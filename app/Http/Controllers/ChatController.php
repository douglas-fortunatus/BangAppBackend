<?php

namespace App\Http\Controllers;
use App\Conversation;
use App\Message;
use App\OneSignalUserMapping;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class ChatController extends Controller
{


    public function associateOneSignalPlayerId(Request $request)
{
    $userId = $request->input('user_id');
    $playerId = $request->input('onesignal_player_id');

    // Check if the association already exists; if not, create it
    OneSignalUserMapping::updateOrCreate(
        ['user_id' => $userId],
        ['onesignal_player_id' => $playerId]
    );

    return response()->json(['message' => 'Association successful']);
}
    // Retrieve all conversations for the authenticated user
    public function getAllConversations(Request $request)
    {
        $user_id = $request->get('user_id');
        $user = User::find($user_id);

        // This will retrieve conversations where the authenticated user is either participant
        $conversations = Conversation::where('user1_id', $user_id)
            ->orWhere('user2_id', $user_id)
            ->get();



        $chats = [];
        foreach ($conversations as $conversation) {
            $receiver_id = $conversation->user1_id == $user_id ? $conversation->user2_id : $conversation->user1_id;
            $receiver = User::find($receiver_id);
            $lastMessage = $conversation->messages()->orderBy('created_at', 'desc')->first();
            $unreadCount = $conversation->messages()->where('is_read', false)->where('sender_id', '!=', $user_id)->count(); // Count of unread messages

            $chats[] = [
                'conversation_id' => $conversation->id,
                'receiver_name' => $receiver->name,
                'receiver_id' => $receiver->id,
                'sender_id' => $user_id,
                'sender_name' => $user->name ,
                'lastMessage' => $lastMessage ? $lastMessage->message : '',
                'image' => $receiver->image,
                'time' => $lastMessage ? $lastMessage->created_at->diffForHumans() : '',
                'unreadCount' => $unreadCount, // Include count of unread messages
                'isActive' => false,
            ];
        }
        usort($chats, function ($a, $b) {
            return strtotime($b['time']) - strtotime($a['time']);
        });

        return response()->json($chats);
    }

    public function getTotalUnreadMessages(Request $request){
        $user_id = $request->user_id;
        $conversations = Conversation::where('user1_id', $user_id)
            ->orWhere('user2_id', $user_id)
            ->get();

        $unreadCount = 0;
        foreach ($conversations as $conversation) {
            $unreadCount += $conversation->messages()->where('is_read', false)->where('sender_id', '!=', $user_id)->count(); // Count of unread messages
        }

        return response()->json(['unreadCount' => $unreadCount]);
    }

    // Get messages for a specific conversation
    public function getMessages(Request $request)
    {
        $user1_id = $request->get('user1_id');
        $user2_id = $request->get('user2_id');
        $conversation = Conversation::where(function ($query) use ($user1_id, $user2_id) {
            $query->where('user1_id', $user1_id)
                ->where('user2_id', $user2_id);
        })->orWhere(function ($query) use ($user1_id, $user2_id) {
            $query->where('user1_id', $user2_id)
                ->where('user2_id', $user1_id);
        })->first();

        if (!$conversation) {
            return response()->json(['message' => 'Conversation not found'], 404);
        }

        return response()->json($conversation->messages()->orderBy('created_at', 'desc')->get());
    }



    // Send a message in a specific conversation
    public function sendMessage(Request $request)
{
    $sender_id = $request->sender_id;
    $user2_id = $request->user2_id;
    $messageText = $request->message;
    $messageType = $request->message_type;

    $conversation = Conversation::where(function ($query) use ($sender_id, $user2_id) {
        $query->where('user1_id', $sender_id)
            ->where('user2_id', $user2_id);
    })->orWhere(function ($query) use ($sender_id, $user2_id) {
        $query->where('user1_id', $user2_id)
            ->where('user2_id', $sender_id);
    })->first();

    if (!$conversation) {
        return response()->json(['message' => 'Conversation not found'], 404);
    }

    $message = new Message([
        'sender_id' => $sender_id,
        'message' => $messageText,
        'message_type' => $messageType ?? 'text',
    ]);
    $receiver = User::find($user2_id);
    $conversation->messages()->save($message);
    $pushNotificationService = new PushNotificationService();
    $pushNotificationService->sendPushNotification($receiver->device_token, $receiver->name, "New Message:" .$messageText, $conversation->id);
    // saveNotification($request->user_id, chatMessage($messageText), 'chat', $receiver->id, $conversation->id);


    // Fetch the saved message from the database
    $savedMessage = Message::findOrFail($message->id);

    return response()->json($savedMessage, 200);
}


// app/Http/Controllers/MessageController.php

public function storeImageMessage(Request $request)
{
    // $request->validate([
    //     'sender_id' => 'required',
    //     'user2_id' => 'required',
    //     'attachment' => 'required|image|mimes:jpeg,png,gif',
    // ]);

Log::info($request->all());
    $sender_id = $request->sender_id;
    $user2_id = $request->user2_id;
    $messageText = $request->message;
    $messageType = $request->message_type;

    $conversation = Conversation::where(function ($query) use ($sender_id, $user2_id) {
        $query->where('user1_id', $sender_id)
            ->where('user2_id', $user2_id);
    })->orWhere(function ($query) use ($sender_id, $user2_id) {
        $query->where('user1_id', $user2_id)
            ->where('user2_id', $sender_id);
    })->first();
    Log::info($conversation);

    if (!$conversation) {
        return response()->json(['message' => 'Conversation not found'], 404);
    }
    Log::info($conversation);



    $attachment = $request->file('attachment');
    $attachmentPath = $attachment->store('message_attachments', 'public');

    $message = new Message([
        'sender_id' => $sender_id,
        'message' => "https://bangapp.pro/BangAppBackend/".$attachmentPath,
        'message_type'=> 'image',
        'attachment'=> $attachmentPath,

    ]);
    $conversation->messages()->save($message);
    $savedMessage = Message::findOrFail($message->id);
    Log::info($savedMessage);

    return response()->json($savedMessage, 200);
}






public function markMessageAsRead(Request $request)
    {
        $message_id = $request->get('message_id');
        $message = Message::find($message_id);

        if (!$message) {
            return response()->json(['message' => 'Message not found'], 404);
        }

        $message->is_read = true;
        $message->save();

        return response()->json(['message' => 'Message marked as read'], 200);
    }
    // Start a new conversation
    public function startConversation(Request $request)
    {
        $user_id =  $request->user_id;
        $recipient_id = $request->recipient_id;

        $data['user_1'] = $user_id;
        $data['user_2'] = $recipient_id;

        // Check if conversation already exists
        $conversation = Conversation::where(function ($query) use ($recipient_id, $user_id) {
            $query->where('user1_id', $user_id)
                ->where('user2_id', $recipient_id);
        })->orWhere(function ($query) use ($recipient_id, $user_id) {
            $query->where('user1_id', $recipient_id)
                ->where('user2_id', $user_id);
        })->first();

        if (!$conversation) {
            $conversation = Conversation::create([
                'user1_id' => $user_id,
                'user2_id' => $recipient_id
            ]);
        }

        return response()->json($conversation, 201);
    }
}
