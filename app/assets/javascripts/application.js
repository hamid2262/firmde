//= require jquery

//= require jquery_ujs
//= require my_theme/global/plugins/jquery-migrate.min.js
//= require bootstrap-sprockets

//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/shell
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/css
//= require summernote
//= require my_summernote


//= require my_theme/global/plugins/fancybox/source/jquery.fancybox.pack.js
//= require my_theme/global/plugins/jquery-mixitup/jquery.mixitup.min.js
//= require my_theme/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js
//= require my_theme/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js
//= require my_theme/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js
//= require my_theme/frontend/pages/scripts/revo-slider-init.js

// require my_theme/global/plugins/gmaps/gmaps

//= require my_theme/frontend/layout/scripts/back-to-top.js
//= require my_theme/frontend/pages/scripts/layerslider-init.js
//= require my_theme/frontend/layout/scripts/layout.js
//= require my_theme/frontend/pages/scripts/portfolio.js

// require contact-us
//= require public_layout
//= require home
//= require contact_opener

//= require accordion_scroll
//= require nav_tab
//= require navbar
//= require carousel_interval
//= require carousel_top

$(function() {
  Layout.init();    
  Layout.initOWL();
  RevosliderInit.initRevoSlider();
  Layout.initTwitter();
  Layout.initOWL();
  Portfolio.init();
  // ContactUs.init();


  $(".my_fancybox_image").on( "mouseenter", function() {
    attrSrc = $(this).attr( "src" )
    $(this).after("<div class='gallery-item'><a data-rel='fancybox-button' title='' href="+attrSrc+" class='fancybox-button'>"+"<img alt='x' src="+attrSrc+" class='img-responsive'>"+"<div class='zoomix'><i class='fa fa-search'></i></div></a></div>");
    $(this).remove()
  } )
  $(".fancybox-button").fancybox();

  $("img").tooltip({
    placement: 'top',
    html: true
  })
    
  $(window).scroll(function () { 
    if ($(window).scrollTop() > 20) {
      $('.header').addClass('fixed-header');
      $('.pre-header').addClass('fixed-pre-header');
    }else {
      $('.header').removeClass('fixed-header');
      $('.pre-header').removeClass('fixed-pre-header');
    }
  });


});

