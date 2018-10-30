$(document).on('turbolinks:load', function() {
  // 初期状態ではサブミットできないように
  $('.button-disabled.button-blue').prop('disabled', true);

  // 日にち貸しボタンの色変更
  $('.reserve-type__button-label').click(function() {
    $(this).css({'background-color':'#60df52', 'color':'#fff'});
  })
  // formにクリックされた日付を入力
  function appendForm(date) {
    $('#reserve-day').val(date);
      $('.button-disabled.button-blue').css({'background-color':'#4abfe6','color':'#FFF'});
        $('.button-disabled.button-blue').prop('disabled', false);
  };
  // リザルトにクリックされた日付と値段を入力
  function appendDay(date) {
    var html = `<div class="reserve-price">
                  <dt>料金</dt>
                  <dd>￥${gon.price.toLocaleString()}</dd>
                </div>`
    $(".reserve-date > dd").empty();
    $(".reserve-date > dd").append(date);
    $(".reserve-situation > .reserve-price").remove();
    $(".reserve-situation").append(html);
  };

  // 日付を選択していないとフォームを空にする
  function removeForm() {
      if ($('.fc-day').hasClass('checked')) {}
    else {
      $('#reserve-day').val("");
      $('.button-disabled.button-blue').css({'background-color':'#eeeeee', 'color':'#999'});
      $('.button-disabled.button-blue').prop('disabled', true);
      $(".reserve-date > dd").empty();
      $(".reserve-date > dd").append("利用期間を選択して下さい");
      $(".reserve-situation > .reserve-price").remove();
    }
  };
  // 選択された日の色を維持する
  function keepChecked(){
    var formVal = $('#reserve-day').val();
    var checkedDay = $(`[data-date="${formVal}"]`)
    checkedDay.addClass('checked')
  };

  // 予約できない曜日を表示
  function not_wday(){
    $.each(gon.not_weekday, function(index, wday) {
      $(wday).addClass('fc-disabled-day')
    });
  };

  // 予約できない日を表示
  function not_day() {
    $.each(gon.not_day, function(index, not_day) {
      $(not_day).addClass('fc-disabled-day')
    });
  };
  // 今日の日付を取得
  function setToday() {
    var dt = new Date();
    var y = dt.getFullYear();
    var m = ("00" + (dt.getMonth()+1)).slice(-2);
    var d = ("00" + dt.getDate()).slice(-2);
    var today = y + "-" + m + "-" + d;
    return today;
  };
  // 過去の日付をクリックできないようにする
  function pastDay(){
    var today = setToday()
    var allDay = $('.fc-day')
    $.each(allDay, function(index, day){
      if ($(day).data('date') < today )
        $(day).addClass('fc-disabled-day')
    })
  };

  // カレンダー基本設定
  $('#calendar').fullCalendar({
    header: {
    left: 'prev',
    center: 'title',
    right: 'next'
  },
    locale: 'ja',
    showNonCurrentDates: false,
    // クリックされたら発火
    dayClick: function(date) {
      // クリックされた日付を取得
      var date = (date.format())
      // クリックした日の色変更
      if ($(this).hasClass('checked')) {
        $(this).removeClass('checked');
        removeForm();
      } else if ($(this).hasClass('fc-disabled-day')) {
      } else {
        $('.fc-day').removeClass('checked'),$(this).addClass('checked')
      }
      // クリックされた日を表示＆フォームに入力
      if ($(this).hasClass('checked')) {
        appendDay(date)
        appendForm(date)
      };
    },
    viewRender: function() {
      keepChecked()
      not_wday()
      not_day()
      pastDay()
    }
  });

});
