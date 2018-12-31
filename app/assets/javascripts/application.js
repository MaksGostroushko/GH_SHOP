//
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require lightbox
//= require trix
//= require jquery3
//= require bootstrap-sprockets
//= require_tree .

$(function() {
    	$('.img_plus').on('click', function() {
			$('.enlargeImageModalSource').attr('src', $(this).attr('src'));
			$('#enlargeImageModal').modal('show');
		});
});

jQuery(document).ready(function($){

$(".btnrating").on('click',(function(e) {

var previous_value = $("#selected_rating").val();

var selected_value = $(this).attr("data-attr");
$("#selected_rating").val(selected_value);

$(".selected-rating").empty();
$(".selected-rating").html(selected_value);

for (i = 1; i <= selected_value; ++i) {
$("#rating-star-"+i).toggleClass('btn-warning');
$("#rating-star-"+i).toggleClass('btn-default');
}

for (ix = 1; ix <= previous_value; ++ix) {
$("#rating-star-"+ix).toggleClass('btn-warning');
$("#rating-star-"+ix).toggleClass('btn-default');
}

}));


});
