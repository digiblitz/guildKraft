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

/**
 * @author  @tatocaster <kutaliatato@gmail.com>
 * Translated default messages for the jQuery validation plugin.
 * Locale: GE (Georgian; ქ�?რთული)
 */
$.extend($.validator.messages, {
	required: "ეს ველი ს�?ვ�?ლდებულ�?�?",
	remote: "გთხ�?ვთ შე�?სწ�?რ�?თ.",
	email: "გთხ�?ვთ შეიყვ�?ნ�?თ სწ�?რი ფ�?რმ�?ტით.",
	url: "გთხ�?ვთ შეიყვ�?ნ�?თ სწ�?რი ფ�?რმ�?ტით.",
	date: "გთხ�?ვთ შეიყვ�?ნ�?თ სწ�?რი თ�?რიღი.",
	dateISO: "გთხ�?ვთ შეიყვ�?ნ�?თ სწ�?რი ფ�?რმ�?ტით ( ISO ).",
	number: "გთხ�?ვთ შეიყვ�?ნ�?თ რიცხვი.",
	digits: "დ�?შვებული�? მხ�?ლ�?დ ციფრები.",
	creditcard: "გთხ�?ვთ შეიყვ�?ნ�?თ სწ�?რი ფ�?რმ�?ტის ბ�?რ�?თის კ�?დი.",
	equalTo: "გთხ�?ვთ შეიყვ�?ნ�?თ იგივე მნიშვნელ�?ბ�?.",
	maxlength: $.validator.format( "გთხ�?ვთ შეიყვ�?ნ�?თ �?რ�? უმეტეს {0} სიმბ�?ლ�?სი." ),
	minlength: $.validator.format( "შეიყვ�?ნეთ მინიმუმ {0} სიმბ�?ლ�?." ),
	rangelength: $.validator.format( "გთხ�?ვთ შეიყვ�?ნ�?თ {0} -დ�?ნ {1} -მდე რ�?�?დენ�?ბის სიმბ�?ლ�?ები." ),
	range: $.validator.format( "შეიყვ�?ნეთ {0} -ს�? {1} -ს შ�?რის." ),
	max: $.validator.format( "გთხ�?ვთ შეიყვ�?ნ�?თ მნიშვნელ�?ბ�? ნ�?კლები �?ნ ტ�?ლი {0} -ს." ),
	min: $.validator.format( "გთხ�?ვთ შეიყვ�?ნ�?თ მნიშვნელ�?ბ�? მეტი �?ნ ტ�?ლი {0} -ს." )
});

}));
