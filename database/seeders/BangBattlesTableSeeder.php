<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\BangBattle;

class BangBattlesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $battles = [
            [
                'body' => 'Awesome battle of images',
                'type' => 'image',
                'battle1' => 'images/battle/amber1.jpeg',
                'battle2' => 'images/battle/amber2.jpeg',
            ],
            [
                'body' => 'Exciting image battle',
                'type' => 'image',
                'battle1' => 'images/battle/amber3.jpeg',
                'battle2' => 'images/battle/gigi1.jpeg',
            ],
            [
                'body' => 'Exciting image battle',
                'type' => 'image',
                'battle1' => 'images/battle/gigi2.jpeg',
                'battle2' => 'images/battle/gigi3.jpeg',
            ],
            [
                'body' => 'Exciting image battle',
                'type' => 'image',
                'battle1' => 'images/battle/gigi4.jpeg',
                'battle2' => 'images/battle/9CHDlPTwUxFFMSf2SM1AQCcLKd0Iz4zb5h9gBtH9.jpg',
            ],
            // Add more entries if needed
        ];
        foreach ($battles as $battleData) {
            BangBattle::create($battleData);
        }
    }
}
