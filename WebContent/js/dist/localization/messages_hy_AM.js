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
(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "../jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: HY_AM (Armenian; հայերեն լեզու)
 */
$.extend($.validator.messages, {
	required: "Պարտադիր լրա�?ման դաշտ",
	remote: "Ներմուծեք ճիշտ արժեքը",
	email: "Ներմուծեք վավեր էլեկտրոնային փոստի հաս�?ե",
	url: "Ներմուծեք վավեր URL",
	date: "Ներմուծեք վավեր ամսաթիվ",
	dateISO: "Ներմուծեք ISO ֆորմատով վավեր ամսաթիվ։",
	number: "Ներմուծեք թիվ",
	digits: "Ներմուծեք միայն թվեր",
	creditcard: "Ներմուծեք ճիշտ բանկային քարտի համար",
	equalTo: "Ներմուծեք միևնուն արժեքը ևս մեկ անգամ",
	extension: "Ընտրեք ճիշտ ընդլանումով ֆայլ",
	maxlength: $.validator.format("Ներմուծեք ոչ ավել քան {0} նիշ"),
	minlength: $.validator.format("Ներմուծեք ոչ պակաս քան {0} նիշ"),
	rangelength: $.validator.format("Ներմուծեք {0}֊ի�? {1} երկարությամբ արժեք"),
	range: $.validator.format("Ներմուծեք թիվ {0}֊ի�? {1} միջակայքում"),
	max: $.validator.format("Ներմուծեք թիվ, որը փոքր կամ հավասար է {0}֊ին"),
	min: $.validator.format("Ներմուծեք թիվ, որը մեծ կամ հավասար է {0}֊ին")
});

}));
