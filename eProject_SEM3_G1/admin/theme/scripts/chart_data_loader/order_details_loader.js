$(document).ready(function () {
    var orderId = getURLParameter('orderId');
    var dataAjax = {};

    if (orderId != null && orderId != "" && !isNaN(orderId)) dataAjax.orderId = orderId;
    else return false;

    console.log(dataAjax);
    AjaxLoader("/admin/Ajax/OrderLoader.aspx", "POST", dataAjax, function (msg) {
        $.get('/js/jquery.tmpl/order_detail_template.txt', function (data) {
            $("#ajax-Loader").hide('fast');
            $("#orderIdText").html("<i></i>View Order: #" + msg.orderId);
            $('#order-details').html($.tmpl(data, msg));
        });
    }, function (arg1, arg2, arg3) {
        console.log(arg1);
    });
});