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
 * Locale: FI (Finnish; suomi, suomen kieli)
 */
$.extend($.validator.messages, {
	required: "T&auml;m&auml; kentt&auml; on pakollinen.",
	email: "Sy&ouml;t&auml; oikea s&auml;hk&ouml;postiosoite.",
	url: "Sy&ouml;t&auml; oikea URL-osoite.",
	date: "Sy&ouml;t&auml; oikea p&auml;iv&auml;m&auml;&auml;r&auml;.",
	dateISO: "Sy&ouml;t&auml; oikea p&auml;iv&auml;m&auml;&auml;r&auml; muodossa VVVV-KK-PP.",
	number: "Sy&ouml;t&auml; luku.",
	creditcard: "Sy&ouml;t&auml; voimassa oleva luottokorttinumero.",
	digits: "Sy&ouml;t&auml; pelk&auml;st&auml;&auml;n numeroita.",
	equalTo: "Sy&ouml;t&auml; sama arvo uudestaan.",
	maxlength: $.validator.format("Voit sy&ouml;tt&auml;&auml; enint&auml;&auml;n {0} merkki&auml;."),
	minlength: $.validator.format("V&auml;hint&auml;&auml;n {0} merkki&auml;."),
	rangelength: $.validator.format("Sy&ouml;t&auml; v&auml;hint&auml;&auml;n {0} ja enint&auml;&auml;n {1} merkki&auml;."),
	range: $.validator.format("Sy&ouml;t&auml; arvo v&auml;lilt&auml; {0}&ndash;{1}."),
	max: $.validator.format("Sy&ouml;t&auml; arvo, joka on enint&auml;&auml;n {0}."),
	min: $.validator.format("Sy&ouml;t&auml; arvo, joka on v&auml;hint&auml;&auml;n {0}.")
});

}));
