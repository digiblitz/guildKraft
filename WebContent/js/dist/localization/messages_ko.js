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
 * Locale: KO (Korean; 한국어)
 */
$.extend($.validator.messages, {
	required: "필수 항목입니다.",
	remote: "항목�?� 수정하세요.",
	email: "유효하지 않�?� E-Mail주소입니다.",
	url: "유효하지 않�?� URL입니다.",
	date: "올바른 날짜를 입력하세요.",
	dateISO: "올바른 날짜(ISO)를 입력하세요.",
	number: "유효한 숫�?가 아닙니다.",
	digits: "숫�?만 입력 가능합니다.",
	creditcard: "신용카드 번호가 바르지 않습니다.",
	equalTo: "같�?� 값�?� 다시 입력하세요.",
	extension: "올바른 확장�?가 아닙니다.",
	maxlength: $.validator.format("{0}�?를 넘�?� 수 없습니다. "),
	minlength: $.validator.format("{0}�? �?��? 입력하세요."),
	rangelength: $.validator.format("문�? 길�?�가 {0} �?서 {1} 사�?��?� 값�?� 입력하세요."),
	range: $.validator.format("{0} �?서 {1} 사�?��?� 값�?� 입력하세요."),
	max: $.validator.format("{0} �?�하�?� 값�?� 입력하세요."),
	min: $.validator.format("{0} �?��?�?� 값�?� 입력하세요.")
});

}));
