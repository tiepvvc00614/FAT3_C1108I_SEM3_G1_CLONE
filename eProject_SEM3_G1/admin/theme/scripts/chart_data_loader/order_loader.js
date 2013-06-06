$(document).ready(function () {
    var fromDate = getURLParameter('fromDate');
    var toDate = getURLParameter('toDate');
    var filterBy = getURLParameter('filterBy');

    var dataAjax = {};

    if (fromDate != null && fromDate != "" && fromDate != "null") dataAjax.fromDate = fromDate;
    if (toDate != null && toDate != "" && toDate != "null") dataAjax.toDate = toDate;
    if (filterBy != null && filterBy != "" && filterBy != "null") dataAjax.filterBy = filterBy;

    $.ajax({
        url: "/admin/Ajax/OrderLoader.aspx",
        type: "GET",
        data: dataAjax,
        success: function (msg) {
            msg.dateFrom = new Date(msg.dateFrom);
            msg.dateTo = new Date(msg.dateTo);
            msg.dateFrom = msg.dateFrom.getDate() + "/" + (msg.dateFrom.getMonth() + 1) + "/" + msg.dateFrom.getFullYear();
            msg.dateTo = msg.dateTo.getDate() + "/" + (msg.dateTo.getMonth() + 1) + "/" + msg.dateTo.getFullYear();
            $.get('/js/jquery.tmpl/order_statistic_table_template.txt', function (data) {
                $("#ajax-Loader").hide('fast');
                $('.order-statistic-content').append($.tmpl(data, msg));
            });
        }
    });
});

