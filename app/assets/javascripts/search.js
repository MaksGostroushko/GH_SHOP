$(document).on('turbolinks:load', function() {
    $.ajax({
      url: "/products",
      dataType: 'JSON',
      success: function(data){
        $("#search").autocomplete({
            source: data
        });
      }
    });
});
