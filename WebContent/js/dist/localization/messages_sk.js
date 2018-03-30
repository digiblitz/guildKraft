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
 * Locale: SK (Slovak; sloven�?ina, slovenský jazyk)
 */
$.extend($.validator.messages, {
	required: "Povinné zadať.",
	maxlength: $.validator.format("Maximálne {0} znakov."),
	minlength: $.validator.format("Minimálne {0} znakov."),
	rangelength: $.validator.format("Minimálne {0} a Maximálne {1} znakov."),
	email: "E-mailová adresa musí byť platná.",
	url: "URL musí byť platný.",
	date: "Musí byť dátum.",
	number: "Musí byť �?íslo.",
	digits: "Môže obsahovať iba �?íslice.",
	equalTo: "Dva hodnoty sa musia rovnať.",
	range: $.validator.format("Musí byť medzi {0} a {1}."),
	max: $.validator.format("Nemôže byť viac ako{0}."),
	min: $.validator.format("Nemôže byť menej ako{0}."),
	creditcard: "Číslo platobnej karty musí byť platné."
});

}));
