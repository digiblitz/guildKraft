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
function forCheck(){
	document.getElementById('chkEncAcm').style.display = "block";
	document.getElementById('chrgCrdAcm').style.display = "none";
}
function forCard(){
	document.getElementById('chkEncAcm').style.display = "none";
	document.getElementById('chrgCrdAcm').style.display = "block";
}

function isnotAlphaNumeric(str){
	stringAlphaNumCheck="!@#$%^&*()_+|<>?/=-~.,;:][{}"+"\\"+"\'";
	f3=1;
	for(j=0;j<str.length;j++){
		if(stringAlphaNumCheck.indexOf(str.charAt(j))!=-1){
			f3=0;
		}
	}
	if(f3==0){
		return true;
	}
	else{
		return false;
	}
}

var dtCh= "/";
var minYear=1900;
var maxYear=2100;
function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    return true;
}
function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}
function daysInFebruary (year){
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}
function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for(var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Enter a valid month in Check Date")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Enter a valid day in Check Date")
		return false
	}
   if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Enter a valid Check Date")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear ){
		alert("Enter a valid Year in Check Date ")
		return false
	}
return true
}

function isnotAlpha(str){
	stringCheck="!@#$%^&*()_+|<>?/=~,`0123456789;:][{}"+"\\";
	f1=1;
	for(j=0;j<str.length;j++){
		if(stringCheck.indexOf(str.charAt(j))!=-1){
			f1=0;
		}
	}
	if(f1==0){
		return true;
	}else{
		return false;
	}
}

function isnotInteger(str){
	stringIntCheck="0123456789";
	f2=1;
	for(j=0;j<str.length;j++){
		if(stringIntCheck.indexOf(str.charAt(j))==-1){
			f2=0;
		}
	}
	if(f2==0){
		return true;
	}
	else{
		return false;
	}
}

function myvalidate(){
	chosen="";
	len = document.myform.r11.length ;
	for(i=0;i<len;i++){
		if(document.myform.r11[i].checked){
			chosen= document.myform.r11[i].value;
		}
	}
	if(chosen==""){
		alert("Check any of the Payment Option.");
		return false;
	}	

	if(chosen=="check"){
		if(document.myform.checkNumber.value==""){
			alert("Enter Check Number in Check Details");
			document.myform.checkNumber.focus();
			return false;
		}
		if(isnotAlphaNumeric(document.myform.checkNumber.value)){
			alert("Enter valid Check Number in Check Details.");
			document.myform.checkNumber.focus();
			return false;
		}
		if(document.myform.checkNumber.value.indexOf('.')!=-1){
			alert("Enter a Valid check number in Check Details.");
			document.myform.checkNumber.focus();
			return false;
		}
		if(document.myform.checkNumber.value.indexOf(" ")==0){
			alert("Enter a Valid check number in Check Details.");
			document.myform.checkNumber.focus();
			return false;
		}
		maxdays=0;
		if(document.myform.checkDate.value==""){
			alert("Enter a Check Date in Payment Information");
			document.myform.checkDate.focus();
			return false;
		}
		if(isnotAlphaNumeric1(document.myform.checkDate.value)){
			alert("Enter a valid Check Date in the Payment Information");
			document.myform.checkDate.focus();
			return false;
		}
		if (isDate(document.myform.checkDate.value)==false){
			document.myform.checkDate.focus()
			return false; 
		}
		if(document.myform.bankName.value==""){
			alert("Enter a Bank Name info in Payment Information");
			document.myform.bankName.focus();
			return false;
		}
		if(document.myform.bankName.value.indexOf(' ')==0){
			alert("Enter valid Bank Name info in Payment Information");
			document.myform.bankName.focus();
			return false;
		}
		if(isnotAlpha(document.myform.bankName.value)){
			alert("Enter valid Bank Name Info in Payment Information");
			document.myform.bankName .focus();
			return false;
		}
		if(document.myform.nameCheck.value.indexOf(' ')==0){
			alert("Enter valid Name on Check info in Payment Information");
			document.myform.nameCheck.focus();
			return false;
		}
		if(document.myform.nameCheck.value==""){
			alert("Enter valid Name on Check info in Payment Information");
			document.myform.nameCheck.focus();
			return false;
		}
		if(document.myform.nameCheck.value.length>80){
			alert(" Name on Check info in Payment Information is out of range");
			document.myform.nameCheck.focus();
			return false;
		}
		if(isnotAlpha(document.myform.nameCheck.value)){
			alert("Enter valid name in the Name on Check Info in Payment Information");
			document.myform.nameCheck.focus();
			return false;
		}
		if(document.myform.nameCheck.value.indexOf(" ")==0){
			alert("Enter valid name in the Name on Check Info in Payment Information");
			document.myform.nameCheck.focus();
			return false;
		}
	}
	if(chosen=="card"){
		if(document.myform.ccType.selectedIndex == 0 ){
			alert("Please select card type." );
			document.myform.ccType.focus();
			return false;
		}
		if(document.myform.ccNumber.value==""){
			alert("Enter a Card Number in the Card Details");
			document.myform.ccNumber.focus();
			return false;
		}
		if(!Number(document.myform.ccNumber.value)){
			alert("Enter valid Card Number in the Card Details");
			document.myform.ccNumber.focus();
			return false;
		}
		if(document.myform.ccType.selectedIndex == 3 ){
			if(document.myform.ccNumber.value.length!=15 ){
				alert("Enter valid Card Number in the Card Details");
				document.myform.ccNumber.focus();
				return false;
			}
		}
		if(document.myform.ccType.selectedIndex == 1 || document.myform.ccType.selectedIndex == 2 ){
			if(document.myform.ccNumber.value.length!=16 ){
				alert("Enter valid Card Number in the Card Details");
				document.myform.ccNumber.focus();
				return false;
			}
		}
		if(document.myform.ccNumber.value.indexOf('.')!=-1){
			alert("Enter Valid Card Number in the Card Details.");
			document.myform.ccNumber.focus();
			return false;
		}
		if(document.myform.ccCvvid.value.length>4){
			alert("Enter valid CVV Number in Card Details");
			document.myform.ccCvvid.focus();
			return false;
		}
		if(document.myform.ccCvvid.value.length<3){
			alert("Enter valid CVV Number in Card Details");
			document.myform.ccCvvid.focus();
			return false;
		}
		if(document.myform.ccCvvid.value.indexOf('.')!=-1){
			alert("Enter Valid Cvv Number in Card Details.");
			document.myform.ccCvvid.focus();
			return false;
		}
		if(isnotInteger(document.myform.ccCvvid.value)){
			alert("Enter Valid Cvv Number in Card Details.");
			document.myform.ccCvvid.focus();
			return false;
		}
		if(document.myform.ccName.value==""){
			alert("Enter valid Print Name in Card Details.");
			document.myform.ccName.focus();
			return false;
		}
		if(document.myform.ccName.value.length>80){
			alert("Entered Print Name in Card Details is out of Range.");
			document.myform.ccName.focus();
			return false;
		}
		if(isnotAlpha(document.myform.ccName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.myform.ccName.focus();
			return false;
		}
		if(Number(document.myform.ccName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.myform.ccName.focus();
			return false;
		}
		if(document.myform.ccName.value.indexOf(' ')==0){
			alert("Enter a Valid Print Name in Card Details.");
			document.myform.ccName.focus();
			return false;
		}
		if(document.myform.ccName.value.indexOf('  ')!==-1){
			alert("Enter Valid Print Name in Card Details.");
			document.myform.ccName.focus();
			return false;
		}
		var rightNow=new Date();
		var theYear=rightNow.getFullYear();
		var tMonth=rightNow.getMonth();
		var theMonth=1+tMonth;
		var theDate=rightNow.getDate();
		if ( document.myform.ccExpMonth.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration Month." );
			document.myform.ccExpMonth.focus();
			return false;
		}
		if (document.myform.ccExpYear.value==theYear){
			if(document.myform.ccExpMonth.value<theMonth){
				alert("Please Select Valid Card Expiration Month.");
				document.myform.ccExpMonth.focus();
				return(false);   
			}
		}
		if (document.myform.ccExpYear.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration year." );
			document.myform.ccExpYear.focus();
			return false;
		}
		if (document.myform.ccExpYear.value<theYear){
			alert("Please Select Valid Card Expiration Year.");
			document.myform.ccExpYear.focus();
			return false;   
		}
	}
	return true;
}
