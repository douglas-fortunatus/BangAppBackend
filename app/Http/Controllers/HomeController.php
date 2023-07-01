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
            'post' => 'required|file|mimes:gif,png,jpg,mp4,mov|max:20480',// Max file size: 2MB
        ]);

        // Get the uploaded file
        $file = $request->file('post');

        // Generate a unique filename
        $filename = uniqid().'.'.$file->getClientOriginalExtension();

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
        return $request->all();
         // Validate the form inputs
        $validatedData = $request->validate([
            'tittle' => 'required|string',
            'video' => 'required|file|mimes:mp4,mov|max:20480',// Max file size: 2MB
        ]);
        // Get the uploaded file
        $video = $request->file('video');
        // Generate a unique filename
        $filename = uniqid().'.'.$video->getClientOriginalExtension();

        $thumbnailPath = 'bangInspiration/'.$filename;
        $outputVideo = 'bangInspiration/compressed_videos/'.$filename;
        // Store the video locally in the storage/app/public directory
        $video->storeAs('bangInspiration', $filename);
 
        $bangInspiration = new bangInspiration();
        $bangInspiration->tittle = $validatedData['tittle'];
        $bangInspiration->video_url = $filename;
        $bangInspiration->creator = 'BangInspiration';
        $bangInspiration->view_count = '0';
        $bangInspiration->profile_url  = 'bangInspiration/bang_logo.jpg';
        $bangInspiration->thumbnail = $thumbnailPath;
        $bangInspiration->save();
    }


    function postBangThumbnail(Request $request){
        Storage::put('bangInspiration/thumbnails', $request->thumbnail);
        return $request->thumbnail;
    }

    
}
