$ ->
  $("#navbar .dropdown").mouseenter ->
      $(".overlay").fadeIn(100)
  $("#navbar .dropdown").mouseleave ->
    $(".overlay").fadeOut(100)
