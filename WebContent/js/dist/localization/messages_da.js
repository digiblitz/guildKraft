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
 * Locale: DA (Danish; dansk)
 */
$.extend($.validator.messages, {
	required: "Dette felt er påkrævet.",
	maxlength: $.validator.format("Indtast højst {0} tegn."),
	minlength: $.validator.format("Indtast mindst {0} tegn."),
	rangelength: $.validator.format("Indtast mindst {0} og højst {1} tegn."),
	email: "Indtast en gyldig email-adresse.",
	url: "Indtast en gyldig URL.",
	date: "Indtast en gyldig dato.",
	number: "Indtast et tal.",
	digits: "Indtast kun cifre.",
	equalTo: "Indtast den samme værdi igen.",
	range: $.validator.format("Angiv en værdi mellem {0} og {1}."),
	max: $.validator.format("Angiv en værdi der højst er {0}."),
	min: $.validator.format("Angiv en værdi der mindst er {0}."),
	creditcard: "Indtast et gyldigt kreditkortnummer."
});

}));
