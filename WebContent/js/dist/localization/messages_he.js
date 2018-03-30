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
 * Locale: HE (Hebrew; עברית)
 */
$.extend($.validator.messages, {
	required: "השדה הזה הינו שדה חובה",
	remote: "נ�? לתקן שדה זה",
	email: "נ�? למל�? כתובת דו�?\"ל חוקית",
	url: "נ�? למל�? כתובת �?ינטרנט חוקית",
	date: "נ�? למל�? ת�?ריך חוקי",
	dateISO: "נ�? למל�? ת�?ריך חוקי (ISO)",
	number: "נ�? למל�? מספר",
	digits: "נ�? למל�? רק מספרי�?",
	creditcard: "נ�? למל�? מספר כרטיס �?שר�?י חוקי",
	equalTo: "נ�? למל�? �?ת �?ותו ערך שוב",
	extension: "נ�? למל�? ערך ע�? סיומת חוקית",
	maxlength: $.validator.format(".נ�? ל�? למל�? יותר מ- {0} תווי�?"),
	minlength: $.validator.format("נ�? למל�? לפחות {0} תווי�?"),
	rangelength: $.validator.format("נ�? למל�? ערך בין {0} ל- {1} תווי�?"),
	range: $.validator.format("נ�? למל�? ערך בין {0} ל- {1}"),
	max: $.validator.format("נ�? למל�? ערך קטן �?ו שווה ל- {0}"),
	min: $.validator.format("נ�? למל�? ערך גדול �?ו שווה ל- {0}")
});

}));
