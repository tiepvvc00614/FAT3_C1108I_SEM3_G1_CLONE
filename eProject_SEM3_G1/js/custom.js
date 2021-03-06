function topNavToSelect() {
	// building select menu
	$('<select class="upper-nav" />').appendTo('.upperHeader .container');

	// building an option for select menu
	$('<option />', {
		'selected': 'selected',
		'value' : '',
		'text': 'Choise Page...'
	}).appendTo('.upperHeader .container select');

	$('.upperHeader ul.inline li a').each(function(){
		var target = $(this);

		$('<option />', {
			'value' : target.attr('href'),
			'text': target.text()
		}).appendTo('.upperHeader .container select');
	});
	// on clicking on link
	$('.upperHeader .container select').on('change',function(){
		window.location = $(this).find('option:selected').val();
	});
}

// building select .navbar for mobile width only
function NavToSelect() {

	// building select menu
	$('<select />').appendTo('.navbar');

	// building an option for select menu
	$('<option />', {
		'selected': 'selected',
		'value' : '',
		'text': 'Choise Page...'
	}).appendTo('.navbar select');

	$('.navbar ul li a').each(function(){
		var target = $(this);

		$('<option />', {
			'value' : target.attr('href'),
			'text': target.text()
		}).appendTo('.navbar select');
	});
	// on clicking on link
	$('.navbar select').on('change',function(){
		window.location = $(this).find('option:selected').val();
	});

}


// bootstrap tooltip invocking
function showtooltip() {
	$('a[data-toggle=tooltip], button[data-toggle=tooltip], input[data-toggle=tooltip]')
	.tooltip({
		animation:false
	});
}

function cartContent() {
	var $cartContent = $('.cart-content');
	$cartContent.find('table').click(function(e){
		e.stopPropagation();
	});
}

// flexslider on home page
function flexSlideShow() {
	$('.flexslider').flexslider({
		 animation: "slide",
		 slideshowSpeed: 4000,
		 directionNav: false,
		 pauseOnHover: true,
		 directionNav: false
	});
}

// bootstrap carousel in caregories grid and list
function productSlider() {
	$('.carousel').carousel();
}


// link fancybox plugin on product detail
function productFancyBox() {
	$(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none'
	});
}

// dropdown mainnav
function dropdownMainNav() {
	var navLis = $('div.navbar > ul.nav > li');
	navLis.hover(
		function () {
			// hide the css default behavir
			$(this).children('div').css('display', 'none');
			//show its submenu
			$(this).children('div').slideDown(150);
		}, 
		function () {
			//hide its submenu
			$(this).children('div').slideUp(350);		
		}
	);

}

// display your twiter feed here
function latestTweets() {
	
    $(".tweet").tweet({
        username: "seaofclouds",
        join_text: "auto",
        avatar_size: 0,
        count: 3,
        auto_join_text_default: "we said,", 
        auto_join_text_ed: "we",
        auto_join_text_ing: "we were",
        auto_join_text_reply: "we replied to",
        auto_join_text_url: "we were checking out",
        loading_text: "loading tweets..."
    });
}

// open and hide the side panel
function openSidePanel() {
	var widgetToggleLink = $('a.Widget-toggle-link'),
		$switcher = $(".switcher");

	widgetToggleLink.on('click', function(e){
		e.preventDefault();
		var left = $switcher.css('left');
		if(left <= '-170px'){
			$switcher.animate({
				left: 0
			}, 200, function(){
				$(this).find(widgetToggleLink).text('-');
			});
		}else{
			$switcher.animate({
				left: '-170px'
			}, 200, function(){
				$(this).find(widgetToggleLink).text('+');
			});
		}
	});
}


// change background pattern
function changeBackgroundPattern() {
	/* cookie vars */
	var cookie_name1 = "site_pattern";
	var cookie_options1 = { path: '/', expires: 30 };
	var get_cookie1 = $.cookie('site_pattern');
	if(get_cookie1 == null){get_cookie1 = 'retina_wood'}
	// backgrounds
	$('head')
	.append('<link rel="stylesheet" id="active-bg" href="css/backgrounds/'+get_cookie1+'.css">');

	$(".switcher > .switcher-content > .pattern-switch").find('a').bind('click', function(e) {
		$('#active-bg').remove();
		e.preventDefault();
		var bgName = $(this).text();
		$.cookie(cookie_name1, bgName, cookie_options1);
		$('head')
		.append('<link rel="stylesheet" id="active-bg" href="css/backgrounds/'+bgName+'.css">');
	});
}


// change layoutStyle
function changeLayoutStyle() {
	/* cookie vars */
	var cookie_name2 = "site_layout";
	var cookie_options2 = { path: '/', expires: 30 };
	var get_cookie2 = $.cookie('site_layout');
	if(get_cookie2 == null){get_cookie2 = 'Wide'}
	//layout
	$('head')
	.append('<link rel="stylesheet" id="active-bg" href="css/layout/'+get_cookie2+'.css">');
	$(".switcher > .switcher-content > .layout-switch").find('a').bind('click', function(e){
		$('#active-layout').remove();
		e.preventDefault();
		var layoutName = $(this).text();
		$.cookie(cookie_name2, layoutName, cookie_options2);
		$('head')
		.append('<link rel="stylesheet" id="active-layout" href="css/layout/'+layoutName+'.css">');

	});
}


// change site color
function changeColorStyle() {
	/* cookie vars */
	var cookie_name3 = "site_color";
	var cookie_options3 = { path: '/', expires: 30 };
	var get_cookie3 = $.cookie('site_color');
	if(get_cookie3 == null){get_cookie3 = 'orange'}
	//layout
	$('head')
	.append('<link rel="stylesheet" id="active-bg" href="css/color/'+get_cookie3+'.css">');
	$(".switcher > .switcher-content > .color-switch").find('a').bind('click', function(e){
		$('#active-color').remove();
		e.preventDefault();
		var colorName = $(this).text();
		$.cookie(cookie_name3, colorName, cookie_options3);
		$('head')
		.append('<link rel="stylesheet" id="active-color" href="css/color/'+colorName+'.css">');

	});
}


// range price product
function rangePriceSlider() {
	var $slideRange = $("#slider-range"),
		amount = $( "#amount" );
	$slideRange.slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        amount.val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    amount.val( "$" + $slideRange.slider( "values", 0 ) +
      " - $" + $slideRange.slider( "values", 1 ) );
}


function preloaderShoppingCart() {
    $.ajax({
        url: "/Ajax/ShoppingCartHandler.aspx",
        type: "GET",
        data: {
        },
        success: function (msg) {
            $.get('/js/jquery.tmpl/cart_template.txt', function (data) {
                $('.cart').html($.tmpl(data, msg));
            });
        }
    });
}


function addressDidChange() {
    var billingFirstName = $("#first-name-billing");
    var billingLastName = $("#last-name-billing");
    var billingCompany = $("#company-billing");
    var billingFirstAddress = $("#first-address-billing");
    var billingSecondAddress = $("#second-address-billing");
    var billingCity = $("#city-billing");
    var billingPostcode = $("#post-code-billing");
    var billingCountry = $("select[name=country-billing]");
    var billingRegion = $("select[name=region-billing]");
    var billingPhone = $("#phone-billing");

    var shippingFirstName = $("#first-name-shipping");
    var shippingLastName = $("#last-name-shipping");
    var shippingCompany = $("#company-shipping");
    var shippingFirstAddress = $("#first-address-shipping");
    var shippingSecondAddress = $("#second-address-shipping");
    var shippingCity = $("#city-shipping");
    var shippingPostcode = $("#post-code-shipping");
    var shippingCountry = $("select[name=country-shipping]");
    var shippingRegion = $("select[name=region-shipping]");
    var shippingPhone = $("#phone-shipping");

    var json2Template = {
        billingAddress:
        {
            firstName: billingFirstName.val(),
            lastName: billingLastName.val(),
            company: billingCompany.val(),
            firstAddress: billingFirstAddress.val(),
            secondAddress: billingSecondAddress.val(),
            city: billingCity.val(),
            postCode: billingPostcode.val(),
            country: billingCountry.val(),
            region: billingRegion.val(),
            phone: billingPhone.val()
        },
        shippingAddress:
        {
            firstName: shippingFirstName.val(),
            lastName: shippingLastName.val(),
            company: shippingCompany.val(),
            firstAddress: shippingFirstAddress.val(),
            secondAddress: shippingSecondAddress.val(),
            city: shippingCity.val(),
            postCode: shippingPostcode.val(),
            country: shippingCountry.val(),
            region: shippingRegion.val(),
            phone: shippingPhone.val()
        }
    };
    $.get('/js/jquery.tmpl/address_information_review_template.txt', function (data) {
        $('#review-address').html($.tmpl(data, json2Template));
    });
}

$(document).ready(function () {
    topNavToSelect();
    NavToSelect();
    showtooltip();
    cartContent();
    flexSlideShow();
    productSlider();
    productFancyBox();
    dropdownMainNav();
    latestTweets();
    openSidePanel();
    changeBackgroundPattern();
    changeLayoutStyle();
    changeColorStyle();
    rangePriceSlider();
    
    preloaderShoppingCart();
    $("#checkout-address-validate input").on("keyup", function () {
        addressDidChange();
    });
    $("#checkout-address-validate select").on("change", function () {
        addressDidChange();
    });

    /**=============BEGIN CHECKOUT USER CHOOSE OPTION=================**/
    var wizard = $("#wizard").wizardPro();
    $("#optChooseCheckout").on('submit', function (evt) {
        evt.preventDefault();
        var userChoosed = $("input[name=optionsRadios]:checked").val();
        if (userChoosed == 1) {
            window.location = "/Register.aspx?ref=Checkout.aspx";
        } else {
            wizard.openstep('next');
        }
    });

    /**=============END CHECKOUT USER CHOOSE OPTION=================**/


    /**=============BEGIN CHECKOUT ADDRESS VALIDATE=================**/
    $("#submit-validate-address").on("click", function (evt) {
        evt.preventDefault();
        var firstNameBilling = $("#first-name-billing");
        var lastNameBilling = $("#last-name-billing");
        var firstAddressBilling = $("#first-address-billing");
        var secondAddressBilling = $("#second-address-billing");
        var cityBilling = $("#city-billing");
        var postCodeBilling = $("#post-code-billing");
        var phoneBilling = $("#phone-billing");
        var countryBilling = $("select[name=country-billing]");
        var regionBilling = $("select[name=region-billing]");
        var emailContact = $("#email-contact");

        var firstNameShipping = $("#first-name-shipping");
        var lastNameShipping = $("#last-name-shipping");
        var firstAddressShipping = $("#first-address-shipping");
        var secondAddressShipping = $("#second-address-shipping");
        var cityShipping = $("#city-shipping");
        var postCodeShipping = $("#post-code-shipping");
        var phoneShipping = $("#phone-shipping");
        var countryShipping = $("select[name=country-shipping]");
        var regionShipping = $("select[name=region-shipping]");

        var validArray = [firstNameBilling, emailContact, lastNameBilling, firstAddressBilling, cityBilling, postCodeBilling, phoneBilling, countryBilling, regionBilling, firstNameShipping, lastNameShipping, firstAddressShipping, cityShipping, countryShipping, regionShipping, postCodeShipping, phoneShipping];
        var isValid = false;

        isValid = validateInformation(validArray, function (message, index, val, isValid) {
            if (!isValid) {
                val.next('span').html("<i class='icon-remove'></i> " + message + "");
                val.parent().parent().removeClass("success");
                val.parent().parent().addClass("error");
                val.next('span').show('fast');
            } else {
                val.parent().parent().removeClass("error");
                val.parent().parent().addClass("success");
                val.next('span').html("<i class='icon-ok'></i> " + message + "");
                val.next('span').show('fast');
            }
        });

        if (!isValid) {
            wizard.openstep('next');
            //$("#checkout-address-validate").submit();
        }
    });
    /**=============END CHECKOUT ADDRESS VALIDATE=================**/




    /*===================BEGIN EDIT CART ======================*/



    /*===================END EDIT CART =======================*/




    /**=============BEGIN LOGIN AJAX=================**/
    $("#loginForm").on("submit", function (evt) {
        evt.preventDefault();
        var isRemember = $("#rememberLogin").is(":checked") ? 1 : 0;
        var emailLogin = $("#emailLogin");
        var passwordLogin = $("#passwordLogin");
        var validateArray = [emailLogin, passwordLogin];

        var isValid = validateInformation(validateArray, function (message, index, val, isValid) {
            if (!isValid) {
                val.next('span').html("<i class='icon-remove'></i> " + message + "");
                val.parent().attr("class", "control-group error");
                val.next('span').show('fast');
            } else {
                val.parent().attr("class", "control-group success");
                val.next('span').html("<i class='icon-ok'></i> " + message + "");
                val.next('span').show('fast');
            }

        });
        if (isValid) {
            AjaxLoader("/Ajax/Login.aspx", "POST", $(this).serialize(), function (msg) {
                if (msg.message == "True") {
                    window.location = "/Default.aspx";
                } else {
                    alert(msg.message);
                }
            }, function (arg1, arg2, arg3) {
                console.log(arg1);
                console.log(arg2);
                console.log(arg3);
            });
        }
    });
    /**=============END LOGIN AJAX=================**/




    /**=============BEGIN REGISTER AJAX=================**/

    $("#registerForm").on("submit", function (evt) {
        evt.preventDefault();
        var firstNameRegister = $("#inputFirstName");
        var lastNameRegister = $("#inputLastName");
        var emailRegister = $("#inputEMAdd");
        var phoneRegister = $("#inputTele");
        var faxRegister = $("#inputFAX");
        var companyRegister = $("#inputCompany");
        var firstAddressRegister = $("#inputFirstAdd");
        var secondAddressRegister = $("#inputSecondAdd");
        var cityRegister = $("#inputCity");
        var postCodeRegister = $("#inputPostCode");
        var countryRegister = $("#inputCountry");
        var regionRegister = $("#inputRegion");
        var passwordRegister = $("#inputPass");
        var repasswordRegister = $("#inputConPass");
        var agreeWithTermRegister = $("#inputAgreeTerm");

        var validateArray = [firstNameRegister, lastNameRegister, emailRegister, phoneRegister, firstAddressRegister, cityRegister, postCodeRegister, countryRegister, regionRegister, [passwordRegister, repasswordRegister]];

        var isValid = validateInformation(validateArray, function (message, index, val, isValid) {
            if (!isValid) {
                val.next('span').html("<i class='icon-remove'></i> " + message + "");
                val.parent().parent().removeClass("success");
                val.parent().parent().addClass("error");
                val.next('span').show('fast');
            } else {
                val.parent().parent().removeClass("error");
                val.parent().parent().addClass("success");
                val.next('span').html("<i class='icon-ok'></i> " + message + "");
                val.next('span').show('fast');
            }
        });
        isValid = (isValid && agreeWithTermRegister.is(":checked"));
        if (isValid) {
            AjaxLoader("/Ajax/Register.aspx", "POST", $(this).serialize(), function (msg) {
                if (msg.message == "True") {
                    $('.register').html("<h2>Thank you</h2><p>Thank you for register at our site</p>");
                } else {
                    alert(msg.message);
                }
            }, function (arg1, arg2, arg3) {
                console.log(arg1);
                console.log(arg2);
                console.log(arg3);

            });
        }
    });

    /**=============END REGISTER AJAX=================**/




    /*============BEGIN CONTACT FORM==============*/
    $("#contact-us").on("submit", function (evt) {
        var nameContact = $("input[name=name-contact]");
        var emailContact = $("input[name=email-contact]");
        var messageContact = $("textarea[name=message-contact]");

        var arrayValid = [nameContact, emailContact, messageContact];

        var isValid = validateInformation(arrayValid, function (message, index, val, isValid) {
            if (!isValid) alert("Please fill all field");
        });

        evt.preventDefault();
        if (isValid) {
            $("#ajaxLoader").show('fast');
            AjaxLoader("/Ajax/Contact.aspx", $(this).attr("method"), $(this).serialize(), function (msg) {
                $("#ajaxLoader").hide('fast');
                console.log(msg);
            }, function (arg1, arg2, arg3) {
                console.log(arg1);
            });
        }
    });

    /*============END CONTACT FORM==============*/

});









function validateInformation(listInputObject, callBackFunction) {
    var isValid = true;
    $.each(listInputObject, function (index, val) {
        if (!(val.length > 1)) {
            val.focusout(function () {
                var arrTmp = [val];
                validateInformation(arrTmp, callBackFunction);
            });
        }
        if (val.length > 1) {
            if (validateInformation(val, callBackFunction)) {
                if (val[0].val() != val[1].val()) {
                    callBackFunction('Please confirm that', index, val[0], false);
                    callBackFunction('Please confirm that', index, val[1], false);
                    isValid = false;
                }
            }

        } else if (val.val() == "") {
            callBackFunction("This field can't be blank", index, val, false);
            isValid = false;
        } else {
            var typeValid = val.attr('typeValid');
            if (typeValid == "email") {
                var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                if (!pattern.test(val.val())) {
                    callBackFunction('Invalid email format', index, val);
                    isValid = false;
                } else {
                    callBackFunction('Valid', index, val, true);
                }
            } else if (typeValid == "phone") {
                var pattern = /\d{10,12}$/;
                if (!pattern.test(val.val())) {
                    callBackFunction('Invalid phone format', index, val);
                    isValid = false;
                } else {
                    callBackFunction('Valid', index, val, true);
                }
            } else if (val.is("input") && val.attr("type") == "checkbox") {
                if (val.is(":checked")) {
                    callBackFunction('Valid', index, val, true);
                } else {
                    callBackFunction('Please tick that', index, val, false);
                    isValid = false;
                }
            } else if (val.is("select")) {
                if (val.val() == val.children("option:first").val()) {
                    callBackFunction('Please choose', index, val, false);
                    isValid = false;
                } else {
                    callBackFunction('Valid', index, val, true);
                }
            } else {
                callBackFunction('Valid', index, val, true);
            }
        }
    });
    return isValid;
}