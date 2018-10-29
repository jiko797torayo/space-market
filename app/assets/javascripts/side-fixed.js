$(function () {
  $(window).scroll(function () {
    if ($(this).scrollTop() > 590 && $(this).scrollTop() < 5100 ) {
      $('.space-side--fixed').addClass('fixed');
    } else if ($(this).scrollTop() < 589 || $(this).scrollTop() > 5100 ) {
      $('.space-side--fixed').removeClass('fixed');
    }
  });
});
