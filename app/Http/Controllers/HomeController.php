<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BangUpdate;
use App\bangInspiration;
use Illuminate\Support\Facades\Storage;
use FFMpeg\FFMpeg;
use Intervention\Image\Facades\Image;
use FFMpeg\Format\Video\X264;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\Process;
use App\BangBattle;



class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    function postBangUpdates(Request $request)
    {
        // Validate the form inputs
        $validatedData = $request->validate([
            'caption' => 'required|string',
            'post' => 'required|file|mimes:gif,png,jpg,mp4,mov|max:20480', // Max file size: 2MB
        ]);

        // Get the uploaded file
        $file = $request->file('post');

        // Generate a unique filename
        $filename = uniqid() . '.' . $file->getClientOriginalExtension();

        // Store the file locally in the storage/app/public directory
        $file->storeAs('bangUpdates', $filename);

        $bangUpdate = new BangUpdate();
        $bangUpdate->caption = $validatedData['caption'];
        $bangUpdate->filename = $filename;
        $bangUpdate->type = $request->type;
        $bangUpdate->save();

        // Redirect back or show a success message
        return redirect()->back()->with('success', 'Bang update posted successfully!');
    }

    function bangInspiration()
    {
        return view('posts.bang_inspiration');
    }

    function postBangInspiration(Request $request)
    {
        // Validate the form inputs
        $validatedData = $request->validate([
            'tittle' => 'required|string',
        ]);
        // Get the uploaded file
        $video = $request->file('video');
        $thumbnail = $request->file('thumbnail');
        // Generate a unique filename
        $filename = uniqid() . '.' . $video->getClientOriginalExtension();
        $thumbnailName = uniqid() . '.' . $thumbnail->getClientOriginalExtension();

        $thumbnailPath = 'bangInspiration/thumb/' . $thumbnailName;
        $outputVideo = 'bangInspiration/compressed_videos/' . $filename;
        // Store the video locally in the storage/app/public directory
        $video->storeAs('bangInspiration', $filename);
        $thumbnail->storeAs('bangInspiration/thumb', $thumbnailName);


        $bangInspiration = new bangInspiration();
        $bangInspiration->tittle = $validatedData['tittle'];
        $bangInspiration->video_url = $filename;
        $bangInspiration->creator = 'BangInspiration';
        $bangInspiration->view_count = '0';
        $bangInspiration->profile_url  = 'bangInspiration/bang_logo.jpg';
        $bangInspiration->thumbnail = $thumbnailName;
        $bangInspiration->save();

        return redirect()->route('bangInspirationWeb')->with('success', 'Bang inspiration posted successfully!');
    }


    function postBangThumbnail(Request $request)
    {
        Storage::put('bangInspiration/thumbnails', $request->thumbnail);
        return $request->thumbnail;
    }

    function bangBattleWeb()
    {
        $battles = BangBattle::all();
        return view('posts.bang_battle',compact('battles'));
    }
    function postBangBattle(Request $request)
    {
        $bangBattle = new BangBattle();
        $bangBattle->body = $request->body;
        $bangBattle->type = $request->type;
        $bangBattle->battle1 = $request->battle1;
        $bangBattle->battle2 = $request->battle2;
        $bangBattle->save();

        // Generate a unique filename
        $filename = uniqid();

        // Store battle1 file
        if ($request->hasFile('battle1')) {
            $extension = $request->battle1->getClientOriginalExtension();
            $request->battle1->storeAs('bangBattle', $filename . '_battle1.' . $extension);
        }

        // Store battle2 file
        if ($request->hasFile('battle2')) {
            $extension = $request->battle2->getClientOriginalExtension();
            $request->battle2->storeAs('bangBattle', $filename . '_battle2.' . $extension);
        }

        return redirect()->route('bangBattleWeb')->with('success', 'Bang Battle posted successfully!');
    }



}
