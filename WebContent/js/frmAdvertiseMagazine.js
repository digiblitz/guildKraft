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
function initIssue(){
	document.getElementById("1").style.display = "none";
	document.getElementById("2").style.display = "none";
	document.getElementById("3").style.display = "none";
	document.getElementById("4").style.display = "none";
	document.getElementById("5").style.display = "none";
	document.getElementById("6").style.display = "none";
	document.frmAdvMagazine.amount.value="0.0";
}

function oneIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "none";
	document.getElementById("3").style.display = "none";
	document.getElementById("4").style.display = "none";
	document.getElementById("5").style.display = "none";
	document.getElementById("6").style.display = "none";
	
	document.frmAdvMagazine.chkIssueId2.selectedIndex=0;
	document.frmAdvMagazine.selWinTypeIdchkIssue2.selectedIndex=0;
	document.frmAdvMagazine.selWinSubTypeIdchkIssue2.selectedIndex=-1;
	document.frmAdvMagazine.selWinDimchkIssue2.selectedIndex=0;
	
	document.frmAdvMagazine.chkIssueId3.selectedIndex=0;
	document.frmAdvMagazine.selWinTypeIdchkIssue3.selectedIndex=0;
	document.frmAdvMagazine.selWinSubTypeIdchkIssue3.selectedIndex=-1;
	document.frmAdvMagazine.selWinDimchkIssue3.selectedIndex=0;
	
	document.frmAdvMagazine.chkIssueId4.selectedIndex=0;
	document.frmAdvMagazine.selWinTypeIdchkIssue4.selectedIndex=0;
	document.frmAdvMagazine.selWinSubTypeIdchkIssue4.selectedIndex=-1;
	document.frmAdvMagazine.selWinDimchkIssue4.selectedIndex=0;

	document.frmAdvMagazine.chkIssueId5.selectedIndex=0;
	document.frmAdvMagazine.selWinTypeIdchkIssue5.selectedIndex=0;
	document.frmAdvMagazine.selWinSubTypeIdchkIssue5.selectedIndex=-1;
	document.frmAdvMagazine.selWinDimchkIssue5.selectedIndex=0;

	document.frmAdvMagazine.chkIssueId6.selectedIndex=0;
	document.frmAdvMagazine.selWinTypeIdchkIssue6.selectedIndex=0;
	document.frmAdvMagazine.selWinSubTypeIdchkIssue6.selectedIndex=-1;
	document.frmAdvMagazine.selWinDimchkIssue6.selectedIndex=0;

	getAmountDetails();

}

function twoIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "none";
	document.getElementById("4").style.display = "none";
	document.getElementById("5").style.display = "none";
	document.getElementById("6").style.display = "none";
	getAmountDetails();
}

function threeIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "block";
	document.getElementById("4").style.display = "none";
	document.getElementById("5").style.display = "none";
	document.getElementById("6").style.display = "none";
	getAmountDetails();
}

function fourIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "block";
	document.getElementById("4").style.display = "block";
	document.getElementById("5").style.display = "none";
	document.getElementById("6").style.display = "none";
	getAmountDetails();
}

function fiveIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "block";
	document.getElementById("4").style.display = "block";
	document.getElementById("5").style.display = "block";
	document.getElementById("6").style.display = "none";
	getAmountDetails();
}

function sixIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "block";
	document.getElementById("4").style.display = "block";
	document.getElementById("5").style.display = "block";
	document.getElementById("6").style.display = "block";
	getAmountDetails();
}

function displayRadios(selBxId){
	//document.frmAdvMagazine.amount.value="0.0";
	var el = document.frmAdvMagazine.elements;
	for (i=0; i < el.length; i++) {
		if(selBxId[selBxId.selectedIndex].value==6){
			sixIssue();
			break;
		}else if(selBxId[selBxId.selectedIndex].value==5){
			fiveIssue();
			break;
		}else if(selBxId[selBxId.selectedIndex].value==4){
			fourIssue();
			break;
		}else if(selBxId[selBxId.selectedIndex].value==3){
			threeIssue();
			break;
		}else if(selBxId[selBxId.selectedIndex].value==2){
			twoIssue();
			break;
		}else if(selBxId[selBxId.selectedIndex].value==1){
			oneIssue();
			break;
		}else{
			initIssue();	
		}
	}
}

function addRowToTable(){
	  var tbl = document.getElementById('tableInner');
	  var lastRow = tbl.rows.length;
	  // if there's no header row in the table, then iteration = lastRow + 1
	  var iteration = lastRow;
	  var row = tbl.insertRow(lastRow);
	  // left cell
	  var cellLeft = row.insertCell(0);
	  var textNode = document.createTextNode(iteration);
	  cellLeft.appendChild(textNode);
}

function showIssue(radNam,divId){
		if(document.frmAdvMagazine.elements[radNam].checked == true){
				if(document.getElementById("1").style.display == "block"){
					oneIssue();	
				}
				if(document.getElementById("2").style.display == "block"){
					twoIssue();	
				}
				if(document.getElementById("3").style.display == "block"){
					threeIssue();	
				}
				if(document.getElementById("4").style.display == "block"){
					fourIssue();	
				}
				if(document.getElementById("5").style.display == "block"){
					fiveIssue();	
				}
				if(document.getElementById("6").style.display == "block"){
					sixIssue();	
				}
		}
}

function showLevels(chkBxNam,divId){
		if(document.frmAdvMagazine.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}
				
function showHide(chkBxNam,divId){
		if(document.frmAdvMagazine.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}

function enabDisab(chkBxId,txtBxId){
		if(document.frmAdvMagazine.elements[chkBxId].checked == true){
				document.frmAdvMagazine.elements[txtBxId].disabled = false;	
		}else {
				document.frmAdvMagazine.elements[txtBxId].disabled = "disabled";	
		} 
}

function enableRad(radBtnId,txtBxId){
		if(document.frmAdvMagazine.elements[radBtnId].checked == true){
				document.frmAdvMagazine.elements[txtBxId].disabled = false;	
		}else{
				document.frmAdvMag.elements[txtBxId].disabled = "disabled";	
		} 
}

function disable(radBtnNewId,txtBxId){
		if(document.frmAdvMagazine.elements[radBtnNewId].checked == true){
				document.frmAdvMagazine.elements[txtBxId].disabled = "disabled";	
		}
}	
		
function showHideRadio(radioNam,divId,radVal){
		if(document.frmAdvMagazine.elements[radioNam].value = radVal){
				document.getElementById(divId).style.display = "none";	
		}else {
				document.getElementById(divId).style.display = "block";	
		} 
}

function yesClear(){
	document.frmAdvMagazine.txtYesDate.disabled=false;
}

function noClear(){
	document.frmAdvMagazine.txtYesDate.disabled=true;
	document.frmAdvMagazine.txtYesDate.value="";
}

function checkClear(){
	document.frmAdvMagazine.ccNumber.disabled=false;
	document.frmAdvMagazine.ccCvvid.disabled=false;
	document.frmAdvMagazine.ccType.disabled=false;
	document.frmAdvMagazine.ccName.disabled=false;
	document.frmAdvMagazine.ccExpMonth.disabled=false;
	document.frmAdvMagazine.ccExpYear.disabled=false;
	document.frmAdvMagazine.checkNumber.disabled=true;
	document.frmAdvMagazine.checkDate.disabled=true;
	document.frmAdvMagazine.bankName.disabled=true;
	
	document.frmAdvMagazine.checkNumber.value="";
	document.frmAdvMagazine.checkDate.value="";
	document.frmAdvMagazine.bankName.value="";	
}

function cardClear(){
	document.frmAdvMagazine.ccNumber.disabled=true;
	document.frmAdvMagazine.ccCvvid.disabled=true;
	document.frmAdvMagazine.ccType.disabled=true;
	document.frmAdvMagazine.ccName.disabled=true;
	document.frmAdvMagazine.ccExpMonth.disabled=true;
	document.frmAdvMagazine.ccExpYear.disabled=true;
	document.frmAdvMagazine.checkNumber.disabled=false;
	document.frmAdvMagazine.checkDate.disabled=false;
	document.frmAdvMagazine.bankName.disabled=false;	
	
	document.frmAdvMagazine.ccNumber.value="";
	document.frmAdvMagazine.ccCvvid.value="";
	document.frmAdvMagazine.ccType.selectedIndex=0;
	document.frmAdvMagazine.ccName.value="";
	document.frmAdvMagazine.ccExpMonth.selectedIndex=0;
	document.frmAdvMagazine.ccExpYear.selectedIndex=0;
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

function isAlpha(str){
	stringCheck="0123456789";
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

function isnotZipcode(str){
	stringZip="0123456789";
	fzip=1;
	for(j=0;j<str.length;j++){
		if(stringZip.indexOf(str.charAt(j))!=-1){
			fzip=0;
		}
	}
	if(fzip==0){
		return false;
	}
	else{
		return true;
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
	      frmAdvMagazine.txtYesDate.value = "StartDate1";

      if(val==2)
         frmAdvMagazine.txtDetDate.value = "StartDate1";

      if(val==3)
	      frmAdvMagazine.txtChDate.value = "StartDate1";

      val = window.open("javascripts/Calendar.jsp?sDate=" + val ,'Calendar','width=170,height=190,menubar=no,toolbar=no,status=no,resizable=no,scrollbars=no,top=400,left=150');
      if(val == null) {
         alert("Plz Enable Site Popup Allowed");
      }
}

function myvalidate(){

//==================== Advertiser's Name ====================================
stringCheck1="`~!@#$%^&*|:;{}[]<>?/=~.,'`;:"+"\\"+"\'";

	if(document.frmAdvMagazine.txtAdvName.value==""){
		alert("Advertiser's Name cannot be empty.");
		document.frmAdvMagazine.txtAdvName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtAdvName.value.length>80){
		alert("Advertiser's Name should not exceed 80 characters.");
		document.frmAdvMagazine.txtAdvName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.txtAdvName.value)){
		alert("Enter valid Advertiser's Name.");
		document.frmAdvMagazine.txtAdvName.focus();
	    	return false;
	}
	
	if(document.frmAdvMagazine.txtAdvName.value.indexOf(' ')==0){
		alert("Enter Valid Advertiser's Name.");
		document.frmAdvMagazine.txtAdvName.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtAdvName.value.indexOf('  ')!==-1){
		alert("Enter Valid Advertiser's Name.");
		document.frmAdvMagazine.txtAdvName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvMagazine.txtAdvName.value)){
		alert("Enter valid Advertiser's Name.");
		document.frmAdvMagazine.txtAdvName.focus();
		return false;
	}
	
// ==================== Agency Name ==========================================	
	
	if(document.frmAdvMagazine.txtAgentName.value==""){
		alert("Agency Name cannot be empty.");
		document.frmAdvMagazine.txtAgentName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtAgentName.value.length>80){
		alert("Agency's Name should not exceed 80 characters.");
		document.frmAdvMagazine.txtAgentName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.txtAgentName.value)){
		alert("Enter valid Agency's Name.");
		document.frmAdvMagazine.txtAgentName.focus();
	    	return false;
	}
	
	if(document.frmAdvMagazine.txtAgentName.value.indexOf(' ')==0){
		alert("Enter Valid Agency's Name.");
		document.frmAdvMagazine.txtAgentName.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtAgentName.value.indexOf('  ')!==-1){
		alert("Enter Valid Agency's Name.");
		document.frmAdvMagazine.txtAgentName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvMagazine.txtAgentName.value)){
		alert("Enter valid Agency's Name.");
		document.frmAdvMagazine.txtAgentName.focus();
		return false;
	}

//============================ First Name in Contact Details ===============
	
	if(document.frmAdvMagazine.txtFirstName.value==""){
		alert("First Name in Contact Details cannot be empty.");
		document.frmAdvMagazine.txtFirstName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtFirstName.value.length>80){
		alert("First Name should not exceed 80 characters.");
		document.frmAdvMagazine.txtFirstName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.txtFirstName.value)){
		alert("Enter valid First Name.");
		document.frmAdvMagazine.txtFirstName.focus();
	    	return false;
	}
	
	if(document.frmAdvMagazine.txtFirstName.value.indexOf(' ')==0){
		alert("Enter valid First Name.");
		document.frmAdvMagazine.txtFirstName.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtFirstName.value.indexOf('  ')!==-1){
		alert("Enter valid First Name.");
		document.frmAdvMagazine.txtFirstName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvMagazine.txtFirstName.value)){
		alert("Enter valid First Name.");
		document.frmAdvMagazine.txtFirstName.focus();
		return false;
	}

//============================ Middle Name in Contact Details ====================

	if(document.frmAdvMagazine.txtMidName.value.length>80){
		alert("Middle Name should not exceed 80 characters");
		document.frmAdvMagazine.txtMidName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.txtMidName.value)){
		alert("Enter valid Middle Name.");
		document.frmAdvMagazine.txtMidName.focus();
	    	return false;
	}
	
	if(document.frmAdvMagazine.txtMidName.value.indexOf(' ')==0){
		alert("Enter valid Middle Name.");
		document.frmAdvMagazine.txtMidName.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtMidName.value.indexOf('  ')!==-1){
		alert("Enter valid Middle Name.");
		document.frmAdvMagazine.txtMidName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvMagazine.txtMidName.value)){
		alert("Enter valid Middle Name.");
		document.frmAdvMagazine.txtMidName.focus();
		return false;
	}

//============================= Last Name in Contact Details ====================

	if(document.frmAdvMagazine.txtLastName.value==""){
		alert("Last Name in Contact details cannot be empty.");
		document.frmAdvMagazine.txtLastName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtLastName.value.length>80){
		alert("Last Name should not exceed 80 characters");
		document.frmAdvMagazine.txtLastName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.txtLastName.value)){
		alert("Enter valid Last Name.");
		document.frmAdvMagazine.txtLastName.focus();
	    	return false;
	}
	
	if(document.frmAdvMagazine.txtLastName.value.indexOf(' ')==0){
		alert("Enter valid Last Name.");
		document.frmAdvMagazine.txtLastName.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtLastName.value.indexOf('  ')!==-1){
		alert("Enter valid Last Name.");
		document.frmAdvMagazine.txtLastName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvMagazine.txtLastName.value)){
		alert("Enter valid Last Name.");
		document.frmAdvMagazine.txtLastName.focus();
		return false;
	}

//========================= For Street Name =================================

	if(document.frmAdvMagazine.txtStreetName.value==""){
		alert("Street Name in Contact details cannot be empty.");
		document.frmAdvMagazine.txtStreetName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtStreetName.value.length>255){
		alert("Street Name should not exceed 255 characters.");
		document.frmAdvMagazine.txtStreetName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtStreetName.value.indexOf(' ')==0){
		alert("Enter valid Street Name.");
		document.frmAdvMagazine.txtStreetName.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtStreetName.value.indexOf('  ')!==-1){
		alert("Enter valid Street Name.");
		document.frmAdvMagazine.txtStreetName.focus();
		return false;
	}

// ============================ For Suite Name ========================

	if(document.frmAdvMagazine.txtSuiteName.value.length>80){
		alert("Suite Name should not exceed 80 characters.");
		document.frmAdvMagazine.txtSuiteName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtSuiteName.value.indexOf(' ')==0){
		alert("Enter valid Suite Name.");
		document.frmAdvMagazine.txtSuiteName.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtSuiteName.value.indexOf('  ')!==-1){
		alert("Enter valid Suite Name.");
		document.frmAdvMagazine.txtSuiteName.focus();
		return false;
	}
//============================ For Counrty and State Name =========================

	var cdln = "";
	if(typeof(window.document.frmAdvMagazine.selConCountry) == 'object'){
		if (window.document.frmAdvMagazine.selConCountry.value != ""){
			var clid;
			clid = window.document.frmAdvMagazine.selConCountry[window.document.frmAdvMagazine.selConCountry.selectedIndex].value;
			cdln = clid;
		}
		if(cdln == "---Select---"){
			alert("Select a Country in Contact details.");
			window.document.frmAdvMagazine.selConCountry.focus();
			return false;
		}
	}
	
	if ( document.frmAdvMagazine.selConCountry.selectedIndex == 0 ){
        alert ( "Select a Country Name in Contact Details." );
		document.frmAdvMagazine.selConCountry.focus();
        return false;
    }

	var edln = "";
	if(typeof(window.document.frmAdvMagazine.selConState) == 'object'){
		if (window.document.frmAdvMagazine.selConState.value != ""){
			var lid;
			lid = window.document.frmAdvMagazine.selConState[window.document.frmAdvMagazine.selConState.selectedIndex].value;
			edln = lid;
		}
		if(edln.length == 1){
			alert("Select a State in contact Details.");
			window.document.frmAdvMagazine.selConState.focus();
			return false;
		}
	}

	if ( document.frmAdvMagazine.selConState.selectedIndex == 0 ){
        alert ( "Select a State Name in Contact Details." );
		document.frmAdvMagazine.selConState.focus();
        return false;
    }

//========================= For Contact City ==================================

	if(document.frmAdvMagazine.txtConCity.value==""){
		alert("City Name in Contact Details cannot be empty");
		document.frmAdvMagazine.txtConCity.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtConCity.value.length>80){
		alert("City Name in Contact Details should not exceed 80 characters.");
		document.frmAdvMagazine.txtConCity.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.txtConCity.value)){
		alert("Enter valid City Name.");
		document.frmAdvMagazine.txtConCity.focus();
    	return false;
    }

	if(isAlpha(document.frmAdvMagazine.txtConCity.value)){
		alert("Enter valid City Name.");
		document.frmAdvMagazine.txtConCity.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtConCity.value.indexOf(' ')==0){
		alert("Enter valid City Name.");
		document.frmAdvMagazine.txtConCity.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtConCity.value.indexOf('  ')!==-1){
		alert("Enter valid City Name.");
		document.frmAdvMagazine.txtConCity.focus();
		return false;
	}

//============================= For Zip Code ==========================
if(document.frmAdvMagazine.txtConZip.value==""){
		alert("Zipcode in Contact Details cannot be empty.");
		document.frmAdvMagazine.txtConZip.focus();
		return false;
	}
	if(isnotZipcode(document.frmAdvMagazine.txtConZip.value)){
		alert("Enter valid Zipcode.");
		document.frmAdvMagazine.txtConZip.focus();
		return false;
	}

	if((document.frmAdvMagazine.txtConZip.value.length<2)||(document.frmAdvMagazine.txtConZip.value.length>10)){
		alert("Enter valid Zipcode.");
		document.frmAdvMagazine.txtConZip.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtConZip.value.indexOf('.')!=-1){
		alert("Enter valid Zipcode.");
		document.frmAdvMagazine.txtConZip.focus();
		return false;
	}

//============================= For Phone Number=============================

	if(document.frmAdvMagazine.txtConPhone.value==""){
		alert("Phone Number cannot be empty");
		document.frmAdvMagazine.txtConPhone.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtConPhone.value!=""){
		len4=document.frmAdvMagazine.txtConPhone.value.length;
		strnum3 = document.frmAdvMagazine.txtConPhone.value;
		var GoodChars = "0123456789()- + ";
		var s1=document.frmAdvMagazine.txtConPhone.value.indexOf('(');
		var s2=document.frmAdvMagazine.txtConPhone.value.indexOf(')');
		var s5=document.frmAdvMagazine.txtConPhone.value.indexOf('+');
		var s6=document.frmAdvMagazine.txtConPhone.value.lastIndexOf('+');
		var s7=document.frmAdvMagazine.txtConPhone.value.indexOf('-');
		var s8=document.frmAdvMagazine.txtConPhone.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number");
			document.frmAdvMagazine.txtConPhone.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number");
			document.frmAdvMagazine.txtConPhone.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid Phone Number");
			document.frmAdvMagazine.txtConPhone.focus();
			return false;
		}
		
		if(s7!==s8){
			alert("Enter valid Phone Number");
			document.frmAdvMagazine.txtConPhone.focus();
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
			document.frmAdvMagazine.txtConPhone.focus();
			return false;
		}
	}

	st10=document.frmAdvMagazine.txtConPhone.value;
	fi10=1;
	for(j=0;j<document.frmAdvMagazine.txtConPhone.value.length-1;j++){
		if(stringCheck1.indexOf(st10.charAt(j))==-1){
			fi10=0;
		}
	}
	if(fi10!=0){
		alert("Enter valid Phone Number.");
		document.frmAdvMagazine.txtConPhone.focus();
		return false;
	}
	
	if(document.frmAdvMagazine.txtConPhone.value.length >40){
		alert("Phone Number should not exceed 40 digits.");
		document.frmAdvMagazine.txtConPhone.focus();
		return false;
	}

//================================= For fax Number ==========================

	if(document.frmAdvMagazine.txtConFax.value!=""){
		len=document.frmAdvMagazine.txtConFax.value.length;
		strnum = document.frmAdvMagazine.txtConFax.value;
		var GoodChars = "0123456789()- + ";
		var f1=document.frmAdvMagazine.txtConFax.value.indexOf('(');
		var f2=document.frmAdvMagazine.txtConFax.value.indexOf(')');
		var f5=document.frmAdvMagazine.txtConFax.value.indexOf('+');
		var f6=document.frmAdvMagazine.txtConFax.value.lastIndexOf('+');
		var f7=document.frmAdvMagazine.txtConFax.value.indexOf('-');
		var f8=document.frmAdvMagazine.txtConFax.value.lastIndexOf('-');
		var f3=1+f2;
		var f4=1+f1;
		if(f1==f3){
			alert("Enter valid Fax Number");
			document.frmAdvMagazine.txtConFax.focus();
			return false;
		}
		if(f2==f4){
			alert("Enter valid Fax Number");
			document.frmAdvMagazine.txtConFax.focus();
			return false;
		}
		if(f5!==f6){
			alert("Enter valid Fax Number");
			document.frmAdvMagazine.txtConFax.focus();
			return false;
		}
		
		if(f7!==f8){
			alert("Enter valid Fax Number");
			document.frmAdvMagazine.txtConFax.focus();
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
			document.frmAdvMagazine.txtConFax.focus();
			return false;
		}
		if(document.frmAdvMagazine.txtConFax.value.length >40){
		alert("Fax Number should not excceed 40 digits.");
		document.frmAdvMagazine.txtConFax.focus();
		return false;
		}
		if(document.frmAdvMagazine.txtConFax.value.indexOf(' ')==0){
		alert("Enter valid Fax Number");
		document.frmAdvMagazine.txtConFax.focus();
		return false;
		}
		if(document.frmAdvMagazine.txtConFax.value.indexOf('  ')!==-1){
		alert("Enter valid Fax Number");
		document.frmAdvMagazine.txtConFax.focus();
		return false;
		}
	}

	st1=document.frmAdvMagazine.txtConFax.value;
	fi1=1;
	for(j=0;j<document.frmAdvMagazine.txtConFax.value.length-1;j++){
		if(stringCheck1.indexOf(st1.charAt(j))==-1){
			fi1=0;
		}
	}

// ============================ For Email =================================

	if(document.frmAdvMagazine.txtConMail.value==""){
		alert("Email ID cannot be empty");
		document.frmAdvMagazine.txtConMail.focus();
		return false;
	}

	if(!(document.frmAdvMagazine.txtConMail.value== "")){
		strmail=document.frmAdvMagazine.txtConMail.value;
		firstat = strmail.indexOf("@");
		lastat = strmail.lastIndexOf("@");
		strmain=strmail.substring(0,firstat);
		strsub=strmail.substring(firstat,document.frmAdvMagazine.txtConMail.value.length);
		if(strmail.length>120){
			alert("Email ID should not exceed 120 characters.");
			document.frmAdvMagazine.txtConMail.focus();
			return false;
		}
		if(strmain.indexOf('  ')!=-1 || firstat==0 || strsub.indexOf('  ')!=-1 ){
			alert("Enter valid Email ID.");
			document.frmAdvMagazine.txtConMail.focus();
			return false;
		}
		if(isnotSpecial(strmain) || isnotSpecial(strsub)){
			alert("Enter valid Email ID.");
			document.frmAdvMagazine.txtConMail.focus();
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
			document.frmAdvMagazine.txtConMail.focus();
			return false;
		}
		if(firstat==-1 || lastat==-1){
			alert("Enter valid Email ID.");
			document.frmAdvMagazine.txtConMail.focus();
			return false;
		}
		if(Number(strmain)){
			alert("Enter valid Email ID.");
			document.frmAdvMagazine.txtConMail.focus();
			return false;
		}
		if(firstat != lastat ){
			alert("Enter valid Email ID.");
			document.frmAdvMagazine.txtConMail.focus();
			return false;
		}
		firstdot=strmail.indexOf(".",firstat);
		lastdot=strmail.lastIndexOf(".");
		if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1){
			alert("Enter valid Email ID.");
			document.frmAdvMagazine.txtConMail.focus();
			return false;
		}
	}
	
//============================= Checking Invoice Option ============================

	chosen="";
	len = document.frmAdvMagazine.rdoAdvertising.length ;
	for(i=0;i<len;i++){
		if(document.frmAdvMagazine.rdoAdvertising[i].checked){
			chosen= document.frmAdvMagazine.rdoAdvertising[i].value;
		}
	}

	if(chosen==""){
		alert("Select any Invoice Option.");
		return false;
	}

// ============================ Checking Advertise Option==============================

	chosen1="";
	len1 = document.frmAdvMagazine.rdoQuest.length ;
	for(i=0;i<len1;i++)
	{if(document.frmAdvMagazine.rdoQuest[i].checked)
	{chosen1= document.frmAdvMagazine.rdoQuest[i].value;}}

	if(chosen1=="")
	{alert("Select any Advertised Option.");
	 return false;}

	if(chosen1=="yes")
	{if(document.frmAdvMagazine.txtYesDate.value=="")
	{ alert("Select a Date in Advertisement Details");
	  document.frmAdvMagazine.txtYesDate.focus();
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

		strdate=document.frmAdvMagazine.txtYesDate.value;
		mm1 = Number(strdate.substring(0,2));
		dd1 = Number(strdate.substring(3,5));
		yyy=(strdate.substring(6,document.frmAdvMagazine.txtYesDate.value.length));
		yyy1=(Number(yyy.length));
		if(yyy>noYear)
		{  alert("Enter valid Date in the Advertising Details");
		   document.frmAdvMagazine.txtYesDate.focus();
		   return false;}
		if((yyy==noYear)&&(mm1>noMonth))
		{	alert("Enter valid Date in the Advertising Details");
			document.frmAdvMagazine.txtYesDate.focus();
			return false;}
		if((dd1>noDate)&&(mm1==noMonth)&&(yyy==noYear))
		{   alert("Enter valid date in the Advertising Details");
			document.frmAdvMagazine.txtYesDate.focus();
			return false;}

	}
	
//=============================== For Frequency Rate =============================

	if(document.frmAdvMagazine.selPlanDisp.selectedIndex==0){
        alert ( "Select a Frequency Rate." );
		document.frmAdvMagazine.selPlanDisp.focus();
        return false;
    }
//==================== When selected index = 1 ===================================	
	if(document.frmAdvMagazine.selPlanDisp.selectedIndex>=1){
		if(document.frmAdvMagazine.chkIssueId1.selectedIndex==0){
        	alert ( "Select an Issue Name." );
			document.frmAdvMagazine.chkIssueId1.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.selWinTypeIdchkIssue1.selectedIndex==0){
        	alert ( "Select an Advertisement Name." );
			document.frmAdvMagazine.selWinTypeIdchkIssue1.focus();
    	    return false;
	    }
	
		/*if(document.frmAdvMagazine.selWinSubTypeIdchkIssue1.selectedIndex==0){
        	alert ( "Select an Advertisement sub Type Name." );
			document.frmAdvMagazine.selWinSubTypeIdchkIssue1.focus();
    	    return false;
	    }*/

		if(document.frmAdvMagazine.selWinDimchkIssue1.selectedIndex==0){
        	alert ( "Select an Ad Dimension." );
			document.frmAdvMagazine.selWinDimchkIssue1.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.txtWinPlace1.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvMagazine.txtWinPlace1.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMagazine.txtWinPlace1.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace1.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvMagazine.txtWinPlace1.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace1.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace1.value.indexOf(' ')==0){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace1.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace1.value.indexOf('  ')!==-1){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace1.focus();
			return false;
		}

	}

//======================= When selected index = 2 =============================
	if(document.frmAdvMagazine.selPlanDisp.selectedIndex>=2){
		if(document.frmAdvMagazine.chkIssueId2.selectedIndex==0){
        	alert ( "Select an Issue Name." );
			document.frmAdvMagazine.chkIssueId2.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.selWinTypeIdchkIssue2.selectedIndex==0){
        	alert ( "Select an Advertisement Name." );
			document.frmAdvMagazine.selWinTypeIdchkIssue2.focus();
    	    return false;
	    }
	
		/*if(document.frmAdvMagazine.selWinSubTypeIdchkIssue2.selectedIndex==0){
        	alert ( "Select an Advertisement sub Type Name." );
			document.frmAdvMagazine.selWinSubTypeIdchkIssue2.focus();
    	    return false;
	    }*/

		if(document.frmAdvMagazine.selWinDimchkIssue2.selectedIndex==0){
        	alert ( "Select an Ad Dimension." );
			document.frmAdvMagazine.selWinDimchkIssue2.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.txtWinPlace2.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvMagazine.txtWinPlace2.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMagazine.txtWinPlace2.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace2.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvMagazine.txtWinPlace2.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace2.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace2.value.indexOf(' ')==0){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace2.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace2.value.indexOf('  ')!==-1){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace2.focus();
			return false;
		}

	}
	if(document.frmAdvMagazine.selPlanDisp.selectedIndex>=3){
		if(document.frmAdvMagazine.chkIssueId3.selectedIndex==0){
        	alert ( "Select an Issue Name." );
			document.frmAdvMagazine.chkIssueId3.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.selWinTypeIdchkIssue3.selectedIndex==0){
        	alert ( "Select an Advertisement Name." );
			document.frmAdvMagazine.selWinTypeIdchkIssue3.focus();
    	    return false;
	    }
	
		/*if(document.frmAdvMagazine.selWinSubTypeIdchkIssue3.selectedIndex==0){
        	alert ( "Select an Advertisement sub Type Name." );
			document.frmAdvMagazine.selWinSubTypeIdchkIssue3.focus();
    	    return false;
	    }*/

		if(document.frmAdvMagazine.selWinDimchkIssue3.selectedIndex==0){
        	alert ( "Select an Ad Dimension." );
			document.frmAdvMagazine.selWinDimchkIssue3.focus();
    	    return false;
	    }
		
		if(document.frmAdvMagazine.txtWinPlace3.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvMagazine.txtWinPlace3.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMagazine.txtWinPlace3.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace3.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvMagazine.txtWinPlace3.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace3.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace3.value.indexOf(' ')==0){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace3.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace3.value.indexOf('  ')!==-1){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace3.focus();
			return false;
		}

	}
	if(document.frmAdvMagazine.selPlanDisp.selectedIndex>=4){
		if(document.frmAdvMagazine.chkIssueId4.selectedIndex==0){
        	alert ( "Select an Issue Name." );
			document.frmAdvMagazine.chkIssueId4.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.selWinTypeIdchkIssue4.selectedIndex==0){
        	alert ( "Select an Advertisement Name." );
			document.frmAdvMagazine.selWinTypeIdchkIssue4.focus();
    	    return false;
	    }
	/*
		if(document.frmAdvMagazine.selWinSubTypeIdchkIssue4.selectedIndex==0){
        	alert ( "Select an Advertisement sub Type Name." );
			document.frmAdvMagazine.selWinSubTypeIdchkIssue4.focus();
    	    return false;
	    }*/

		if(document.frmAdvMagazine.selWinDimchkIssue4.selectedIndex==0){
        	alert ( "Select an Ad Dimension." );
			document.frmAdvMagazine.selWinDimchkIssue4.focus();
    	    return false;
	    }
		
		if(document.frmAdvMagazine.txtWinPlace4.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvMagazine.txtWinPlace4.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMagazine.txtWinPlace4.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace4.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvMagazine.txtWinPlace4.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace4.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace4.value.indexOf(' ')==0){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace4.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace4.value.indexOf('  ')!==-1){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace4.focus();
			return false;
		}

	}
	
	if(document.frmAdvMagazine.selPlanDisp.selectedIndex>=5){
		if(document.frmAdvMagazine.chkIssueId5.selectedIndex==0){
        	alert ( "Select an Issue Name." );
			document.frmAdvMagazine.chkIssueId5.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.selWinTypeIdchkIssue5.selectedIndex==0){
        	alert ( "Select an Advertisement Name." );
			document.frmAdvMagazine.selWinTypeIdchkIssue5.focus();
    	    return false;
	    }
	
	/*	if(document.frmAdvMagazine.selWinSubTypeIdchkIssue5.selectedIndex==0){
        	alert ( "Select an Advertisement sub Type Name." );
			document.frmAdvMagazine.selWinSubTypeIdchkIssue5.focus();
    	    return false;
	    }*/

		if(document.frmAdvMagazine.selWinDimchkIssue5.selectedIndex==0){
        	alert ( "Select an Ad Dimension." );
			document.frmAdvMagazine.selWinDimchkIssue5.focus();
    	    return false;
	    }
		
		if(document.frmAdvMagazine.txtWinPlace5.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvMagazine.txtWinPlace5.focus();
			return false;
		}
		if(isnotAlpha(document.frmAdvMagazine.txtWinPlace5.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace5.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvMagazine.txtWinPlace5.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace5.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace5.value.indexOf(' ')==0){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace5.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace5.value.indexOf('  ')!==-1){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace5.focus();
			return false;
		}

	}

	if(document.frmAdvMagazine.selPlanDisp.selectedIndex>=6){
		if(document.frmAdvMagazine.chkIssueId6.selectedIndex==0){
        	alert ( "Select an Issue Name." );
			document.frmAdvMagazine.chkIssueId6.focus();
    	    return false;
	    }

		if(document.frmAdvMagazine.selWinTypeIdchkIssue6.selectedIndex==0){
        	alert ( "Select an Advertisement Name." );
			document.frmAdvMagazine.selWinTypeIdchkIssue6.focus();
    	    return false;
	    }
	
	/*	if(document.frmAdvMagazine.selWinSubTypeIdchkIssue6.selectedIndex==0){
        	alert ( "Select an Advertisement sub Type Name." );
			document.frmAdvMagazine.selWinSubTypeIdchkIssue6.focus();
    	    return false;
	    }*/

		if(document.frmAdvMagazine.selWinDimchkIssue6.selectedIndex==0){
        	alert ( "Select an Ad Dimension." );
			document.frmAdvMagazine.selWinDimchkIssue6.focus();
    	    return false;
	    }
	
		if(document.frmAdvMagazine.txtWinPlace6.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvMagazine.txtWinPlace6.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvMagazine.txtWinPlace6.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace6.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvMagazine.txtWinPlace6.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace6.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace6.value.indexOf(' ')==0){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace6.focus();
			return false;
		}

		if(document.frmAdvMagazine.txtWinPlace6.value.indexOf('  ')!==-1){
			alert("Enter valid Placement Name.");
			document.frmAdvMagazine.txtWinPlace6.focus();
			return false;
		}


}

//============================== For Advertising Material =======================

	if(document.frmAdvMagazine.txtMatName.value==""){
		alert("Advertising Material Details cannot be empty");
		document.frmAdvMagazine.txtMatName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtMatName.value.length>80){
		alert("Advertising Material should not exceed 80 characters.");
		document.frmAdvMagazine.txtMatName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.txtMatName.value)){
		alert("Enter valid Advertising Material Details.");
		document.frmAdvMagazine.txtMatName.focus();
    	return false;
    }

	if(isAlpha(document.frmAdvMagazine.txtMatName.value)){
		alert("Enter valid Advertising Material Details.");
		document.frmAdvMagazine.txtMatName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtMatName.value.indexOf(' ')==0){
		alert("Enter valid Advertising Material Details.");
		document.frmAdvMagazine.txtMatName.focus();
		return false;
	}

	if(document.frmAdvMagazine.txtMatName.value.indexOf('  ')!==-1){
		alert("Enter valid Advertising Material Details.");
		document.frmAdvMagazine.txtMatName.focus();
		return false;
	}

//========================== For Date ====================================

	if(document.frmAdvMagazine.txtDetDate.value==""){
		alert("Date in Advertisement Details cannot be empty.");
		document.frmAdvMagazine.txtDetDate.focus();
		return false;
	}

//============================= Checking Ad Supplied on option ============================

	chosen="";
	len = document.frmAdvMagazine.rdoSupply.length ;
	for(i=0;i<len;i++){
		if(document.frmAdvMagazine.rdoSupply[i].checked){
			chosen= document.frmAdvMagazine.rdoSupply[i].value;
		}
	}

	if(chosen==""){
		alert("Select any Ad Supply Option.");
		return false;
	}


//-----------------------------------Special Instruction--------------------------------------------------------------------
 
	if(document.frmAdvMagazine.txtAreaIns.value.length >1024 ){
		alert("Special Instruction should not exceed 1024 characters.");
		document.frmAdvMagazine.txtAreaIns.focus();
 		return false;
	 }			
    
//============================ For Total Amount =============================

	if(document.frmAdvMagazine.amount.value==""){
		alert("Total Amount cannot be empty");
		document.frmAdvMagazine.amount.focus();
		return false;
	}
	

	if(document.frmAdvMagazine.amount.value=="0.0"){
		alert("Total Amount cannot be zero");
		document.frmAdvMagazine.amount.focus();
		return false;
	}
   
	

//================================== For Check & Card Option =======================

	chosen2="";
	len2 = document.frmAdvMagazine.r11.length ;
	for(i=0;i<len2;i++){
		if(document.frmAdvMagazine.r11[i].checked){
			chosen2= document.frmAdvMagazine.r11[i].value;
		}
	}

	if(chosen2==""){
		alert("Check any of the Payment Option.");
		return false;
	}

//--------------------------Check  Number ---------------------------

	if(chosen2=="check"){
		if(document.frmAdvMagazine.checkNumber.value==""){
			alert("Check Number in Check Details cannot be empty");
			document.frmAdvMagazine.checkNumber.focus();
			return false;
		}

	if(!Number(document.frmAdvMagazine.checkNumber.value)){
		alert("Enter valid Check Number in Check Details");
		document.frmAdvMagazine.checkNumber.focus();
		return false;
	}

	if(document.frmAdvMagazine.checkNumber.value.length>16){
		alert("Check Number exceeds the maximum of 16 characters.");
		document.frmAdvMagazine.checkNumber.focus();
		return false;
	}

	if(document.frmAdvMagazine.checkNumber.value.indexOf('.')!=-1){
		alert("Enter Valid check number.");
		document.frmAdvMagazine.checkNumber.focus();
		return false;
	}
//=============================== For Check Date ========================
	if(document.frmAdvMagazine.checkDate.value==""){
		alert("Select Date in Check Details");
		document.frmAdvMagazine.checkDate.focus();
		return false;
	}


	if(!(document.frmAdvMagazine.checkDate.value=="")){
	
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

	if(!(document.frmAdvMagazine.checkDate.value=="")){
		strdate=document.frmAdvMagazine.checkDate.value;
		mm = Number(strdate.substring(0,2));
		dd = Number(strdate.substring(3,5));
		yyyy=(strdate.substring(6,document.frmAdvMagazine.checkDate.value.length));

		var now = new Date();
		var months1 = now.getMonth();
		var years=now.getYear();
		var months = 7+months1;
		year=1+years;
		
		if((months<12)&&(mm>months)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if((months1==6)&&(mm>1)&&(mm<6)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}
		
		if((months1==7)&&(mm>2)&&(mm<7)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if((months1==8)&&(mm>3)&&(mm<8)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if((months1==9)&&(mm>4)&&(mm<9)){
			alert("Enter a valid Date in Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if((months1==10)&&(mm>5)&&(mm<10)){
			alert("Enter a valid Date in Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if((months1==11)&&(mm>6)&&(mm<11)){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if(yyyy<nowYear){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if((yyyy==nowYear)&&(mm<nowMonth)){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if((dd<nowDate)&&(mm==nowMonth)){
			alert("Enter valid date in the Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}

		if(dd>31){
			alert("Enter valid date in the Payment Details");
			document.frmAdvMagazine.checkDate.focus();
			return false;
		}
	}
}

//===================================In Favor Of====================================

	if(document.frmAdvMagazine.bankName.value==""){
		alert("Bank Name in Payment Information cannot be empty.");
		document.frmAdvMagazine.bankName.focus();
		return false;
	}

	if(document.frmAdvMagazine.bankName.value.length>80){
		alert("Bank Name in Payment Information exceeds the maximum of 80 characters.");
		document.frmAdvMagazine.bankName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.bankName.value)){
		alert("Enter valid Bank Name in Payment Information.");
		document.frmAdvMagazine.bankName.focus();
    	return false;
	}

	if(document.frmAdvMagazine.bankName.value.indexOf(' ')==0){
		alert("Enter Valid Bank Name in Payment Information.");
		document.frmAdvMagazine.bankName.focus();
		return false;
	}

	if(document.frmAdvMagazine.bankName.value.indexOf('  ')!==-1){
		alert("Enter Valid Bank Name in Payment Information.");
		document.frmAdvMagazine.bankName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvMagazine.bankName.value)){
		alert("Enter valid Bank Name in Payment Information");
		document.frmAdvMagazine.bankName.focus();
		return false;
	}
}

		
// ======================= For Card No =============================
         
	    if(chosen2=="card"){
		if(document.frmAdvMagazine.ccNumber.value==""){
			alert("Enter Card Number in the Card Details");
			document.frmAdvMagazine.ccNumber.focus();
			return false;
		}

		if(!Number(document.frmAdvMagazine.ccNumber.value)){
			alert("Enter valid Card Number in the Card Details");
			document.frmAdvMagazine.ccNumber.focus();
			return false;
		}

		if(document.frmAdvMagazine.ccNumber.value.length!=16 ){
			alert(" Card Number in the Card Details is not equal to 16 characters");
			document.frmAdvMagazine.ccNumber.focus();
			return false;
		}

		if(document.frmAdvMagazine.ccNumber.value.indexOf('.')!=-1){
			alert("Enter Valid Number in Card Number.");
			document.frmAdvMagazine.ccNumber.focus();
			return false;
		}

//--------for CVV Number -------------------------------------

	if(document.frmAdvMagazine.ccCvvid.value==""){
		alert("Enter valid CVV Number in Card Details");
		document.frmAdvMagazine.ccCvvid.focus();
		return false;
	}
    
	if(!Number(document.frmAdvMagazine.ccCvvid.value)){
			alert("Enter valid CVV Number in Card Details");
			document.frmAdvMagazine.ccCvvid.focus();
			return false;
		}
	if(document.frmAdvMagazine.ccCvvid.value.length>4){
		alert("CVV Number in Card Details should not exceed 4 digits");
		document.frmAdvMagazine.ccCvvid.focus();
		return false;
	}

	if(document.frmAdvMagazine.ccCvvid.value.length<3){
		alert("CVV Number in Card Details should not preceed 3 digits");
		document.frmAdvMagazine.ccCvvid.focus();
		return false;
	}

	if(document.frmAdvMagazine.ccCvvid.value.indexOf('.')!=-1){
		alert("Enter Valid Number in Cvv Number.");
		document.frmAdvMagazine.ccCvvid.focus();
		return false;
	}
	
	
	//===================== For card type ================
	if (document.frmAdvMagazine.ccType.selectedIndex == 0 ){
		alert ( "Please select card type." );
		document.frmAdvMagazine.ccType.focus();
		return false;
   	}

	
//----for Print Name on Card ----------------------------------------
	if(document.frmAdvMagazine.ccName.value==""){
		alert("Card Name in Card Details cannot be empty");
		document.frmAdvMagazine.ccName.focus();
		return false;
	}

	if(document.frmAdvMagazine.ccName.value.length>80){
		alert("Card Name in Card Details should not exceed 80 characters.");
		document.frmAdvMagazine.ccName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvMagazine.ccName.value)){
		alert("Enter valid Card Name.");
		document.frmAdvMagazine.ccName.focus();
	    return false;
    }

	if(isAlpha(document.frmAdvMagazine.ccName.value)){
		alert("Enter valid card name");
		document.frmAdvMagazine.ccName.focus();
		return false;
	}

	if(document.frmAdvMagazine.ccName.value.indexOf(' ')==0){
		alert("Enter Valid Card Name.");
		document.frmAdvMagazine.ccName.focus();
		return false;
	}

	if(document.frmAdvMagazine.ccName.value.indexOf('  ')!==-1){
		alert("Enter Valid Card Name.");
		document.frmAdvMagazine.ccName.focus();
		return false;
	}

//---for Expiry month drop down --------------------------------

	var rightNow=new Date();
	var theYear=rightNow.getYear();
	var tMonth=rightNow.getMonth();
	var theMonth=1+tMonth;
	var theDate=rightNow.getDate();

	if (document.frmAdvMagazine.ccExpMonth.selectedIndex == 0 ){
		alert ( "Please select a Month." );
		document.frmAdvMagazine.ccExpMonth.focus();
    	return false;
	}

	if (document.frmAdvMagazine.ccExpYear.value==theYear){
		 if(document.frmAdvMagazine.ccExpMonth.value<theMonth){
			alert("You have selected an Expired Month in card details. Please Select Valid Expiration Month.");
			document.frmAdvMagazine.ccExpMonth.focus();
			return(false);   
		}
	}

//-----------for Expiry Year drop down

	if (document.frmAdvMagazine.ccExpYear.selectedIndex == 0 ){
		alert ( "Please select a year." );
		document.frmAdvMagazine.ccExpYear.focus();
    	return false;
	}


	if (document.frmAdvMagazine.ccExpYear.value<theYear){
		alert("You have selected an Expired Year in card details. Please Select Valid Expiration Year.");
		document.frmAdvMagazine.ccExpYear.focus();
		return(false);   
	}

		}
	return true;
}
