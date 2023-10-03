<?php

namespace App\Http\Controllers;

use App\Conversation;
use App\Message;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    // Retrieve all conversations for the authenticated user
    public function getAllConversations(Request $request)
    {
        $user_id = $request->get('user_id');

        // This will retrieve conversations where the authenticated user is either participant
        $conversations = Conversation::where('user1_id', $user_id)
            ->orWhere('user2_id', $user_id)
            ->get();

        return response()->json($conversations);
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
    ]);

    $conversation->messages()->save($message);

    // Fetch the saved message from the database
    $savedMessage = Message::findOrFail($message->id);

    return response()->json($savedMessage, 200);
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
