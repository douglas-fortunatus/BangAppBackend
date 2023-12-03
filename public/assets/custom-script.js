$(document).ready(function()
{
// Prepare the preview for profile picture
    $("#wizard-picture").change(function(){
        readURL(this);
    });
});
function readURL(input)
{
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }
}


function makeAjaxRequest(url, method, data, successCallback, errorCallback)
{
    $.ajax({
        url: url,
        method: method,
        data: data,
        dataType: 'json',
        success: function (response) {
            if (typeof successCallback === 'function') {
                successCallback(response);
            }
        },
        error: function (xhr, status, error) {
            if (typeof errorCallback === 'function') {
                errorCallback(xhr, status, error);
            }
        }
    });
}


function loadRegions() {
    var selectedZoneId = $('#zoneSelect').val();

    // Make an Ajax request to fetch regions based on the selected zone
    makeAjaxRequest(
        '/getRegions', // Replace with your actual route
        'GET',
        { zoneId: selectedZoneId },
        function(response) {
            console.log(response)
            console.log('this is response')
            // Populate #inputState dropdown with the received regions
            var inputStateDropdown = $('#regionSelect');
            inputStateDropdown.empty(); // Clear existing options
            inputStateDropdown.append($('<option selected>Choose...</option>'));

            // Append each region to the dropdown
            $.each(response.regions, function(index, region) {
                inputStateDropdown.append($('<option>', {
                    value: region.id,
                    text: region.name
                }));
            });
        },
        function(xhr, status, error) {
            // Handle error if needed
            console.error('Error loading regions:', error);
        }
    );
}


function loadDistricts() {
    var selectedZoneId = $('#regionSelect').val();

    // Make an Ajax request to fetch regions based on the selected zone
    makeAjaxRequest(
        '/getDistricts', // Replace with your actual route
        'GET',
        { regionId: selectedZoneId },
        function(response) {
            console.log(response)
            console.log('this is response')
            // Populate #inputState dropdown with the received regions
            var inputStateDropdown = $('#districtSelect');
            inputStateDropdown.empty(); // Clear existing options
            inputStateDropdown.append($('<option selected>Choose...</option>'));

            // Append each region to the dropdown
            $.each(response.regions, function(index, region) {
                inputStateDropdown.append($('<option>', {
                    value: region.id,
                    text: region.name
                }));
            });
        },
        function(xhr, status, error) {
            // Handle error if needed
            console.error('Error loading regions:', error);
        }
    );
}




function loadWards() {
    var selectedZoneId = $('#districtSelect').val();

    // Make an Ajax request to fetch regions based on the selected zone
    makeAjaxRequest(
        '/getWards', // Replace with your actual route
        'GET',
        { districtId: selectedZoneId },
        function(response) {
            console.log(response)
            console.log('this is response')
            // Populate #inputState dropdown with the received regions
            var inputStateDropdown = $('#wardSelect');
            inputStateDropdown.empty(); // Clear existing options
            inputStateDropdown.append($('<option selected>Choose...</option>'));

            // Append each region to the dropdown
            $.each(response.regions, function(index, region) {
                inputStateDropdown.append($('<option>', {
                    value: region.id,
                    text: region.name
                }));
            });
        },
        function(xhr, status, error) {
            // Handle error if needed
            console.error('Error loading regions:', error);
        }
    );
}




