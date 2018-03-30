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
    document.frmAdvOmni.amount.value="0.0";
}

function oneIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "none";
	document.getElementById("3").style.display = "none";
	document.getElementById("4").style.display = "none";
	
	
	document.frmAdvOmni.chkIssueId2.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue2.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue2.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue2.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId3.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue3.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue3.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue3.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId4.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue4.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue4.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue4.selectedIndex=0;
	getAmountDetails();
}

function twoIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "none";
	document.getElementById("4").style.display = "none";
	
/*	document.frmAdvOmni.chkIssueId1.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue1.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue1.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue1.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId3.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue3.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue3.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue3.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId2.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue2.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue2.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue2.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId4.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue4.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue4.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue4.selectedIndex=0;
	*/
	getAmountDetails();
}

function threeIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "block";
	document.getElementById("4").style.display = "none";
	
	/*document.frmAdvOmni.chkIssueId1.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue1.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue1.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue1.selectedIndex=0;
	
	 document.frmAdvOmni.chkIssueId3.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue3.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue3.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue3.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId2.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue2.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue2.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue2.selectedIndex=0;

	document.frmAdvOmni.chkIssueId4.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue4.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue4.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue4.selectedIndex=0;*/
	getAmountDetails();
}

function fourIssue(){
	document.getElementById("1").style.display = "block";
	document.getElementById("2").style.display = "block";
	document.getElementById("3").style.display = "block";
	document.getElementById("4").style.display = "block";
    
	/*document.frmAdvOmni.chkIssueId1.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue1.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue1.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue1.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId2.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue2.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue2.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue2.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId3.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue3.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue3.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue3.selectedIndex=0;
	
	document.frmAdvOmni.chkIssueId4.selectedIndex=0;
	document.frmAdvOmni.selWinTypeIdchkIssue4.selectedIndex=0;
	document.frmAdvOmni.selWinSubTypeIdchkIssue4.selectedIndex=-1;
	document.frmAdvOmni.selWinDimchkIssue4.selectedIndex=0;
     */
	 getAmountDetails();
}



function displayRadios(selBxId){
	
	var el = document.frmAdvOmni.elements;
	for (i=0; i < el.length; i++) {
		 
		if(selBxId[selBxId.selectedIndex].value==4){
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
		if(document.frmAdvOmni.elements[radNam].checked == true){
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
				
		}
}

function showLevels(chkBxNam,divId){
		if(document.frmAdvOmni.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}
				
function showHide(chkBxNam,divId){
		if(document.frmAdvOmni.elements[chkBxNam].checked == true){
				document.getElementById(divId).style.display = "block";	
		}else {
				document.getElementById(divId).style.display = "none";	
		} 
}

function enabDisab(chkBxId,txtBxId){
		if(document.frmAdvOmni.elements[chkBxId].checked == true){
				document.frmAdvOmni.elements[txtBxId].disabled = false;	
		}else {
				document.frmAdvOmni.elements[txtBxId].disabled = "disabled";	
		} 
}

function enableRad(radBtnId,txtBxId){
		if(document.frmAdvOmni.elements[radBtnId].checked == true){
				document.frmAdvOmni.elements[txtBxId].disabled = false;	
		}else{
				document.frmAdvMag.elements[txtBxId].disabled = "disabled";	
		} 
}

function disable(radBtnNewId,txtBxId){
		if(document.frmAdvOmni.elements[radBtnNewId].checked == true){
				document.frmAdvOmni.elements[txtBxId].disabled = "disabled";	
		}
}	
		
function showHideRadio(radioNam,divId,radVal){
		if(document.frmAdvOmni.elements[radioNam].value = radVal){
				document.getElementById(divId).style.display = "none";	
		}else {
				document.getElementById(divId).style.display = "block";	
		} 
}

function yesClear(){
	document.frmAdvOmni.txtYesDate.disabled=false;
}

function noClear(){
	document.frmAdvOmni.txtYesDate.disabled=true;
	document.frmAdvOmni.txtYesDate.value="";
}

function checkClear(){
	document.frmAdvOmni.ccNumber.disabled=false;
	document.frmAdvOmni.ccCvvid.disabled=false;
	document.frmAdvOmni.ccType.disabled=false;
	document.frmAdvOmni.ccName.disabled=false;
	document.frmAdvOmni.ccExpMonth.disabled=false;
	document.frmAdvOmni.ccExpYear.disabled=false;
	document.frmAdvOmni.checkNumber.disabled=true;
	document.frmAdvOmni.checkDate.disabled=true;
	document.frmAdvOmni.bankName.disabled=true;
	
	document.frmAdvOmni.checkNumber.value="";
	document.frmAdvOmni.checkDate.value="";
	document.frmAdvOmni.bankName.value="";	
}

function cardClear(){
	document.frmAdvOmni.ccNumber.disabled=true;
	document.frmAdvOmni.ccCvvid.disabled=true;
	document.frmAdvOmni.ccType.disabled=true;
	document.frmAdvOmni.ccName.disabled=true;
	document.frmAdvOmni.ccExpMonth.disabled=true;
	document.frmAdvOmni.ccExpYear.disabled=true;
	document.frmAdvOmni.checkNumber.disabled=false;
	document.frmAdvOmni.checkDate.disabled=false;
	document.frmAdvOmni.bankName.disabled=false;	
	
	document.frmAdvOmni.ccNumber.value="";
	document.frmAdvOmni.ccCvvid.value="";
	document.frmAdvOmni.ccType.selectedIndex=0;
	document.frmAdvOmni.ccName.value="";
	document.frmAdvOmni.ccExpMonth.selectedIndex=0;
	document.frmAdvOmni.ccExpYear.selectedIndex=0;
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
	      frmAdvOmni.txtYesDate.value = "StartDate1";

      if(val==2)
         frmAdvOmni.txtDetDate.value = "StartDate1";

      if(val==3)
	      frmAdvOmni.txtChDate.value = "StartDate1";

      val = window.open("javascripts/Calendar.jsp?sDate=" + val ,'Calendar','width=170,height=190,menubar=no,toolbar=no,status=no,resizable=no,scrollbars=no,top=400,left=150');
      if(val == null) {
         alert("Plz Enable Site Popup Allowed");
      }
}

function myvalidate(){

//==================== Advertiser's Name ====================================
stringCheck1="`~!@#$%^&*|:;{}[]<>?/=~.,'`;:"+"\\"+"\'";

	if(document.frmAdvOmni.txtAdvName.value==""){
		alert("Advertiser's Name cannot be empty.");
		document.frmAdvOmni.txtAdvName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtAdvName.value.length>80){
		alert("Advertiser's Name should not exceed 80 characters.");
		document.frmAdvOmni.txtAdvName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.txtAdvName.value)){
		alert("Enter valid Advertiser's Name.");
		document.frmAdvOmni.txtAdvName.focus();
	    	return false;
	}
	
	if(document.frmAdvOmni.txtAdvName.value.indexOf(' ')==0){
		alert("Enter Valid Advertiser's Name.");
		document.frmAdvOmni.txtAdvName.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtAdvName.value.indexOf('  ')!==-1){
		alert("Enter Valid Advertiser's Name.");
		document.frmAdvOmni.txtAdvName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvOmni.txtAdvName.value)){
		alert("Enter valid Advertiser's Name.");

		document.frmAdvOmni.txtAdvName.focus();
		return false;
	}
	
// ==================== Agency Name ==========================================	
	
	if(document.frmAdvOmni.txtAgentName.value==""){
		alert("Agency Name cannot be empty.");
		document.frmAdvOmni.txtAgentName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtAgentName.value.length>80){
		alert("Agency's Name should not exceed 80 characters.");
		document.frmAdvOmni.txtAgentName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.txtAgentName.value)){
		alert("Enter valid Agency's Name.");
		document.frmAdvOmni.txtAgentName.focus();
	    	return false;
	}
	
	if(document.frmAdvOmni.txtAgentName.value.indexOf(' ')==0){
		alert("Enter Valid Agency's Name.");
		document.frmAdvOmni.txtAgentName.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtAgentName.value.indexOf('  ')!==-1){
		alert("Enter Valid Agency's Name.");
		document.frmAdvOmni.txtAgentName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvOmni.txtAgentName.value)){
		alert("Enter valid Agency's Name.");
		document.frmAdvOmni.txtAgentName.focus();
		return false;
	}

//============================ First Name in Contact Details ===============
	
	if(document.frmAdvOmni.txtFirstName.value==""){
		alert("First Name in Contact details cannot be empty.");
		document.frmAdvOmni.txtFirstName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtFirstName.value.length>80){
		alert("First Name should not exceed 80 characters.");
		document.frmAdvOmni.txtFirstName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.txtFirstName.value)){
		alert("Enter valid First Name.");
		document.frmAdvOmni.txtFirstName.focus();
	    	return false;
	}
	
	if(document.frmAdvOmni.txtFirstName.value.indexOf(' ')==0){
		alert("Enter Valid First Name.");
		document.frmAdvOmni.txtFirstName.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtFirstName.value.indexOf('  ')!==-1){
		alert("Enter Valid First Name.");
		document.frmAdvOmni.txtFirstName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvOmni.txtFirstName.value)){
		alert("Enter valid First Name.");
		document.frmAdvOmni.txtFirstName.focus();
		return false;
	}

//============================ Middle Name in Contact Details ====================

	if(document.frmAdvOmni.txtMidName.value.length>80){
		alert("Middle Name should not exceed 80 characters.");
		document.frmAdvOmni.txtMidName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.txtMidName.value)){
		alert("Enter valid Middle Name.");
		document.frmAdvOmni.txtMidName.focus();
	    return false;
	}
	
	if(document.frmAdvOmni.txtMidName.value.indexOf(' ')==0){
		alert("Enter Valid Middle Name.");
		document.frmAdvOmni.txtMidName.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtMidName.value.indexOf('  ')!==-1){
		alert("Enter Valid Middle Name.");
		document.frmAdvOmni.txtMidName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvOmni.txtMidName.value)){
		alert("Enter valid Middle Name.");
		document.frmAdvOmni.txtMidName.focus();
		return false;
	}

//============================= Last Name in Contact Details ====================

	if(document.frmAdvOmni.txtLastName.value==""){
		alert("Last Name in Contact details cannot be empty.");
		document.frmAdvOmni.txtLastName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtLastName.value.length>80){
		alert("Last Name should not exceed 80 characters.");
		document.frmAdvOmni.txtLastName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.txtLastName.value)){
		alert("Enter valid Last Name.");
		document.frmAdvOmni.txtLastName.focus();
	    	return false;
	}
	
	if(document.frmAdvOmni.txtLastName.value.indexOf(' ')==0){
		alert("Enter Valid Last Name.");
		document.frmAdvOmni.txtLastName.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtLastName.value.indexOf('  ')!==-1){
		alert("Enter Valid Last Name.");
		document.frmAdvOmni.txtLastName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvOmni.txtLastName.value)){
		alert("Enter valid Last Name.");
		document.frmAdvOmni.txtLastName.focus();
		return false;
	}

//========================= For Street Name =================================

	if(document.frmAdvOmni.txtStreetName.value==""){
		alert("Street Name in Contact details cannot be empty.");
		document.frmAdvOmni.txtStreetName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtStreetName.value.length>255){
		alert("Street Name should not exceed 255 characters.");
		document.frmAdvOmni.txtStreetName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtStreetName.value.indexOf(' ')==0){
		alert("Enter Valid Street Name.");
		document.frmAdvOmni.txtStreetName.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtStreetName.value.indexOf('  ')!==-1){
		alert("Enter Valid Street Name.");
		document.frmAdvOmni.txtStreetName.focus();
		return false;
	}

// ============================ For Suite Name ========================
	if(document.frmAdvOmni.txtSuiteName.value.length>80){
		alert("Suite Name should not exceed 80 characters.");
		document.frmAdvOmni.txtSuiteName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtSuiteName.value.indexOf(' ')==0){
		alert("Enter Valid Suite Name.");
		document.frmAdvOmni.txtSuiteName.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtSuiteName.value.indexOf('  ')!==-1){
		alert("Enter Valid Suite Name.");
		document.frmAdvOmni.txtSuiteName.focus();
		return false;
	}
//============================ For Counrty and State Name =========================

	var cdln = "";
	if(typeof(window.document.frmAdvOmni.selConCountry) == 'object'){
		if (window.document.frmAdvOmni.selConCountry.value != ""){
			var clid;
			clid = window.document.frmAdvOmni.selConCountry[window.document.frmAdvOmni.selConCountry.selectedIndex].value;
			cdln = clid;
		}
		if(cdln == "---Select---"){
			alert("Please select a Country in Contact details.");
			window.document.frmAdvOmni.selConCountry.focus();
			return false;
		}
	}
	
	if ( document.frmAdvOmni.selConCountry.selectedIndex == 0 ){
        alert ( "Please select a Country Name in Contact Details." );
		document.frmAdvOmni.selConCountry.focus();
        return false;
    }

	var edln = "";
	if(typeof(window.document.frmAdvOmni.selConState) == 'object'){
		if (window.document.frmAdvOmni.selConState.value != ""){
			var lid;
			lid = window.document.frmAdvOmni.selConState[window.document.frmAdvOmni.selConState.selectedIndex].value;
			edln = lid;
		}
		if(edln.length == 1){
			alert("Please select a State in contact Details.");
			window.document.frmAdvOmni.selConState.focus();
			return false;
		}
	}

	if ( document.frmAdvOmni.selConState.selectedIndex == 0 ){
        alert ( "Please select a State Name in Contact Details." );
		document.frmAdvOmni.selConState.focus();
        return false;
    }

//========================= For Contact City ==================================

	if(document.frmAdvOmni.txtConCity.value==""){
		alert("City Name in Contact Details cannot be empty");
		document.frmAdvOmni.txtConCity.focus();
		return false;
	}

	if(document.frmAdvOmni.txtConCity.value.length>80){
		alert("City Name in Contact Details should not exceed 80 characters.");
		document.frmAdvOmni.txtConCity.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.txtConCity.value)){
		alert("Enter valid City Name in Contact Details.");
		document.frmAdvOmni.txtConCity.focus();
    	return false;
    }

	if(isAlpha(document.frmAdvOmni.txtConCity.value)){
		alert("Enter valid City Name in Contact Details.");
		document.frmAdvOmni.txtConCity.focus();
		return false;
	}

	if(document.frmAdvOmni.txtConCity.value.indexOf(' ')==0){
		alert("Enter Valid City Name in Contact Details.");
		document.frmAdvOmni.txtConCity.focus();
		return false;
	}

	if(document.frmAdvOmni.txtConCity.value.indexOf('  ')!==-1){
		alert("Enter Valid City Name in Contact Details.");
		document.frmAdvOmni.txtConCity.focus();
		return false;
	}

//============================= For Zip Code ==========================
    if(document.frmAdvOmni.txtConZip.value==""){
		alert("Zipcode in Contact Details cannot be empty.");
		document.frmAdvOmni.txtConZip.focus();
		return false;
	}
	if(isnotZipcode(document.frmAdvOmni.txtConZip.value)){
		alert("Enter Valid Zipcode in Contact Details.");
		document.frmAdvOmni.txtConZip.focus();
		return false;
	}

	if((document.frmAdvOmni.txtConZip.value.length<2)||(document.frmAdvOmni.txtConZip.value.length>10)){
		alert("Enter Valid Zipcode in Contact Details.");
		document.frmAdvOmni.txtConZip.focus();
		return false;
	}

	if(document.frmAdvOmni.txtConZip.value.indexOf('.')!=-1){
		alert("Enter Valid Zipcode in Contact Details.");
		document.frmAdvOmni.txtConZip.focus();
		return false;
	}

//============================= For Phone Number=============================

	if(document.frmAdvOmni.txtConPhone.value==""){
		alert("Phone Number cannot be empty");
		document.frmAdvOmni.txtConPhone.focus();
		return false;
	}

	if(document.frmAdvOmni.txtConPhone.value!=""){
		len4=document.frmAdvOmni.txtConPhone.value.length;
		strnum3 = document.frmAdvOmni.txtConPhone.value;
		var GoodChars = "0123456789()- + ";
		var s1=document.frmAdvOmni.txtConPhone.value.indexOf('(');
		var s2=document.frmAdvOmni.txtConPhone.value.indexOf(')');
		var s5=document.frmAdvOmni.txtConPhone.value.indexOf('+');
		var s6=document.frmAdvOmni.txtConPhone.value.lastIndexOf('+');
		var s7=document.frmAdvOmni.txtConPhone.value.indexOf('-');
		var s8=document.frmAdvOmni.txtConPhone.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number");
			document.frmAdvOmni.txtConPhone.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number");
			document.frmAdvOmni.txtConPhone.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid Phone Number");
			document.frmAdvOmni.txtConPhone.focus();
			return false;
		}
		
		if(s7!==s8){
			alert("Enter valid Phone Number");
			document.frmAdvOmni.txtConPhone.focus();
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
			document.frmAdvOmni.txtConPhone.focus();
			return false;
		}
	}

	st10=document.frmAdvOmni.txtConPhone.value;
	fi10=1;
	for(j=0;j<document.frmAdvOmni.txtConPhone.value.length-1;j++){
		if(stringCheck1.indexOf(st10.charAt(j))==-1){
			fi10=0;
		}
	}
	if(fi10!=0){
		alert("Enter valid Phone Number.");
		document.frmAdvOmni.txtConPhone.focus();
		return false;
	}
	
	if(document.frmAdvOmni.txtConPhone.value.length >40){
		alert("Phone Number out of Range.");
		document.frmAdvOmni.txtConPhone.focus();
		return false;
	}

//================================= For fax Number ==========================

	if(document.frmAdvOmni.txtConFax.value!=""){
		len=document.frmAdvOmni.txtConFax.value.length;
		strnum = document.frmAdvOmni.txtConFax.value;
		var GoodChars = "0123456789()- + ";
		var f1=document.frmAdvOmni.txtConFax.value.indexOf('(');
		var f2=document.frmAdvOmni.txtConFax.value.indexOf(')');
		var f5=document.frmAdvOmni.txtConFax.value.indexOf('+');
		var f6=document.frmAdvOmni.txtConFax.value.lastIndexOf('+');
		var f7=document.frmAdvOmni.txtConFax.value.indexOf('-');
		var f8=document.frmAdvOmni.txtConFax.value.lastIndexOf('-');
		var f3=1+f2;
		var f4=1+f1;
		if(f1==f3){
			alert("Enter valid Fax Number");
			document.frmAdvOmni.txtConFax.focus();
			return false;
		}
		if(f2==f4){
			alert("Enter valid Fax Number");
			document.frmAdvOmni.txtConFax.focus();
			return false;
		}
		if(f5!==f6){
			alert("Enter valid Fax Number");
			document.frmAdvOmni.txtConFax.focus();
			return false;
		}
		
		if(f7!==f8){
			alert("Enter valid Fax Number");
			document.frmAdvOmni.txtConFax.focus();
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
			document.frmAdvOmni.txtConFax.focus();
			return false;
		}
		if(document.frmAdvOmni.txtConFax.value.length >40){
		alert("Fax Number should not exceed 40 characters.");
		document.frmAdvOmni.txtConFax.focus();
		return false;
		}
		if(document.frmAdvOmni.txtConFax.value.indexOf(' ')==0){
		alert("Enter valid Fax Number");
		document.frmAdvOmni.txtConFax.focus();
		return false;
		}
		if(document.frmAdvOmni.txtConFax.value.indexOf('  ')!==-1){
		alert("Enter valid Fax Number");
		document.frmAdvOmni.txtConFax.focus();
		return false;
		}
	}

	st1=document.frmAdvOmni.txtConFax.value;
	fi1=1;
	for(j=0;j<document.frmAdvOmni.txtConFax.value.length-1;j++){
		if(stringCheck1.indexOf(st1.charAt(j))==-1){
			fi1=0;
		}
	}

// ============================ For Email =================================

	if(document.frmAdvOmni.txtConMail.value==""){
		alert("Email ID cannot be empty");
		document.frmAdvOmni.txtConMail.focus();
		return false;
	}

	if(!(document.frmAdvOmni.txtConMail.value== "")){
		strmail=document.frmAdvOmni.txtConMail.value;
		firstat = strmail.indexOf("@");
		lastat = strmail.lastIndexOf("@");
		strmain=strmail.substring(0,firstat);
		strsub=strmail.substring(firstat,document.frmAdvOmni.txtConMail.value.length);
		if(strmail.length>120){
			alert("Email ID exceeds the maximum of 120 characters.");
			document.frmAdvOmni.txtConMail.focus();
			return false;
		}
		if(strmain.indexOf('  ')!=-1 || firstat==0 || strsub.indexOf('  ')!=-1 ){
			alert("Enter valid Email ID.");
			document.frmAdvOmni.txtConMail.focus();
			return false;
		}
		if(isnotSpecial(strmain) || isnotSpecial(strsub)){
			alert("Enter valid Email ID.");
			document.frmAdvOmni.txtConMail.focus();
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
			document.frmAdvOmni.txtConMail.focus();
			return false;
		}
		if(firstat==-1 || lastat==-1){
			alert("Enter valid Email ID.");
			document.frmAdvOmni.txtConMail.focus();
			return false;
		}
		if(Number(strmain)){
			alert("Enter valid Email ID.");
			document.frmAdvOmni.txtConMail.focus();
			return false;
		}
		if(firstat != lastat ){
			alert("Enter valid Email ID.");
			document.frmAdvOmni.txtConMail.focus();
			return false;
		}
		firstdot=strmail.indexOf(".",firstat);
		lastdot=strmail.lastIndexOf(".");
		if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1){
			alert("Enter valid Email ID.");
			document.frmAdvOmni.txtConMail.focus();
			return false;
		}
	}
	
//============================= Checking Invoice Option ============================

	chosen="";
	len = document.frmAdvOmni.rdoAdvertising.length ;
	for(i=0;i<len;i++){
		if(document.frmAdvOmni.rdoAdvertising[i].checked){
			chosen= document.frmAdvOmni.rdoAdvertising[i].value;
		}
	}

	if(chosen==""){
		alert("Check any of the Invoice Option.");
		return false;
	}

// ============================ Checking Advertise Option==============================

	chosen1="";
	len1 = document.frmAdvOmni.rdoQuest.length ;
	for(i=0;i<len1;i++)
	{if(document.frmAdvOmni.rdoQuest[i].checked)
	{chosen1= document.frmAdvOmni.rdoQuest[i].value;}}

	if(chosen1=="")
	{alert("Check any of the Advertised Option.");
	 return false;}

	if(chosen1=="yes")
	{if(document.frmAdvOmni.txtYesDate.value=="")
	{ alert("Select a Date in Advertisement Details");
	  document.frmAdvOmni.txtYesDate.focus();
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

		strdate=document.frmAdvOmni.txtYesDate.value;
		mm1 = Number(strdate.substring(0,2));
		dd1 = Number(strdate.substring(3,5));
		yyy=(strdate.substring(6,document.frmAdvOmni.txtYesDate.value.length));
		yyy1=(Number(yyy.length));
		if(yyy>noYear)
		{  alert("Enter valid Date in the Advertising Details");
		   document.frmAdvOmni.txtYesDate.focus();
		   return false;}
		if((yyy==noYear)&&(mm1>noMonth))
		{	alert("Enter valid Date in the Advertising Details");
			document.frmAdvOmni.txtYesDate.focus();
			return false;}
		if((dd1>noDate)&&(mm1==noMonth)&&(yyy==noYear))
		{   alert("Enter valid date in the Advertising Details");
			document.frmAdvOmni.txtYesDate.focus();
			return false;}

	}
	
//=============================== For Frequency Rate =============================

	 if(document.frmAdvOmni.selPlanDisp.selectedIndex==0){
        alert ( "Please select a Frequency Name." );
		document.frmAdvOmni.selPlanDisp.focus();
        return false;
    } 
//==================== When selected index = 1 ===================================	
   if(document.frmAdvOmni.selPlanDisp.selectedIndex>=1){
		 if(document.frmAdvOmni.chkIssueId1.selectedIndex==0){
        	alert ( "Please select an Issue Name." );
			document.frmAdvOmni.chkIssueId1.focus();
    	    return false;
	    }

		if(document.frmAdvOmni.selWinTypeIdchkIssue1.selectedIndex==0){
        	alert ( "Please select an Advertisement Name." );
			document.frmAdvOmni.selWinTypeIdchkIssue1.focus();
    	    return false;
	    }
	
		/*if(document.frmAdvOmni.selWinSubTypeIdchkIssue1.selectedIndex==0){
        	alert ( "Please should not exceed 80 characters." );
			document.frmAdvOmni.selWinSubTypeIdchkIssue1.focus();
    	    return false;
	    } */

		if(document.frmAdvOmni.selWinDimchkIssue1.selectedIndex==0){
        	alert ( "Please select Ad Dimension." );
			document.frmAdvOmni.selWinDimchkIssue1.focus();
    	    return false;
	    } 

		if(document.frmAdvOmni.txtWinPlace1.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvOmni.txtWinPlace1.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvOmni.txtWinPlace1.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace1.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvOmni.txtWinPlace1.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvOmni.txtWinPlace1.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace1.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace1.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace1.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace1.focus();
			return false;
		}

	}
 
//======================= When selected index = 2 =============================
	if(document.frmAdvOmni.selPlanDisp.selectedIndex>=2){
		if(document.frmAdvOmni.chkIssueId2.selectedIndex==0){
        	alert ( "Please select an Issue Name." );
			document.frmAdvOmni.chkIssueId2.focus();
    	    return false;
	    }

		if(document.frmAdvOmni.selWinTypeIdchkIssue2.selectedIndex==0){
        	alert ( "Please select an Advertisement Name." );
			document.frmAdvOmni.selWinTypeIdchkIssue2.focus();
    	    return false;
	    }
	
	/*	if(document.frmAdvOmni.selWinSubTypeIdchkIssue2.selectedIndex==0){
        	alert ( "Please select an Advertisement sub Type Name." );
			document.frmAdvOmni.selWinSubTypeIdchkIssue2.focus();
    	    return false;
	    }*/

		if(document.frmAdvOmni.selWinDimchkIssue2.selectedIndex==0){
        	alert ( "Please select Ad Dimension." );
			document.frmAdvOmni.selWinDimchkIssue2.focus();
    	    return false;
	    }

		if(document.frmAdvOmni.txtWinPlace2.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvOmni.txtWinPlace2.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvOmni.txtWinPlace2.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace2.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvOmni.txtWinPlace2.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvOmni.txtWinPlace2.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace2.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace2.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace2.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace2.focus();
			return false;
		}

	}


if(document.frmAdvOmni.selPlanDisp.selectedIndex>=3){
	
		
		if(document.frmAdvOmni.chkIssueId3.selectedIndex==0){
        	alert ( "Please select an Issue Name." );
			document.frmAdvOmni.chkIssueId3.focus();
    	    return false;
	    }

		if(document.frmAdvOmni.selWinTypeIdchkIssue3.selectedIndex==0){
        	alert ( "Please select an Advertisement Name." );
			document.frmAdvOmni.selWinTypeIdchkIssue3.focus();
    	    return false;
	    }
	
		/*if(document.frmAdvOmni.selWinSubTypeIdchkIssue3.selectedIndex==0){
        	alert ( "Please select an Advertisement sub Type Name." );
			document.frmAdvOmni.selWinSubTypeIdchkIssue3.focus();
    	    return false;
	    }*/

		if(document.frmAdvOmni.selWinDimchkIssue3.selectedIndex==0){
        	alert ( "Please select Ad Dimension." );
			document.frmAdvOmni.selWinDimchkIssue3.focus();
    	    return false;
	    }
		if(document.frmAdvOmni.txtWinPlace3.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvOmni.txtWinPlace3.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvOmni.txtWinPlace3.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace3.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvOmni.txtWinPlace3.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvOmni.txtWinPlace3.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace3.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace3.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace3.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace3.focus();
			return false;
		}

}
if(document.frmAdvOmni.selPlanDisp.selectedIndex>=4){
		
		if(document.frmAdvOmni.chkIssueId4.selectedIndex==0){
        	alert ( "Please select an Issue Name." );
			document.frmAdvOmni.chkIssueId4.focus();
    	    return false;
	    }

		if(document.frmAdvOmni.selWinTypeIdchkIssue4.selectedIndex==0){
        	alert ( "Please select an Advertisement Name." );
			document.frmAdvOmni.selWinTypeIdchkIssue4.focus();
    	    return false;
	    }
	
	/*	if(document.frmAdvOmni.selWinSubTypeIdchkIssue4.selectedIndex==0){
        	alert ( "Please select an Advertisement sub Type Name." );
			document.frmAdvOmni.selWinSubTypeIdchkIssue4.focus();
    	    return false;
	    }*/

		if(document.frmAdvOmni.selWinDimchkIssue4.selectedIndex==0){
        	alert ( "Please select Ad Dimension." );
			document.frmAdvOmni.selWinDimchkIssue4.focus();
    	    return false;
	    } 
		if(document.frmAdvOmni.txtWinPlace4.value.length>80){
			alert("Placement Name should not exceed 80 characters.");
			document.frmAdvOmni.txtWinPlace4.focus();
			return false;
		}
	
		if(isnotAlpha(document.frmAdvOmni.txtWinPlace4.value)){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace4.focus();
    		return false;
	    }

		if(isAlpha(document.frmAdvOmni.txtWinPlace4.value)){
			alert("Enter valid Placement Name.");
			document.frmAdvOmni.txtWinPlace4.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace4.value.indexOf(' ')==0){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace4.focus();
			return false;
		}

		if(document.frmAdvOmni.txtWinPlace4.value.indexOf('  ')!==-1){
			alert("Enter Valid Placement Name.");
			document.frmAdvOmni.txtWinPlace4.focus();
			return false;
		}

}

//============================== For Advertising Material =======================

	if(document.frmAdvOmni.txtMatName.value==""){
		alert("Advertising Material Details cannot be empty");
		document.frmAdvOmni.txtMatName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtMatName.value.length>80){
		alert("Advertising Material should not exceed 80 characters.");
		document.frmAdvOmni.txtMatName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.txtMatName.value)){
		alert("Enter Valid Advertising Material Details.");
		document.frmAdvOmni.txtMatName.focus();
    	return false;
    }

	if(isAlpha(document.frmAdvOmni.txtMatName.value)){
		alert("Enter valid Advertising Material Details.");
		document.frmAdvOmni.txtMatName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtMatName.value.indexOf(' ')==0){
		alert("Enter Valid Advertising Material Details.");
		document.frmAdvOmni.txtMatName.focus();
		return false;
	}

	if(document.frmAdvOmni.txtMatName.value.indexOf('  ')!==-1){
		alert("Enter Valid Advertising Material Details.");
		document.frmAdvOmni.txtMatName.focus();
		return false;
	}

//========================== For Date ====================================

	if(document.frmAdvOmni.txtDetDate.value==""){
		alert("Date in Advertisement Details cannot be empty.");
		document.frmAdvOmni.txtDetDate.focus();
		return false;
	}

//============================= Checking Ad Supplied on option ============================

	chosen="";
	len = document.frmAdvOmni.rdoSupply.length ;
	for(i=0;i<len;i++){
		if(document.frmAdvOmni.rdoSupply[i].checked){
			chosen= document.frmAdvOmni.rdoSupply[i].value;
		}
	}

	if(chosen==""){
		alert("Check any of the Ad Supply Option.");
		return false;
	}


//-----------------------------------Special Instruction--------------------------------------------------------------------
 
	if(document.frmAdvOmni.txtAreaIns.value.length >1024 ){
		alert("Special Instruction should not exceed 1024 characters");
		document.frmAdvOmni.txtAreaIns.focus();
 		return false;
	 }			
    
//============================ For Total Amount =============================

	if(document.frmAdvOmni.amount.value==""){
		alert("Total Amount cannot be empty");
		document.frmAdvOmni.amount.focus();
		return false;
	}
	

	if(document.frmAdvOmni.amount.value=="0.0"){
		alert("Total Amount cannot be zero");
		document.frmAdvOmni.amount.focus();
		return false;
	}
   
	

//================================== For Check & Card Option =======================

	chosen2="";
	len2 = document.frmAdvOmni.r11.length ;
	for(i=0;i<len2;i++){
		if(document.frmAdvOmni.r11[i].checked){
			chosen2= document.frmAdvOmni.r11[i].value;
		}
	}

	if(chosen2==""){
		alert("Check any of the Payment Option.");
		return false;
	}

//--------------------------Check  Number ---------------------------

	if(chosen2=="check"){
		if(document.frmAdvOmni.checkNumber.value==""){
			alert("Check Number in Check Details cannot be empty");
			document.frmAdvOmni.checkNumber.focus();
			return false;
		}

	if(!Number(document.frmAdvOmni.checkNumber.value)){
		alert("Enter valid Check Number in Check Details");
		document.frmAdvOmni.checkNumber.focus();
		return false;
	}

	if(document.frmAdvOmni.checkNumber.value.length>16){
		alert("Check Number exceeds the maximum of 16 characters.");
		document.frmAdvOmni.checkNumber.focus();
		return false;
	}

	if(document.frmAdvOmni.checkNumber.value.indexOf('.')!=-1){
		alert("Enter Valid check number.");
		document.frmAdvOmni.checkNumber.focus();
		return false;
	}
//=============================== For Check Date ========================
	if(document.frmAdvOmni.checkDate.value==""){
		alert("Select Date in Check Details");
		document.frmAdvOmni.checkDate.focus();
		return false;
	}


	if(!(document.frmAdvOmni.checkDate.value=="")){
	
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

	if(!(document.frmAdvOmni.checkDate.value=="")){
		strdate=document.frmAdvOmni.checkDate.value;
		mm = Number(strdate.substring(0,2));
		dd = Number(strdate.substring(3,5));
		yyyy=(strdate.substring(6,document.frmAdvOmni.checkDate.value.length));

		var now = new Date();
		var months1 = now.getMonth();
		var years=now.getYear();
		var months = 7+months1;
		year=1+years;
		
		if((months<12)&&(mm>months)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if((months1==6)&&(mm>1)&&(mm<6)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}
		
		if((months1==7)&&(mm>2)&&(mm<7)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if((months1==8)&&(mm>3)&&(mm<8)){
			alert("Enter valid Date in Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if((months1==9)&&(mm>4)&&(mm<9)){
			alert("Enter a valid Date in Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if((months1==10)&&(mm>5)&&(mm<10)){
			alert("Enter a valid Date in Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if((months1==11)&&(mm>6)&&(mm<11)){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if(yyyy<nowYear){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if((yyyy==nowYear)&&(mm<nowMonth)){
			alert("Enter valid Date in the Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if((dd<nowDate)&&(mm==nowMonth)){
			alert("Enter valid date in the Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}

		if(dd>31){
			alert("Enter valid date in the Payment Details");
			document.frmAdvOmni.checkDate.focus();
			return false;
		}
	}
}

//===================================In Favor Of====================================

	if(document.frmAdvOmni.bankName.value==""){
		alert("Bank Name in Payment Information cannot be empty.");
		document.frmAdvOmni.bankName.focus();
		return false;
	}

	if(document.frmAdvOmni.bankName.value.length>80){
		alert("Bank Name in Payment Information exceeds the maximum of 80 characters.");
		document.frmAdvOmni.bankName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.bankName.value)){
		alert("Enter valid Bank Name in Payment Information.");
		document.frmAdvOmni.bankName.focus();
    	return false;
	}

	if(document.frmAdvOmni.bankName.value.indexOf(' ')==0){
		alert("Enter Valid Bank Name in Payment Information.");
		document.frmAdvOmni.bankName.focus();
		return false;
	}

	if(document.frmAdvOmni.bankName.value.indexOf('  ')!==-1){
		alert("Enter Valid Bank Name in Payment Information.");
		document.frmAdvOmni.bankName.focus();
		return false;
	}

	if(isAlpha(document.frmAdvOmni.bankName.value)){
		alert("Enter valid Bank Name in Payment Information");
		document.frmAdvOmni.bankName.focus();
		return false;
	}
}

		
// ======================= For Card No =============================
         
	    if(chosen2=="card"){
		if(document.frmAdvOmni.ccNumber.value==""){
			alert("Enter Card Number in the Card Details");
			document.frmAdvOmni.ccNumber.focus();
			return false;
		}

		if(!Number(document.frmAdvOmni.ccNumber.value)){
			alert("Enter valid Card Number in the Card Details");
			document.frmAdvOmni.ccNumber.focus();
			return false;
		}

		if(document.frmAdvOmni.ccNumber.value.length!=16 ){
			alert(" Card Number in the Card Details is not equal to 16 characters");
			document.frmAdvOmni.ccNumber.focus();
			return false;
		}

		if(document.frmAdvOmni.ccNumber.value.indexOf('.')!=-1){
			alert("Enter Valid Number in Card Number.");
			document.frmAdvOmni.ccNumber.focus();
			return false;
		}

//--------for CVV Number -------------------------------------

	if(document.frmAdvOmni.ccCvvid.value==""){
		alert("Enter valid CVV Number in Card Details");
		document.frmAdvOmni.ccCvvid.focus();
		return false;
	}
    
	if(!Number(document.frmAdvOmni.ccCvvid.value)){
			alert("Enter valid CVV Number in Card Details");
			document.frmAdvOmni.ccCvvid.focus();
			return false;
		}
	if(document.frmAdvOmni.ccCvvid.value.length>4){
		alert("CVV Number in Card Details should not exceed 4 digits");
		document.frmAdvOmni.ccCvvid.focus();
		return false;
	}

	if(document.frmAdvOmni.ccCvvid.value.length<3){
		alert("CVV Number in Card Details should not preceed 3 digits");
		document.frmAdvOmni.ccCvvid.focus();
		return false;
	}

	if(document.frmAdvOmni.ccCvvid.value.indexOf('.')!=-1){
		alert("Enter Valid Number in Cvv Number.");
		document.frmAdvOmni.ccCvvid.focus();
		return false;
	}
	
	
	//===================== For card type ================
	if (document.frmAdvOmni.ccType.selectedIndex == 0 ){
		alert ( "Please select card type." );
		document.frmAdvOmni.ccType.focus();
		return false;
   	}

	
//----for Print Name on Card ----------------------------------------
	if(document.frmAdvOmni.ccName.value==""){
		alert("Card Name in Card Details cannot be empty");
		document.frmAdvOmni.ccName.focus();
		return false;
	}

	if(document.frmAdvOmni.ccName.value.length>80){
		alert("Card Name in Card Details should not exceed 80 characters.");
		document.frmAdvOmni.ccName.focus();
		return false;
	}

	if(isnotAlpha(document.frmAdvOmni.ccName.value)){
		alert("Enter valid Card Name.");
		document.frmAdvOmni.ccName.focus();
	    return false;
    }

	if(isAlpha(document.frmAdvOmni.ccName.value)){
		alert("Enter valid card name");
		document.frmAdvOmni.ccName.focus();
		return false;
	}

	if(document.frmAdvOmni.ccName.value.indexOf(' ')==0){
		alert("Enter Valid Card Name.");
		document.frmAdvOmni.ccName.focus();
		return false;
	}

	if(document.frmAdvOmni.ccName.value.indexOf('  ')!==-1){
		alert("Enter Valid Card Name.");
		document.frmAdvOmni.ccName.focus();
		return false;
	}

//---for Expiry month drop down --------------------------------

	var rightNow=new Date();
	var theYear=rightNow.getYear();
	var tMonth=rightNow.getMonth();
	var theMonth=1+tMonth;
	var theDate=rightNow.getDate();

	if (document.frmAdvOmni.ccExpMonth.selectedIndex == 0 ){
		alert ( "Please select a Month." );
		document.frmAdvOmni.ccExpMonth.focus();
    	return false;
	}

	if (document.frmAdvOmni.ccExpYear.value==theYear){
		 if(document.frmAdvOmni.ccExpMonth.value<theMonth){
			alert("You have selected an Expired Month in card details. Please Select Valid Expiration Month.");
			document.frmAdvOmni.ccExpMonth.focus();
			return(false);   
		}
	}

//-----------for Expiry Year drop down

	if (document.frmAdvOmni.ccExpYear.selectedIndex == 0 ){
		alert ( "Please select a year." );
		document.frmAdvOmni.ccExpYear.focus();
    	return false;
	}


	if (document.frmAdvOmni.ccExpYear.value<theYear){
		alert("You have selected an Expired Year in card details. Please Select Valid Expiration Year.");
		document.frmAdvOmni.ccExpYear.focus();
		return(false);   
	}

		}
		

	return true;
}
// JavaScript Document
