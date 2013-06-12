$(document).ready(function () {
    var keyword = getURLParameter("keyword");
    var categoryId = getURLParameter("searchInCategory");

    var dataAjax = {};

    if (keyword != null && keyword != "" && keyword != "null") dataAjax.keyword = keyword;
    if (categoryId != null && categoryId != "" && categoryId != "null" && isNaN(categoryId)) dataAjax.categoryId = categoryId;

    if (dataAjax.keyword == null) return false;

    searchProduct(dataAjax);

    $("#searchItem").on('submit', function (evt) {
        evt.preventDefault();
        searchProduct($(this).serialize());
    });

});

function searchProduct(dataAjax) {
    AjaxLoader("/Ajax/SearchProduct.aspx", "GET", dataAjax, function (msg) {
        $.get('/js/jquery.tmpl/grid_product_template.txt', function (data) {
            $("#ajax-Loader").hide('fast');
            $('.listProducts').html($.tmpl(data, msg));
        });
    }, function (arg1, arg2, arg3) {
        console.log(arg1);
    });
}