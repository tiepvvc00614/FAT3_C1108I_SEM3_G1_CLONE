$(document).ready(function () {
    $.ajax({
        url: "/Ajax/ShoppingCartHandler.aspx",
        type: "GET",
        data: {
        },
        success: function (msg) {
            $.get('/js/jquery.tmpl/cart_detail_template.txt', function (data) {
                $('#ctl00_MainContentPlaceHolder_content_place').html($.tmpl(data, msg));
            });
        }
    });
    
});