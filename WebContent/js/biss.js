//
//Copyright: 2018 digiBlitz Foundation
//
//License: digiBlitz Public License 1.0 (DPL) 
//Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
//
//Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
//
//Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
//
//"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
//
(function($) {
	"use strict";

	$( 'document' ).ready(function() {

		//
		// Vars
		//

		var grid100Width = 0,
			useCustomHeaderMenuAnimation = 1,
			customHeaderMenuAnimationIn = 'fadeInLeft',
			customHeaderMenuAnimationOut = 'fadeOutRight',
			isBlockedMenuSet = 0,
			$blockedNavLi = $( '.site-header nav.blocked > ul.desktop-nav > li' ),
			paddingTop = 0,
			$normalNavLi = $( '.site-header nav.normal > ul.desktop-nav > li' );

		//
		//	Scroll to the top
		//

		$( 'body' ).on( 'click', '#scroll-to-the-top', function(e) { e.preventDefault(); $('body,html').animate({scrollTop: 0}, 500); });

		//
		// Skill item
		//

		$('.biss-skill').each(function() {

			var $this = $(this),
				name = $this.attr('data-name'),
				animated = $this.attr('data-animated'),
				value = $this.attr('data-value');

			if ( animated != undefined && animated != 0 ) {

				$this.addClass('animated');

			}

			$('<div class="name"><span>' + value + '%</span> - ' + name + '</div>').appendTo($(this));

			$('<div class="val-bg"><span style="width: ' + value + '%;"></span></div>').appendTo($(this));

		});

		//
		// Accordion
		//

		$('.biss-accordion').each(function() {

			var $this = $(this),
				$section = $this.find('.item'),
				$header = $section.find('header'),
				$i = $header.find('i.toggle'),
				$content = $section.find('.content'),
				active = $this.attr('data-active'),
				width = $this.attr('data-width');

			if ( width != undefined ) {

				$this.css('max-width', parseInt(width, 10) + 'px');

			}

			if ( active != undefined ) {

				active = parseInt($this.attr('data-active'), 10) - 1;

			} else {

				active = -1;

			}

			if (active >= 0 && active < $section.length) {

				$section.eq(active).addClass('active').find('.content').show().end().find('i.toggle').addClass('fa-minus');

			}

			$header.on('click', function() {

				$i.removeClass('fa-minus');

				if ($(this).closest('.item').hasClass('active')) {

					$(this).find('i.toggle').removeClass('fa-minus');

					$(this).parent().find('.content').slideUp();

					$(this).closest('.item').removeClass('active');

				} else {

					$(this).find('i.toggle').addClass('fa-minus');

					$content.slideUp();

					$section.removeClass('active');

					$(this).parent().find('.content').stop(true, true).slideToggle();

					$(this).closest('.item').toggleClass('active');

				}

			});

		});

		//
		// Tabs
		//

		$('.biss-tabs, .biss-tabs-2').each(function() {

			var $this = $(this),
				$h = $this.find('> header > span'),
				$items = $this.find('> .item'),
				active = $this.attr('data-active') - 1,
				width = $this.attr('data-width');

			if ( active != undefined) {

				$h.eq(active).addClass('active');

				$items.eq(active).show();

			} else {

				$h.eq(0).addClass('active');

				$items.eq(0).show();

			}

			if ( width != undefined ) {

				$this.width(parseInt(width, 10));

			}

			$h.on( 'click', function() {

				var id = $(this).index();

				$h.removeClass('active').eq(id).addClass('active');

				$items.hide().eq(id).fadeIn();

			});

		});

		//
		// Arrows
		//

		$('.arrow-down, .arrow-up').each(function() {

			$('<span class="arrow-elem">').appendTo($(this));

		});

		//
		// Handlers
		//

		$( 'body' ).on( 'mouseenter', '.site-header nav.blocked > ul.desktop-nav > li', function() {

			var $this = $( this ),
				$hover = $this.find( '> .wrapper > .hover' );

			$hover.stop( true, true ).stop(true, true).animate({
				'top'			: '0',
				'margin-top'	: '0'
			}, { queue:false, duration:200, easing: 'swing' } );

		} );

		$( 'body' ).on( 'mouseleave', '.site-header nav.blocked > ul.desktop-nav > li', function() {

			var $this = $( this ),
				$hover = $this.find( '> .wrapper > .hover' );

			$hover.stop( true, true ).stop(true, true).animate({
				'top'			: '100%',
				'margin-top'	: '-2px'
			}, { queue:false, duration:200, easing: 'swing' } );

		} );

		//
		// Services
		//

		$( 'body' ).on('mouseenter', '.services-1', function() {

			$( this ).find( '.color-bg' ).stop( true, true ).animate( { 'height':'100%' } );

			$( this ).find( 'a.biss-btn' ).removeClass( 'biss-btn-border-primary' ).addClass( 'biss-btn-border-white' );

		} );

		$( 'body' ).on('mouseleave', '.services-1', function() {

			$( this ).find( '.color-bg' ).stop( true, true ).animate( { 'height':'2px' } );

			$( this ).find( 'a.biss-btn' ).removeClass( 'biss-btn-border-white' ).addClass( 'biss-btn-border-primary' );

		} );

		//
		// Transparent bgs
		//

		$( '.transparent-bg-secondary' ).each( function() {

			var $this = $( this );

			$this.wrapInner( '<div class="transparent-bg-secondary-inner"/>' );

			$('<div class="transparent-bg-secondary-layer"/>').appendTo( $this );

		} );

		$( '.transparent-bg-primary' ).each( function() {

			var $this = $( this );

			$this.wrapInner( '<div class="transparent-bg-primary-inner"/>' );

			$('<div class="transparent-bg-primary-layer"/>').appendTo( $this );

		} );

		$( '.transparent-bg-white' ).each( function() {

			var $this = $( this );

			$this.wrapInner( '<div class="transparent-bg-white-inner"/>' );

			$('<div class="transparent-bg-white-layer"/>').appendTo( $this );

		} );

		//
		// Colorbox
		//

		$( '.post a.zoom' ).colorbox();

		$( '.project-item a.zoom' ).colorbox();

		$( '.product-item a.zoom' ).colorbox();
		
		$( 'a.single-imgs' ).colorbox();

		//
		// Header search
		//

		$( '.header-search input' ).on( 'focus', function() { $( this ).animate( {'width':80} ); } );
		$( '.header-search input' ).on( 'blur', function() { $( this ).animate( {'width':60} ); } );

		//
		// Mega menus
		//

		$( '#mega-menu-1' ).rivaMegaMenu({
			animationIn:customHeaderMenuAnimationIn,
			animationOut:customHeaderMenuAnimationOut,
			hoverId:'mega-menu-1-hover'
		});

		//
		// Customs Header Menu Animation
		//

		var customHeaderMenuAnimation = function( elem, action ) {

			if ( action == 'hover' ) {

				elem.show().removeClass('animated ' + customHeaderMenuAnimationOut ).addClass('animated ' + customHeaderMenuAnimationIn);

			} else if ( action == 'blur' ) {

				elem.removeClass('animated ' + customHeaderMenuAnimationIn ).addClass('animated ' + customHeaderMenuAnimationOut );

				elem.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {

					elem.hide();

					elem.removeClass('animated ' + customHeaderMenuAnimationOut );

				});

			}

		}

		//
		// Mobile menu
		//

		if ( $( '.site-header nav > ul.desktop-nav' ).length > 0 ) {

			$( '.site-header nav > ul.desktop-nav' ).clone().removeClass( 'hidden-sm hidden-xs desktop-nav' ).addClass( 'mobile-nav' ).attr( 'id', 'mobile-nav' ).find( '> li' ).each( function() {

				if ( $( this ).attr( 'id' ) == 'mega-menu-1-hover' ) {

					$( this ).remove().detach();
				}

			} ).end().appendTo( $( '#mobile-menu-wrapper' ) );

		}

		$( '#mobile-nav-icon' ).on( 'click', function() {

			$( this ).toggleClass( 'clicked' );

			$( '#mobile-nav' ).stop( true, true ).slideToggle();

		} );

		$( '#mobile-nav' ).find( 'li' ).each( function() {

			var $this = $( this ),
				$ul = $this.find( '> ul' );

			if ( $ul.length > 0 ) {

				$this.addClass( 'has' );

				$( '<i class="fa fa-angle-right"></i>' ).appendTo( $this );

			}

			$this.find( 'i.fa-angle-right' ).on( 'click', function() {

				$( this ).toggleClass( 'fa-angle-down' );

				$( this ).parent().find( '> ul' ).stop( true, true ).slideToggle();

			} );

		} );

		//
		// Normal menu
		//

		$normalNavLi.each( function() {

			var $this = $( this ),
				$li = $this.find( 'li' );

			$li.each( function() {

				var $this = $( this ),
					$ul = $( this ).find( 'ul' );

				if ( $ul.length > 0 ) {

					$( '<i class="fa fa-angle-right"></i>').appendTo( $( this ).find( '> a' ) );

					$this.on('mouseenter', function() {

						if ( useCustomHeaderMenuAnimation ) {

							customHeaderMenuAnimation( $ul, 'hover' );

						} else {

							$ul.stop( true, true ).fadeIn();

						}

					} );

					$this.on('mouseleave', function() {

						if ( useCustomHeaderMenuAnimation ) {

							customHeaderMenuAnimation( $ul, 'blur' );

						} else {

							$ul.stop( true, true ).fadeOut();

						}

					} );

				}

			} );

			$( '<span class="hover"></span>' ).appendTo( $this );

		} );

		$normalNavLi.on('mouseenter', function() {

			var $this = $( this ),
				$ul = $this.find( '> ul' );

			$this.find( '> .hover' ).animate( {
				'height':'100%'
			}, 200 );

			if ( $ul.length > 0 ) {

				if ( useCustomHeaderMenuAnimation ) {

					customHeaderMenuAnimation( $ul, 'hover' );

				} else {

					$ul.stop( true, true ).fadeIn();

				}

			}

		} );

		$normalNavLi.on('mouseleave', function() {

			var $this = $( this ),
				$ul = $this.find( '> ul' );

			$this.find( '> .hover' ).animate( {
				'height':'0'
			}, 200 );

			if ( $ul.length > 0 ) {

				if ( useCustomHeaderMenuAnimation ) {

					customHeaderMenuAnimation( $ul, 'blur' );

				} else {

					$ul.stop( true, true ).fadeOut();

				}

			}

		} );

		//
		// Blocked header menu
		//

		var setBlockedMenu = function() {

			grid100Width = parseInt( $( '.site-header nav.blocked' ).width(), 10 );

			if ( $blockedNavLi.length > 0 ) {

				$blockedNavLi.find( 'li' ).each(function() {

					var $this = $( this ),
						$ul = $this.find( '> ul' );

					if ( $ul.length > 0 && !isBlockedMenuSet ) {

						$( '<i class="fa fa-angle-right"></i>' ).appendTo( $this.find( '> a' ) );

					}

				});

				$blockedNavLi.width(Math.floor( ( grid100Width - parseInt( $blockedNavLi.css( 'padding-right' ), 10 ) * ( $blockedNavLi.length - 1 )  ) / $blockedNavLi.length ));

				if ( !isBlockedMenuSet ) {

					$blockedNavLi.find( '> a' ).wrap( '<div class="wrapper"/>' );

					$( '<div class="hover"/>' ).appendTo( $blockedNavLi.find( '.wrapper ') );

				}

				$blockedNavLi.on('mouseenter', function() {

					var $this = $( this ),
						$nestedUL = $this.find( '> ul' ),
						$hover = $this.find( '> .wrapper > .hover' );

					if ( $nestedUL.length > 0 ) {

						if ( useCustomHeaderMenuAnimation ) {

							customHeaderMenuAnimation( $nestedUL, 'hover' );

						} else {

							$nestedUL.stop( true, true ).fadeIn();

						}

					}

				} );

				$blockedNavLi.on('mouseleave', function() {

					var $this = $( this ),
						$nestedUL = $this.find( '> ul' ),
						$hover = $this.find( '> .wrapper > .hover' );

					if ( $nestedUL.length > 0 ) {

						if ( useCustomHeaderMenuAnimation ) {

							customHeaderMenuAnimation( $nestedUL, 'blur' );

						} else {

							$nestedUL.stop( true, true ).fadeOut();

						}

					}

				} );

				$blockedNavLi.find( 'ul' ).width( $blockedNavLi.find( '> .wrapper ').width() );

				$blockedNavLi.find( 'li' ).on('mouseenter', function() {

					var $this = $( this ),
						$ul = $this.find( '> ul' );

					if ( useCustomHeaderMenuAnimation ) {

						customHeaderMenuAnimation( $ul, 'hover' );

					} else {

						$ul.stop( true, true ).fadeIn();

					}

				});

				$blockedNavLi.find( 'li' ).on('mouseleave', function() {

					var $this = $( this ),
						$ul = $this.find( '> ul' );

					if ( useCustomHeaderMenuAnimation ) {

						customHeaderMenuAnimation( $ul, 'blur' );

					} else {

						$ul.stop( true, true ).fadeOut();

					}

				});

			}

			isBlockedMenuSet = 1;
		}

		setBlockedMenu();

		//
		// Cart
		//

		$( 'body' ).on('click', 'table.cart-product-table i.cart-table-change-qty', function() {

			var $this = $(this),
				position = $this.attr('data-position'),
				$displayQty = $('#cart-table-display-qty-' + position),
				$displayTotal = $('#cart-table-display-total-' + position),
				$tableQty = $('#cart-table-qty-' + position),
				$tableTotal = $('#cart-table-total-' + position),
				oldQty = parseInt($displayQty.attr('data-qty'), 10),
				price = parseInt($('#cart-table-price-' + position).attr('data-val'), 10),
				oldTotal = 0;

			if ( $this.hasClass('fa-plus')) {

				var newQty = oldQty + 1;

				$tableQty.attr('data-qty', newQty).val( newQty );

				$displayQty.html( newQty ).attr( 'data-qty', newQty );

				$tableTotal.val( newQty * price );

				$displayTotal.html('$' + newQty * price );

			} else {

				if ( oldQty != 1 ) {

					var newQty = oldQty - 1;

					$tableQty.attr('data-qty', newQty).val( newQty );

					$displayQty.html( newQty ).attr( 'data-qty', newQty );

					$tableTotal.val( newQty * price );

					$displayTotal.html('$' + newQty * price );

				}
			}

		});

		//
		// Shop checkout
		//

		$('.shop-checkout-tab').filter('[data-tab="1"]').show();

		$( 'body' ).on('click', '#shop-checkout-tabs-select a', function(e) {

			e.preventDefault();

			$('#shop-checkout-tabs-select').find('li').removeClass('active');

			$(this).parent().addClass('active');

			$('.shop-checkout-tab').hide();

			$('.shop-checkout-tab').filter('[data-tab=' + $(this).attr('data-tab') + ']').fadeIn();

		});

		$( 'body' ).on('click', '#checkout-billing-createaccount', function() {

			$('#checkout-billing-createaccountfields').slideToggle();

		});

		$( 'body' ).on('click', '#checkout-shipping-sameaddress', function() {

			$('#checkout-shipping-shippingaddressfields').slideToggle();

		});

		$( 'body' ).on('click', '#checkout-billing-next', function(e) {

			e.preventDefault();

			$('#checkout-billing').hide();

			$('#checkout-shipping').fadeIn();

			$('#checkout-billing-header').removeClass('active');

			$('#checkout-shipping-header').addClass('active');

		});

		$( 'body' ).on('click', '#checkout-shipping-next', function(e) {

			e.preventDefault();

			$('#checkout-shipping').hide();

			$('#checkout-payment').fadeIn();

			$('#checkout-shipping-header').removeClass('active');

			$('#checkout-payment-header').addClass('active');

		});

		$( 'body' ).on('click', '#checkout-shipping-prev', function(e) {

			e.preventDefault();

			$('#checkout-shipping').hide();

			$('#checkout-billing').fadeIn();

			$('#checkout-shipping-header').removeClass('active');

			$('#checkout-billing-header').addClass('active');

		});

		$( 'body' ).on('click', '#checkout-payment-prev', function(e) {

			e.preventDefault();

			$('#checkout-payment').hide();

			$('#checkout-shipping').fadeIn();

			$('#checkout-payment-header').removeClass('active');

			$('#checkout-shipping-header').addClass('active');

		});

		$( 'body' ).on('click', '.payment-type-item p.title', function() {

			$('.payment-type-item').find('span.checkbox-blank').removeClass('checkbox-selected');

			$(this).find('span.checkbox-blank').addClass('checkbox-selected');

			$('#checkout-payment-type').val( $(this).attr('data-payment') );
		});

		//
		// Main wrapper
		//

		$('#wrap-all').css( 'padding-top', $('#site-header').height() );

		//
		// Misc
		//

		$('.height-100').height( $(window).height() );

		//
		// Window resize
		//

		$(window).resize(function() {

			paddingTop = $('#site-header').height();

			setBlockedMenu();

			$('#video-1, #video-2').height( $(window).height() - $('#site-header').height() - 40 );

			$('#wrap-all').css( 'padding-top', paddingTop );

		}).trigger( 'resize' );

		//
		// Settings
		//

		$('#biss-settings').find('i.fa-cog').click(function() {

			$(this).toggleClass('clicked');

			if ( $(this).hasClass('clicked')) {

				$('#biss-settings').animate({
					'left':0
				});

			} else {

				$('#biss-settings').animate({
					'left': -240
				});

			}

		});

		$('.biss-settings ul [class*="s"]').click(function() {

			$('#site-color').attr('href', 'css/colors/' + $(this).attr('data-value') + '.css');

		});

		$('.biss-settings ul [class*="i"]').click(function() {

			$('body').addClass( 'body-bg-image' ).css({
				'background-image' : 'url(../img/bg-images/' + $(this).attr('data-value') + '.jpg)',
				'background-position' : 'center',
				'background-repeat' : 'no-repeat',
				'background-size' : 'cover',
				'background-attachment' : 'fixed'
			});

		});

		//
		// Scrolling
		//

		$(window).scroll(function () {

			if ( $(this).scrollTop() > ( paddingTop * 2 ) ) {

				$( '.scroll-hide' ).slideUp();

				$( '#site-header' ).addClass( 'sticked' );

			} else {

				$( '.scroll-hide' ).slideDown();

				$( '#site-header' ).removeClass( 'sticked' );

			}

			if ( $(this).scrollTop() > 500 ) {

				$( '#scroll-to-the-top' ).show().removeClass( 'animated ' + customHeaderMenuAnimationOut ).addClass( 'animated ' + customHeaderMenuAnimationIn );

			} else {

				$( '#scroll-to-the-top' ).removeClass( 'animated ' + customHeaderMenuAnimationIn ).addClass( 'animated ' + customHeaderMenuAnimationOut );

			}

		});

	});

})(jQuery);

/* Email Ajax Response */

var xmlHttp = createXmlHttpRequestObject();

function createXmlHttpRequestObject() {

	var xmlHttp;

	if(window.ActiveXObject) {

		try {

			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

		} catch (e) {

			xmlHttp = false;

		}

	} else {

		try {

			xmlHttp = new XMLHttpRequest();

		} catch (e) {

			xmlHttp = false;

		}

	}

	if (!xmlHttp) {

		alert("Error on XMLHttpRequest object creation.");

	} else {

		return xmlHttp;
	}

}

function processSendEmail() {

	if (xmlHttp.readyState == 4 || xmlHttp.readyState == 0) {

		type = encodeURIComponent(document.getElementById("message-type").value);

		name = encodeURIComponent(document.getElementById("message-name").value);

		email = encodeURIComponent(document.getElementById("message-email").value);

		company = encodeURIComponent(document.getElementById("message-company").value);

		phone = encodeURIComponent(document.getElementById("message-phone").value);

		message = encodeURIComponent(document.getElementById("message-message").value);

		xmlHttp.open("GET", "email.php?type=" + type + '&name=' + name + '&email=' + email + '&company=' + company + '&phone=' + phone + '&message=' + message, true);

		xmlHttp.onreadystatechange = handleServerResponse;

		xmlHttp.send(null);

	}

}

function handleServerResponse() {

	if (xmlHttp.readyState == 4) {

		if (xmlHttp.status == 200) {

			xmlResponse = xmlHttp.responseText;

			document.getElementById("sendMessageStatus").innerHTML = '<i>' + xmlResponse + '</i>';

		} else {

			alert("There is a problem during server connection: " + xmlHttp.statusText);

		}

	}

}
