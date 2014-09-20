// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready;
ready = function() {
    $('.uploadImageInput').hide();
    var filereader = new FileReader();
    var client_id = atob("ODM0MTkwNTU1MGVhODBk");
    var select_id = -1;

    $('.uploadImage').click(function(e) {
        /*
            when an upload image link is clicked, find the section that it is in. 
            label the url field. un hide the file selector button. add the change listener.
        */
        e.stopPropagation();
        e.preventDefault();
        //find the link's id.
        var section_id = parseInt($(this).attr("id"),10);
        console.log(section_id);
        //label the url field.
        $('input#album_images_attributes_'+section_id+'_url').addClass("activeImageInputUrlField_" + section_id);
        //find the selctor button, unhide it, and add the change listner.
        $('input#file_'+section_id).show().on('change',handle_image_selection);
        select_id = section_id;
    });

	function prepare_image_sliders() {
        var _CaptionTransitions = [];
        
        _CaptionTransitions["1"] = {$Duration:900,$FlyDirection:8,$Easing:{$Top:$JssorEasing$.$EaseInOutSine},$ScaleVertical:0.6,$Opacity:2};
        var options = {
            $CaptionSliderOptions: {
                $Class: $JssorCaptionSlider$,
                $CaptionTransitions: _CaptionTransitions,
                $PlayInMode: 1,
                $PlayOutMode: 3
            },
        };
        var jssor_slider1 = new $JssorSlider$('slider1_container', options);
	}

    function handle_image_selection(e) {
        alert("working...");
        files = e.target.files;
        filereader.onload = function(event) {
            var event_result = event.target.result;
            var base64_data = event_result.replace(/^data\:image\/\w+\;base64\,/, '');
            $.ajax({
                type:"POST",
                headers: {
                    'Authorization': "Client-ID " + client_id,
                },
                data:{
                    image: base64_data,
                    type: "base64"
                },
                url:'https://api.imgur.com/3/image',
                success:function(msg) {
                    handle_success_upload(msg);
                },
                error:function(errormsg) {
                    alert("we dun goofd " + errormsg)
                }
            });
        }
        filereader.readAsDataURL(files[0]);
    }

    function handle_success_upload(msg) {
        /*
            handle a successful upload. find the url field. place the link. hide the file select input. reset the select id field.
        */
        var link = msg.data.link;
        $('.activeImageInputUrlField_'+select_id).val(link);
        $('input#file_'+select_id).val("").hide();
        select_id = -1;
        alert("Uploaded!")
    }

    if ($('#slider1_container').length != 0) {
        prepare_image_sliders();
    }

}

$(document).ready(ready);
$(document).on('page:load',ready);