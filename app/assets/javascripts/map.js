function loadScript(url){
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = url;
  script.async = true;
  script.defer = true;
  document.getElementsByTagName('head')[0].appendChild(script);
}
loadScript(`https://maps.googleapis.com/maps/api/js?key=${ gon.map_key }&callback=initMap`);
loadScript('https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js');

var map;
var marker = [];
//各スペースの経度緯度情報を格納
var markerData = [];
for (var i = 0; i < gon.space_latitude.length; i++){
  markerData.push({
    lat: gon.space_latitude[i],
    lng: gon.space_longitude[i],
  });
}

function initMap() {
  // 地図の作成
  var mapLatLng = new google.maps.LatLng({lat: markerData[0]['lat'], lng: markerData[0]['lng']}); // 緯度経度のデータ作成
  map = new google.maps.Map(document.getElementById('map'), { // #sampleに地図を埋め込む
    center: mapLatLng, // 地図の中心を指定
    zoom: 11 // 地図のズームを指定
  });

  //マーカー毎の処理
  for (var i = 0; i < markerData.length; i++) {
    markerLatLng = new google.maps.LatLng({lat: markerData[i]['lat'], lng: markerData[i]['lng']}); // 緯度経度のデータ作成
    marker[i] = new google.maps.Marker({ // マーカーの追加
      position: markerLatLng, // マーカーを立てる位置を指定
      map: map // マーカーを立てる地図を指定
    });
    markerEvent(i); // マーカーにクリックイベントを追加
  }
}
// マーカーにクリックイベントを追加
function markerEvent(i) {
  marker[i].addListener('click', function() { // マーカーをクリックしたとき
    $('.select-space').not('.hidden').addClass('hidden');
    $(`.select-space${i}`).removeClass('hidden');
  });
}
