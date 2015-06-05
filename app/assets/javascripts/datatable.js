var MyDataTable = function () {

    var lang_de = {
            sEmptyTable: "Keine Daten in der Tabelle vorhanden",
            sInfo: "_START_ bis _END_ von _TOTAL_ Einträgen",
            sInfoEmpty: "0 bis 0 von 0 EintrÃ¤gen",
            sInfoFiltered: "(gefiltert von _MAX_ Einträgen)",
            sInfoPostFix: "",
            sInfoThousands: ".",
            sLengthMenu: "_MENU_ Einträge anzeigen",
            sLoadingRecords: "Wird geladen...",
            sProcessing: "Bitte warten...",
            sSearch: "Suchen",
            sZeroRecords: "Keine Einträge vorhanden.",
            oPaginate: {
                sFirst: "Erste",
                sPrevious: "Zurück",
                sNext: "Nächste", 
                sLast: "Letzte"
            },
            oAria: {
                sSortAscending: ": aktivieren, um Spalte aufsteigend zu sortieren",
                sSortDescending: ": aktivieren, um Spalte absteigend zu sortieren"
            }
    };

    var handleCreateTable = function (table) {
        var oTable = table.dataTable({
            // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
            // So when dropdowns used the scrollable div should be removed. 
            //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

            "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.
            
            
            // "columns": [{
            //     "orderable": false
            // }, {
            //     "orderable": true
            // }, {
            //     "orderable": true
            // }, {
            //     "orderable": true
            // }, {
            //     "orderable": true
            // }],

            "lengthMenu": [
                [5, 15, 20, -1],
                [5, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "pageLength": 5,            
            // "pagingType": "full_numbers",
            "language": lang_de,
            // {
            //     "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/German.json"
            // },
            "columnDefs": [{  // set default column settings
                'orderable': false,
                'targets': [0]
            }, {
                "searchable": false,
                "targets": [0]
            }],
            "order": [
                [3, "desc"]
            ] // set first column as a default sort by asc
        });
        return oTable
    };

    var handleCheckboxChangeRedrawChart = function (table, tableSelector, chartSelector) {
        table.on('change', 'tbody tr .checkboxes', function () {
            $(this).parents('tr').toggleClass("active");
            ChartDraw.plotAccordingToChoices(chartSelector, tableSelector);          
        });
    };

    var handleGroupCheckerChange = function (table, tableSelector, chartSelector) {
        table.find('.group-checkable').change(function () {
            var set = jQuery(this).attr("data-set");
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                if (checked) {
                    $(this).attr("checked", true);
                    $(this).parents('tr').addClass("active");
                } else {
                    $(this).attr("checked", false);
                    $(this).parents('tr').removeClass("active");
                };
            });

            ChartDraw.plotAccordingToChoices(chartSelector, tableSelector);
            jQuery.uniform.update(set);
        });
    };

    var handleClickOnPlusSign = function(table, oTable) {
        table.on('click', ' tbody td .row-details', function () {
            var nTr = $(this).parents('tr')[0];
            if (oTable.fnIsOpen(nTr)) {
                /* This row is already open - close it */
                $(this).addClass("row-details-close").removeClass("row-details-open");
                oTable.fnClose(nTr);
            } else {
                /* Open this row */
                $(this).addClass("row-details-open").removeClass("row-details-close");
                oTable.fnOpen(nTr, createFormatDetails(oTable, nTr), 'details');
            }
        });
    }

    var createFormatDetails = function(oTable, nTr) {
        var thNames = oTable.find("th")
        var aData = oTable.fnGetData(nTr);
        var sOut = '<table>';
        sOut += '<tr><td>'+ thNames[0].innerHTML+'</td><td>' + aData[0] + '</td></tr>';
        sOut += '<tr><td>'+ thNames[1].innerHTML+'</td><td>' + aData[1] + '</td></tr>';
        sOut += '<tr><td>'+ thNames[2].innerHTML+'</td><td>' + aData[2] + '</td></tr>';
        sOut += '<tr><td>'+ thNames[3].innerHTML+'</td><td>' + aData[3] + '</td></tr>';
        sOut += '<tr><td>'+ thNames[8].innerHTML+'</td><td>' + aData[8] + '</td></tr>';
        sOut += '<tr><td>'+ thNames[9].innerHTML+'</td><td>' + aData[9] + '</td></tr>';
        sOut += '</table><hr>';
        sOut += '<p><b>'+ thNames[7].innerHTML+'</b></td><td>' + aData[7] + '</p>';
        return sOut;
    };


    return {

        createTableForUmsats:  function(tableSelector, chartSelector){

            var table = $(tableSelector);

            handleCreateTable(table);

            handleGroupCheckerChange(table,tableSelector, chartSelector);

            handleCheckboxChangeRedrawChart(table,tableSelector, chartSelector);

        },

        createTableForOffeneTisches:  function(tableSelector){

            var table = $(tableSelector);

            oTable = handleCreateTable(table);
            handleClickOnPlusSign(table, oTable);

        },

        createFormatDetailsPlusSign: function(tableSelector) {
            var nCloneTh = document.createElement('th');
            nCloneTh.className = "table-checkbox";
            
            var nCloneTd = document.createElement('td');
            nCloneTd.innerHTML = '<span class="row-details row-details-close"></span>';

            table = $(tableSelector);

            table.find('thead tr').each(function () {
                this.insertBefore(nCloneTh, this.childNodes[0]);
            });

            table.find('tbody tr.detailable').each(function () {
                this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
            });
        },

        createTableForTerminalGereateStatus:  function(tableSelector){

            var table = $(tableSelector);

            oTable = handleCreateTable(table);
        }


    }// return

}();