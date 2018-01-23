$(document).ready(function () {
    var gridData1;
    var gridData2;
    var v_bal_type = 'BB';
    var v_cur_type = 'EUR,UAH,RUB,GBP,JPY,NOK,XAU,XAG,CHF,USD,CAD';

    function yesterday(elementID) {
        var now = new Date();
        now.setDate(now.getDate() - 1);
        var day = now.getDate();
        var month = now.getMonth() + 1;
        var year = now.getFullYear();
        yesterday = day + "." + month + "." + year;
        document.getElementById(elementID).value = yesterday;
        return yesterday;
    }

   yesterday("start_date");
    
    $(function () {
        $('#datetimepicker1').datepicker({
            language: "ru",

        });

        $('#datetimepicker2').datepicker({
            language: "ru"
        });
    }
    );

    ajaxRefreshSelectPicker("#form-control1", "includes_php/balance_chart/bal_type.php", {DATA: 'SELECT'});
    ajaxRefreshSelectPicker("#form-control2", "includes_php/balance_chart/curr_type.php", {DATA: 'SELECT'});

    function ajaxRefreshSelectPicker(idSelectPicker, URL, PostData) {

        $.ajax({url: URL, method: 'POST', data:
                    PostData,
            dataType: 'json', success: function (response) {
                var options = "";
                for (var key in response) {
                    options = options + '<option value="' + response[key]["KEY"] + '">' + response[key]["VALUE"] + '</option>';
                }
                $(idSelectPicker).html(options)
                        .selectpicker('refresh');
            }})
    }



    $("#datetimepicker1").on("change", function (value) {
        refresh();
        clearDetail();
    });

    $("#form-control1").on("change", function (value) {
        var This = $(this);
        v_bal_type = $(this).val();
        refresh();
        clearDetail();
    });

    $('#form-control2').change(function (e) {
        v_cur_type = $('#form-control2').val().join(',');
        refresh();
        clearDetail();
    });


    $('#refresh').click(function () {

        refresh();
        clearDetail();
    });

    function clearGrid() {
        var firstGrid = $("#grid1").swidget();

        if (firstGrid) {
            document.getElementById("grid1").innerHTML = '';
        }
    }

    function clearDetail() {
        var firstGrid = $("#grid2").swidget();

        if (firstGrid) {
            document.getElementById("grid2").innerHTML = '';
        }
    }

    // refresh();
    // document.getElementById("WAITIMG").style.visibility = "hidden";

    function refresh() {
        //  clearGrid();
        // var stopMusicExt = document.getElementByClass("filter-option");
        //  for (var i = 0; i < list.length; i++) {
        // list[i] is a node with the desired class name
        // }
        // console.log(stopMusicExt);
        //  element = $('button[data-id="form-control2"]');
        //   console.log(element);

        $.ajax({url: 'includes_php/BALANCE/get_data.php', method: 'POST', data:
                    {DATA: 'MASTER',
                        dateStart: document.getElementById("start_date").value,
                        dateFinish: '01.01.3000',
                        bal_type: v_bal_type,
                        cur_type: v_cur_type},
            dataType: 'json', success: function (response) {
                gridData1 = response;
                createFirstGridData();

            }})
    }

    function createSecondGridData() {
        document.getElementById("WAITIMG").style.display = "block";
        $.ajax({url: 'includes_php/BALANCE/get_data.php', method: 'POST', data:
                    {DATA: 'DETAILS',
                        RK: $("#grid1").swidget().contentTable.find(".sui-selected").get(0).cells[0].innerHTML,
                        BBBU: $("#grid1").swidget().contentTable.find(".sui-selected").get(0).cells[1].innerHTML,
                        CUR: $("#grid1").swidget().contentTable.find(".sui-selected").get(0).cells[5].innerHTML,
                        BAL_DATE: $("#grid1").swidget().contentTable.find(".sui-selected").get(0).cells[6].innerHTML,
                    },
            dataType: 'json', success: function (response) {
                document.getElementById("WAITIMG").style.display = "none";
                gridData2 = response;
                createSecondGridDataAdd();
            }})

    }


    function createFirstGridData() {
        var firstGrid = $("#grid1").swidget();
        if (firstGrid) {

            options = firstGrid.initialOptions;
            options.dataSource.data = gridData1;
            /*  options.exportOptions.dataSource.data = gridData1;*/
            firstGrid.refresh(options);
        } else {
            $("#grid1").shieldGrid({
                dataSource: {
                    data: gridData1
                },
                navigation: true,
                scrolling: true,
                resizing: true,
                paging: {
                    pageSize: 5
                },
                selection: {
                    type: "row",
                    multiple: false
                },

                filtering: {
                    enabled: true
                },
                events: {
                    selectionChanged: clearDetail
                },
                columns: [
                    {field: "RK", width: "150px", title: "RK ст/бал сч"},
                    {field: "BALANCE_TYPE", width: "150px", title: "Тип бал. BB, BU"},
                    {field: "BALANCE_ARTICLE_NM", width: "400px", title: "Статья баланса"},
                    {field: "BALANCE_ACCOUNT_NUMBER", width: "400px", title: "Балансовый счет(а)"},
                    {field: "CHAPTER_CCD", width: "150px", title: "Тип статьи/Глава баланса"},
                    {field: "CURRENCY_CCD", width: "150px", title: "Валюта"},
                    {field: "BALANCE_DATE1", width: "150px", title: "Балансовая дата"},
                    {field: "SALDO_PREV", width: "150px", title: "Остаток входящий"},
                    {field: "RSALDO_PREV", width: "150px", title: "Остаток входящий рублевый"},
                    {field: "SALDO_PREV_DT", width: "150px", title: "Остаток входящий ДТ"},
                    {field: "RSALDO_PREV_DT", width: "150px", title: "Остаток входящий рублевый ДТ"},
                    {field: "SALDO_PREV_CT", width: "150px", title: "Остаток входящий КТ"},
                    {field: "RSALDO_PREV_CT", width: "150px", title: "Остаток входящий рублевый КТ"},
                    {field: "DEBIT", width: "150px", title: "Обороты ДТ"},
                    {field: "RDEBIT", width: "150px", title: "Обороты ДТ рублевый"},
                    {field: "CREDIT", width: "150px", title: "Обороты КТ"},
                    {field: "RCREDIT", width: "150px", title: "Обороты КТ рублевый"},
                    {field: "SALDO", width: "150px", title: "Остаток исходящий"},
                    {field: "RSALDO", width: "150px", title: "Остаток исходящий рублевый"},
                    {field: "SALDO_DT", width: "150px", title: "Остаток исходящий ДТ"},
                    {field: "RSALDO_DT", width: "150px", title: "Остаток исходящий ДТ рублевый"},
                    {field: "SALDO_CT", width: "150px", title: "Остаток исходящий КТ"},
                    {field: "RSALDO_CT", width: "150px", title: "Остаток исходящий КТ рублевый"}
                ], toolbar: [
                    {
                        buttons: [
                            {
                                commandName: "excel",
                                caption: '<span class="sui-sprite sui-grid-icon-export-excel"></span> <span class="sui-grid-button-text">Excel</span>'
                            }
                        ]
                    },
                ],
                exportOptions: {
                    proxy: "/filesaver/save/",
                    excel: {
                        fileName: "Balance",
                        author: "Rncb",
                        /*  dataSource: {
                         data: gridData1
                         },*/
                        readDataSource: true
                    }
                }

            });
        }
    }
    $("#exportButton").click(function () {
        //   document.getElementById("WAITIMG").style.display = "block";
        // document.getElementById("WAITIMG").style.visibility = "visible";
        createSecondGridData();
        // document.getElementById("WAITIMG").style.visibility = "hidden";
    });

    function createSecondGridDataAdd() {
        $("#hint").hide();
        var selectedItemID = $("#grid1").swidget().contentTable.find(".sui-selected").get(0).cells[0].innerHTML;
        var secondGrid = $("#grid2").swidget();
        if (secondGrid) {
            options = secondGrid.initialOptions;
            options.dataSource.data = gridData2;
            secondGrid.refresh(options);

        } else {

            $("#grid2").shieldGrid({
                dataSource: {
                    data: gridData2
                },
                paging: true,
                navigation: true,
                scrolling: true,
                resizing: true,
                paging: {
                    pageSize: 50
                },
                filtering: {
                    enabled: true
                },
                columns: [
                    {field: "BALANCE_DATE", width: "150px", title: "Дата баланса"},
                    {field: "RK", width: "150px", title: "Rk ст. бал. / rk бал. сч."},
                    {field: "BALANCE_ARTICLE_NM", width: "400px", title: "Наим.ст.бал."},
                    {field: "BALANCE_ACCOUNT_NUMBER", width: "150px", title: "Номер бал. счета"},
                    {field: "ACCOUNT_NUMBER", width: "150px", title: "Номер счета"},
                    {field: "ACCOUNT_DESC", width: "400px", title: "Наим. счета"},
                    {field: "CURRENCY_CCD", width: "150px", title: "Код валюты"},
                    {field: "REST_AMT", width: "150px", title: "Остаток в валюте"},
                    {field: "REST_AMT_NC", width: "150px", title: "Остаток в рублях"},
                    {field: "BRANCH_SERVICE_CCD", width: "150px", title: "Код обсл. терр. подр."},
                    {field: "BRANCH_NM", width: "200px", title: "Наим-е обсл-го терр. подр"},
                    {field: "BUSINESS_GROUP_NM", width: "160px", title: "Наим-е бизнес-группы"},
                    {field: "COUNTERPARTY_GROUP_NM", width: "150px", title: "Наим-е группы контрагентов"},
                    {field: "CCD", width: "150px", title: "Тип продукта"},
                    {field: "PRODUCT_NM", width: "300px", title: "Наименование продукта"},
                ],
                toolbar: [
                    {
                        buttons: [
                            {
                                commandName: "excel",
                                caption: '<span class="sui-sprite sui-grid-icon-export-excel"></span> <span class="sui-grid-button-text">Excel</span>'
                            }
                        ]
                    }
                ],
                exportOptions: {
                    proxy: "/filesaver/save/",
                    excel: {
                        fileName: "Balance-detail",
                        author: "Rncb",
                        //   fileFormat: "xlsx",
                        //   noLegacyFallback: false,
                        created: new Date(),
                        columnFields: ["BALANCE_DATE",
                            "RK",
                            /*"BALANCE_ARTICLE_NM",*/
                            "BALANCE_ACCOUNT_NUMBER",
                            "ACCOUNT_NUMBER",
                            "ACCOUNT_DESC",
                            "CURRENCY_CCD",
                            "REST_AMT",
                            "REST_AMT_NC",
                            "BRANCH_SERVICE_CCD",
                            "BRANCH_NM",
                            "BUSINESS_GROUP_NM",
                            "COUNTERPARTY_GROUP_NM",
                            "CCD",
                            "PRODUCT_NM",
                        ],
                        /*   dataSource: {
                         data: gridData2
                         },
                         readDataSource: true*/
                    }
                }
            });
        }
    }
});


