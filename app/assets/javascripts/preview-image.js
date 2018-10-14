$(document).on("turbolinks:load", function() {
  $('#user_icon').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $("#preview").empty();
      $("#preview").attr('src', e.target.result);
    };
    reader.readAsDataURL(e.target.files[0]);
  });
});
