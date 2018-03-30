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
 * Locale: bn_BD (Bengali, Bangladesh)
 */
$.extend($.validator.messages, {
	required: "�?ই তথ�?যটি আবশ�?যক।",
	remote: "�?ই তথ�?যটি ঠিক কর�?ন।",
	email: "অন�?গ�?রহ করে �?কটি সঠিক মেইল ঠিকানা লিখ�?ন।",
	url: "অন�?গ�?রহ করে �?কটি সঠিক লিঙ�?ক দিন।",
	date: "তারিখ সঠিক নয়।",
	dateISO: "অন�?গ�?রহ করে �?কটি সঠিক (ISO) তারিখ লিখ�?ন।",
	number: "অন�?গ�?রহ করে �?কটি সঠিক নম�?বর লিখ�?ন।",
	digits: "�?খানে শ�?ধ�? সংখ�?যা ব�?যবহার করা যাবে।",
	creditcard: "অন�?গ�?রহ করে �?কটি ক�?রেডিট কার�?ডের সঠিক নম�?বর লিখ�?ন।",
	equalTo: "�?কই মান আবার লিখ�?ন।",
	extension: "সঠিক ধরনের ফাইল আপলোড কর�?ন।",
	maxlength: $.validator.format("{0}টির বেশি অক�?ষর লেখা যাবে না।"),
	minlength: $.validator.format("{0}টির কম অক�?ষর লেখা যাবে না।"),
	rangelength: $.validator.format("{0} থেকে {1} টি অক�?ষর সম�?বলিত মান লিখ�?ন।"),
	range: $.validator.format("{0} থেকে {1} �?র মধ�?যে �?কটি মান ব�?যবহার কর�?ন।"),
	max: $.validator.format("অন�?গ�?রহ করে {0} বা তার চাইতে কম মান ব�?যবহার কর�?ন।"),
	min: $.validator.format("অন�?গ�?রহ করে {0} বা তার চাইতে বেশি মান ব�?যবহার কর�?ন।")
});

}));
