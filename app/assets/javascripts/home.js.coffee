$ ->
  $("#losungen_boxes .service-box-v1").mouseenter ->
    $(".losungen_pictogram", this).css("background-image", "url(https://s3-eu-west-1.amazonaws.com/opcde/assets/loesungen_icons/icons_white.png)")

  $("#losungen_boxes .service-box-v1").mouseleave ->
    $(".losungen_pictogram", this).css("background-image", "url(https://s3-eu-west-1.amazonaws.com/opcde/assets/loesungen_icons/icons_gray.png)")
