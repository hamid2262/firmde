//= require jquery
//= require my_theme/global/plugins/jquery-migrate.min.js
//= require jquery_ujs

//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.responsive

//= require bootstrap-sprockets

//= require my_theme/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js

//= require my_theme/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown
//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/shell
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/css
//= require summernote
//= require my_summernote

//= require my_theme/global/plugins/jquery.blockui.min.js
//= require my_theme/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js
//= require my_theme/global/scripts/metronic.js
//= require my_theme/admin/layout/scripts/layout.js
//= require pages
//= require datatable

$(function() {
  Metronic.init(); // init metronic core componets
  Layout.init(); // init layout

  MyDataTable.createTableForTerminalGereateStatus('#view_statistics_table');

});