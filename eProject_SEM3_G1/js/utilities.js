﻿$.urlParam = function (name) {
    var results = new RegExp('[\\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
    return results[1] || 0;
}

function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search) || [, null])[1]
    );
}

function AjaxLoader(url, type, data, callBackFunction, errorFunction) {
    $.ajax({
        url: url,
        type: type,
        data: data,
        success: function (msg) {
            callBackFunction(msg);
        }, error: function (arg1, arg2, arg3) {
            errorFunction(arg1, arg2, arg3);
        }
    });
}