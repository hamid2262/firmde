$ ->
  $("#navbar .dropdown").mouseenter ->
    $(".my_overlay").fadeIn(500)
  $("#navbar .dropdown").mouseleave ->
    $(".my_overlay").fadeOut(500)
