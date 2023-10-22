<?php

namespace App\Http\Controllers;

use Kreait\Firebase\Messaging\AndroidConfig;
use Kreait\Firebase\Messaging\AndroidNotification;
use Kreait\Firebase\Messaging\Notification;
use Kreait\Firebase\Messaging\Message;
use Kreait\Firebase\Messaging\Notification as FcmNotification;
use Kreait\Firebase\Messaging\CloudMessage;

class PushNotificationService extends Controller
{
    //
    public function sendPushNotification($deviceToken,$title, $body,$notificationId,$type,$userName=null)
    {
        $messaging = app('firebase.messaging');
        // Create a new Message instance with the notification details
        $message = CloudMessage::withTarget('token', $deviceToken)
            ->withNotification(Notification::create($title, $body))
            ->withData(['notification_id'=> $notificationId,'type'=>$type,'user_name'=>$userName])
            ->withAndroidConfig(AndroidConfig::fromArray(['ttl' => '3600s']))
            ->withNotification(FcmNotification::create($title, $body)); // Use withNotification() for Android-specific settings
        $messaging->send($message);
    }

    public function sendUserPushNotification($deviceToken, $title, $body)
    {
        $messaging = app('firebase.messaging');
        // Create a new Message instance with the notification details
        $message = CloudMessage::withTarget('token', $deviceToken)
            ->withNotification(Notification::create($title, $body))
            ->withAndroidConfig(AndroidConfig::fromArray(['ttl' => '3600s']))
            ->withNotification(FcmNotification::create($title, $body)); // Use withNotification() for Android-specific settings
        $messaging->send($message);
    }
}
