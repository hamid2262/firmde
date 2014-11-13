$ ->
  $("#contact_popup .opener").click (e) ->
    e.preventDefault()
    if $(this).parent().parent().css("bottom") == "55px"
      $(this).parent().parent().css("bottom", "-409px")
      $(".my_overlay").fadeOut(500)
    else
      $(this).parent().parent().css("bottom", "55px")
      $(".my_overlay").fadeIn(500)