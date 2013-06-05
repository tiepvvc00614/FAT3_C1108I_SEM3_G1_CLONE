$(document).ready(function () {
    var fromDate = getURLParameter('fromDate');
    var toDate = getURLParameter('toDate');
    var filterBy = getURLParameter('filterBy');

    console.log(fromDate);

    var dataAjax = {};

    if (fromDate != null && fromDate != "" && fromDate != "null") dataAjax.fromDate = fromDate;
    if (toDate != null && toDate != "" && toDate != "null") dataAjax.toDate = toDate;
    if (filterBy != null && filterBy != "" && filterBy != "null") dataAjax.filterBy = filterBy;

    $.ajax({
        url: "/admin/Ajax/OrderLoader.aspx",
        type: "GET",
        data: dataAjax,
        success: function (msg) {
            
        }
    });
});

