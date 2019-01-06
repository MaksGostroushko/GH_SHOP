$(document).on('turbolinks:load', function(){
    $('.star').click(function(){
      $('.star').css('color', 'black');
      $(this).css('color', 'yellow');
    });
});
