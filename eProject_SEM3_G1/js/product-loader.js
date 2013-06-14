(function ($) {
    $.extend(jQuery.tmpl.tag, {
        "for": {
            _default: { $2: "var i=1;i<=1;i++" },
            open: 'for ($2){',
            close: '};'
        }
    });
})(jQuery);

$('document').ready(function () {

    var container = $('.container');

    var productId = getURLParameter('productId');
    if (isNaN(productId)) {
        return false;
    }

    var dataAjax = {};
    dataAjax.productId = productId;

    AjaxLoader("/Ajax/GetProduct.aspx", "GET", dataAjax, function (msg) {
        $.get('/js/jquery.tmpl/product_detail_template.txt', function (data) {
            $('#ctl00_MainContentPlaceHolder_content_place').html($.tmpl(data, msg));
            $("#add-to-cart-form").on("submit", function (evt) {
                evt.preventDefault();
                var productId = $("#productID").val();
                var quantitySelected = $("select[name=quantity]").val();
                if (isNaN(productId) || isNaN(quantitySelected)) {
                    alert("Please choose quantity");
                    return false;
                }
                addToCart(productId, quantitySelected);
            });

            $("#related-btn-add-to-cart").each(function (i) {
                $(this).on('click', function (evt) {
                    console.log("Okay");
                    evt.preventDefault();
                    var productId = $(this).attr('productId');
                    addToCart(productId, 1);
                });
            });
        });
    }, 
    function (arg1, arg2, arg3) {
        
    });
});

function addToCart(productId, quantity) {
    $('#ajax-loader').show();
    $.ajax({
        url: "/Ajax/ShoppingCartHandler.aspx",
        type: "POST",
        data: {
            quantity: quantity,
            product: productId
        },
        success: function (msg) {
            console.log(msg);
            if (msg.message == "Added") {
                $.get('./js/jquery.tmpl/cart_template.txt', function (data) {
                    $('.cart').html($.tmpl(data, msg));
                    $('#shoppingCartItemCount').trigger('click', function () {
                        $('body').animate({ scrollTop: 0 }, 5000);
                    });

                });
            }
            else
                alert(msg.message);
            $('#ajax-loader').hide();
        }
    });
}