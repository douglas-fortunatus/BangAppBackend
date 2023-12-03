


@extends('layouts.topbar')

@section('content')
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <style>
        .scrollable-table-container {
            width: 100%;
            overflow-x: auto;
        }
    </style>


    <!-- Centered card -->

    <div class="w-100 m-4">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            ADD BATTLE
          </button>

        <div class="card my-3">

        <div class="col-12">
            <div class="col-12">
                <table class="table table-bordered scrollable-table-container">
                    <thead>
                        <tr>
                            <th scope="col">S/N</th>
                            <th scope="col">Name</th>
                            <th scope="col">Media</th>
                            <th class="col-md-2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($battles as $battle)
                        <tr>
                            <th scope="row">1</th>
                            <td>{{$battle->body}}</td>
                            <td>{{$battle->type}}</td>
                            <td>
                                <button  class="btn btn-primary">EDIT</button>

                                <a href="{{ route('pin_bang_battle', ['id' => $battle->id]) }}" class="btn btn-light"  >@if($battle->pinned) Unpin @else Pin @endif</a>
                                <a href="{{ route('delete_bang_battle', ['id' => $battle->id]) }}" class="btn btn-danger"  >DELETE</a>

                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    </div>




    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">


                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">Bang Battle</h5>
                    </div>

                    <div class="card-body border-top">
                        <form action="{{route('postBangBattle')}}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row mb-3">
                                <label class="col-lg-4 col-form-label">Title:</label>
                                <div class="col-lg-8">
                                    <input name="body" type="text" class="form-control" placeholder="Write Title">
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

          </div>
        </div>
      </div>



    <script type="text/javascript">
        function generateThumbnail(file) {
            return new Promise((resolve, reject) => {
                const video = document.createElement('video');
                video.preload = 'metadata';

                video.onloadedmetadata = () => {
                    video.currentTime = 5; // Set the desired time for the thumbnail (e.g., 5 seconds)
                };

                video.onseeked = () => {
                    const canvas = document.createElement('canvas');
                    canvas.width = video.videoWidth;
                    canvas.height = video.videoHeight;

                    const context = canvas.getContext('2d');
                    context.drawImage(video, 0, 0, canvas.width, canvas.height);

                    const thumbnailDataUrl = canvas.toDataURL('image/jpeg');
                    resolve(thumbnailDataUrl);
                };

                video.onerror = reject;

                video.src = URL.createObjectURL(file);
            });
        }

        const generateVideoThumbnail = (file) => {
            return new Promise((resolve) => {
                const canvas = document.createElement("canvas");
                const video = document.createElement("video");

                // This is important
                video.autoplay = true;
                video.muted = true;

                // Event listener to capture the thumbnail once video metadata is loaded
                video.onloadedmetadata = () => {
                    canvas.width = video.videoWidth;
                    canvas.height = video.videoHeight;

                    // Draw the video frame on the canvas
                    const ctx = canvas.getContext("2d");
                    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

                    // Convert the canvas image to base64 data URL
                    const thumbnailDataUrl = canvas.toDataURL("image/png");

                    // Resolve the promise with the thumbnail data URL
                    resolve(thumbnailDataUrl);
                };

                // Set the video source to the provided file
                video.src = URL.createObjectURL(file);
            });
        };


        function getVideoCover(file, seekTo = 3.0) {
            return new Promise((resolve, reject) => {
                // load the file to a video player
                const videoPlayer = document.createElement('video');
                videoPlayer.setAttribute('src', URL.createObjectURL(file));
                videoPlayer.load();
                videoPlayer.addEventListener('error', (ex) => {
                    reject("error when loading video file", ex);
                });
                // load metadata of the video to get video duration and dimensions
                videoPlayer.addEventListener('loadedmetadata', () => {
                    // seek to user defined timestamp (in seconds) if possible
                    if (videoPlayer.duration < seekTo) {
                        reject("video is too short.");
                        return;
                    }
                    // delay seeking or else 'seeked' event won't fire on Safari
                    setTimeout(() => {
                        videoPlayer.currentTime = seekTo;
                    }, 200);
                    // extract video thumbnail once seeking is complete
                    videoPlayer.addEventListener('seeked', () => {
                        // define a canvas to have the same dimension as the video
                        const canvas = document.createElement("canvas");
                        canvas.width = videoPlayer.videoWidth;
                        canvas.height = videoPlayer.videoHeight;
                        // draw the video frame to canvas
                        const ctx = canvas.getContext("2d");
                        ctx.drawImage(videoPlayer, 0, 0, canvas.width, canvas.height);
                        // return the canvas image as a blob
                        ctx.canvas.toBlob(
                            blob => {
                                resolve(blob);
                            },
                            "image/jpeg",
                            0.75 /* quality */
                        );
                    });
                });
            });
        }


        const fileInput = document.getElementById('videoInput');

        fileInput.addEventListener('change', async (event) => {

            const file = event.target.files[0];

            try {
                const thumbnailDataUrl = await getVideoCover(file);

                // Send the thumbnail data URL to PHP
                if (fileInput.files.length > 0) {

                    uploadThumbnail(thumbnailDataUrl);
                }
                // Handle the PHP response
                const data = await response.json();
                console.log(data); // Response from PHP
            } catch (error) {
                console.error(error);
            }
        });

        // Function to upload the thumbnail using AJAX
        function uploadThumbnail(thumbnailDataUrl) {
            const formData = new FormData();
            const thumbnailBlob = dataURItoBlob(thumbnailDataUrl);
            const thumbnailFile = new File([thumbnailBlob], 'thumbnail.jpg', {
                type: 'image/jpeg'
            });
            formData.append('thumbnail', thumbnailFile);
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            // Append the CSRF token to the form data
            formData.append('_token', csrfToken);
            // Send the AJAX request
            fetch('{{ route('postBangThumbnail') }}', {
                    method: 'POST',
                    body: formData,
                })
                .then((response) => response.json())
                .then((data) => {
                    // Handle the response from the server (if needed)
                    console.log(data);
                })
                .catch((error) => {
                    // Handle errors (if any)
                    console.error('Error:', error);
                });
        }

        // Helper function to convert data URL to Blob
        function dataURItoBlob(dataURI) {
            const byteString = atob(dataURI.split(',')[1]);
            const mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
            const ab = new ArrayBuffer(byteString.length);
            const ia = new Uint8Array(ab);
            for (let i = 0; i < byteString.length; i++) {
                ia[i] = byteString.charCodeAt(i);
            }
            return new Blob([ab], {
                type: mimeString
            });
        }

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
    <!-- /centered card -->
@endsection
