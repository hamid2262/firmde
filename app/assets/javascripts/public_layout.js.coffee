$ ->
  $("#navbar .dropdown").mouseenter ->
    $(".my_overlay").fadeIn(100)
  $("#navbar .dropdown").mouseleave ->
    $(".my_overlay").fadeOut(100)
