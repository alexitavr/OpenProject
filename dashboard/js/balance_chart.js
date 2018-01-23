$(document).ready(function () {
    var gridData1;
    var gridData2;
    var v_bal_type = 'BB';
    var v_cur_type = 'RUB';
    var v_bal_acc = null;
    var v_bal_RK = null;

    $(function () {
        $('#datetimepicker1').datepicker({
            language: "ru",

        });

    }
    );
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

    refreshFilter('BB');

    function  refreshFilter(bal_type) {
        ajaxRefreshSelectPicker("#form-control3",
                "includes_php/balance_chart/Bal_acc.php",
                {BAL_TYPE: bal_type});

        ajaxRefreshSelectPicker("#form-control4",
                "includes_php/balance_chart/Bal_RK.php",
                {BAL_TYPE: bal_type});

    }

    $("#datetimepicker1").on("change", function (value) {
        refresh();
    });

    $("#form-control1").on("change", function (value) {

        v_bal_type = $('#form-control1').val();
        refreshFilter(v_bal_type);

        refresh();
    });

    $("#form-control2").on("change", function (value) {
        v_cur_type = $('#form-control2').val().join(',');
        v_bal_RK = '';
        v_bal_acc = '';
        refresh();
    });

    $("#form-control3").on("change", function (value) {
        v_bal_acc = $('#form-control3').val().join(',');
        v_bal_RK = '';
        refresh();
    });

    $("#form-control4").on("change", function (value) {
        v_bal_RK = $('#form-control4').val().join(',');
        v_bal_acc = '';
        refresh();
    });

    $('#refresh').click(function () {
        refresh();
    });

    function getChart() {
        $(function () {
            var date = document.getElementById("start_date").value;
            var dataChart;
            var URL = 'includes_php/balance_chart/get_data_chart.php';

            $.ajax({url: URL, method: 'POST',
                data: {date: date,
                    bal: v_bal_type,
                    CUR: v_cur_type,
                    BAL_ACC: v_bal_acc,
                    BAL_RK: v_bal_RK,
                },
                dataType: 'json', success: //function (response) {

                        function (response) {
                            // Populate series
                            var SALDO_PREV = new Array();
                            var RSALDO_PREV = new Array();
                            var DEBIT = new Array();
                            var RDEBIT = new Array();
                            var CREDIT = new Array();
                            var RCREDIT = new Array();
                            var SALDO = new Array();
                            var RSALDO = new Array();
                            for (i = 0; i < response.length; i++) {
                                SALDO_PREV.push([response[i].KEY, response[i].SALDO_PREV]);
                                RSALDO_PREV.push([response[i].KEY, response[i].RSALDO_PREV]);
                                DEBIT.push([response[i].KEY, response[i].DEBIT]);
                                RDEBIT.push([response[i].KEY, response[i].RDEBIT]);
                                CREDIT.push([response[i].KEY, response[i].CREDIT]);
                                RCREDIT.push([response[i].KEY, response[i].RCREDIT]);
                                SALDO.push([response[i].KEY, response[i].SALDO]);
                                RSALDO.push([response[i].KEY, response[i].RSALDO]);
                            }


                            $('#container').highcharts({
                                chart: {
                                    type: "column"
                                },
                                title: {
                                    text: "Балансы РНКБ"
                                },
                                xAxis: {
                                    type: 'category',
                                    allowDecimals: false,
                                    title: {
                                        text: "Балансовый счет / статья"
                                    }
                                },
                                yAxis: {
                                    title: {
                                        text: 'Сумма, тыс',
                                    },
                                    type: 'logarithmic',
                                    minorTickInterval: 1000
                                }, /*tooltip: {
                                 / headerFormat: '<span style="font-size:10px">{point.key}</span><table>',*/
                                /*     pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                 '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                                 /*   footerFormat: '',
                                 },*/
                                series: [{
                                        name: 'Остаток входящий в вал',
                                        data: SALDO_PREV
                                    }, {
                                        name: 'Остаток входящий руб',
                                        data: RSALDO_PREV
                                    }, {
                                        name: 'Обороты ДТ в вал',
                                        data: DEBIT
                                    },
                                    {
                                        name: 'Обороты ДТ руб',
                                        data: RDEBIT
                                    }
                                    , {
                                        name: 'Обороты KТ в вал',
                                        data: CREDIT
                                    }, {
                                        name: 'Обороты KТ руб',
                                        data: RCREDIT
                                    }
                                    , {
                                        name: 'Остаток исходящий в вал',
                                        data: SALDO
                                    }, {
                                        name: 'Остаток исходящий в руб',
                                        data: RSALDO
                                    }

                                ]
                            });

                            /*  });*/
                        }})


        });
    }
//--------------------------------

    refresh();

    function refresh() {
        getChart();

    }

});
