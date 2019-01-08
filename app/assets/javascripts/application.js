//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery3
//= require jquery-ui
//= require lightbox
//= require trix
//= require bootstrap
//= require turbolinks
//= require comment
//= require flash
//= require rating

$(function() {
    	$('.img_plus').on('click', function() {
			$('.enlargeImageModalSource').attr('src', $(this).attr('src'));
			$('#enlargeImageModal').modal('show');
		});
});


$(document).on('turbolinks:load', function() {
    lightbox.init();

    $("#email").html("<n uers='znvygb:obkvat@znvy.pbz'>obkvat@tznvy.pbz</n>".replace(/[a-zA-Z]/g, function(c){return String.fromCharCode((c<="Z"?90:122)>=(c=c.charCodeAt(0)+13)?c:c-26);}));

    var availableTags = [
      "Tarko",
      "Berinchik",
      "Loma",
      "Lomachenko",
      "Matrix",
      "Usyk",
      "Gvozdik",
      "Universal"
    ];
    $( "#search" ).autocomplete({
      source: availableTags
    });
    //
    // $( "#slider-range" ).slider({
    //   range: true,
    //   min: 0,
    //   max: 1000,
    //   values: [ 75, 300 ],
    //   slide: function( event, ui ) {
    //     $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
    //   }
    // });
    // $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
    //   " - $" + $( "#slider-range" ).slider( "values", 1 ) );
});
