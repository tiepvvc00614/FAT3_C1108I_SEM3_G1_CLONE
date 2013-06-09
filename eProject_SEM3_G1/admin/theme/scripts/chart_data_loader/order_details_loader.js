$(document).ready(function () {
    var orderId = getURLParameter('orderId');
    var dataAjax = {};

    if (orderId != null && orderId != "" && !isNaN(orderId)) dataAjax.orderId = orderId;
    else return false;

    console.log(orderId);
});