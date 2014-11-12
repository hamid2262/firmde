$ ->
  $("#contact_popup .opener").click (e) ->
    e.preventDefault()
    if $(this).parent().parent().css("bottom") == "55px"
      $(this).parent().parent().css("bottom", "-446px")
      $(".my_overlay").fadeOut(500)
    else
      $(this).parent().parent().css("bottom", "55px")
      $(".my_overlay").fadeIn(500)

  # $("#losungen_boxes .service-box-v1").mouseleave ->
  #   $(".losungen_pictogram", this).css("background-image", "url(https://s3-eu-west-1.amazonaws.com/opcde/assets/loesungen_icons/icons_gray.png)")