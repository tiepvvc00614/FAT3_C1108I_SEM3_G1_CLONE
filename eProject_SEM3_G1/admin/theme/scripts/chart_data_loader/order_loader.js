$(document).ready(function () {
    $("#showOrderByPeriod").on('submit', function (evt) {
        evt.preventDefault();
        LoadOrderAjax($(this).serialize());
    });
    
    
});

function LoadOrderAjax(dataAjax) {

    $('.order-statistic-content').html("");
    $("#ajax-Loader").show('fast');
    $.ajax({
        url: "/admin/Ajax/OrderLoader.aspx",
        type: "GET",
        data: dataAjax,
        success: function (msg) {
            console.log(msg);
            msg.dateFrom = new Date(msg.dateFrom);
            msg.dateTo = new Date(msg.dateTo);
            msg.dateFrom = msg.dateFrom.getDate() + "/" + (msg.dateFrom.getMonth() + 1) + "/" + msg.dateFrom.getFullYear();
            msg.dateTo = msg.dateTo.getDate() + "/" + (msg.dateTo.getMonth() + 1) + "/" + msg.dateTo.getFullYear();
            $.get('/js/jquery.tmpl/order_statistic_table_template.txt', function (data) {
                $("#ajax-Loader").hide('fast');
                $('.order-statistic-content').html($.tmpl(data, msg));
            });
        }, error: function (arg1, arg2, arg3) {
            console.log(arg1);
        }

    });
    
}

