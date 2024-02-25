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
use Illuminate\Support\Facades\Auth;


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
        $bangUpdate->user_id = Auth::user()->id;
        $bangUpdate->filename = $filename;
        $bangUpdate->type = $request->type;
        $bangUpdate->save();

        // Redirect back or show a success message
        return redirect()->back()->with('success', 'Bang update posted successfully!');
    }

    function bangInspiration()
    {

        $bannginspirations = bangInspiration::all();
        return view('posts.bang_inspiration',compact('bannginspirations'));
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
        // Generate a unique filename
        $filename = uniqid();

        // Create a new BangBattle model
        $bangBattle = new BangBattle();
        $bangBattle->body = $request->body;
        $bangBattle->type = $request->type;
        $bangBattle->price = $request->price;
        $bangBattle->subtitle = $request->subtitle;
        // Save the model to get an ID
        $bangBattle->save();

        // Store battle1 file
        if ($request->hasFile('battle1')) {
            $extension = $request->battle1->getClientOriginalExtension();
            $request->battle1->storeAs('bangBattle', $filename. '_battle1.' . $extension);

            // Update the battle1 attribute with the stored path
            $bangBattle->battle1 = 'bangBattle/' . $filename . '_battle1.' . $extension;
        }

        // Store battle2 file
        if ($request->hasFile('battle2')) {
            $extension = $request->battle2->getClientOriginalExtension();
            $request->battle2->storeAs('bangBattle', $filename. '_battle2.' . $extension);

            // Update the battle2 attribute with the stored path
            $bangBattle->battle2 = 'bangBattle/' . $filename . '_battle2.' . $extension;
        }

        // Store battle2 file
        if ($request->hasFile('thumbnail')) {
            $extension = $request->thumbnail->getClientOriginalExtension();
            $request->thumbnail->storeAs('bangBattle', $filename. '_thumbnail.' . $extension);

            // Update the battle2 attribute with the stored path
            $bangBattle->cover_image = 'bangBattle/' . $filename . '_thumbnail.' . $extension;
        }

        if ($request->hasFile('thumbnail2')) {
            $extension = $request->thumbnail2->getClientOriginalExtension();
            $request->thumbnail2->storeAs('bangBattle', $filename. '_thumbnail2.' . $extension);

            // Update the battle2 attribute with the stored path
            $bangBattle->cover_image2 = 'bangBattle/' . $filename . '_thumbnail2.' . $extension;
        }

        // Save the updated model
        $bangBattle->save();

        return redirect()->route('bangBattleWeb')->with('success', 'Bang Battle posted successfully!');
    }

    function bangBattlePin($id)
    {
        $battle = BangBattle::find($id);

        // Toggle the value of 'public_id', treating NULL as false
        $battle->update(['pinned' => !$battle->pinned ?? false]);

        return redirect()->route('bangBattleWeb')->with('success', 'Battle pinned successfully.');
    }

    function bangBattleEdit($id)
    {
        $battle = BangBattle::find($id);

        return view('posts.bang_battle_edit', compact('battle'));
    }

    function updateBangBattle(Request $request)
    {
       
        $battle = BangBattle::find($request->id);
        
        $battle->body = $request->body;
        $battle->price = $request->price;
        $battle->subtitle = $request->subtitle;
        try {
            if ($battle->save()) {
                return redirect()->route('bangBattleWeb')->with('success', 'Battle edited successfully.');
            } else {
                return redirect()->route('bangBattleWeb')->with('error', 'Something Went Wrong.');
            }
        } catch (\Exception $e) {
            dd($e);
            // Handle the exception, you can log it or perform any other necessary actions.
            return redirect()->route('bangBattleWeb')->with('error', 'An error occurred: ' . $e->getMessage());
        }
    }


    public function deleteBangBattle($id)
    {
        $battle = BangBattle::find($id);
        if (!$battle) {
            return redirect()->route('bangBattleWeb')->with('error', 'Battle not found.');
        }
        // Delete image files
        if (!empty($battle->battle1)) {
            Storage::delete('bangbattle/' . $battle->battle1);
        }
        if (!empty($battle->battle2)) {
            Storage::delete('bangbattle/' . $battle->battle2);
        }
        $battle->delete();
        return redirect()->route('bangBattleWeb')->with('success', 'Battle deleted successfully.');
    }





}
