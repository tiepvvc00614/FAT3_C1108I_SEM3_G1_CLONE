$(document).ready(function () {
    $.get('/js/jquery.tmpl/cart_detail_template.txt', function (data) {
        $('#ctl00_MainContentPlaceHolder_content_place').html($.tmpl(data, msg));
    });
});