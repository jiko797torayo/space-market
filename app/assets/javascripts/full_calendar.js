$(document).on('turbolinks:load', function() {

  function appendForm(date) {
    $('#reserve-day').val(date);
      $('.button-disabled.button-blue').css({'background-color':'#4abfe6','color':'#FFF'});
       $('.button-disabled.button-blue').prop('disabled', false);
  };

  function appendDay(date) {
    var html = `<div class="reserve-price">
                  <dt>料金</dt>
                  <dd>￥${gon.price}</dd>
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
  }

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
      if ($(this).hasClass('fc-disabled-day')) {}
      else if ($(this).hasClass('checked')) {
        $(this).removeClass('checked');
        removeForm();
      } else {
        $('.fc-day').removeClass('checked'),$(this).addClass('checked')
      }
      // クリックされた日を表示＆フォームに入力
      if ($(this).hasClass('checked')) {
        appendDay(date)
        appendForm(date)
      };
    }
  });

  // 予約できない曜日を表示
  $(function not_wday(){
   $.each(gon.not_weekday, function(index, wday) {
    $(wday).addClass('fc-disabled-day')
   });
  });
  // 別の月に移動した時に予約できない曜日を表示
  $('.fc-button').click(function click_not_wday() {
   $.each(gon.not_weekday, function(index, wday) {
    $(wday).addClass('fc-disabled-day')
   });
  });
  // 予約できない日を表示
  $(function not_day() {
    $.each(gon.not_day, function(index, not_day) {
      $(not_day).addClass('fc-disabled-day')
    });
  });
  // 別の月に移動した時に予約できない日を表示
  $('.fc-button').click(function click_not_day() {
    $.each(gon.not_day, function(index, not_day) {
      $(not_day).addClass('fc-disabled-day')
    });
  });

  $('.reserve-type__button-label').click(function() {
    $(this).css({'background-color':'#60df52', 'color':'#fff'});
  })

});
