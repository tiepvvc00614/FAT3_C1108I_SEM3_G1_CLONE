$(document).ready(function () {
    var returnURL = getURLParameter("returnURL");
    $("#login-admin-form").on('submit', function (evt) {
        console.log("OK");
        evt.preventDefault();
        AjaxLoader($(this).attr('action'), $(this).attr('method'), $(this).serialize(), function (msg) {
            if (msg.message == "True") {
                if (returnURL != null && returnURL != "" && returnURL != "null") window.location = returnURL;
                else window.location = "/admin/Default.aspx";
            }
        }, function (arg1, arg2, arg3) {

        });
    });
});