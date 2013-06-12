$(document).ready(function () {
    var categoryId = getURLParameter('categoryId');
    var currentPage = 1;

    if (categoryId == null || categoryId == "" || categoryId == "null" || isNaN(categoryId)) return false;
    console.log(categoryId);
    reloadProduct(categoryId, currentPage);
});



function reloadProduct(categoryId, currentPage) {
    var dataAjax = {};
    dataAjax.categoryId = categoryId;
    dataAjax.currentPage = currentPage;
    console.log(dataAjax);
    AjaxLoader("/Ajax/GetProduct.aspx", "GET", dataAjax, function (msg) {
        console.log(msg);
        $.get('/js/jquery.tmpl/grid_product_template.txt', function (data) {
            $("#ajax-Loader").hide('fast');
            $('.listProducts').html($.tmpl(data, msg));
        });
    }, function (arg1, arg2, arg3) {
        console.log(arg1);
    });
}
