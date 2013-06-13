$(document).ready(function () {
    $("#searchItem").on('submit', function (evt) {
        evt.preventDefault();
        searchProduct($(this).serialize());
    });
    var keyword = getURLParameter("keyword");
    var categoryId = getURLParameter("searchInCategory");
    var dataAjax = {};

    if (keyword != null && keyword != "" && keyword != "null") dataAjax.keyword = keyword;
    if (categoryId != null && categoryId != "" && categoryId != "null" && !isNaN(categoryId)) dataAjax.searchInCategory = categoryId;

    console.log(dataAjax);

    if (dataAjax.keyword == null) return false;


    searchProduct(dataAjax);



});

function searchProduct(dataAjax) {
    $('.listProducts').html("");
    $('.ajaxLoader').show('fast');

    if (dataAjax.keyword == null) {
        history.pushState(null, "page 2", "Search.aspx?" + dataAjax);
    }

    AjaxLoader("/Ajax/SearchProduct.aspx", "GET", dataAjax, function (msg) {
        if (msg.products.length == 0) {
            $('.search-error').show('fast');
        } else {
            $('.search-error').hide('fast');
            $.get('/js/jquery.tmpl/grid_product_template.txt', function (data) {
                $('.listProducts').html($.tmpl(data, msg));
            });
        }
        $('#ajaxLoader').hide('fast');
    }, function (arg1, arg2, arg3) {
        console.log(arg1);
    });
}