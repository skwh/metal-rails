// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require nested_form_fields
//= require_tree .

var ready;
ready = function() {
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

	prepare_image_sliders();
}

$(document).ready(ready);
$(document).on('page:load',ready);