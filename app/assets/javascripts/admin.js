//= require jquery
//= require my_theme/global/plugins/jquery-migrate.min.js
// require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/shell
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/css
//= require summernote
//= require my_summernote

//= require my_theme/global/plugins/jquery.blockui.min.js
//= require my_theme/global/scripts/metronic.js
//= require my_theme/admin/layout/scripts/layout.js
//= require pages
// require turbolinks

$(function() {
   Metronic.init(); // init metronic core componets
   Layout.init(); // init layout
});
