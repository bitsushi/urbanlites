// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');
tag.src = "http://www.youtube.com/player_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function onYouTubePlayerAPIReady() {
  window.player = new YT.Player('player', {
    height: '390',
    width: '640',
    videoId: 'u1zgFlCw8Aw',
    playerVars: { 'controls': 1, 'wmode': 'opaque' },
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
}

function onPlayerReady(event) {
  console.log('ready');
  // event.target.playVideo();
}

var done = false;
function onPlayerStateChange(event) {
  console.log(event.data);
  // if (event.data == YT.PlayerState.PLAYING && !done) {
  //   setTimeout(stopVideo, 6000);
  //   done = true;
  // }
}
function stopVideo() {
  window.player.stopVideo();
}