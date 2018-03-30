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
 * Locale: HR (Croatia; hrvatski jezik)
 */
$.extend($.validator.messages, {
	required: "Ovo polje je obavezno.",
	remote: "Ovo polje treba popraviti.",
	email: "Unesite ispravnu e-mail adresu.",
	url: "Unesite ispravan URL.",
	date: "Unesite ispravan datum.",
	dateISO: "Unesite ispravan datum (ISO).",
	number: "Unesite ispravan broj.",
	digits: "Unesite samo brojeve.",
	creditcard: "Unesite ispravan broj kreditne kartice.",
	equalTo: "Unesite ponovo istu vrijednost.",
	extension: "Unesite vrijednost sa ispravnom ekstenzijom.",
	maxlength: $.validator.format("Maksimalni broj znakova je {0} ."),
	minlength: $.validator.format("Minimalni broj znakova je {0} ."),
	rangelength: $.validator.format("Unesite vrijednost između {0} i {1} znakova."),
	range: $.validator.format("Unesite vrijednost između {0} i {1}."),
	max: $.validator.format("Unesite vrijednost manju ili jednaku {0}."),
	min: $.validator.format("Unesite vrijednost veću ili jednaku {0}.")
});

}));
