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
 * Locale: LV (Latvian; latviešu valoda)
 */
$.extend($.validator.messages, {
	required: "Šis lauks ir oblig�?ts.",
	remote: "Lūdzu, p�?rbaudiet šo lauku.",
	email: "Lūdzu, ievadiet derīgu e-pasta adresi.",
	url: "Lūdzu, ievadiet derīgu URL adresi.",
	date: "Lūdzu, ievadiet derīgu datumu.",
	dateISO: "Lūdzu, ievadiet derīgu datumu (ISO).",
	number: "Lūdzu, ievadiet derīgu numuru.",
	digits: "Lūdzu, ievadiet tikai ciparus.",
	creditcard: "Lūdzu, ievadiet derīgu kredītkartes numuru.",
	equalTo: "Lūdzu, ievadiet to pašu vēlreiz.",
	extension: "Lūdzu, ievadiet vērtību ar derīgu paplašin�?jumu.",
	maxlength: $.validator.format("Lūdzu, ievadiet ne vair�?k k�? {0} rakstzīmes."),
	minlength: $.validator.format("Lūdzu, ievadiet vismaz {0} rakstzīmes."),
	rangelength: $.validator.format("Lūdzu ievadiet {0} līdz {1} rakstzīmes."),
	range: $.validator.format("Lūdzu, ievadiet skaitli no {0} līdz {1}."),
	max: $.validator.format("Lūdzu, ievadiet skaitli, kurš ir maz�?ks vai vien�?ds ar {0}."),
	min: $.validator.format("Lūdzu, ievadiet skaitli, kurš ir liel�?ks vai vien�?ds ar {0}.")
});

}));
