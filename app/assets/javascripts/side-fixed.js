$(document).on('turbolinks:load', function() {
  // 要素の高さを取得
  var siteHeaderH = $('.site-other-header').height();
  var topImageH   = $('.space-head__img').height();
  var siteDetailH = $('.space-detail').height();
  var notesH      = $('.space-main__attention').height();
  var sideBarH    = $('.space-side__box').height();
  var startFixed = siteHeaderH + topImageH ;
  var endFixed   = startFixed + siteDetailH + notesH - sideBarH;
  // スクロール位置によるfixedのつけ外し
  $(window).scroll(function() {
    if ($(this).scrollTop() > startFixed && $(this).scrollTop() < endFixed ) {
      $('.space-side--fixed').css({'position':'', 'top': '' });
      $('.space-side--fixed').addClass('fixed');
    } else if ($(this).scrollTop() < startFixed || $(this).scrollTop() > endFixed ) {
      $('.space-side--fixed').removeClass('fixed');
    }
  });
  // 上の関数でelseを使うと上手くいかなかった分を切り分けにより改善
  $(window).scroll(function() {
    if ($(this).scrollTop() > endFixed) {
      $('.space-side--fixed').css({'position':'absolute', 'top': endFixed});
    };
  });

});
