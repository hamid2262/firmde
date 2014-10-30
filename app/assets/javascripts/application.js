//= require jquery
//= require jquery_ujs
//= require my_theme/global/plugins/jquery-migrate.min.js
//= require bootstrap-sprockets

//= require my_theme/global/plugins/fancybox/source/jquery.fancybox.pack.js
//= require my_theme/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js
//= require my_theme/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js
//= require my_theme/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js
//= require my_theme/frontend/pages/scripts/revo-slider-init.js

//= require my_theme/frontend/layout/scripts/back-to-top.js
//= require my_theme/frontend/pages/scripts/layerslider-init.js
//= require my_theme/frontend/layout/scripts/layout.js

//= require public_layout

$(function() {
  // Layout.init();    
  // Layout.initOWL();
  // LayersliderInit.initLayerSlider();
  // Layout.initImageZoom();
  // Layout.initTouchspin();
  // RevosliderInit.initRevoSlider();
  // Layout.initTwitter();
    Layout.init();    
    Layout.initOWL();
    RevosliderInit.initRevoSlider();
    Layout.initTwitter();
    //Layout.initFixHeaderWithPreHeader(); /* Switch On Header Fixing (only if you have pre-header) */
    //Layout.initNavScrolling(); 

});