@extends('layouts.topbar')

@section('content')

<!-- Centered card -->
                    <div class="row">
                        <div class="col-lg-8 offset-lg-2">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">Bang Updates</h5>
                                </div>

                                <div class="card-body">
                                    Welcome to the Bang Updates section! This is the space where you can post updates that will be visible to all users. Share your latest news, announcements, or any important information here. Let everyone stay in the loop!
                                </div>

                                <div class="card-body border-top">
                                    <form action="{{route('postBangUpdates')}}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row mb-3">
                                            <label class="col-lg-4 col-form-label">Caption:</label>
                                            <div class="col-lg-8">
                                                <input name="caption" type="text" class="form-control" placeholder="Write Caption">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label class="col-lg-4 col-form-label">Post:</label>
                                            <div class="col-lg-8">
                                                <input name="post" type="file" class="form-control">
                                                <div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 2Mb</div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label class="col-lg-4 col-form-label">Type:</label>
                                            <div class="col-lg-8">
                                                
                                                <select name="type" class="form-control">
                                                    <option selected value="image">image</option>
                                                    <option value="video">video</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="text-end">
                                            <button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /centered card -->

@endsection
