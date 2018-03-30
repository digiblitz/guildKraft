//
//	RivaThemes Sorting plugin
//

(function( $ ){

	var methods = {

		init : function( options ) {

			var $this = $(this);

			function RivaSorting() {

				var $obj = $this,
					bodyWidth = 0,
					defaults = {												// Default settings`
						'inRow'						: 3,
						'gutter'					: 10,
						'selector'					: 'sorting-item'
					}


				//
				// Constructor
				//

				var __construct = function() {

					options = $.extend(defaults, options);

					console.log('rivaSorting init for #' + $this.attr('id') + '...');		// Init message

					$obj.inRow = options['inRow'];

					$obj.gutter = options['gutter'];

					$obj.showAll = options['showAll'];

					$obj.items = $obj.find('.' + options['selector']);

					$obj.qty = $obj.items.length;

					$obj.filters = $obj.find('.filters');

					$obj.itemWidth = 0;

					$obj.objWidth = parseInt($this.width());

					$obj.find('.listing').wrapInner('<div class="riva-sorting-inner"></div>');

					$obj.find('.listing').css({
						'width'	: '100%',
						'float'	: 'left',
						'overflow'	: 'hidden'
					});

					$obj.find('.riva-sorting-inner').css({
						'float'	: 'left',
						'margin-left'	: '-' + $obj.gutter + 'px'
					});

					$obj.items.css({
						'margin-left'	: $obj.gutter + 'px',
						'margin-bottom'	: $obj.gutter + 'px'
					});

					$obj.select = $('<select class="filters-select"></select>').insertAfter($obj.filters);

					$obj.filters.find('span').each(function() {

						var $this = $(this),
							val = $this.attr('data-value'),
							text = $this.text();

						$('<option value="' + val + '">' + text + '</option>').appendTo($obj.select);

						$this.click(function() {

							displayItems($(this).attr('data-value'));

							$obj.filters.find('span').removeClass('active');

							$(this).addClass('active');

						});

					});

					$obj.select.wrap('<form class="filter-form"></form>').on('change', function() {

						displayItems( $(this).find('option').filter(':selected').val());

					});

				}()

				//
				// Make clear
				//

				var makeClear = function() {

					var n = 0;

					$obj.find('.listing .cl').remove().detach();

					if ( bodyWidth <= 480 ) {

						n = 1;

					} else if ( bodyWidth > 480 && bodyWidth <= 768) {

						if ( $obj.inRow <= 2 ) {

							n = $obj.inRow;

						} else {

							n = 2;

						}

					} else if ( bodyWidth > 768 && bodyWidth <= 992 ) {

						if ( $obj.inRow <= 3 ) {

							n = $obj.inRow;

						} else {

							n = 3;

						}


					} else if ( bodyWidth > 992 ) {

						n = $obj.inRow;

					}

					for ( var i = 1; i <= $obj.items.filter(':visible').length; i++ ) {

						if ( i % n == 0 ) {

							$('<div class="cl"></div>').insertAfter($obj.items.filter(':visible').eq(i - 1));

						}

					}

				}

				//
				// Show/hide items
				//

				var displayItems = function( className ) {

					$obj.items.hide();

					if ( className == "*") {

						$obj.items.fadeIn();

					} else {

						$obj.items.each(function() {

							if ( $(this).hasClass(className) ) {

								$(this).fadeIn();

							}

						});

					}

					makeClear();

				}

				//
				// Rendering
				//

				this.render = function() {

					var n = 0;

					bodyWidth = $('body').width();

					$obj.objWidth = parseInt($this.width());

					$obj.find('.riva-sorting-inner').css({
						'width'	: $obj.objWidth + $obj.gutter + 'px'
					});

					if ( bodyWidth <= 480 ) {

						n = 1;

					} else if ( bodyWidth > 480 && bodyWidth <= 768) {

						if ( $obj.inRow <= 2 ) {

							n = $obj.inRow;

						} else {

							n = 2;

						}

					} else if ( bodyWidth > 768 && bodyWidth <= 992 ) {

						if ( $obj.inRow <= 3 ) {

							n = $obj.inRow;

						} else {

							n = 3;

						}


					} else if ( bodyWidth > 992 ) {

						n = $obj.inRow;

					}

					$obj.items.width( Math.floor( ( $obj.objWidth - ( $obj.gutter * n - $obj.gutter ) - ( parseInt($obj.items.css('border-left-width')) + parseInt($obj.items.css('border-right-width')) ) * n ) / n ) );

					makeClear();

				}

			}

			var sorting = new RivaSorting();

			$(window).resize(function() {

				sorting.render();

			}).trigger('resize');
		}

	}

	$.fn.rivaSorting = function( method ) {

		if ( methods[method] ) {

			return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));

		} else if ( typeof method === 'object' || ! method ) {

			return methods.init.apply( this, arguments );

		} else {

			console.log( 'Method called "' +  method + '" does not exist for jQuery.rivaSorting' );

		} 
	};


})( jQuery );

//
//	RivaThemes Logog Group plugin
//

(function( $ ){

	var methods = {

		init : function( options ) {

			var $this = $(this);

			function LogoGroup() {

				var $obj = $this,
					settings = null,
					rest = 0,
					bodyWidth = 0,
					defaults = {													// Default settings
						'row'						: '4',
						'padding'					: '20',
						'selector'					: 'logo-group-item'
					}


				//
				// Constructor
				//

				var __construct = function() {

					options = $.extend(defaults, options);

					console.log('rivaLogoGroup init for #' + $this.attr('id') + '...');		// Init message

					$obj.row = options['row'];												// Logos in row

					$obj.padding = options['padding'];										// Logo block padding

					$obj.items = $obj.find('.' + options['selector']);						// Set of logos

					$obj.qty = $obj.items.length;											// Qty of logos

					$obj.itemWidth = 0;													// Logo item width

					$obj.items.hover(function() {

						$(this).find('img').fadeTo(400, 1);

					}, function() {

						$(this).find('img').fadeTo(400, 0.5);

					});

				}()

				//
				// Apply CSS
				//

				var applyCSS = function( n ) {

					$obj.items.removeClass('lastRow');

					$obj.items.removeClass('lastInRow');

					rest = $obj.qty % n;

					if ( rest == 0 ) {

						$obj.items.slice( -n ).addClass('lastRow');

					} else {

						$obj.items.slice( -rest ).addClass('lastRow');

					}

					$obj.items.filter(':nth-child(' + n + 'n)').addClass('lastInRow');

				}

				//
				// Rendering
				//

				this.render = function() {

					bodyWidth = $('body').width();

					var number = 0;

					if ( bodyWidth > 1200) {

						number = $obj.row;

						$obj.itemWidth = 100 / number + '%';

						$obj.items.css('width', $obj.itemWidth);

						applyCSS( number );

					} else if ( bodyWidth > 768 && bodyWidth <= 992 ) {

						if ( $obj.row < 4) {

							number = $obj.row;

						} else {

							number = 4;

						}

						$obj.itemWidth = 100 / number + '%';

						$obj.items.css('width', $obj.itemWidth);

						applyCSS( number );

					} else if ( bodyWidth > 480 && bodyWidth <= 768 ) {

						if ( $obj.row < 3) {

							number = $obj.row;

						} else {

							number = 3;
							
						}

						$obj.itemWidth = 100 / number + '%';

						$obj.items.css('width', $obj.itemWidth);

						applyCSS( number );

					} else if ( bodyWidth <= 480 ) {

						if ( $obj.row < 2) {

							number = $obj.row;

						} else {

							number = 2;
							
						}

						$obj.itemWidth = 100 / number + '%';

						$obj.items.css('width', $obj.itemWidth);

						applyCSS( number );

					}

					$obj.items.css({
						'padding':$obj.padding
					}).each(function() {

						$(this).height($(this).width());

					});

				}

			}

			var logoGroup = new LogoGroup();

			$(window).resize(function() {

				logoGroup.render();

			}).trigger('resize');
		}

	}

	$.fn.rivaLogoGroup = function( method ) {

		if ( methods[method] ) {

			return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));

		} else if ( typeof method === 'object' || ! method ) {

			return methods.init.apply( this, arguments );

		} else {

			console.log( 'Method called "' +  method + '" does not exist for jQuery.rivaLogoGroup' );

		} 
	};


})( jQuery );

//
//	RivaThemes Mega Menu plugin
//

(function( $ ){

	var hovered = 0,
		methods = {

		init : function( options ) {

			var $this = $(this),													// Element itself
				animationIn = options['animationIn'],								// Animation-in style (see animate.css)
				animationOut = options['animationOut'],								// Animation-out style (see animate.css)
				id = options['hoverId'],											// Id of the link corresponding to the mega menu
				$link = $('#' + id),												// Link
				w = $this.width(),													// Width of the mega
				useCustomAnimation = 1,
				$sections = $this.find('aside'),									// A set of sections in mega menu
				defaults = {														// Default settings
					'animationIn'	: '',
					'animationOut'	: '',
					'hoverId'		: 'mega-menu-hover'
				};

			if ( $link.get(0) != undefined ) {

				console.log('rivaMegaMenu init for #' + $this.attr('id') + '...');		// Init message

				options = $.extend(defaults, options);									// Apply default settings

				if ( animationIn === undefined && animationOut === undefined ) {

					useCustomAnimation = 0;

				}

				$this.hide();															// Hide the mega

				$sections.each(function() {												// Set the width of each mega section

					$(this).css('width', Math.floor(w / $sections.length) + 'px');

				});

				$this.hover(function() {												// Mega menu mouse enter

					hovered = 1;


				}, function() {															// Mega menu mouse leave							

					hovered = 0;

					if ( useCustomAnimation ) {

						$(this).removeClass('animated ' + animationIn).addClass('animated ' + animationOut);

					} else {

						$(this).fadeOut();

					}

					setTimeout(function() { $this.hide(); }, 400);

				});

				$($link.get(0).tagName + '#' + id).hover(function() {					// Ling hover

					if ( useCustomAnimation ) {

						$this.removeClass('animated ' + animationOut).show().addClass('animated ' + animationIn);

					} else {

						$this.fadeIn();

					}

				}, function() {															// Ling leave

					setTimeout(function() {

						if (!hovered) {

							if ( useCustomAnimation ) {

								$this.removeClass('animated ' + animationIn ).addClass('animated ' + animationOut );

								$this.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {

									$this.hide();

								});


							} else {

								$this.fadeOut();

							}

						}

					}, 0);

					hovered = 0;
				});

			}

		}

	};

	$.fn.rivaMegaMenu = function( method ) {

		if ( methods[method] ) {

			return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));

		} else if ( typeof method === 'object' || ! method ) {

			return methods.init.apply( this, arguments );

		} else {

			console.log( 'Method called "' +  method + '" does not exist for jQuery.rivaMegaMenu' );

		} 
	};

})( jQuery );

//
//	RivaThemes Carousel plugin
//

(function( $ ){

	var methods = {

		init : function( options ) {

			var $this = $(this);

			function Carousel() {

				var $obj = $this,
					$items = null,
					$wrapper = null,
					$wrapperInner = null,
					$rivaItems = null,
					$nav = null,
					$a = null,
					bodyWidth = 0,
					scroll = 0,
					current = 0,
					steps = 0,
					timeout = 0,
					timer = 0,
					insertMenu = null,
					settings = null;

				var defaults = {																	// Default settings
						'style'						: 'horizontal',
						'navigation'				: 'buttons',
						'navigation_class'			: '',
						'navigation_item_class'		: '',
						'button_left_text'			: '< left',
						'button_right_text'			: 'right >',
						'visible'					: 1,
						'selector'					: 'selector',
						'gutter'					: 20,
						'infinite'					: 0,
						'interval'					: 3000,
						'autostart'					: 0,
						'speed'						: 400,
						'ease'						: 'linear'
					}

				//
				// Run the interval
				//

				var runInterval = function() {

					if ( settings['navigation'] == 'buttons' ) {

						if ( settings['style'] == 'horizontal' ) {

							doScroll(1);

						} else if ( settings['style'] == 'vertical' ) {

							doVerticalScroll(1);

						}

					} else if ( settings['navigation'] == 'bullets' ) {

						doBulletsScroll( current );

					}

				}

				//
				// Get elements max htight
				//

				var getMaxHeight = function ( cur ) {

					var max = 0,
						end = 0;

					end = parseInt(cur) + parseInt(settings['visible']);

					$rivaItems.slice(cur, end).each(function() {

						if ($(this).height() > max) {

							max = Math.ceil($(this).height());

						}

					});

					return max;

				}

				//
				// Get vertical block height
				//

				var getVerticalHeight = function( cur ) {
					
					var h = 0,
						end = 0;

					end = parseInt(cur) + parseInt(settings['visible']);

					$rivaItems = $obj.find('.rivaCarouselItem');

					$rivaItems.slice(cur, end).each(function() {

						h += $(this).height() + parseInt($(this).css('padding-top')) + parseInt($(this).css('padding-bottom'));

					});

					return h - settings['gutter'];

				}

				//
				// Scrolling wrapper with bullets
				//

				var doBulletsScroll = function( cur ) {

					$obj.a.removeClass('active');

					if ( settings['style'] == 'vertical' ) {

						if ( cur == 0 ) {

							scroll = 0;

						} else {

							var $rivaItems = $obj.find('.rivaCarouselItem').slice(0, cur);

							for ( var i = 0; i < $rivaItems.length; i++ ) {

								scroll += $rivaItems.eq(i).height() + settings['gutter'];

							}

						}

						$wrapperInner.animate({ 'top' : '-' + scroll + 'px' }, settings['speed'], settings['ease']);

						scroll = 0;

						$wrapper.animate({ 'height' : getVerticalHeight(cur) + 'px' }, settings['speed'], settings['ease']);

					} else if ( settings['style'] == 'horizontal' ) {

						$wrapperInner.animate({ 'left' : '-' + ( scroll + settings['gutter'] ) * cur + 'px' }, settings['speed'], settings['ease']);

						$wrapper.animate({ 'height' : getMaxHeight(cur) + 'px' }, settings['speed'], settings['ease']);

					}

					$obj.a.filter('[data-step=' + cur + ']').addClass('active');

					current = parseInt(cur) + parseInt(settings['visible']);

					if ( current >= $obj.items.length ) {

						current = 0;

					}

				}


				//
				// Scrolling wrapper
				//

				var doScroll = function ( direction ) {

					if ( bodyWidth <= 768 ) {

						steps = $rivaItems.length;

						var visible = 1;

					} else {

						var visible = settings['visible'];

					}

					if ( direction > 0 ) {

						if ( settings['infinite'] == 1 ) {

							if ( current < steps ) {

								$wrapperInner.animate({ 'left' : '-=' + ( scroll + settings['gutter'] ) + 'px' }, settings['speed'], settings['ease']);

								current++;

								if ( current == (steps - visible) ) {

									$wrapperInner.animate({ 'left': '-' + ((scroll + settings['gutter']) * visible) + 'px'}, 0);

									current = settings['visible'];

								}

							}

						} else {

							if ( current == (steps - visible)) {

								$wrapperInner.animate({ 'left' : '0px' }, settings['speed'], settings['ease']);

								current = 0;

							} else if ( current < (steps - visible) ) {

								$wrapperInner.animate({ 'left' : '-=' + ( scroll + settings['gutter'] ) + 'px' }, settings['speed'], settings['ease']);

								current++;

							}

						}

					} else if ( direction < 0 ) {

						if ( settings['infinite'] == 1 ) {

							if (current > 0) {

								$wrapperInner.animate({ left: '+=' + ( scroll + settings['gutter'] ) + 'px' }, settings['speed'], settings['ease']);

								current--;

								if (current == 0) {

									$wrapperInner.animate({'left': '-' + (scroll + settings['gutter']) * (steps - visible * 2) + 'px'}, 0);

									current = steps - visible * 2;

								}

							}

						} else {

							if ( current == 0) {

								$wrapperInner.animate({ 'left' : '-' + ( scroll + settings['gutter'] ) * (steps - visible) + 'px' }, settings['speed'], settings['ease']);

								current = steps - visible;

							} else if ( current > 0 ) {

								$wrapperInner.animate({ 'left' : '+=' + ( scroll + settings['gutter'] ) + 'px' }, settings['speed'], settings['ease']);

								current--;

							}

						}

					}

					$wrapper.animate({ 'height' : getMaxHeight(current) + 'px' }, settings['speed'], settings['ease']);

				}


				//
				// Scrolling wrapper
				//

				var doVerticalScroll = function ( direction ) {

					$rivaItems = $obj.find('.rivaCarouselItem');

					if ( direction > 0 ) {

						// If infinite

						if ( settings['infinite'] == 1 ) {

							var max = steps - settings['visible'];

							if ( current < max ) {

								scroll = $rivaItems.eq(current).height() + parseInt(settings['gutter']);

								$wrapperInner.animate({ 'top' : '-=' + scroll + 'px' }, settings['speed'], settings['ease']);

								current++;

								if ( current == max ) {

									$wrapperInner.animate({ 'top': '-' + (getVerticalHeight(0) + parseInt(settings['gutter'])) + 'px'}, 0);

									current = settings['visible'];

								}

							}

						// If NOT infinite

						} else {

							var max = steps - settings['visible'];

							if ( current == max ) {

								$wrapperInner.animate({ top: '0px' }, settings['speed'], settings['ease']);

								current = 0;

							} else if ( current < max ) {

								scroll = $rivaItems.eq(current).height() + parseInt(settings['gutter']);

								$wrapperInner.animate({ top: '-=' + scroll + 'px' }, settings['speed'], settings['ease']);

								current++;

							} 

						}

					} else if ( direction < 0 ) {

						// If infinite

						if ( settings['infinite'] == 1 ) {

							if (current > 0) {

								scroll = $rivaItems.eq(current - 1).height() + parseInt(settings['gutter']);

								$wrapperInner.animate({ top: '+=' + scroll + 'px' }, settings['speed'], settings['ease']);

								current--;

								if (current == 0) {

									scroll = 0;

									$rivaItems.slice(0, steps - (settings['visible'] * 2) ).each(function() {

										scroll += $(this).height() + parseInt(settings['gutter']);

									});

									$wrapperInner.animate({ top : '-=' + scroll + 'px'}, 0);

									current = steps - settings['visible'] * 2;

								}

							}

						// If NOT infinite

						} else {

							if ( current > 0 ) {

								scroll = $rivaItems.eq(current - 1).height() + parseInt(settings['gutter']);

								$wrapperInner.animate({ top: '+=' + scroll + 'px' }, settings['speed'], settings['ease']);

								current--

							} else if ( current == 0 ) {

								var max = steps - settings['visible'];

								scroll = 0;

								$rivaItems.slice(0, max).each(function() {

									scroll += $(this).height() + parseInt(settings['gutter']);

								});

								$wrapperInner.animate({ top: '-=' + (scroll) + 'px' }, settings['speed'], settings['ease']);

								current = max;

							}

						}

					}

					$wrapper.animate({ 'height' : getVerticalHeight(current) + 'px' }, settings['speed'], settings['ease']);

				}

				//
				// Constructor
				//

				var __construct = function() {

					settings = $.extend(defaults, options);

					console.log('rivaCarousel init for #' + $this.attr('id') + '...');		// Init message

					$items = $obj.find('.' + settings['selector']);

					//
					// Checking style
					//

					if ( settings['style'] != 'vertical' && settings['style'] != 'horizontal' ) {
						
						$('<span style="color: #f00;"><b>Error:</b> please specify the correct value of "style".</span>').appendTo($obj);

						return;

					}

					//
					// Checking navigation type
					//

					if ( settings['navigation'] != 'buttons' && settings['navigation'] != 'bullets' ) {
						
						$('<span style="color: #f00;"><b>Error:</b> please specify the correct navigation type.</span>').appendTo($obj);

						return;

					}

					//
					// Checking infinite
					//

					if ( isNaN(settings['infinite']) || settings['infinite'] < 0 ) {
						
						$('<span style="color: #f00;"><b>Error:</b> please specify the correct value of "infinite".</span>').appendTo($obj);

						return;

					}

					//
					// Checking visible
					//

					if ( isNaN(settings['visible']) || settings['visible'] < 0 || settings['visible'] > $items.length ) {
						
						$('<span style="color: #f00;"><b>Error:</b> please specify the correct value of "visible".</span>').appendTo($obj);

						return;

					}

					//
					// Checking gutter
					//

					if ( isNaN(settings['gutter']) || settings['gutter'] < 0 ) {
						
						$('<span style="color: #f00;"><b>Error:</b> please specify the correct value of "gutter".</span>').appendTo($obj);

						return;

					}

					//
					// Checking interval
					//

					if ( isNaN(settings['interval']) || settings['interval'] < 0 ) {
						
						$('<span style="color: #f00;"><b>Error:</b> please specify the correct value of "interval".</span>').appendTo($obj);

						return;

					}

					//
					// Checking autostart
					//

					if ( isNaN(settings['autostart']) || settings['autostart'] < 0 ) {
						
						$('<span style="color: #f00;"><b>Error:</b> please specify the correct value of "autostart".</span>').appendTo($obj);

						return;

					}

					//
					// Disable infinite for bullets navigation
					//

					if ( settings['navigation'] == 'bullets' ) {

						settings['infinite'] = 0;

					}

					$items.wrapAll('<div class="rivaCarouselWrapper"></div>');

					$wrapper = $obj.find('.rivaCarouselWrapper').css('padding-right', '0px');

					if ( settings['style'] == 'vertical' ) {

						$wrapper.addClass('rivaCarouselWrapperVertical');

					}					

					if ( settings['infinite'] == 1 && settings['navigation'] == 'buttons' ) {
						
						var $lasts = $items.slice(0,settings['visible']).clone().addClass('cloned');

						var $firsts = $items.slice(-settings['visible']).clone().addClass('cloned');

						$lasts.appendTo($wrapper);

						$firsts.prependTo($wrapper);

					}

					$items = $obj.find('.' + settings['selector']);

					$items.each(function() {

						$(this).wrap('<div class="rivaCarouselItem"></div>');

					});

					$rivaItems = $obj.find('.rivaCarouselItem');

					$obj.items = $obj.find('.rivaCarouselItem');

					if ( settings['style'] == 'vertical' ) {

						$rivaItems.css('padding-top', settings['gutter'] + 'px').wrapAll('<div class="rivaCarouselWrapperInner"></div>');

					} else if ( settings['style'] == 'horizontal' ) {

						$rivaItems.css('padding-left', settings['gutter'] + 'px').wrapAll('<div class="rivaCarouselWrapperInner"></div>');

					}

					$wrapperInner = $obj.find('.rivaCarouselWrapperInner');

					//
					// Check the style
					//

					if ( settings['style'] == 'horizontal' ) {

						$wrapperInner.css('margin-left', - settings['gutter'] + 'px');

					} else if ( settings['style'] == 'vertical' ) {

						$wrapperInner.css('margin-top', - settings['gutter'] + 'px');

					}

					//
					// Navigation with buttons
					//

					$insertMenu = $obj.find('div.riva-insert-menu-here');

					if ( settings['navigation'] == 'buttons' ) {

						//
						// Create navigation
						//

						$('<div class="rivaCarouselNav"></div>').insertAfter($insertMenu);

						$insertMenu.remove().detach();

						$nav = $obj.find('.rivaCarouselNav').addClass(settings['navigation_class']);

						$('<a href="#" class="to-the-left ' + settings['navigation_item_class'] + '">' + settings['button_left_text'] + '</a>').appendTo($nav);

						$('<a href="#" class="to-the-right ' + settings['navigation_item_class'] + '">' + settings['button_right_text'] + '</a>').appendTo($nav);

						$a = $nav.find('a');

						$a.click(function(e) {

							e.preventDefault();

							//
							// Scroll to the left
							//

							if ( $(this).hasClass('to-the-left') ) {

								if ( settings['style'] == 'horizontal' ) {

									doScroll(-1);

								} else if ( settings['style'] == 'vertical' ) {

									doVerticalScroll(-1);

								}

							}

							//
							// Scroll to the right
							//

							if ( $(this).hasClass('to-the-right') ) {

								if ( settings['style'] == 'horizontal' ) {

									doScroll(1);

								} else if ( settings['style'] == 'vertical' ) {

									doVerticalScroll(1);

								}

							}

						});


						$a.mousedown(function() {

							clearTimeout(timeout);

							clearInterval(timer);

						});

						$a.mouseup(function() {

							if ( settings['autostart'] == 1 ) {

								timeout = setTimeout(function() {

									timer = setInterval( runInterval , settings['interval'] );;

								}, settings['interval']);

							}

						});

						$rivaItems.bind('mouseover', function() {

							clearTimeout(timeout);

							clearInterval(timer);

						});

						$rivaItems.bind('mouseleave', function() {

							if ( settings['autostart'] == 1 ) {

								timeout = setTimeout(function() {

									timer = setInterval( runInterval , settings['interval'] );;

								}, settings['interval']);

							}

						});

					}

					//
					// Navigation with bullets
					//

					if ( settings['navigation'] == 'bullets' ) {

						$('<div class="rivaCarouselNavBullets"></div>').insertAfter($insertMenu);

						$insertMenu.remove().detach();

						$nav = $obj.find('.rivaCarouselNavBullets').addClass(settings['navigation_class']);

						$nav.find('a').remove().detach();

						var b = $('body').width();

						if ( b <= 768 ) {

							var q = $rivaItems.length;

							for ( var i = 0; i < q; i++ ) {

								$('<a href="#" class="' + settings['navigation_item_class'] + '" data-step="' + i + '">' + ( i + 1 ) + '</a>').appendTo($nav);

							}

						} else if ( b > 768 && b <= 992) {

							var n = 0;

							if ( settings['visible'] < 3 ) {

								n = settings['visible'];

							} else {

								n = 3;

							}

							var q = Math.ceil( $rivaItems.length / n );

							for ( var i = 0; i < q; i++ ) {

								$('<a href="#" class="' + settings['navigation_item_class'] + '" data-step="' + (i * n) + '">' + ( i + 1 ) + '</a>').appendTo($nav);

							}

						} else {

							var q = Math.ceil( $rivaItems.length / settings['visible'] );

							for ( var i = 0; i < q; i++ ) {

								$('<a href="#" class="' + settings['navigation_item_class'] + '" data-step="' + (i * settings['visible']) + '">' + ( i + 1 ) + '</a>').appendTo($nav);

							}

						}

						$a = $nav.find('a');

						$obj.a = $a;

						$a.first().addClass('active');

						$a.click(function(e) {

							e.preventDefault();

							current = $(this).attr('data-step');

							doBulletsScroll(current);

						}).hover(function() {

							$(this).addClass('hover');

						}, function() {

							$(this).removeClass('hover');

						});

						$a.mousedown(function() {

							clearTimeout(timeout);

							clearInterval(timer);

						});

						$a.mouseup(function() {

							if ( settings['autostart'] == 1 ) {

								timeout = setTimeout(function() {

									timer = setInterval( runInterval , settings['interval'] );;

								}, settings['interval']);

							}

						});

						$rivaItems.bind('mouseover', function() {

							clearTimeout(timeout);

							clearInterval(timer);

						});

						$rivaItems.bind('mouseleave', function() {

							if ( settings['autostart'] == 1 ) {

								timeout = setTimeout(function() {

									timer = setInterval( runInterval , settings['interval'] );;

								}, settings['interval']);

							}

						});

					}

					//
					// Autostart
					//

					if ( settings['autostart'] == 1) {

						timeout = setTimeout(function() {

							timer = setInterval( runInterval , settings['interval'] );;

						}, settings['interval']);

					}

				}()

				//
				// Rendering
				//

				this.render = function() {

					bodyWidth = $('body').width();

					$rivaItems = $obj.find('.rivaCarouselItem');

					if ( settings['style'] == 'horizontal' ) {

						if ( bodyWidth > 992 ) {

							scroll = $wrapper.width()  / settings['visible'] - (settings['gutter'] * (settings['visible'] - 1) )/ settings['visible'];

							$rivaItems.width(scroll);

						} else if ( bodyWidth > 768 && bodyWidth <= 992 ) {

							var n = 0;

							if ( settings['visible'] < 3 ) {

								n = settings['visible'];

							} else {

								n = 3;

							}

							scroll = $wrapper.width()  / n - (settings['gutter'] * (settings['visible'] - 1) )/ settings['visible'];

							$rivaItems.width(scroll);

						} else {

							scroll = $wrapper.width()

							$rivaItems.width(scroll);

						}

						if ( settings['infinite'] == 1 ) {

							$wrapperInner.animate({ 'left': '-' + ((scroll + settings['gutter']) * settings['visible']) + 'px'}, 0);

							current = settings['visible'];

						} else {

							$wrapperInner.animate({ 'left': '0px'}, 0);

						}

						var h = getMaxHeight(current);

						$wrapper.animate({ 'height' : h + 'px' }, 0);

						$wrapperInner.animate({ 'height' : h + 'px' }, 0);


					} else if ( settings['style'] == 'vertical' ) {

						var h = getVerticalHeight(current);

						$wrapper.height(h);

						$wrapperInner.height(h);

						if ( settings['infinite'] == 1 ) {

							var h = getVerticalHeight(0);

							$wrapperInner.animate({ 'top': '-' + (h + parseInt(settings['gutter'])) + 'px'}, 0);

							current = settings['visible'];

						} else {

							$wrapperInner.animate({ 'left': '0px'}, 0);

						}

					}

					steps = $rivaItems.length;

				}

			}

			var carousel = new Carousel();

			$(window).resize(function() {

				carousel.render();

			}).trigger('resize');

		}

	}

	$.fn.rivaCarousel = function( method ) {
    
		if ( methods[method] ) {
			
			return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));

		} else if ( typeof method === 'object' || ! method ) {

			return methods.init.apply( this, arguments );

		} else {

			console.log( 'Method called "' +  method + '" does not exist for jQuery.rivaCarousel' );
		}    
	};

})( jQuery );

//
//	RivaThemes Advanced Selector
//

(function( $ ){

	var methods = {

		init : function( options ) {

			var $this = $(this);

			function AdvancedSelector() {

				var $obj = $this,
					slideDetails = new Array(),
					slideImages = new Array(),
					asWidth = $this.width(),
					defaults = {													// Default settings
						'title'						: '',
						'height'					: '600',
						'thumbWrapperPadding'		: '20',
						'gutter'					: '10',
						// See http://daneden.github.io/animate.css/ for animation styles
						'animationIn'				: 'fadeInRight',
						'animationOut'				: 'fadeOutLeft',
						'selector'					: 'item'
					}


				//
				// Constructor
				//

				var __construct = function() {

					console.log( 'rivaAdvancedSelector init for #' + $this.attr( 'id' ) + '...' );		// Init message

					options = $.extend( defaults, options );

					{

						$obj.wrapperTitle = options['title'];

						$obj.asHeight = options['height'];

						$obj.thumbWrapperPadding = options['thumbWrapperPadding'];

						$obj.gutter = options['gutter'];

						$obj.animationIn = options['animationIn'];

						$obj.animationOut = options['animationOut'];

						$obj.selector = options['selector'];

						$obj.thumbs = null;

						$obj.slides = null;

						$obj.nav = null;

						$obj.thumbsWrapper = null;

						$obj.slidesWrapper = null;

						$obj.currentThumb = 0;

						$obj.currentSlide = 0;

						$obj.qty = 0;

					}

					$obj.addClass( 'rivaAdvancedSelector' ).height( $obj.asHeight );

					$obj.find( '.' + $obj.selector ).hide().each(function() {

						if ( $(this).find('> .details').length != 0 ) {

							slideDetails.push( $(this).find('> .details') );

						} else {

							slideDetails.push( $('<div></div>') );

						}

						if ( $(this).find('> img.th').length != 0 ) {

							slideImages.push( $(this).find('> img.th') );

						} else {

							slideImages.push( $('<img width="0" height="0" alt="no image">') );

						}

					}).remove().detach();

					$(' <div class="rivaAdvancedSelectorThumbs"><div class="rivaAdvancedSelectorThumbsInner"><div class="rivaAdvancedSelectorThumbsWrapper"></div></div></div>' ).prependTo( $obj );

					$(' <div class="rivaAdvancedSelectorSlides"><div class="rivaAdvancedSelectorSlidesWrapper"></div></div>' ).prependTo( $obj );

					$( '<nav><a href="#" class="left"><i class="fa fa-angle-left"></i></a><a href="#" class="right"><i class="fa fa-angle-right"></i></a></nav>' ).prependTo( $obj.find( '.rivaAdvancedSelectorThumbs' ) );

					$obj.nav = $obj.find( '.rivaAdvancedSelectorThumbs' ).find( 'nav a' );

					if (  $obj.wrapperTitle != '' ) {

						$( '<p class="title">' + $obj.wrapperTitle + '</p>' ).prependTo( $obj.find( '.rivaAdvancedSelectorThumbs' ) );

					}

					$obj.thumbsWrapper = $obj.find( '.rivaAdvancedSelectorThumbsWrapper' );

					$obj.slidesWrapper = $obj.find( '.rivaAdvancedSelectorSlidesWrapper' );

					for ( var i = 0; i < slideImages.length; i++ ) {

						slideImages[i].clone().appendTo( $obj.thumbsWrapper ).css( 'margin-right', $obj.gutter );

						slideDetails[i].clone().appendTo( $obj.slidesWrapper ).wrap( '<div class="rivaAdvancedSelectorSlide"></div>' );

					}

					$obj.thumbs = $obj.thumbsWrapper.find( 'img' ).first().addClass('active').end();

					$obj.slides = $obj.slidesWrapper.find( '.rivaAdvancedSelectorSlide' ).first().addClass('active').end().each(function() {

						var $this = $(this),
							index = $this.index();

						slideImages[ index ].clone().prependTo($this);

					});

					$obj.qty = $obj.thumbs.length;

					$obj.find( '.rivaAdvancedSelectorThumbsInner' ).css( 'margin', $obj.thumbWrapperPadding );

					$obj.find( '.rivaAdvancedSelectorSlides' ).height( $obj.asHeight - $obj.find( '.rivaAdvancedSelectorThumbs' ).height() );

					// Clicking navigation

					$obj.nav.click(function(e) {

						var $this = $(this);

						e.preventDefault();


						if ( $this.attr('class') == 'left') {

							scrollThumbs( -1 );

						} else {

							scrollThumbs( 1 );

						}

					});

					// Clicking thumbs

					$obj.thumbs.click(function() {

						var $this = $(this),
							number = $this.index();

						hideSlide( $obj.currentSlide )

						displaySlide( number );

						$obj.currentSlide = number;

					});

				}()

				//
				// Hiding slide
				//

				var hideSlide = function( number ) {

				var $slide = $obj.slides.eq( number );

				$slide.find('.details').removeClass( 'animated ' + $obj.animationIn ).addClass( 'animated ' + $obj.animationOut );

				setTimeout(function() {

					$slide.removeClass( 'active' ).fadeOut(200);

				}, 400);

				}

				//
				// Dsiplaing slide
				//

				var displaySlide = function( number ) {

					setTimeout(function() {

						var $slide = $obj.slides.eq( number );

						$slide.fadeIn( 200 );

						setTimeout(function() {

							$slide.addClass('active').find('.details').removeClass( 'animated ' + $obj.animationOut ).addClass( 'animated ' + $obj.animationIn );

						}, 200);

						

						$obj.thumbs.removeClass( 'active' ).eq( number ).addClass( 'active' );

					}, 600 );

				}

				//
				// Scrolling thumbs
				//

				var scrollThumbs = function( direction ) {

					var scroll = $obj.thumbs.eq( $obj.currentThumb ).width() + $obj.gutter;

					if ( direction > 0 ) {

						if ( $obj.currentThumb < ( $obj.qty - 1 ) ) {

							$obj.thumbsWrapper.animate({
								'margin-left' : '-=' + scroll + 'px'
							}, 400, function() {

								$obj.currentThumb = $obj.currentThumb + 1;

							})

						}

					} else {

						if ( $obj.currentThumb > 0 ) {

							$obj.thumbsWrapper.animate({
								'margin-left' : '+=' + scroll + 'px'
							}, 400, function() {

								$obj.currentThumb = $obj.currentThumb - 1;

							})

						}

					}

				}

				//
				// Rendering
				//

				this.render = function() {

					asWidth = $obj.width();

					$obj.find( '.rivaAdvancedSelectorThumbsInner' ).width( asWidth - $obj.thumbWrapperPadding * 2 );

					$obj.slides.width( asWidth );

				}

			}

			var advancedSelector = new AdvancedSelector();

			$(window).resize(function() {

				advancedSelector.render();

			}).trigger('resize');
		}

	}

	$.fn.rivaAdvancedSelector = function( method ) {

		if ( methods[method] ) {

			return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));

		} else if ( typeof method === 'object' || ! method ) {

			return methods.init.apply( this, arguments );

		} else {

			console.log( 'Method called "' +  method + '" does not exist for jQuery.rivaAdvancedSelector' );

		} 
	};


})( jQuery );

/*
*	Riva Countdown
*/

(function( $ ){
	$.fn.rivaCountdown = function( options ) {
		/*
		*	Vars
		*/
		var $this = this,
			year = options['year'],
			month = options['month'],
			day = options['day'],
			hours = options['hours'],
			minutes = options['minutes'],
			seconds = options['seconds'],
			endDate, today,
			$daysValue = $this.find('#riva-countdown-days .value p'),
			$hoursValue = $this.find('#riva-countdown-hours .value p'),
			$minsValue = $this.find('#riva-countdown-minutes .value p'),
			$secsValue = $this.find('#riva-countdown-seconds .value p'),
			dividers = new Array(86400, 3600, 60, 1), rest, t,
			values = new Array($daysValue, $hoursValue, $minsValue, $secsValue),
			timer_is_on = 0;

		console.log('rivaCountdown init for #' + $this.attr('id') + '...');		// Init message

		endDate = new Date(year, month - 1, day, hours, minutes, seconds);

		if (!timer_is_on) {

			timer_is_on = 1;

			changeTime();

		}

		function changeTime() {

			today = new Date();

			rest = (endDate - today) / 1000;

			for (var i = 0; i < dividers.length; i++) {

				values[i].html(Math.floor(rest / dividers[i]));

				rest = rest % dividers[i];

			}

			t = setTimeout(changeTime,1000);

		}
	}
})( jQuery );


//
// RivaThemes Single Product Preview
//

(function( $ ){

	var methods = {

		init : function( options ) {

			var $this = $(this);

			function SinglePreview() {

				var $obj = $this;

				var defaults = {																	// Default settings
						'style'						: 'horizontal',
						'thumbsWidth'				: 100
					}

				// Scroll thumbs

				function scrollThumbs( direction ) {

//					alert( direction );

					var $wrapper = $obj.find( '.rivaSingleProductPreviewThumbsWrapperInner' );

					if ( $obj.style == 'horizontal' ) {

						if ( direction > 0 ) {

							if ( $obj.currentThumb < $obj.thumbsQty ) {

								$wrapper.animate({
									'margin-left': '-=' + ($obj.thumbsWidth + 10) + 'px'
								}, function() {

									$obj.currentThumb++;

								});

							}

						} else {

							if ( $obj.currentThumb != 1 ) {

								$wrapper.animate({
									'margin-left': '+=' + ($obj.thumbsWidth + 10) + 'px'
								}, function() {

									$obj.currentThumb--;

								});

							}

						}

					} else {

						if ( direction > 0 ) {

							if ( $obj.currentThumb < $obj.thumbsQty ) {

								$wrapper.animate({
									'margin-top': '-=' + ($obj.thumbsWidth + 10) + 'px'
								}, function() {

									$obj.currentThumb++;

								});

							}

						} else {

							if ( $obj.currentThumb != 1 ) {

								$wrapper.animate({
									'margin-top': '+=' + ($obj.thumbsWidth + 10) + 'px'
								}, function() {

									$obj.currentThumb--;

								});

							}

						}

					}

				}

				//
				// Constructor
				//

				var __construct = function() {

					console.log('rivaSingleProductPreview init for #' + $this.attr('id') + '...');		// Init message

					options = $.extend( defaults, options );

					$obj.style = options[ 'style' ];

					$obj.thumbsWidth = options[ 'thumbsWidth' ];

					$( '<div class="rivaSingleProductPreviewThumbs"></div>' ).appendTo( $obj );

					$obj.thumbs = $obj.find( '.rivaSingleProductPreviewThumbs' );

					$obj.imgs = $obj.find( 'img' );

					$obj.imgs.wrapAll( '<div class="rivaSingleProductPreviewSlides"></div>' ).each( function() {

						$(this).clone().appendTo( $obj.thumbs ).css( 'max-width', $obj.thumbsWidth + 'px' );

					} );

					$obj.slides = $obj.find( '.rivaSingleProductPreviewSlides' );

					$obj.slides.find( 'img' ).hide().first().show();

					$obj.thumbs.find( 'img' ).wrapAll( '<div class="rivaSingleProductPreviewThumbsWrapper"></div>' ).first().addClass( 'active' );

					$obj.thumbs.find( '.rivaSingleProductPreviewThumbsWrapper' ).wrapInner( '<div class="rivaSingleProductPreviewThumbsWrapperInner"></div>' );

					if ( $obj.style == 'horizontal' ) {

						$obj.addClass( 'horizontal' );

						$( '<a href="#" class="nav prev"><span class="glyphicon glyphicon-arrow-left"></span></a>' ).appendTo( $obj.thumbs );

						$( '<a href="#" class="nav next"><span class="glyphicon glyphicon-arrow-right"></span></a>' ).appendTo( $obj.thumbs );

					} else if ( $obj.style == 'vertical' ) {

						$obj.addClass( 'vertical' ).css('padding-right', ($obj.thumbsWidth + 0) + 'px');

						$obj.find('.rivaSingleProductPreviewThumbs').width( $obj.thumbsWidth );

						$( '<a href="#" class="nav prev"><span class="glyphicon glyphicon-arrow-up"></span></a>' ).appendTo( $obj.thumbs );

						$( '<a href="#" class="nav next"><span class="glyphicon glyphicon-arrow-down"></span></a>' ).appendTo( $obj.thumbs );

						$obj.find('.rivaSingleProductPreviewThumbsWrapper').height( $obj.slides.height() - 60 );

					}

					$obj.nav = $obj.thumbs.find( 'a.nav' );

					$( '<div class="rivaSingleProductPreviewSlideControls"><a href="' + $obj.slides.find( 'img' ).first().attr( 'src' ) + '" class="resize" style="margin-right: 10px;"><span class="glyphicon glyphicon-resize-full"></span></a><a href="#share" class="share"><span class="glyphicon glyphicon-share"></span></a></div>').appendTo( $obj.slides );

					$obj.resizeLink = $obj.find( '.rivaSingleProductPreviewSlideControls a.resize');

					$obj.resizeLink.colorbox();

					$obj.currentThumb = 1;

					$obj.thumbsQty = $obj.find('.rivaSingleProductPreviewThumbsWrapperInner img').length;

					$obj.thumbs.find( 'img' ).click( function() {

						var $this = $(this),
							index = $this.index();

						$obj.thumbs.find( 'img' ).removeClass( 'active' );

						$this.addClass( 'active' );

						$obj.slides.find( 'img' ).hide().eq( index ).fadeIn();

						$obj.resizeLink.attr( 'href', $this.attr( 'src' ) );

					} );

					$obj.nav.click( function(e) {

						e.preventDefault();

						if ( $(this).hasClass('prev')) {

							scrollThumbs( -1 );

						} else {

							scrollThumbs( 1 );
						}

					} );

				}()

				//
				// Rendering
				//

				this.render = function() {

					if ( $obj.style == 'vertical' ) {

						$obj.find('.rivaSingleProductPreviewThumbsWrapper').height( $obj.slides.height() - 60 );

					}
				}

			}

			var preview = new SinglePreview();

			$(window).resize(function() {

				preview.render();

			}).trigger('resize');

		}

	}

	$.fn.rivaSingleProductPreview = function( method ) {
    
		if ( methods[method] ) {
			
			return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));

		} else if ( typeof method === 'object' || ! method ) {

			return methods.init.apply( this, arguments );

		} else {

			console.log( 'Method called "' +  method + '" does not exist for jQuery.rivaSingleProductPreview' );
		}    
	};

})( jQuery );

