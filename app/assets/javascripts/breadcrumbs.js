$(document).on('turbolinks:load', function() {
  //パンくずリスト
  if (location.href.match(/\/equipment_infos\/new/) || location.href.match(/\/equipment_infos\/\d+\/edit/)) {
    $('.step-one').addClass('active');
  }
  if (location.href.match(/\/basic_infos\/new/) || location.href.match(/\/basic_infos\/\d+\/edit/)) {
    $('.step-two').addClass('active');
  }
  if (location.href.match(/\/descriptions\/new/) || location.href.match(/\/descriptions\/\d+\/edit/)) {
    $('.step-three').addClass('active');
  }
  if (location.href.match(/\/space_images\/new/) || location.href.match(/\/space_images\/\d+\/edit/)) {
    $('.step-four').addClass('active');
  }
  if (location.href.match(/\/plans\/new/) || location.href.match(/\/plans\/\d+\/edit/)) {
    $('.step-five').addClass('active');
  }
});
