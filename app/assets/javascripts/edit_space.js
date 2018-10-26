$(document).on("turbolinks:load", function() {
  
  var all_status = $('.status');

  $(function set_publish_button(){
    if (!all_status.is(":contains('未完')")) {
      $('#publish-btn').addClass("to-publish").prop('disabled', false)
    }
  });
});
