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
/*  Javascript Document 
******************************************************************************************************************
	Product Name: Integrated Enterprise Dashboard - Association / Club V0.5
	Organization: digiBlitz Technologies (P) Ltd.
    Created by: K.N.Sathish
    Created Date: 07/08/2006  
*****************************************************************************************************************
*/

function showLevels(chkBxNam,divId){
		if(document.frmAdvMag.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}
				
function showHide(chkBxNam,divId){
		if(document.frmAdvMag.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}

function enabDisab(chkBxId,txtBxId){
	  
		if(document.frmAdvMag.elements[chkBxId].checked == true){
				document.frmAdvMag.elements[txtBxId].disabled = false;	
		}else {
				document.frmAdvMag.elements[txtBxId].disabled = "disabled";	
		} 
}

function enableRad(radBtnId,txtBxId){	
		if(document.frmAdvMag.elements[radBtnId].checked == true){
				document.frmAdvMag.elements[txtBxId].disabled = false;	
		}else{
				document.frmAdvMag.elements[txtBxId].disabled = "disabled";	
		} 
}

function disable(radBtnNewId,txtBxId){
		if(document.frmAdvMag.elements[radBtnNewId].checked == true){
				document.frmAdvMag.elements[txtBxId].disabled = "disabled";	
		}
}
		
function showHideRadio(radioNam,divId,radVal){
		if(document.frmAdvMag.elements[radioNam].value == radVal){
				document.getElementById(divId).style.display = "block";	
		}
		else {
				document.getElementById(divId).style.display = "none";	
		} 
}

function yesClear(){
	document.frmAdvMag.txtYesDate.disabled=false;

}

function noClear(){
	document.frmAdvMag.txtYesDate.disabled=true;
	document.frmAdvMag.txtYesDate.value="";
}
function oneClear(){
	document.frmAdvMag.selOneAdvType.disabled=false;
	document.frmAdvMag.selOneAdvSubType.disabled=false;
	document.frmAdvMag.selOneAdDim.disabled=false;
	document.frmAdvMag.txtOnePlace.disabled=false;
	
}
function twoClear(){
	document.frmAdvMag.selTwoAdvType.disabled=false;
	document.frmAdvMag.selTwoAdvSubType.disabled=false;
	document.frmAdvMag.selTwoAdDim.disabled=false;
	document.frmAdvMag.txtTwoPlace.disabled=false;
}
function threeClear(){
	document.frmAdvMag.selThreeAdvType.disabled=false;
	document.frmAdvMag.selThreeAdvSubType.disabled=false;
	document.frmAdvMag.selThreeAdDim.disabled=false;
	document.frmAdvMag.txtThreePlace.disabled=false;
	
}
function fourClear(){
	document.frmAdvMag.selFourAdvType.disabled=false;
	document.frmAdvMag.selFourAdvSubType.disabled=false;
	document.frmAdvMag.selFourAdDim.disabled=false;
	document.frmAdvMag.txtFourPlace.disabled=false;

}

function fiveClear(){
	document.frmAdvMag.selFiveAdvType.disabled=false;
	document.frmAdvMag.selFiveAdvSubType.disabled=false;
	document.frmAdvMag.selFiveAdDim.disabled=false;
	document.frmAdvMag.txtFivePlace.disabled=false;
}
function sixClear(){
	document.frmAdvMag.selSixAdvType.disabled=false;
	document.frmAdvMag.selSixAdvSubType.disabled=false;
	document.frmAdvMag.selSixAdDim.disabled=false;
	document.frmAdvMag.txtSixPlace.disabled=false;
}
function checkClear(){
	document.frmAdvMag.txtCcNumber.disabled=false;
	document.frmAdvMag.txtCvvNumber.disabled=false;
	document.frmAdvMag.selCardType.disabled=false;
	document.frmAdvMag.txtCCName.disabled=false;
	document.frmAdvMag.selExpiryMonth.disabled=false;
	document.frmAdvMag.selExpiryYear.disabled=false;
	document.frmAdvMag.txtChNumber.disabled=true;
	document.frmAdvMag.txtChDate.disabled=true;
	document.frmAdvMag.txtFav.disabled=true;
	
	document.frmAdvMag.txtChNumber.value="";
	document.frmAdvMag.txtChDate.value="";
	document.frmAdvMag.txtFav.value="";	

}

function cardClear(){
	document.frmAdvMag.txtCcNumber.disabled=true;
	document.frmAdvMag.txtCvvNumber.disabled=true;
	document.frmAdvMag.selCardType.disabled=true;
	document.frmAdvMag.txtCCName.disabled=true;
	document.frmAdvMag.selExpiryMonth.disabled=true;
	document.frmAdvMag.selExpiryYear.disabled=true;
	document.frmAdvMag.txtChNumber.disabled=false;
	document.frmAdvMag.txtChDate.disabled=false;
	document.frmAdvMag.txtFav.disabled=false;	
	
	document.frmAdvMag.txtCcNumber.value="";
	document.frmAdvMag.txtCvvNumber.value="";
	document.frmAdvMag.selCardType.selectedIndex=0;
	document.frmAdvMag.txtCCName.value="";
	document.frmAdvMag.selExpiryMonth.selectedIndex=0;
	document.frmAdvMag.selExpiryYear.selectedIndex=0;

}


function isnotAlpha(str){
	stringCheck="!@#$%^&*()_+|:;{}[]<>?/=-~.,'`0123456789;:"+"\\"+"\""+"\'";
	f1=1;
	for(j=0;j<str.length;j++){
		if(stringCheck.indexOf(str.charAt(j))!=-1){
			f1=0;
		}
	}
	if(f1==0){
		return true;
	}
	else{
		return false;
	}
}

function phoneCheck(str1){
	stringCheck1="`~!@#$%^&*|:;{}[]<>?/=~.,'`;:"+"\\"+"\'";
	f2=1;
	for(j=0;j<str1.length;j++){
		if(stringCheck1.indexOf(str1.charAt(j))!=-1){
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

function isnotSpecial(str){
	stringSpecialCheck="!#$%^&*()+|<>?/=-~,;:][{}"+"\\"+"\'";
	f4=1;
	for(j=0;j<str.length;j++){
		if(stringSpecialCheck.indexOf(str.charAt(j))!=-1){
			f4=0;
		}
	}
	if(f4==0){
		return true;
	}
	else{
		return false;
	}
}

function popupCal(val) {
      if(val==1)
	      frmAdvMag.txtYesDate.value = "StartDate1";

      if(val==2)
         frmAdvMag.txtDetDate.value = "StartDate1";

      if(val==3)
	      frmAdvMag.txtChDate.value = "StartDate1";

      val = window.open("javascripts/Calendar.jsp?sDate=" + val ,'Calendar','width=170,height=190,menubar=no,toolbar=no,status=no,resizable=no,scrollbars=no,top=400,left=150');
      if(val == null) {
         alert("Plz Enable Site Popup Allowed");
      }
}

function frmAdvCheck(){

//==================== Advertiser's Name ====================================
stringCheck1="`~!@#$%^&*|:;{}[]<>?/=~.,'`;:"+"\\"+"\'";

	if(document.frmAdvMag.txtAdvName.value==""){
		alert("Advertiser's Name cannot be empty.");
		document.frmAdvMag.txtAdvName.focus();
		return false;
	}

	if(document.frmAdvMag.txtAdvName.value.length>80){
		alert("Advertiser's Name is out of range.");
		document.frmAdvMag.txtAdvName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtAdvName.value)){
		alert("Enter valid Advertiser's Name.");
		document.frmAdvMag.txtAdvName.focus();
	    	return false;
	}
	
	if(document.frmAdvMag.txtAdvName.value.indexOf(' ')==0){
		alert("Enter Valid Advertiser's Name.");
		document.frmAdvMag.txtAdvName.focus();
		return false;
	}
	
	if(document.frmAdvMag.txtAdvName.value.indexOf('  ')!==-1){
		alert("Enter Valid Advertiser's Name.");
		document.frmAdvMag.txtAdvName.focus();
		return false;
	}

	if(Number(document.frmAdvMag.txtAdvName.value)){
		alert("Enter valid Advertiser's Name.");
		document.frmAdvMag.txtAdvName.focus();
		return false;
	}
	
// ==================== Agency Name ==========================================	
	
	if(document.frmAdvMag.txtAgentName.value==""){
		alert("Agency Name cannot be empty.");
		document.frmAdvMag.txtAgentName.focus();
		return false;
	}

	if(document.frmAdvMag.txtAgentName.value.length>80){
		alert("Agency's Name is out of range.");
		document.frmAdvMag.txtAgentName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtAgentName.value)){
		alert("Enter valid Agency's Name.");
		document.frmAdvMag.txtAgentName.focus();
	    	return false;
	}
	
	if(document.frmAdvMag.txtAgentName.value.indexOf(' ')==0){
		alert("Enter Valid Agency's Name.");
		document.frmAdvMag.txtAgentName.focus();
		return false;
	}
	
	if(document.frmAdvMag.txtAgentName.value.indexOf('  ')!==-1){
		alert("Enter Valid Agency's Name.");
		document.frmAdvMag.txtAgentName.focus();
		return false;
	}

	if(Number(document.frmAdvMag.txtAgentName.value)){
		alert("Enter valid Agency's Name.");
		document.frmAdvMag.txtAgentName.focus();
		return false;
	}

//============================ First Name in Contact Details ===============
	
	if(document.frmAdvMag.txtFirstName.value==""){
		alert("First Name in Contact details cannot be empty.");
		document.frmAdvMag.txtFirstName.focus();
		return false;
	}

	if(document.frmAdvMag.txtFirstName.value.length>80){
		alert("First Name in Contact Details is out of Range.");
		document.frmAdvMag.txtFirstName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtFirstName.value)){
		alert("Enter valid First Name.");
		document.frmAdvMag.txtFirstName.focus();
	    	return false;
	}
	
	if(document.frmAdvMag.txtFirstName.value.indexOf(' ')==0){
		alert("Enter Valid First Name.");
		document.frmAdvMag.txtFirstName.focus();
		return false;
	}
	
	if(document.frmAdvMag.txtFirstName.value.indexOf('  ')!==-1){
		alert("Enter Valid First Name.");
		document.frmAdvMag.txtFirstName.focus();
		return false;
	}

	if(Number(document.frmAdvMag.txtFirstName.value)){
		alert("Enter valid First Name.");
		document.frmAdvMag.txtFirstName.focus();
		return false;
	}

//============================ Middle Name in Contact Details ====================

	if(document.frmAdvMag.txtMidName.value.length>80){
		alert("Middle Name is out of range.");
		document.frmAdvMag.txtMidName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtMidName.value)){
		alert("Enter valid Middle Name.");
		document.frmAdvMag.txtMidName.focus();
	    	return false;
	}
	
	if(document.frmAdvMag.txtMidName.value.indexOf(' ')==0){
		alert("Enter Valid Middle Name.");
		document.frmAdvMag.txtMidName.focus();
		return false;
	}
	
	if(document.frmAdvMag.txtMidName.value.indexOf('  ')!==-1){
		alert("Enter Valid Middle Name.");
		document.frmAdvMag.txtMidName.focus();
		return false;
	}

	if(Number(document.frmAdvMag.txtMidName.value)){
		alert("Enter valid Middle Name.");
		document.frmAdvMag.txtMidName.focus();
		return false;
	}

//============================= Last Name in Contact Details ====================

	if(document.frmAdvMag.txtLastName.value==""){
		alert("Last Name in Contact details cannot be empty.");
		document.frmAdvMag.txtLastName.focus();
		return false;
	}

	if(document.frmAdvMag.txtLastName.value.length>80){
		alert("Last Name is out of range.");
		document.frmAdvMag.txtLastName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtLastName.value)){
		alert("Enter valid Last Name.");
		document.frmAdvMag.txtLastName.focus();
	    	return false;
	}
	
	if(document.frmAdvMag.txtLastName.value.indexOf(' ')==0){
		alert("Enter Valid Last Name.");
		document.frmAdvMag.txtLastName.focus();
		return false;
	}
	
	if(document.frmAdvMag.txtLastName.value.indexOf('  ')!==-1){
		alert("Enter Valid Last Name.");
		document.frmAdvMag.txtLastName.focus();
		return false;
	}

	if(Number(document.frmAdvMag.txtLastName.value)){
		alert("Enter valid Last Name.");
		document.frmAdvMag.txtLastName.focus();
		return false;
	}

//========================= For Street Name =================================

	if(document.frmAdvMag.txtStreetName.value==""){
		alert("Street Name in Contact details cannot be empty.");
		document.frmAdvMag.txtStreetName.focus();
		return false;
	}

	if(document.frmAdvMag.txtStreetName.value.length>255){
		alert("Street Name is out of range.");
		document.frmAdvMag.txtStreetName.focus();
		return false;
	}

	if(document.frmAdvMag.txtStreetName.value.indexOf(' ')==0){
		alert("Enter Valid Street Name.");
		document.frmAdvMag.txtStreetName.focus();
		return false;
	}
	
	if(document.frmAdvMag.txtStreetName.value.indexOf('  ')!==-1){
		alert("Enter Valid Street Name.");
		document.frmAdvMag.txtStreetName.focus();
		return false;
	}

// ============================ For Suite Name ========================

	if(document.frmAdvMag.txtSuiteName.value==""){
		alert("Suite Name in Contact details cannot be empty.");
		document.frmAdvMag.txtSuiteName.focus();
		return false;
	}

	if(document.frmAdvMag.txtSuiteName.value.length>80){
		alert("Suite Name is out of range.");
		document.frmAdvMag.txtSuiteName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtSuiteName.value)){
		alert("Enter valid Suite Name.");
		document.frmAdvMag.txtSuiteName.focus();
	    	return false;
	}
	
	if(document.frmAdvMag.txtSuiteName.value.indexOf(' ')==0){
		alert("Enter Valid Suite Name.");
		document.frmAdvMag.txtSuiteName.focus();
		return false;
	}
	
	if(document.frmAdvMag.txtSuiteName.value.indexOf('  ')!==-1){
		alert("Enter Valid Suite Name.");
		document.frmAdvMag.txtSuiteName.focus();
		return false;
	}

	if(Number(document.frmAdvMag.txtSuiteName.value)){
		alert("Enter valid Suite Name.");
		document.frmAdvMag.txtSuiteName.focus();
		return false;
	}

//============================ For Counrty and State Name =========================

	var cdln = "";
	if(typeof(window.document.frmAdvMag.selConCountry) == 'object'){
		if (window.document.frmAdvMag.selConCountry.value != ""){
			var clid;
			clid = window.document.frmAdvMag.selConCountry[window.document.frmAdvMag.selConCountry.selectedIndex].value;
			cdln = clid;
		}
		if(cdln == "---Select---"){
			alert("Please select a Country in Contact details.");
			window.document.frmAdvMag.selConCountry.focus();
			return false;
		}
	}
	
	if ( document.frmAdvMag.selConCountry.selectedIndex == 0 ){
        alert ( "Please select a Country Name in Contact Details." );
		document.frmAdvMag.selConCountry.focus();
        return false;
    }

	var edln = "";
	if(typeof(window.document.frmAdvMag.selConState) == 'object'){
		if (window.document.frmAdvMag.selConState.value != ""){
			var lid;
			lid = window.document.frmAdvMag.selConState[window.document.frmAdvMag.selConState.selectedIndex].value;
			edln = lid;
		}
		if(edln.length == 1){
			alert("Please select a State in contact Details.");
			window.document.frmAdvMag.selConState.focus();
			return false;
		}
	}

	if ( document.frmAdvMag.selConState.selectedIndex == 0 ){
        alert ( "Please select a State Name in Contact Details." );
		document.frmAdvMag.selConState.focus();
        return false;
    }

//========================= For Contact City ==================================

	if(document.frmAdvMag.txtConCity.value==""){
		alert("City Name in Contact Details cannot be empty");
		document.frmAdvMag.txtConCity.focus();
		return false;
	}

	if(document.frmAdvMag.txtConCity.value.length>80){
		alert("City Name in Contact Details is out of range.");
		document.frmAdvMag.txtConCity.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtConCity.value)){
		alert("Enter valid City Name in Contact Details.");
		document.frmAdvMag.txtConCity.focus();
    	return false;
    }

	if(Number(document.frmAdvMag.txtConCity.value)){
		alert("Enter valid City Name in Contact Details.");
		document.frmAdvMag.txtConCity.focus();
		return false;
	}

	if(document.frmAdvMag.txtConCity.value.indexOf(' ')==0){
		alert("Enter Valid City Name in Contact Details.");
		document.frmAdvMag.txtConCity.focus();
		return false;
	}

	if(document.frmAdvMag.txtConCity.value.indexOf('  ')!==-1){
		alert("Enter Valid City Name in Contact Details.");
		document.frmAdvMag.txtConCity.focus();
		return false;
	}

//============================= For Zip Code ==========================
if(document.frmAdvMag.txtConZip.value==""){
		alert("Zipcode in Contact Details cannot be empty.");
		document.frmAdvMag.txtConZip.focus();
		return false;
	}
	if(!Number(document.frmAdvMag.txtConZip.value)){
		alert("Enter Valid Zipcode in Contact Details.");
		document.frmAdvMag.txtConZip.focus();
		return false;
	}

	if(document.frmAdvMag.txtConZip.value.length!=5){
		alert("Entered Zipcode is out of range.");
		document.frmAdvMag.txtConZip.focus();
		return false;
	}

	if(document.frmAdvMag.txtConZip.value.indexOf('.')!=-1){
		alert("Enter Valid Zipcode in Contact Details.");
		document.frmAdvMag.txtConZip.focus();
		return false;
	}

//============================= For Phone Number=============================

	if(document.frmAdvMag.txtConPhone.value==""){
		alert("Phone Number cannot be empty");
		document.frmAdvMag.txtConPhone.focus();
		return false;
	}

	if(document.frmAdvMag.txtConPhone.value!=""){
		len4=document.frmAdvMag.txtConPhone.value.length;
		strnum3 = document.frmAdvMag.txtConPhone.value;
		var GoodChars = "0123456789()- + ";
		var s1=document.frmAdvMag.txtConPhone.value.indexOf('(');
		var s2=document.frmAdvMag.txtConPhone.value.indexOf(')');
		var s5=document.frmAdvMag.txtConPhone.value.indexOf('+');
		var s6=document.frmAdvMag.txtConPhone.value.lastIndexOf('+');
		var s7=document.frmAdvMag.txtConPhone.value.indexOf('-');
		var s8=document.frmAdvMag.txtConPhone.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number");
			document.frmAdvMag.txtConPhone.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number");
			document.frmAdvMag.txtConPhone.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid Phone Number");
			document.frmAdvMag.txtConPhone.focus();
			return false;
		}
		
		if(s7!==s8){
			alert("Enter valid Phone Number");
			document.frmAdvMag.txtConPhone.focus();
			return false;
		}

		valid = 1;
		for(j=0;j<len4-1;j++){
			if(GoodChars.indexOf(strnum3.charAt(j))==-1){
				valid=0;
			}
		}
		if(valid!=1){
			alert("Enter valid Phone Number");
			document.frmAdvMag.txtConPhone.focus();
			return false;
		}
	}

	st10=document.frmAdvMag.txtConPhone.value;
	fi10=1;
	for(j=0;j<document.frmAdvMag.txtConPhone.value.length-1;j++){
		if(stringCheck1.indexOf(st10.charAt(j))==-1){
			fi10=0;
		}
	}
	if(fi10!=0){
		alert("Enter valid Phone Number.");
		document.frmAdvMag.txtConPhone.focus();
		return false;
	}

//================================= For fax Number ==========================

	if(document.frmAdvMag.txtConFax.value!=""){
		len=document.frmAdvMag.txtConFax.value.length;
		strnum = document.frmAdvMag.txtConFax.value;
		var GoodChars = "0123456789()- + ";
		var f1=document.frmAdvMag.txtConFax.value.indexOf('(');
		var f2=document.frmAdvMag.txtConFax.value.indexOf(')');
		var f5=document.frmAdvMag.txtConFax.value.indexOf('+');
		var f6=document.frmAdvMag.txtConFax.value.lastIndexOf('+');
		var f7=document.frmAdvMag.txtConFax.value.indexOf('-');
		var f8=document.frmAdvMag.txtConFax.value.lastIndexOf('-');
		var f3=1+f2;
		var f4=1+f1;
		if(f1==f3){
			alert("Enter valid Fax Number");
			document.frmAdvMag.txtConFax.focus();
			return false;
		}
		if(f2==f4){
			alert("Enter valid Fax Number");
			document.frmAdvMag.txtConFax.focus();
			return false;
		}
		if(f5!==f6){
			alert("Enter valid Fax Number");
			document.frmAdvMag.txtConFax.focus();
			return false;
		}
		
		if(f7!==f8){
			alert("Enter valid Fax Number");
			document.frmAdvMag.txtConFax.focus();
			return false;
		}

		valid = 1;
		for(j=0;j<len4-1;j++){
			if(GoodChars.indexOf(strnum.charAt(j))==-1){
				valid=0;
			}
		}
		if(valid!=1){
			alert("Enter valid Fax Number");
			document.frmAdvMag.txtConFax.focus();
			return false;
		}
	}

	st1=document.frmAdvMag.txtConFax.value;
	fi1=1;
	for(j=0;j<document.frmAdvMag.txtConFax.value.length-1;j++){
		if(stringCheck1.indexOf(st1.charAt(j))==-1){
			fi1=0;
		}
	}

// ============================ For Email =================================

	if(document.frmAdvMag.txtConMail.value==""){
		alert("Email ID cannot be empty");
		document.frmAdvMag.txtConMail.focus();
		return false;
	}

	if(!(document.frmAdvMag.txtConMail.value== "")){
		strmail=document.frmAdvMag.txtConMail.value;
		firstat = strmail.indexOf("@");
		lastat = strmail.lastIndexOf("@");
		strmain=strmail.substring(0,firstat);
		strsub=strmail.substring(firstat,document.frmAdvMag.txtConMail.value.length);
		if(strmail.length>120){
			alert("Email ID is out of range.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
		if(strmain.indexOf('  ')!=-1 || firstat==0 || strsub.indexOf('  ')!=-1 ){
			alert("Enter valid Email ID.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
		if(isnotSpecial(strmain) || isnotSpecial(strsub)){
			alert("Enter valid Email ID.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
		k=0;
		strlen=strsub.length;
		for(i=0;i<strlen-1;i++){
			if(strsub.charAt(i)=='.'){
				k=k+1;
			}
		}
		if(k>2){
			alert("Enter valid Email ID.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
		if(firstat==-1 || lastat==-1){
			alert("Enter valid Email ID.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
		if(Number(strmain)){
			alert("Enter valid Email ID.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
		if(firstat != lastat ){
			alert("Enter valid Email ID.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
		firstdot=strmail.indexOf(".",firstat);
		lastdot=strmail.lastIndexOf(".");
		if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1){
			alert("Enter valid Email ID.");
			document.frmAdvMag.txtConMail.focus();
			return false;
		}
	}
	
//============================= Checking Invoice Option ============================

	chosen="";
	len = document.frmAdvMag.rdoAdvertising.length ;
	for(i=0;i<len;i++){
		if(document.frmAdvMag.rdoAdvertising[i].checked){
			chosen= document.frmAdvMag.rdoAdvertising[i].value;
		}
	}

	if(chosen==""){
		alert("Check any of the Invoice Option.");
		return false;
	}

// ============================ Checking Advertise Option==============================

	chosen1="";
	len1 = document.frmAdvMag.rdoQuest.length ;
	for(i=0;i<len1;i++)
	{if(document.frmAdvMag.rdoQuest[i].checked)
	{chosen1= document.frmAdvMag.rdoQuest[i].value;}}

	if(chosen1=="")
	{alert("Check any of the Advertised Option.");
	 return false;}

	if(chosen1=="yes")
	{if(document.frmAdvMag.txtYesDate.value=="")
	{ alert("Select a Date in Advertisement Details");
	  document.frmAdvMag.txtYesDate.focus();
	  return false;}
		var todaysDate=new Date();
		var noDate=todaysDate.getDate();
		var noYear=todaysDate.getYear();
		var noMonth1=todaysDate.getMonth();
		var noMonth=1+noMonth1;
		if(noDate<10)
		{noDate="0"+noDate;}
		if(noMonth<10)
		{noMonth="0"+noMonth;}

		strdate=document.frmAdvMag.txtYesDate.value;
		mm1 = Number(strdate.substring(0,2));
		dd1 = Number(strdate.substring(3,5));
		yyy=(strdate.substring(6,document.frmAdvMag.txtYesDate.value.length));
		yyy1=(Number(yyy.length));
		if(yyy>noYear)
		{  alert("Enter valid Date in the Advertising Details");
		   document.frmAdvMag.txtYesDate.focus();
		   return false;}
		if((yyy==noYear)&&(mm1>noMonth))
		{	alert("Enter valid Date in the Advertising Details");
			document.frmAdvMag.txtYesDate.focus();
			return false;}
		if((dd1>noDate)&&(mm1==noMonth)&&(yyy==noYear))
		{   alert("Enter valid date in the Advertising Details");
			document.frmAdvMag.txtYesDate.focus();
			return false;}

	}
	
//=============================== For Frequency Rate =============================

	if(document.frmAdvMag.selPlanDisp.selectedIndex==0){
        alert ( "Please select a Frequency Name." );
		document.frmAdvMag.selPlanDisp.focus();
        return false;
    }
	if(!((document.frmAdvMag.chkIssueOne.checked)||(document.frmAdvMag.chkIssueTwo.checked)||(document.frmAdvMag.chkIssueThree.checked)||(document.frmAdvMag.chkIssueFour.checked)||(document.frmAdvMag.chkIssueFive.checked)||(document.frmAdvMag.chkIssueSix.checked))){
		alert("Please Select any option in the Number of Issues.");
		return false;
	}
	if(document.frmAdvMag.chkIssueOne.checked==true){
		if(document.frmAdvMag.selOneAdvType.selectedIndex==0){
        	alert ( "Please select an Advertisement Name." );
			document.frmAdvMag.selOneAdvType.focus();
    	    return false;
	    }

		if(document.frmAdvMag.selOneAdvSubType.selectedIndex==0){
        	alert ( "Please select an Advertisement Sub-types Name." );
			document.frmAdvMag.selOneAdvSubType.focus();
    	    return false;
	    }
	
		if(document.frmAdvMag.selOneAdDim.selectedIndex==0){
        	alert ( "Ad Dimension cannot be empty." );
			document.frmAdvMag.selOneAdDim.focus();
    	    return false;
	    }

		if(document.frmAdvMag.txtOnePlace.value.length>80){
			alert("Placement Name is out of range.");
			document.frmAdvMag.txtOnePlace.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMag.txtOnePlace.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtOnePlace.focus();
    		return false;
	    }

		if(Number(document.frmAdvMag.txtOnePlace.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMag.txtOnePlace.focus();
			return false;
		}

		if(document.frmAdvMag.txtOnePlace.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtOnePlace.focus();
			return false;
		}

		if(document.frmAdvMag.txtOnePlace.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtOnePlace.focus();
			return false;
		}

	}

if(document.frmAdvMag.chkIssueTwo.checked==true){
	if(document.frmAdvMag.selTwoAdvType.selectedIndex==0){
        alert ( "Please select an Advertisement Name." );
		document.frmAdvMag.selTwoAdvType.focus();
        return false;
    }

	if(document.frmAdvMag.selTwoAdvSubType.selectedIndex==0){
        alert ( "Please select an Advertisement Sub-types Name." );
		document.frmAdvMag.selTwoAdvSubType.focus();
        return false;
    }

	if(document.frmAdvMag.selTwoAdDim.selectedIndex==0){
        alert ( "Ad Dimension cannot be empty." );
		document.frmAdvMag.selTwoAdDim.focus();
        return false;
    }

	if(document.frmAdvMag.txtTwoPlace.value.length>80){
		alert("Placement Name is out of range.");
		document.frmAdvMag.txtTwoPlace.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtTwoPlace.value)){
		alert("Enter Valid Placement Name.");
		document.frmAdvMag.txtTwoPlace.focus();
    	return false;
    }

	if(Number(document.frmAdvMag.txtTwoPlace.value)){
		alert("Enter valid Placement Name.");
		document.frmAdvMag.txtTwoPlace.focus();
		return false;
	}

	if(document.frmAdvMag.txtTwoPlace.value.indexOf(' ')==0){
		alert("Enter Valid Placement Name.");
		document.frmAdvMag.txtTwoPlace.focus();
		return false;
	}

	if(document.frmAdvMag.txtTwoPlace.value.indexOf('  ')!==-1){
		alert("Enter Valid Placement Name.");
		document.frmAdvMag.txtTwoPlace.focus();
		return false;
	}

}

if(document.frmAdvMag.chkIssueThree.checked==true){
	if(document.frmAdvMag.selThreeAdvType.selectedIndex==0){
        alert ( "Please select an Advertisement Name." );
		document.frmAdvMag.selThreeAdvType.focus();
        return false;
    }

	if(document.frmAdvMag.selThreeAdvSubType.selectedIndex==0){
        alert ( "Please select an Advertisement Sub-types Name." );
		document.frmAdvMag.selThreeAdvSubType.focus();
        return false;
    }

	if(document.frmAdvMag.selThreeAdDim.selectedIndex==0){
        alert ( "Ad Dimension cannot be empty." );
		document.frmAdvMag.selThreeAdDim.focus();
        return false;
    }

	if(document.frmAdvMag.txtThreePlace.value.length>80){
		alert("Placement Name is out of range.");
		document.frmAdvMag.txtThreePlace.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtThreePlace.value)){
		alert("Enter Valid Placement Name.");
		document.frmAdvMag.txtThreePlace.focus();
    	return false;
    }

	if(Number(document.frmAdvMag.txtThreePlace.value)){
		alert("Enter valid Placement Name.");
		document.frmAdvMag.txtThreePlace.focus();
		return false;
	}

	if(document.frmAdvMag.txtThreePlace.value.indexOf(' ')==0){
		alert("Enter Valid Placement Name.");
		document.frmAdvMag.txtThreePlace.focus();
		return false;
	}

	if(document.frmAdvMag.txtThreePlace.value.indexOf('  ')!==-1){
		alert("Enter Valid Placement Name.");
		document.frmAdvMag.txtThreePlace.focus();
		return false;
	}

}
if(document.frmAdvMag.chkIssueFour.checked==true){
		if(document.frmAdvMag.selFourAdvType.selectedIndex==0){
	        alert ( "Please select an Advertisement Name." );
			document.frmAdvMag.selFourAdvType.focus();
	        return false;
	    }
	

		if(document.frmAdvMag.selFourAdvSubType.selectedIndex==0){
	        alert ( "Please select an Advertisement Sub-types Name." );
			document.frmAdvMag.selFourAdvSubType.focus();
	        return false;
	    }
	

		if(document.frmAdvMag.selFourAdDim.selectedIndex==0){
	        alert ( "Ad Dimension cannot be empty." );
			document.frmAdvMag.selFourAdDim.focus();
	        return false;
	    }
	
	
		if(document.frmAdvMag.txtFourPlace.value.length>80){
			alert("Placement Name is out of range.");
			document.frmAdvMag.txtFourPlace.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMag.txtFourPlace.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtFourPlace.focus();
	    	return false;
	    }
	
		if(Number(document.frmAdvMag.txtFourPlace.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMag.txtFourPlace.focus();
			return false;
		}
	
		if(document.frmAdvMag.txtFourPlace.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtFourPlace.focus();
			return false;
		}
	
		if(document.frmAdvMag.txtFourPlace.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtFourPlace.focus();
			return false;
	}

}

if(document.frmAdvMag.chkIssueFive.checked==true){
		if(document.frmAdvMag.selFiveAdvType.selectedIndex==0){
	        alert ( "Please select an Advertisement Name." );
			document.frmAdvMag.selFiveAdvType.focus();
	        return false;
	    }
	

		if(document.frmAdvMag.selFiveAdvSubType.selectedIndex==0){
	        alert ( "Please select an Advertisement Sub-types Name." );
			document.frmAdvMag.selFiveAdvSubType.focus();
	        return false;
	    }
	
		if(document.frmAdvMag.selFiveAdDim.selectedIndex==0){
	        alert ( "Ad Dimension cannot be empty." );
			document.frmAdvMag.selFiveAdDim.focus();
	        return false;
	    }
	
		if(document.frmAdvMag.txtFivePlace.value.length>80){
			alert("Placement Name is out of range.");
			document.frmAdvMag.txtFivePlace.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMag.txtFivePlace.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtFivePlace.focus();
	    	return false;
	    }
	
		if(Number(document.frmAdvMag.txtFivePlace.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMag.txtFivePlace.focus();
			return false;
		}
	
		if(document.frmAdvMag.txtFivePlace.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtFivePlace.focus();
			return false;
		}
	
		if(document.frmAdvMag.txtFivePlace.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtFivePlace.focus();
			return false;
	}

}


if(document.frmAdvMag.chkIssueSix.checked==true){
		if(document.frmAdvMag.selSixAdvType.selectedIndex==0){
	        alert ( "Please select an Advertisement Name." );
			document.frmAdvMag.selSixAdvType.focus();
	        return false;
	    }
	

		if(document.frmAdvMag.selSixAdvSubType.selectedIndex==0){
	        alert ( "Please select an Advertisement Sub-types Name." );
			document.frmAdvMag.selSixAdvSubType.focus();
	        return false;
	    }
	

		if(document.frmAdvMag.selSixAdDim.selectedIndex==0){
	        alert ( "Ad Dimension cannot be empty." );
			document.frmAdvMag.selSixAdDim.focus();
	        return false;
	    }
	
		if(document.frmAdvMag.txtSixPlace.value.length>80){
			alert("Placement Name is out of range.");
			document.frmAdvMag.txtSixPlace.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMag.txtSixPlace.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtSixPlace.focus();
	    	return false;
	    }
	
		if(Number(document.frmAdvMag.txtSixPlace.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMag.txtSixPlace.focus();
			return false;
		}
	
		if(document.frmAdvMag.txtSixPlace.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtSixPlace.focus();
			return false;
		}
	
		if(document.frmAdvMag.txtSixPlace.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvMag.txtSixPlace.focus();
			return false;
	}
	
}


//============================== For Advertising Material =======================

	if(document.frmAdvMag.txtAdName.value==""){
		alert("Advertising Material Details cannot be empty");
		document.frmAdvMag.txtAdName.focus();
		return false;
	}

	if(document.frmAdvMag.txtAdName.value.length>80){
		alert("Advertising Material is out of range.");
		document.frmAdvMag.txtAdName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtAdName.value)){
		alert("Enter Valid Advertising Material Details.");
		document.frmAdvMag.txtAdName.focus();
    	return false;
    }

	if(Number(document.frmAdvMag.txtAdName.value)){
		alert("Enter valid Advertising Material Details.");
		document.frmAdvMag.txtAdName.focus();
		return false;
	}

	if(document.frmAdvMag.txtAdName.value.indexOf(' ')==0){
		alert("Enter Valid Advertising Material Details.");
		document.frmAdvMag.txtAdName.focus();
		return false;
	}

	if(document.frmAdvMag.txtAdName.value.indexOf('  ')!==-1){
		alert("Enter Valid Advertising Material Details.");
		document.frmAdvMag.txtAdName.focus();
		return false;
	}

//========================== For Date ====================================

	if(document.frmAdvMag.txtDetDate.value==""){
		alert("Date in Advertisement Details cannot be empty.");
		document.frmAdvMag.txtDetDate.focus();
		return false;
	}

//============================= Checking Ad Supplied on option ============================

	chosen="";
	len = document.frmAdvMag.rdoSupply.length ;
	for(i=0;i<len;i++){
		if(document.frmAdvMag.rdoSupply[i].checked){
			chosen= document.frmAdvMag.rdoSupply[i].value;
		}
	}

	if(chosen==""){
		alert("Check any of the Ad Supply Option.");
		return false;
	}


//-----------------------------------Special Instruction--------------------------------------------------------------------
 
if((document.frmAdvMag.txtAreaIns.value.length >1024 ))
 {alert("Description is out of range.");
  document.frmAdvMag.txtAreaIns.focus();
 return false;}			
    
//============================ For Total Amount =============================

	if(document.frmAdvMag.txtTotAmount.value==""){
		alert("Total Amount cannot be empty");
		document.frmAdvMag.txtTotAmount.focus();
		return false;
	}

	if(!Number(document.frmAdvMag.txtTotAmount.value)){
		alert("Enter valid Total Amount.");
		document.frmAdvMag.txtTotAmount.focus();
		return false;
	}

	if(!(document.frmAdvMag.txtTotAmount.value=="")){
		if((document.frmAdvMag.txtTotAmount.value.indexOf('.'))!=-1){
			fstr=document.frmAdvMag.txtTotAmount.value;
			fstr1=document.frmAdvMag.txtTotAmount.value.indexOf('.');
			mm = (fstr.substring(fstr1,document.frmAdvMag.txtTotAmount.value.length));
			str=(Number(mm.length));
			if((str)>3){
				alert("Total Amount is Not Valid.");
				document.frmAdvMag.txtTotAmount.focus();
				return false;
			}
		}
	}

//================================== For Check & Card Option =======================

	chosen2="";
	len2 = document.frmAdvMag.rdoAmt.length ;
	for(i=0;i<len2;i++){
		if(document.frmAdvMag.rdoAmt[i].checked){
			chosen2= document.frmAdvMag.rdoAmt[i].value;
		}
	}

	if(chosen2==""){
		alert("Check any of the Payment Option.");
		return false;
	}

//--------------------------Check  Number ---------------------------

	if(chosen2=="check"){
		if(document.frmAdvMag.txtChNumber.value==""){
			alert("Check Number in Check Details cannot be empty");
			document.frmAdvMag.txtChNumber.focus();
			return false;
		}

	if(!Number(document.frmAdvMag.txtChNumber.value)){
		alert("Enter valid Check Number in Check Details");
		document.frmAdvMag.txtChNumber.focus();
		return false;
	}

	if(document.frmAdvMag.txtChNumber.value.length>16){
		alert("Check Number exceeds the maximum of 16 characters.");
		document.frmAdvMag.txtChNumber.focus();
		return false;
	}

	if(document.frmAdvMag.txtChNumber.value.indexOf('.')!=-1){
		alert("Enter Valid check number.");
		document.frmAdvMag.txtChNumber.focus();
		return false;
	}
//=============================== For Check Date ========================
	if(document.frmAdvMag.txtChDate.value==""){
		alert("Select Date in Check Details");
		document.frmAdvMag.txtChDate.focus();
		return false;
	}


	if(!(document.frmAdvMag.txtChDate.value=="")){
	
	var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	
	if(nowDate<10){
		nowDate="0"+nowDate;
	}

	if(nowMonth<10){
		nowMonth="0"+nowMonth;
	}

	if(!(document.frmAdvMag.txtChDate.value=="")){
		strdate=document.frmAdvMag.txtChDate.value;
		mm = Number(strdate.substring(0,2));
		dd = Number(strdate.substring(3,5));
		yyyy=(strdate.substring(6,document.frmAdvMag.txtChDate.value.length));

		var now = new Date();
		var months1 = now.getMonth();
		var years=now.getYear();
		var months = 7+months1;
		year=1+years;
		
		if((months<12)&&(mm>months)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if((months1==6)&&(mm>1)&&(mm<6)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}
		
		if((months1==7)&&(mm>2)&&(mm<7)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if((months1==8)&&(mm>3)&&(mm<8)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if((months1==9)&&(mm>4)&&(mm<9)){
			alert("Enter a valid Date in Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if((months1==10)&&(mm>5)&&(mm<10)){
			alert("Enter a valid Date in Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if((months1==11)&&(mm>6)&&(mm<11)){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if(yyyy<nowYear){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if((yyyy==nowYear)&&(mm<nowMonth)){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if((dd<nowDate)&&(mm==nowMonth)){
			alert("Enter valid date in the Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}

		if(dd>31){
			alert("Enter valid date in the Payment Details");
			document.frmAdvMag.txtChDate.focus();
			return false;
		}
	}
}

//===================================In Favor Of====================================

if(document.frmAdvMag.txtFav.value==""){
		alert("In Favor of Info in Payment Information cannot be empty.");
		document.frmAdvMag.txtFav.focus();
		return false;
	}

	if(document.frmAdvMag.txtFav.value.length>80){
		alert("In Favor of Name in Payment Information is out of range.");
		document.frmAdvMag.txtFav.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtFav.value)){
		alert("Enter valid Name in In Favor of Info in Payment Information.");
		document.frmAdvMag.txtFav.focus();
    	return false;
	}

	if(document.frmAdvMag.txtFav.value.indexOf(' ')==0){
		alert("Enter Valid Name in In Favor of Info in Payment Information.");
		document.frmAdvMag.txtFav.focus();
		return false;
	}

	if(document.frmAdvMag.txtFav.value.indexOf('  ')!==-1){
		alert("Enter Valid Name in In Favor of Info in Payment Information.");
		document.frmAdvMag.txtFav.focus();
		return false;
	}

	if(Number(document.frmAdvMag.txtFav.value)){
		alert("Enter valid name in the In Favor of  Info in Payment Information");
		document.frmAdvMag.txtFav.focus();
		return false;
	}
}

		
// ======================= For Card No =============================
if(chosen2==""){
		if(document.frmAdvMag.txtCcNumber.value==""){
			alert("Enter Card Number in the Card Details");
			document.frmAdvMag.txtCcNumber.focus();
			return false;
		}

		if(!Number(document.frmAdvMag.txtCcNumber.value)){
			alert("Enter valid Card Number in the Card Details");
			document.frmAdvMag.txtCcNumber.focus();
			return false;
		}

		if(document.frmAdvMag.txtCcNumber.value.length!=16 ){
			alert(" Card Number in the Card Details is out of range.");
			document.frmAdvMag.txtCcNumber.focus();
			return false;
		}

		if(document.frmAdvMag.txtCcNumber.value.indexOf('.')!=-1){
			alert("Enter Valid Number in Card Number.");
			document.frmAdvMag.txtCcNumber.focus();
			return false;
		}

//--------for CVV Number -------------------------------------

	if(document.frmAdvMag.txtCvvNumber.value==""){
		alert("Enter valid CVV Number in Card Details");
		document.frmAdvMag.txtCvvNumber.focus();
		return false;
	}

	if(document.frmAdvMag.txtCvvNumber.value.length>4){
		alert("Entered CVV Number Exceeds range.");
		document.frmAdvMag.txtCvvNumber.focus();
		return false;
	}

	if(document.frmAdvMag.txtCvvNumber.value.length<3){
		alert("Entered CVV Number is below range.");
		document.frmAdvMag.txtCvvNumber.focus();
		return false;
	}

	if(document.frmAdvMag.txtCvvNumber.value.indexOf('.')!=-1){
		alert("Enter Valid Number in Cvv Number.");

		document.frmAdvMag.txtCvvNumber.focus();
		return false;
	}
	
	
	//===================== For card type ================
		
if ( document.frmAdvMag.selCardType.selectedIndex == 0 ){
    alert ( "Please select card type." );
	document.frmAdvMag.selCardType.focus();
    return false;
 	}
//----for Print Name on Card ----------------------------------------
	if(document.frmAdvMag.txtCCName.value==""){
		alert("Print Name in Card Details cannot be empty");
		document.frmAdvMag.txtCCName.focus();
		return false;
	}

	if(document.frmAdvMag.txtCCName.value.length>80){
		alert("Print Name in Card Details is out of range.");
		document.frmAdvMag.txtCCName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMag.txtCCName.value)){
		alert("Enter valid Card Name.");
		document.frmAdvMag.txtCCName.focus();
	    return false;
    }

	if(Number(document.frmAdvMag.txtCCName.value)){
		alert("Enter valid card name");
		document.frmAdvMag.txtCCName.focus();
		return false;
	}

	if(document.frmAdvMag.txtCCName.value.indexOf(' ')==0){
		alert("Enter Valid Card Name.");
		document.frmAdvMag.txtCCName.focus();
		return false;
	}

	if(document.frmAdvMag.txtCCName.value.indexOf('  ')!==-1){
		alert("Enter Valid Card Name.");
		document.frmAdvMag.txtCCName.focus();
		return false;
	}

//---for Expiry month drop down --------------------------------

	var rightNow=new Date();
	var theYear=rightNow.getYear();
	var tMonth=rightNow.getMonth();
	var theMonth=1+tMonth;
	var theDate=rightNow.getDate();

	if ( document.frmAdvMag.selExpiryMonth.selectedIndex == 0 ){
		alert ( "Please select a Month." );
		document.frmAdvMag.selExpiryMonth.focus();
    	return false;
	}

	if (document.frmAdvMag.selExpiryYear.value==theYear){
		 if(document.frmAdvMag.selExpiryMonth.value<theMonth){
			alert("You have selected an Expired Month in card details. Please Select Valid Expiration Month.");
			document.frmAdvMag.selExpiryMonth.focus();
			return(false);   
		}
	}

//-----------for Expiry Year drop down

	if ( document.frmAdvMag.selExpiryYear.selectedIndex == 0 ){
		alert ( "Please select a year." );
		document.frmAdvMag.selExpiryYear.focus();
    	return false;
	}


	if (document.frmAdvMag.selExpiryYear.value<theYear){
		alert("You have selected an Expired Year in card details. Please Select Valid Expiration Year.");
		document.frmAdvMag.selExpiryYear.focus();
		return false;   
	}

}
	return true;
}
