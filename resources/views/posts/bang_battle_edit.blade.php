@extends('layouts.topbar')

@section('content')
<div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Edit Bang Battle</h5>
                    </div>

                    <div class="card-body border-top">
                        <form action="{{route('updateBangBattle')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row mb-3">
                                <label class="col-lg-4 col-form-label">Title:</label>
                                <div class="col-lg-8">
                                    <input name="body" value="{{$battle->body}}" type="text" class="form-control" placeholder="Write Title">
                                    <input type="hidden" value="{{$battle->id}}" name="id">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-lg-4 col-form-label">Sub-Tittle:</label>
                                <div class="col-lg-8">
                                    <input name="subtitle"  value="{{$battle->subtitle}}" type="text" class="form-control" placeholder="Write Sub-Title">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-lg-4 col-form-label">Price:</label>
                                <div class="col-lg-8">
                                    <input name="price"  value="{{$battle->price}}" type="number" class="form-control" placeholder="Set Price">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-lg-4 col-form-label">Type:</label>
                                <div class="col-lg-8">
                                    <select id="typeChange" name="type" class="form-control">
                                        <option value="image">Image</option>
                                        <option value="video">Video</option>
                                    </select>
                                </div>
                            </div>
                            <div id="thumbnail" class="row mb-3" style="display: none;">
                                <label class="col-lg-4 col-form-label">Thumbnail:</label>
                                <div class="col-lg-8">
                                    <input name="thumbnail" id="thumbnailInput" type="file" class="form-control">
                                    <div class="form-text text-muted">Accepted formats: jpg, png, webpg Max file size 12Mb</div>
                                </div>
                            </div>
                            <div id="thumbnail2" class="row mb-3" style="display: none;">
                                <label class="col-lg-4 col-form-label">Thumbnail2:</label>
                                <div class="col-lg-8">
                                    <input name="thumbnail2" id="thumbnailInput" type="file" class="form-control">
                                    <div class="form-text text-muted">Accepted formats: jpg, png, webpg Max file size 12Mb</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-lg-4 col-form-label">Battle 1:</label>
                                <div class="col-lg-8">
                                    <input name="battle1" id="thumbnailInput" type="file" class="form-control">
                                    <div class="form-text text-muted">Accepted formats: jpg, png, webpg Max file size 12Mb</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-lg-4 col-form-label">Battle 2:</label>
                                <div class="col-lg-8">
                                    <input name="battle2" id="videoInput" type="file" class="form-control">
                                    <div class="form-text text-muted">Accepted formats: gif, png, jpg. Max file size 12Mb</div>
                                </div>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-primary">Submit form <i class="ph-paper-plane-tilt ms-2"></i></button>
                            </div>
                        </form>
                </div>

            </div>
            <script>
                     $("#typeChange").change(function(){
            console.log('thisfdf')
            if($("#typeChange").val()=='video'){
                $("#thumbnail").show()
                $("#thumbnail2").show()
            }
            else{
                $("#thumbnail").hide()
                $("#thumbnail2").hide()
            }
        });
            </script>
@endsection

