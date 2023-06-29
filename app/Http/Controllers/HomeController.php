<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BangUpdate;

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
}
