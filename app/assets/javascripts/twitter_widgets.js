function loadScript(url){
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = url;
  script.async = true;
  script.charset = 'utf-8';
  document.getElementsByTagName('head')[0].appendChild(script);
}
  loadScript('https://platform.twitter.com/widgets.js');
