$(document).ready(function () {
    dataAjax = {};
    dataAjax.getRandom = "true";
    dataAjax.totalItem = 8;

    AjaxLoader("/Ajax/GetProduct.aspx", "GET", dataAjax,
    function (msg) {
        $.get('/js/jquery.tmpl/grid_product_template.txt', function (data) {
            $('.listProducts').html($.tmpl(data, msg));
        });
    },
    function (arg1, arg2, arg3) {
        console.log(arg1);
    });
});