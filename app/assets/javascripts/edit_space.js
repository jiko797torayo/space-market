$(document).on('turbolinks:load', function() {
  //スペース編集画面：入力の「未完」がひとつもなければ、ボタンの色を変更し有効化する
  function set_publish_button() {
    var all_status = $('.status');
    if (!all_status.is(":contains('未完')")) {
      $('#publish-btn').addClass('to-publish').prop('disabled', false)
    }
  };
  if (location.href.match(/\/spaces\/\d+\/edit/)) {
    set_publish_button() 
  }
});
