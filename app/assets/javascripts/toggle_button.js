$(document).on('turbolinks:load', function() {

    // 予約一覧とあなたのスペース一覧の切り替え
  $(function() {
    $('.toggle-button').on('click', function() {
      $('.user-space').toggle();
      $('.none').toggle();
      $('.reserve').toggleClass('check')
      $('.userSpace').toggleClass('check')
    })
  });
});
