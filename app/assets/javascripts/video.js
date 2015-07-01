function pageLoad() {
  videoObj = {
    "title": "test video title",
    "uid": "eS9bI7KDmeU",
    "url": "https://www.youtube.com/watch?v=eS9bI7KDmeU"
  };

  $("#btnCheckVideo").click(function() {
    uid = $("#video_url").val();
    checkVideo(uid)
  });

  // https://www.googleapis.com/youtube/v3/videos?key=AIzaSyBx6PNbsLcrB86i3cErr5EjIRoz6v8-8DI&part=snippet&id=8Td8zLMWU4Y
}

function checkVideo(uid) {
  console.log(uid);
}

$(document).ready(pageLoad);
$(document).on('page:load', pageLoad);