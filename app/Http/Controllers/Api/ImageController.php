<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ImageController extends Controller
{
    //
    public function addimage(Request $request)
    {
        $image = new Image;
        $image->title = $request->title;
        
            if ($request->hasFile('image')) {
            
            $path = $request->file('image')->store('images');
            $image->url = $path;
           }
        $image->save();
        return new ImageResource($image);
    }
}
