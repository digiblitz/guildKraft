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
 * Locale: ZH (Chinese; 中文 (Zh�?ngwén), 汉语, 漢語)
 * Region: TW (Taiwan)
 */
$.extend($.validator.messages, {
	required: "必須填寫",
	remote: "請修正此欄�?",
	email: "請輸入有效的電�?郵件",
	url: "請輸入有效的網�?�",
	date: "請輸入有效的日期",
	dateISO: "請輸入有效的日期 (YYYY-MM-DD)",
	number: "請輸入正確的數值",
	digits: "�?��?�輸入數字",
	creditcard: "請輸入有效的信用�?�號碼",
	equalTo: "請�?複輸入一次",
	extension: "請輸入有效的後綴",
	maxlength: $.validator.format("最多 {0} 個字"),
	minlength: $.validator.format("最少 {0} 個字"),
	rangelength: $.validator.format("請輸入長度為 {0} 至 {1} 之間的字串"),
	range: $.validator.format("請輸入 {0} 至 {1} 之間的數值"),
	max: $.validator.format("請輸入�?大於 {0} 的數值"),
	min: $.validator.format("請輸入�?�?於 {0} 的數值")
});

}));
