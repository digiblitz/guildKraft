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
	}else{
		jQuery('.demo_changer').animate({"left":"0px"},function(){
			jQuery('.demo_changer').toggleClass("active");
		});			
	} 
});

// Selector (MODULE #4)
$(window).on('load', function () {
	$('.selectpicker').selectpicker({
		'selectedText': 'cat'
	});
});

// Selector (MODULE #2)
jQuery('.demo_changer .PatternChanger a').click(function(){
	var bgBgCol = jQuery(this).attr('href');
	jQuery('.demo_changer .PatternChanger a').removeClass('current');
	jQuery('body').css({backgroundColor:'#ffffff'});
	jQuery(this).addClass('current');
	jQuery('body').css({backgroundImage:'url(' + bgBgCol + ')'});
	if (jQuery(this).hasClass('bg_t')){
		jQuery('body').css({backgroundRepeat:'repeat', backgroundPosition:'50% 0', backgroundAttachment:'scroll'});
	} else {
		jQuery('body').css({backgroundRepeat:'repeat', backgroundPosition:'50% 0', backgroundAttachment:'scroll'});
	}
	return false;
});
