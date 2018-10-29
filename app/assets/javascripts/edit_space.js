$(document).on("turbolinks:load", function() {
  
  //入力の「未完」がひとつもなければ、ボタンの色を変更し有効化する
  var all_status = $('.status');
  $(function set_publish_button(){
    if (!all_status.is(":contains('未完')")) {
      $('#publish-btn').addClass("to-publish").prop('disabled', false)
    }
  });
});
