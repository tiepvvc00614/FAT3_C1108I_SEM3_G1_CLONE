$(document).ready(function () {
    var fromDate = $.urlParam('fromDate');
    var toDate = $.urlParam('toDate');
    var filter = $.urlParam('filterBy');

    var dataAjax = {};

    if (fromDate != null && toDate != null) {
        dataAjax.fromDate = fromDate;
        dataAjax.toDate = toDate;
    }

    if (filter != null) {
        dataAjax.filter = filter;
    }

    console.log(dataAjax);

    if (fromDate != null && fromDate != "" && !isNaN(fromDate) && toDate != null && toDate != "" && !isNaN(toDate)) {
        /*$.ajax({
        url: "/admin/Ajax/OrderLoader.aspx",
        type: "GET",
        data: dataAjax,
        success: function (msg) {

        }
        });*/
    } else {

    }
});