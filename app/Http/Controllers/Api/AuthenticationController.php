<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\User;
use App\Post;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Unique;



class AuthenticationController extends Controller
{
    function baseUrl()
    {
        return env('APP_URL') ;
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'regex:/^[A-Za-z][A-Za-z0-9]{4,31}$/', 'max:20', 'min:5', 'alpha_num', 'unique:users,name'],
            'email' => ['required', 'email', 'unique:users'],
            'password' => ['required', 'string', 'min:6', 'max:30'],
            'phone_number' => ['required', 'regex:/^[0-9]{10}$/'],
            'date_of_birth' => ['required', 'date', 'before:-18 years'],
        ]);

        if ($validator->fails()) {
            return response(['errors' => $validator->errors()], 422);
        }

        $validatedData = $validator->validated();

        $validatedData['password'] = bcrypt($request->password);

        $user = User::create($validatedData);

        $token = JWTAuth::attempt(['email' => $request->email, 'password' => $request->password]);

        return response(['name'=>$user->name,'token'=>$token,'id'=>$user->id,'email'=>$user->email,'image'=>env('APP_URL').$user->image]);
    }

    public function login(Request $request)
    {
            
       $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => 'invalid_credentials'], 401);
        }

        $credentials = $request->only('email', 'password');

        if (! $token = JWTAuth::attempt($credentials)) {
            return response()->json(['error' => 'invalid_credentials'], 401);
        }

        // Get the authenticated user from the JWT token
        $user = JWTAuth::user();

        // Return the token and user ID in the response
        return response()->json([
            'token' => $token,
            'user_id' => $user->id,
            'user_image' => env('APP_URL').$user->image,
            'name' => $user->name,
        ]);
    }

    public function user(User $user)
    {
        $user = $user->only([
            'id',
            'name',
            'email',
            'image',
            'followerCount',
            'followingCount',
            'followingMe',
            'followed',
            'created_at',
        ]);

        return response(['data' => $user, 'message' => 'success'], 200);
    }

    function getCurrentUser(Request $request)
    {
        return $request->user();
    }

}
