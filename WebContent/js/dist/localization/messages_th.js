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
 * Locale: TH (Thai; ไทย)
 */
$.extend($.validator.messages, {
	required: "โปรดระบุ",
	remote: "โปรด�?�?้ไขให้ถู�?ต้อง",
	email: "โปรดระบุที่อยู่อีเมล์ที่ถู�?ต้อง",
	url: "โปรดระบุ URL ที่ถู�?ต้อง",
	date: "โปรดระบุวันที่ ที่ถู�?ต้อง",
	dateISO: "โปรดระบุวันที่ ที่ถู�?ต้อง (ระบบ ISO).",
	number: "โปรดระบุทศนิยมที่ถู�?ต้อง",
	digits: "โปรดระบุจำนวนเต็มที่ถู�?ต้อง",
	creditcard: "โปรดระบุรหัสบัตรเครดิตที่ถู�?ต้อง",
	equalTo: "โปรดระบุค่าเดิมอี�?ครั้ง",
	extension: "โปรดระบุค่าที่มีส่วนขยายที่ถู�?ต้อง",
	maxlength: $.validator.format("โปรดอย่าระบุค่าที่ยาว�?ว่า {0} อั�?ขระ"),
	minlength: $.validator.format("โปรดอย่าระบุค่าที่สั้น�?ว่า {0} อั�?ขระ"),
	rangelength: $.validator.format("โปรดอย่าระบุค่าความยาวระหว่าง {0} ถึง {1} อั�?ขระ"),
	range: $.validator.format("โปรดระบุค่าระหว่าง {0} �?ละ {1}"),
	max: $.validator.format("โปรดระบุค่าน้อย�?ว่าหรือเท่า�?ับ {0}"),
	min: $.validator.format("โปรดระบุค่ามา�?�?ว่าหรือเท่า�?ับ {0}")
});

}));
