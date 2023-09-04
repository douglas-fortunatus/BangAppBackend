<?php

namespace App\Events;

use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class NewMessageEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets;

    // Define any properties or constructor if needed

    public function broadcastOn()
    {
        return ['your-channel-name'];
    }
}
