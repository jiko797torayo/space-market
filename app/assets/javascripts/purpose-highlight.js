$(document).on('turbolinks:load', function() {
  var purposeClass = `.search--header--type__nav__${ gon.purpose_key }`;
  var purpose = gon.purpose_key;
  $(purposeClass).addClass('nav-highlight');

  var others = { 'film_shoot': 'ロケ撮影' , 'studio': '展示会', 'performance': '演奏', 'sports': 'スポーツ', 'office': 'オフィス', 'wedding': '結婚式', 'event': 'イベント', 'other': 'その他' };
  for(var key in others) {
    if(key == purpose) {
      $('.nav-others__title').text(others[key]).addClass('nav-highlight');
    }
  }
});
