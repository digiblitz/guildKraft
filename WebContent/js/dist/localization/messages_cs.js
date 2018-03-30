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
 * Locale: CS (Czech; �?eština, �?eský jazyk)
 */
$.extend($.validator.messages, {
	required: "Tento údaj je povinný.",
	remote: "Prosím, opravte tento údaj.",
	email: "Prosím, zadejte platný e-mail.",
	url: "Prosím, zadejte platné URL.",
	date: "Prosím, zadejte platné datum.",
	dateISO: "Prosím, zadejte platné datum (ISO).",
	number: "Prosím, zadejte �?íslo.",
	digits: "Prosím, zadávejte pouze �?íslice.",
	creditcard: "Prosím, zadejte �?íslo kreditní karty.",
	equalTo: "Prosím, zadejte znovu stejnou hodnotu.",
	extension: "Prosím, zadejte soubor se správnou příponou.",
	maxlength: $.validator.format("Prosím, zadejte nejvíce {0} znaků."),
	minlength: $.validator.format("Prosím, zadejte nejméně {0} znaků."),
	rangelength: $.validator.format("Prosím, zadejte od {0} do {1} znaků."),
	range: $.validator.format("Prosím, zadejte hodnotu od {0} do {1}."),
	max: $.validator.format("Prosím, zadejte hodnotu menší nebo rovnu {0}."),
	min: $.validator.format("Prosím, zadejte hodnotu větší nebo rovnu {0}.")
});

}));
