$ ->
  $("#navbar #Loesungen").mouseenter ->
    $(".my_overlay").fadeIn(100)
  $("#navbar #Loesungen").mouseleave ->
    $(".my_overlay").fadeOut(100)