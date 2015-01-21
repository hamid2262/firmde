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
//= require my_theme/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js
//= require my_theme/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js
//= require my_theme/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js
//= require my_theme/frontend/pages/scripts/revo-slider-init.js

//= require my_theme/global/plugins/gmaps/gmaps

//= require my_theme/frontend/layout/scripts/back-to-top.js
//= require my_theme/frontend/pages/scripts/layerslider-init.js
//= require my_theme/frontend/layout/scripts/layout.js

//= require contact-us
//= require public_layout
//= require home
//= require contact_opener

//= require accordion_scroll
//= require nav_tab
//= require carousel_interval
//= require carousel_top

$(function() {
  Layout.init();    
  Layout.initOWL();
  RevosliderInit.initRevoSlider();
  Layout.initTwitter();
  ContactUs.init();
});

