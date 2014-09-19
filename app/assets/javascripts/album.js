// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready;
ready = function() {
    $('.uploadImageInput').hide();
    var filereader = new FileReader();
    var client_id = atob("ODM0MTkwNTU1MGVhODBk");
    var select_id = -1;

    $('.uploadImage').click(function(e) {
        e.stopPropagation();
        e.preventDefault();
        var this_id = $(this).attr("id")
        select_id = parseInt(this_id.replace( /[^\d.]/g, '' ),10);
        console.log(select_id);
        $('input#album_images_attributes_'+select_id+'_url').addClass("activeImageInputUrlField_" + select_id);
        $(this).next().show().attr("id","activeImageInput_"+select_id).on('change', handle_image_selection);
    });

	function prepare_image_sliders() {
		//define random caption transitions, if a caption specifies '*' as transition,
        //it will choose transition randomly every time from following transition array
        //var _CaptionTransitions = [{code1}, {code2} ...];
        //use following line instead if there is no caption plays random transition
        var _CaptionTransitions = [];
        
        //define named transitions for caption that plays specified transition
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
        console.log(msg.data.link);
        console.log(select_id);
        $('.activeImageInputUrlField_'+select_id).val(msg.data.link);
        $('input#activeImageInput_'+select_id).val("").hide();
        select_id = -1;
        alert("Uploaded!")
    }

	prepare_image_sliders();

}

$(document).ready(ready);
$(document).on('page:load',ready);