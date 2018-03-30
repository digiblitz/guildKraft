<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="com.mee.ann.*"%>
<%@ page import="com.hlcmeeting.util.*"%>
<%@ page import="java.text.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/cscombo_new.js" type="text/javascript"></script>
<script src="js/frmMeeAnnualConvRegister.js" type="text/javascript" ></script>
<script src="js/frmAnnualConvReg.js" type="text/javascript" ></script>
<script src="js/gen_validatorv2.js" type="text/javascript" ></script>

<script language="JavaScript">
var arHttpRequest;

function userDetails(param){


			var  url = null;
			if(param.value.length==0)
			return;
			url = "UsrSignupAjax.html?cmd=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			
			req.onreadystatechange = processRequest1;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function processRequest1(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
							//clearDetails();
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									var userId =xmlDoc.getElementsByTagName('userId')[0].childNodes[0].nodeValue; 
									var dob =xmlDoc.getElementsByTagName('dob')[0].childNodes[0].nodeValue; 
									var age =xmlDoc.getElementsByTagName('age')[0].childNodes[0].nodeValue;
									var status =xmlDoc.getElementsByTagName('status')[0].childNodes[0].nodeValue;
									document.AnnualRegForm.status.value = status;
									
									//var membStat = xmlDoc.getElementsByTagName('membStat')[0].childNodes[0].nodeValue;
									//alert(firstName);
									//alert(lastName);
									//alert(phone);
									var firstNameObj = document.getElementById("firstNameId");
									
									var lastNameObj = document.getElementById("lastNameId");
									var phoneObj = document.getElementById("phoneId"); 
									var userObj = document.getElementById("userDetId"); 
									var dobObj = document.getElementById("dobId"); 
									var ageObj = document.getElementById("ageId"); 
									//var statObj = document.getElementById('membStat');
									//alert('statObj.value ' +statObj.value);
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
									if(phone=="null"){
									 phone = "xxxx";
									 }
									 
										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
									 
									dobObj.value=dob;
									userObj.value=userId;
									ageObj.value=age;
									//alert(document.AnnualRegForm.membershipTypeFinalId.value);
									
									//alert("status :"+document.AnnualRegForm.status.value);
									if(document.AnnualRegForm.status.value=="Active")

									{										
									if(age<=18 && age!=0){
										document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.juniorMemberType.value;
									}									
									else{
										document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.memberType.value;
									}
									}
									else
									{
										document.AnnualRegForm.membershipTypeFinalId.value = document.AnnualRegForm.nonMemberType.value
									}
									
									//alert(document.AnnualRegForm.membershipTypeFinalId.value);
									document.AnnualRegForm.newBadge.value=firstName+" "+lastName;
							} 
							if(req.status==500) {
							  alert("MembershipId does'nt exists");
							  clearFields();
							  document.AnnualRegForm.userNameId.focus();
							  return;
							}
							else{ 
								
							} 
						}	
						
					} 
		 
 function clearFields() {
		document.getElementById("userNameId").value = "";
		document.getElementById("firstNameId").value = "";
		document.getElementById("lastNameId").value = "";
		document.getElementById("newBadgeId").value = "";
	
		document.getElementById("phoneId").value = "";
		document.getElementById("userDetId").value = "";
		document.getElementById("dobId").value = "";
		document.getElementById("ageId").value = "";
 }
 
      function nonUserDetails(param){
	  //alert('hi');
					//alert(param.value);
						if(param.value.length==0)
						return;
							var  url = null;
							url = "UsrSignupAjax.html?cmd=memDetails&nonmemberId="+escape(param.value);
						 

							if (window.ActiveXObject){ 
								req = new ActiveXObject("Microsoft.XMLHTTP"); 
							} 
							else if (window.XMLHttpRequest){ 
								req = new XMLHttpRequest(); 
							} 
						
							req.onreadystatechange = processRequest;         
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processRequest(){ 
						if (req.readyState == 4){ 
						   //alert(req.readyState);
							if(req.status == 200){ 
									//clearDetails();
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
									var usrdob =xmlDoc.getElementsByTagName('userdob')[0].childNodes[0].nodeValue;
									var usrage =xmlDoc.getElementsByTagName('userage')[0].childNodes[0].nodeValue; 

									var fNameObj = document.getElementById("firstNameId1");
									var lNameObj = document.getElementById("lastNameId1");
									var phObj = document.getElementById("phoneId1");  
									var usObj = document.getElementById("userDetId");  
									var userDobObj = document.getElementById("dobId");
									var userageObj = document.getElementById("ageId");
									 
									
									fNameObj.value= fName;
									lNameObj.value=lName;
									usObj.value=usId;
									userDobObj.value=usrdob;
									userageObj.value=usrage;
									//alert(firstNameObj.value);
									//alert(lastNameObj.value);
									
									
									document.AnnualRegForm.newBadge.value=fName+" "+lName;
									
									if(ph=="null"){
									 	ph = "xxxx";
									 }
									 
										var phLen = ph.length;
										var minPhLen = phLen - 4;
										phObj.value=ph.substring(minPhLen,phLen);
									showAge();
							} 
							if(req.status==500) {
							  alert("User Name does'nt exists");
							  clear();
							  document.AnnualRegForm.userNameId1.focus();
							  return;
							}
							else{ 
								//alert("Error loading page\n"+ req.status +":"+ req.statusText); 
							} 
							  
						}	
					} 
		          function clear() {
						document.getElementById("userNameId1").value = "";
						document.getElementById("firstNameId1").value = "";
						document.getElementById("lastNameId1").value = "";
						document.getElementById("newBadgeId").value = "";
						document.getElementById("phoneId1").value = "";
						document.getElementById("userDetId").value = "";
						document.getElementById("dobId").value = "";
						document.getElementById("ageId").value = "";
						showHideRadio('rf','ponyClubber','mem');
					}
 //=================================membership checking
 
//===========================================================================================
//=========================== Functions to be Used ===========================================
function enable(){
	document.AnnualRegForm.newClubId.disabled = false;
	document.AnnualRegForm.newClubNameId.disabled = false;
	
}

function disable(){
	document.AnnualRegForm.newClubId.disabled = true;
	document.AnnualRegForm.newClubNameId.disabled = true;
	document.AnnualRegForm.newClubId.value = "";
	document.AnnualRegForm.newClubNameId.value = "";
}

function enableText(){
	document.AnnualRegForm.accomId.disabled = false;
}

function disableText(){
	document.AnnualRegForm.accomId.disabled = true;
}

function Dospace(str){
	if(str.indexOf("  ")!=-1){
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

function isnotAlpha(str){
	stringCheck="!@#$%^&*()_+|<>?/=-~.,`0123456789;:][{}"+"\\"+"\'"+"\"";
	f1=1;
	for(j=0;j<str.length;j++){
		if(stringCheck.indexOf(str.charAt(j))!=-1){
			f1=0;
		}
	}
	if(f1==0){
		return true; 
	}
	else {
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

function checkAll() {
     el = document.forms['AnnualRegForm'].elements;
     for (i=0; i < el.length; i++) {
       if(el[i].type == "checkbox") {
          void(el[i].checked=0);
       }
     }
 }
 
 function deSelectAll() {
     el = document.forms['AnnualRegForm'].elements;
     for (i=0; i < el.length; i++) {
      var chkVal = el[i].name.substring(0,12);
		if(el[i].type == "checkbox" && chkVal=="meetingDates" ) {
          	void(el[i].checked=0);
       	}
     }
 }
 
 function checkCheckboxValidation() {
     el = document.forms['AnnualRegForm'].elements;
	 var checkCnt = 0;
     for (i=0; i < el.length; i++) {
		 var chkVal = el[i].name.substring(0,12);
		  if(el[i].type == "checkbox" && chkVal=="meetingDates" ) {
			if((el[i].checked==true)){
				checkCnt=1;
			}
		 }
	}
	
	if(checkCnt==0){
		alert("select any one of the dates");
	}
	return checkCnt;
 }
 
  function checkAllValidation() {
     el = document.forms['AnnualRegForm'].elements;
	 var checkCnt1 = 0;
     for (i=0; i < el.length; i++) {
		 var chkVal = el[i].name.substring(0,12);
		  if(el[i].type == "checkbox" && chkVal=="meetingDates" ) {
			if((el[i].checked==false)){
				checkCnt1=1;
			}
		 }
	}
	
	if(checkCnt1==0){
		alert("You have selected all the days. \n By changing the registration type to Full Registration, \n you will receive a discounted price.");
	}
	//return checkCnt1;
 }

function clearHLCdetails(){
	document.AnnualRegForm.userNameId.value="";
	document.AnnualRegForm.firstNameId.value="";
	document.AnnualRegForm.lastNameId.value="";
	document.AnnualRegForm.phoneId.value="";
	document.AnnualRegForm.phoneId1.value="";
	document.AnnualRegForm.newClubId.value="";
	document.AnnualRegForm.pclub[0].checked="false"
	document.AnnualRegForm.pclub[1].checked="true"
	document.AnnualRegForm.newStateId.value="--Select--";
	document.AnnualRegForm.newBadgeId.value="";
	document.AnnualRegForm.regAmountId.value="0.00";
	document.AnnualRegForm.activityAmount.value="0.00";
	document.AnnualRegForm.newRegTypeId.selectedIndex=0;
	var valLen = document.AnnualRegForm.priceIdLen.value;	
	for(i=1;i<=valLen;i++){
		var amtbx = "AmtBx"+i;
		var pricebx = "priceId"+i;
		document.getElementById(amtbx).value="0.00";
		document.getElementById(pricebx).value = "";		
	}
	document.getElementById("meeDates").style.display = "none";
	checkAll();
	
}
function clearDetails(){
	 
	document.AnnualRegForm.firstNameId.value="";
	document.AnnualRegForm.lastNameId.value="";
	document.AnnualRegForm.phoneId.value="";
	document.AnnualRegForm.phoneId1.value="";
	document.AnnualRegForm.newClubId.value="";
	document.AnnualRegForm.pclub[0].checked="false"
	document.AnnualRegForm.pclub[1].checked="true"
	document.AnnualRegForm.newStateId.value="--Select--";
	document.AnnualRegForm.newBadgeId.value="";
	document.AnnualRegForm.regAmountId.value="0.00";
	document.AnnualRegForm.activityAmount.value="0.00";
	document.AnnualRegForm.newRegTypeId.selectedIndex=0;
	var valLen = document.AnnualRegForm.priceIdLen.value;	
	for(i=1;i<=valLen;i++){
		var amtbx = "AmtBx"+i;
		var pricebx = "priceId"+i;
		document.getElementById(amtbx).value="0.00";
		document.getElementById(pricebx).value = "";		
	}
	document.getElementById("meeDates").style.display = "none";
	checkAll();
	showHideRadio('rf','ponyClubber','mem');
}

function clearByPony(){
	document.AnnualRegForm.regAmountId.value="0.00";
	document.AnnualRegForm.activityAmount.value="0.00";
	document.AnnualRegForm.newRegTypeId.selectedIndex=0;
	var valLen = document.AnnualRegForm.priceIdLen.value;
	for(i=1;i<=valLen;i++){
		var amtbx = "AmtBx"+i;
		var pricebx = "priceId"+i;
		document.getElementById(amtbx).value="0.00";
		document.getElementById(pricebx).value = "";		
	}
	document.getElementById("meeDates").style.display = "none";
	checkAll();
}

function clearNotHLCdetails(){
	document.AnnualRegForm.userNameId1.value="";
	document.AnnualRegForm.firstNameId1.value="";
	document.AnnualRegForm.lastNameId1.value="";
	document.AnnualRegForm.phoneId1.value="";
	document.AnnualRegForm.newClubId.value="";
	document.AnnualRegForm.pclub[0].checked="false"
	document.AnnualRegForm.pclub[1].checked="true"
	document.AnnualRegForm.newClubNameId.value="";
	document.AnnualRegForm.newBadgeId.value="";
	document.AnnualRegForm.newStateId.value="--Select--";
	document.AnnualRegForm.regAmountId.value="0.00";
	document.AnnualRegForm.activityAmount.value="0.00";
	document.AnnualRegForm.newRegTypeId.selectedIndex=0;
	var valLen = document.AnnualRegForm.priceIdLen.value;
	for(i=1;i<=valLen;i++){
		var amtbx = "AmtBx"+i;
		var pricebx = "priceId"+i;
		document.getElementById(amtbx).value="0.00";
		document.getElementById(pricebx).value = "";		
	}
	document.getElementById("meeDates").style.display = "none";
	checkAll();
}

function clearNewdetails(){
	document.AnnualRegForm.newFirstNameId.value="";
	document.AnnualRegForm.newBadgeId.value="";
	document.AnnualRegForm.newClubId.value="";
	document.AnnualRegForm.newClubNameId.value="";
	document.AnnualRegForm.pclub.value="no"
	document.AnnualRegForm.newLastNameId.value="";
	document.AnnualRegForm.newBirthmonthId.value="";
	document.AnnualRegForm.newBirthdayId.value="";
	document.AnnualRegForm.newBirthyearId.value="";
	document.AnnualRegForm.sexId.value="";
	document.AnnualRegForm.newAddressId.value="";
	//document.AnnualRegForm.newCountryId.value="USA";
	document.AnnualRegForm.newStateId.value="--Select--";
	document.AnnualRegForm.newCityId.value="";
	document.AnnualRegForm.newZipId.value="";
	document.AnnualRegForm.newEmailId.value="";
	document.AnnualRegForm.newPhoneId.value="";
	document.AnnualRegForm.newFax.value="";
	document.AnnualRegForm.regAmountId.value="0.00";
	document.AnnualRegForm.activityAmount.value="0.00";
	document.AnnualRegForm.newRegTypeId.selectedIndex=0;
	var valLen = document.AnnualRegForm.priceIdLen.value;
	for(i=1;i<=valLen;i++){
		var amtbx = "AmtBx"+i;
		var pricebx = "priceId"+i;
		document.getElementById(amtbx).value="0.00";
		document.getElementById(pricebx).value = "";		
	}
	document.getElementById("meeDates").style.display = "none";
	checkAll();
}
function concatVal(){
document.AnnualRegForm.newBadge.value= document.AnnualRegForm.newFirstName.value+" "+document.AnnualRegForm.newLastName.value;
}
function myvalidate(){

//===================================For radio Button====================================
	chosen="";
	len = document.AnnualRegForm.rself.length ;
	for(i=0;i<len;i++){
		if(document.AnnualRegForm.rself[i].checked){
			chosen= document.AnnualRegForm.rself[i].value; 
		}
	}
	if(chosen==""){
		alert("Select the Membership Information");


		return false;
	}

//===============================For HLC Member Information=================================
	if(chosen=="mem"){
		if(document.AnnualRegForm.userNameId.value==""){
			alert("Member Id cant be Empty");
			document.AnnualRegForm.userNameId.focus();
			return false;
		}
		if(isnotSpecial(document.AnnualRegForm.userNameId.value)){
			alert("UserName is not valid");
			document.AnnualRegForm.userNameId.focus();
			return false;
		}
		if((document.AnnualRegForm.userNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.userNameId.value.indexOf(' ')==0)){
			alert("User Name is not valid");
			document.AnnualRegForm.userNameId.focus();
			return false;
		}
		if(document.AnnualRegForm.userNameId.value.length > 80){
			alert("User Name is not valid");
			document.AnnualRegForm.userNameId.focus();
			return false;
		}
	}

//===============================For Web User Information=================================
	if(chosen=="web"){
		if(document.AnnualRegForm.userNameId1.value==""){
			alert("UserName is Empty");
			document.AnnualRegForm.userNameId1.focus();
			return false;
		}
		if(isnotSpecial(document.AnnualRegForm.userNameId1.value)){
			alert("UserName is not valid");
			document.AnnualRegForm.userNameId1.focus();
			return false;
		}
		if((document.AnnualRegForm.userNameId1.value.indexOf('  ')!=-1)||(document.AnnualRegForm.userNameId1.value.indexOf(' ')==0)){
			alert("User Name is not valid");
			document.AnnualRegForm.userNameId1.focus();
			return false;
		}
		if(document.AnnualRegForm.userNameId1.value.length > 80){
			alert("User Name is not valid");
			document.AnnualRegForm.userNameId1.focus();
			return false;
		}

//==========================================For Pony Club Details============================
		chosen="";
		len = document.AnnualRegForm.pclub.length ;
		for(i=0;i<len;i++){
			if(document.AnnualRegForm.pclub[i].checked){
				chosen= document.AnnualRegForm.pclub[i].value;
			}
		}
		if(chosen==""){
			alert("Check any of the Pony Club Member Option.");
			return false;
		}
		
//=============================for club memebr Id===================================
		if(chosen=="yes"){
			 
			 
			if((document.AnnualRegForm.newClubId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubId.value.indexOf(' ')==0)){
				alert("Club MemberId is not valid");
				document.AnnualRegForm.newClubId.focus();
				return false;

			}
			if(document.AnnualRegForm.newClubId.value.length > 80){
				alert("Club MemberId is not valid");
				document.AnnualRegForm.newClubId.focus();
				return false;
			}
		
	//====================================for club member =========================================
			if(document.AnnualRegForm.newClubNameId.value==""){
				alert("Club Member Name is Empty");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
			 
			if((document.AnnualRegForm.newClubNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubNameId.value.indexOf(' ')==0)){
				alert("Club Member Name is not valid");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
			if(document.AnnualRegForm.newClubNameId.value.length > 80){
				alert("Club Member Name is not valid");
				document.AnnualRegForm.newClubNameId.focus();


				return false;
			}
		}
	}

//===============================For New User Information =================================

	if(chosen=="new"){
	if(document.AnnualRegForm.newFirstNameId.value==""){
			alert("First Name is Empty");
			document.AnnualRegForm.newFirstNameId.focus();
			return false;
		}
//==================================for first Name =======================================
	  if((document.AnnualRegForm.newFirstNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newFirstNameId.value.indexOf(' ')==0)){
			alert("First Name is not valid");
			document.AnnualRegForm.newFirstNameId.focus();
			return false;
		}	
		if(document.AnnualRegForm.newFirstNameId.value.length > 80){
			alert("First Name is not valid");
			document.AnnualRegForm.newFirstNameId.focus();
			return false;
		}
//=====================================for Last Name ============================================
		if(document.AnnualRegForm.newLastNameId.value==""){
			alert("Last Name is Empty");
			document.AnnualRegForm.newLastNameId.focus();
			return false;
		}
		if(isnotAlpha(document.AnnualRegForm.newLastNameId.value)){
			alert("Last Name is not valid");
			document.AnnualRegForm.newLastNameId.focus();
			return false;
		}
		if((document.AnnualRegForm.newLastNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newLastNameId.value.indexOf(' ')==0)){
			alert("Last Name is not valid");
			document.AnnualRegForm.newLastNameId.focus();
			return false;
		}	
		if(document.AnnualRegForm.newLastNameId.value.length > 80){
			alert("Last Name is not valid");
			document.AnnualRegForm.newLastNameId.focus();
			return false;
		}
//============================= DOB ========================================================

		if(document.AnnualRegForm.newBirthmonthId.value==""){
			alert(" Select Month in Date of Birth ");
			document.AnnualRegForm.newBirthmonthId.focus();
			return false;
		}
		if(!(document.AnnualRegForm.newBirthmonthId.value=="")){
			leno=document.AnnualRegForm.newBirthmonthId.length;
			for(i=0;i<leno;i++){
				if(document.AnnualRegForm.newBirthmonthId[i].selected){
					choseno=document.AnnualRegForm.newBirthmonthId[i].value ;
				}
			}
		}

//------month checking----
		var lyear=document.AnnualRegForm.newBirthyearId.value;
		var lcheck=(lyear%4);

		if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 2)&&(document.AnnualRegForm.newBirthdayId.value >29)&&(lcheck=="0")){
			alert ("Date is not valid") ;
			document.AnnualRegForm.newBirthdayId.focus();
			return false;
		}
		var lyear1=document.AnnualRegForm.newBirthyearId.value;
		var lcheck1=(lyear1%4);

		if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 2)&&(document.AnnualRegForm.newBirthdayId.value >28)&&(lcheck1>0)){
			alert ("Date is not valid") ;
			document.AnnualRegForm.newBirthdayId.focus();
			return false;
		}
		if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 4)&&(document.AnnualRegForm.newBirthdayId.value=="31")){
			alert ("Date is not valid") ;
			document.AnnualRegForm.newBirthdayId.focus();
			return false;
		}
		if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 6)&&(document.AnnualRegForm.newBirthdayId.value=="31")){
			alert ("Date is not valid") ;
			document.AnnualRegForm.newBirthdayId.focus();
			return false;
		}
		if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 9)&&(document.AnnualRegForm.newBirthdayId.value=="31")){
			alert ("Date is not valid") ;
			document.AnnualRegForm.newBirthdayId.focus();
			return false;
		}
		if((document.AnnualRegForm.newBirthmonthId.selectedIndex== 11)&&(document.AnnualRegForm.newBirthdayId.value=="31")){
			alert ("Date is not valid") ;
			document.AnnualRegForm.newBirthdayId.focus();
			return false;
		}
		if(document.AnnualRegForm.newBirthdayId.value==""){
			alert(" Select Day in Date of Birth");
			document.AnnualRegForm.newBirthdayId.focus();
			return false;
		}
		if(!(document.AnnualRegForm.newBirthdayId.value=="")){
			leno=document.AnnualRegForm.newBirthdayId.length;
			for(i=0;i<leno;i++){
				if(document.AnnualRegForm.newBirthdayId[i].selected){
					choseno=document.AnnualRegForm.newBirthdayId[i].value ;
				}
			}
		}
		if(document.AnnualRegForm.newBirthyearId.value==""){
			alert(" Select Year in Date of Birth");
			document.AnnualRegForm.newBirthyearId.focus();
			return false;
		}
		if(!(document.AnnualRegForm.newBirthyearId.value=="")){
			leno=document.AnnualRegForm.newBirthyearId.length;
			for(i=0;i<leno;i++){ 
				if(document.AnnualRegForm.newBirthyearId[i].selected){
					choseno=document.AnnualRegForm.newBirthyearId[i].value ;
				}
			}
		}

//============================for Gender===========================================
		chosen="";
		len = document.AnnualRegForm.sexId.length ;
		for(i=0;i<len;i++){
			if(document.AnnualRegForm.sexId[i].checked){
				chosen= document.AnnualRegForm.sexId[i].value; 
			}
		}
		if(chosen==""){
			alert("Select the Gender");
			return false;
		}
//==============================For Address =================================
		if(document.AnnualRegForm.newAddressId.value==""){
			alert("Address is not valid");
			document.AnnualRegForm.newAddressId.focus();
			return false;
		}
		if((document.AnnualRegForm.newAddressId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newAddressId.value.indexOf(' ')==0)){
			alert("Address is not valid");
			document.AnnualRegForm.newAddressId.focus();
			return false;
		}	
		if(document.AnnualRegForm.newAddressId.value.length > 255){
			alert("Address is not valid");
			document.AnnualRegForm.newAddressId.focus();
			return false;
		}

//================================= For Country ===================================
		var cdln = "";
		if(typeof(window.document.AnnualRegForm.newCountryId) == 'object'){
			if (window.document.AnnualRegForm.newCountryId.value != ""){
				var clid;
				clid = window.document.AnnualRegForm.newCountryId[window.document.AnnualRegForm.newCountryId.selectedIndex].value;
				cdln = clid;
			}
			if(cdln == "Select One"){
				alert("Please select the Country");
				window.document.AnnualRegForm.newCountryId.focus();
				return false;
			}
		}
		if(document.AnnualRegForm.newCountryId.selectedIndex == 0 ){
			alert ( "Please select the Country." );
			document.AnnualRegForm.newCountryId.focus();
			return false;
		}

//================================ For State ====================================
		var edln = "";
		if(typeof(window.document.AnnualRegForm.newStateId) == 'object'){
			if (window.document.AnnualRegForm.newStateId.value != ""){
				var lid;
				lid = window.document.AnnualRegForm.newStateId[window.document.AnnualRegForm.newStateId.selectedIndex].value;
				edln = lid;
			}
			if(edln.length == 1){
				alert("Please select the State.");
				window.document.AnnualRegForm.newStateId.focus();
				return false;
			}
		} 
		if ( document.AnnualRegForm.newStateId.selectedIndex == 0 ){
			alert ( "Please select the State Name." );
			document.AnnualRegForm.newStateId.focus();
			return false;
		}
//__________________________________________city___________________________________________________________________
		if(document.AnnualRegForm.newCityId.value==""){
			alert(" Enter City Name in New User Information ");
			document.AnnualRegForm.newCityId.focus();
			return false; 
		}
		if(document.AnnualRegForm.newCityId.value.indexOf(' ')==0){
			alert("Enter City Name in User Information.");
			document.AnnualRegForm.newCityId.focus();
			return false; 
		}
		if(isnotAlpha(document.AnnualRegForm.newCityId.value)){
			alert("Enter Valid City in New User Information ");
			document.AnnualRegForm.newCityId.focus();
			return false; 
		}
		if(Dospace(document.AnnualRegForm.newCityId.value)){
			alert("Enter Valid City in New User Information");
			document.AnnualRegForm.newCityId.focus();
			return false; 
		}
		if( document.AnnualRegForm.newCityId.value.length > 80 ){
			alert("Enter within 80 characters for City in New User Information" );
			document.AnnualRegForm.newCityId.focus();
			return false; 
		}

//___________________________________________________ZipCode_________________________________________________________
		if(document.AnnualRegForm.newZipId.value==""){
			alert("Enter the Zipcode.");
			document.AnnualRegForm.newZipId.focus();
			return false;
		}
		if(isnotZipcode(document.AnnualRegForm.newZipId.value)){
			alert("Enter Valid Zipcode.");
			document.AnnualRegForm.newZipId.focus();
			return false;
		}
		if((document.AnnualRegForm.newZipId.value.length<2)||(document.AnnualRegForm.newZipId.value.length>20)){
			alert("Zipcode must be above 2 digits and below 20 digits.");
			document.AnnualRegForm.newZipId.focus();
			return false;
		}
		if(document.AnnualRegForm.newZipId.value.indexOf('.')!=-1){
			alert("Enter valid Zip code.");
			document.AnnualRegForm.newZipId.focus();
			return false;
		}

//--------------------------------------EMAIL---------------------------------------
		if(document.AnnualRegForm.newEmailId.value==""){
			alert("Enter your Email ID");
			document.AnnualRegForm.newEmailId.focus();
			return false;
		}
		if(!(document.AnnualRegForm.newEmailId.value== "")){
			strmail=document.AnnualRegForm.newEmailId.value;
			firstat = strmail.indexOf("@");
			lastat = strmail.lastIndexOf("@");
			strmain=strmail.substring(0,firstat);
			strsub=strmail.substring(firstat,document.AnnualRegForm.newEmailId.value.length);
			if(strmail.length>120){
				alert("Email is out of range");
				document.AnnualRegForm.newEmailId.focus();
				return false;
			}
			if(strmain.indexOf('  ')!=-1 || firstat==0 || strsub.indexOf(' ')!=-1 ){
				alert("Enter valid Email ");
				document.AnnualRegForm.newEmailId.focus();
				return false;
			}
			if(isnotSpecial(strmain) || isnotSpecial(strsub)){
				alert("Enter valid Email ");
				document.AnnualRegForm.newEmailId.focus();
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
				alert("Enter valid Email ");
				document.AnnualRegForm.newEmailId.focus();
				return false;
			}
			if(firstat==-1 || lastat==-1){
				alert("Enter valid Email" );
				document.AnnualRegForm.newEmailId.focus();
				return false;
			}
			if(Number(strmain)){
				alert("Enter valid Email ");
				document.AnnualRegForm.newEmailId.focus();
				return false;
			}
			if(firstat != lastat ){
				alert("Enter valid Email ");
				document.AnnualRegForm.newEmailId.focus();
				return false;
			}
			firstdot=strmail.indexOf(".",firstat);
			lastdot=strmail.lastIndexOf(".");
			if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1){
				alert("Enter valid Email ");
				document.AnnualRegForm.newEmailId.focus();
				return false;
			}
		}

//----------------------IF ENTER PHONE ---------------------------------------
		if(document.AnnualRegForm.newPhoneId.value==""){
			alert("Enter Phone Number");
			document.AnnualRegForm.newPhoneId.focus();
			return false;
		}
		if(document.AnnualRegForm.newPhoneId.value!=""){
			var s1=document.AnnualRegForm.newPhoneId.value.indexOf('(');
			var s2=document.AnnualRegForm.newPhoneId.value.indexOf(')');
			var s5=document.AnnualRegForm.newPhoneId.value.indexOf('+');
			var s6=document.AnnualRegForm.newPhoneId.value.lastIndexOf('+');
			var s7=document.AnnualRegForm.newPhoneId.value.indexOf('-');
			var s8=document.AnnualRegForm.newPhoneId.value.lastIndexOf('-');
			var s3=1+s2;
			var s4=1+s1;
			if(s1==s3){
				alert("Enter valid Phone Number");
				document.AnnualRegForm.newPhoneId.focus();
				return false;
			}
			if(s2==s4){
				alert("Enter valid Phone Number");
				document.AnnualRegForm.newPhoneId.focus();
				return false;
			}
			if(s5!=s6){
				alert("Enter valid Phone Number");
				document.AnnualRegForm.newPhoneId.focus();
				return false;
			}
			if(s7!=s8){
				alert("Enter valid Phone Number");
				document.AnnualRegForm.newPhoneId.focus();
				return false;
			}
			len7=document.AnnualRegForm.newPhoneId.value.length;
			strnum = document.AnnualRegForm.newPhoneId.value;
			var GoodChars = "0123456789()-+ ";
			valid = 1;
			for(j=0;j<len7;j++){
				if(GoodChars.indexOf(strnum.charAt(j))==-1){
					valid=0;
				}
			}
			if(valid!=1){
				alert("Enter valid Phone Number");
				document.AnnualRegForm.newPhoneId.focus();
				return false;
			}
			if(document.AnnualRegForm.newPhoneId.value.length>40){
				alert("Phone Number should not exceed 40 characters.");
				document.AnnualRegForm.newPhoneId.focus();
				return false;
			}
		}

//-----------------------------------------FAX--------------------------------
		if(document.AnnualRegForm.newFax.value!=""){
			// alert('1');
			var s1=document.AnnualRegForm.newFax.value.indexOf('(');
			var s2=document.AnnualRegForm.newFax.value.indexOf(')');
			var s5=document.AnnualRegForm.newFax.value.indexOf('+');
			var s6=document.AnnualRegForm.newFax.value.lastIndexOf('+');
			var s7=document.AnnualRegForm.newFax.value.indexOf('-');
			var s8=document.AnnualRegForm.newFax.value.lastIndexOf('-');
			var s3=1+s2;
			var s4=1+s1;
						if(s1==s3){
							alert("Enter valid fax ");
							document.AnnualRegForm.newFax.focus();
							return false;
						}
						if(s2==s4){
							alert("Enter valid fax ");
							document.AnnualRegForm.newFax.focus();
							return false;
						}
						if(s5!==s6){
							alert("Enter valid fax ");
							document.AnnualRegForm.newFax.focus();
							return false;
						}
						if(s7!==s8){
							alert("Enter valid fax ");
							document.AnnualRegForm.newFax.focus();
							return false;
						}
//alert('2');
						len7=document.AnnualRegForm.newFax.value.length;
						strnum = document.AnnualRegForm.newFax.value;
						var GoodChars = "0123456789()-+ ";
						valid = 1;
						for(j=0;j<len7;j++){
							if(GoodChars.indexOf(strnum.charAt(j))==-1){
								valid=0;
							}
						}
						//alert('3');
						if(valid!=1){
							alert("Enter valid fax ");
							document.AnnualRegForm.newFax.focus();
							return false;
						}
						//alert('4');
						if(document.AnnualRegForm.newFax.value.length>40){
							alert("Enter valid Fax ");
							document.AnnualRegForm.newFax.focus();
							return false;
						}
						
						 // alert('5');
 		          }
//==========================================For Pony Club Details============================
		chosen="";
		len = document.AnnualRegForm.pclub.length ;
		for(i=0;i<len;i++){
			if(document.AnnualRegForm.pclub[i].checked){
				chosen= document.AnnualRegForm.pclub[i].value;
			}
		}
		if(chosen==""){
			alert("Check any of the Pony Club Member Option.");
			return false;
		}
	
//=============================for club memebr Id===================================
		if(chosen=="yes"){
			if((document.AnnualRegForm.newClubId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubId.value.indexOf(' ')==0)){
				alert("Club MemberId is not valid");
				document.AnnualRegForm.newClubId.focus();
				return false;
			}
			if(document.AnnualRegForm.newClubId.value.length > 80){
				alert("Club MemberId is not valid");
				document.AnnualRegForm.newClubId.focus();
				return false;
			}
		
//====================================for club member =========================================
			if(document.AnnualRegForm.newClubNameId.value==""){
				alert("Club Member Name is Empty");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
			if(isnotSpecial(document.AnnualRegForm.newClubNameId.value)){
				alert("Club Member Name is not valid");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
			if((document.AnnualRegForm.newClubNameId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newClubNameId.value.indexOf(' ')==0)){
				alert("Club Member Name is not valid");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
			if(document.AnnualRegForm.newClubNameId.value.length > 80){
				alert("Club Member Name is not valid");
				document.AnnualRegForm.newClubNameId.focus();
				return false;
			}
		}
	}
//==================================== for Badge Information ====================================

	if(document.AnnualRegForm.newBadgeId.value==""){
		alert("Badge Name cannot be Empty");
		document.AnnualRegForm.newBadgeId.focus();
		return false;
	}
	
	if((document.AnnualRegForm.newBadgeId.value.indexOf('  ')!=-1)||(document.AnnualRegForm.newBadgeId.value.indexOf(' ')==0)){
		alert("Badge Name is not valid");
		document.AnnualRegForm.newBadgeId.focus();
		return false;
	}
	if(document.AnnualRegForm.newBadgeId.value.length > 80){
		alert("Badge Name is not valid");
		document.AnnualRegForm.newBadgeId.focus();
		return false;
	}
//alert(' Val is '+document.getElementById('newRegTypeId').value);

	if(document.getElementById('newRegTypeId').value==""){
		alert("Select any one of the Registration Type");
		document.AnnualRegForm.newRegTypeId.focus();
		return false;	
	}
	
 	
  var obj = document.getElementById("newRegTypeId");
  var selText = obj.options[obj.selectedIndex].text;
	if(selText=='Daily Basis'){
	 var ret = checkCheckboxValidation();
	 //alert(ret);
	 if(ret==0){
	   return false;
	 }
		 
	}
//==================================for Special Accomodation Information======================
	chosen="";
	len = document.AnnualRegForm.accom.length ;
	for(i=0;i<len;i++){
		if(document.AnnualRegForm.accom[i].checked){
			chosen= document.AnnualRegForm.accom[i].value;
		}
	}
	if(chosen==""){
		alert("Check any of the Special Accomodation Option.");
		return false;
	}
	if (chosen=="yes1"){
		if(document.AnnualRegForm.accomId.value == ""){
			alert("Special Accomodation Information cannot be Empty");
			document.AnnualRegForm.accomId.focus();
			return false;
		}
		if(document.AnnualRegForm.accomId.value.length >1024){
			alert("Special Accomodation Information is not valid");
			document.AnnualRegForm.accomId.focus();
			return false;
		}
	}
		
	var totamt =  eval(document.AnnualRegForm.regAmount.value) + eval(document.AnnualRegForm.activityAmount.value);	
   //alert(totamt);
	if(totamt == 0 ){
		alert("Please select any other activity or registration activity");
		document.AnnualRegForm.activityAmount.focus();
		return false;
	}		
	
		return true;
}

</script>

</head>



<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
			<div class="col-md-2 pad">
		
		<!--==============================include infobar Here=================================-->
		
            <%@ include file = "../../include/infobar.jsp" %>
			
		<!--==============================include infobar Here=================================-->
		
			</div>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Meetings: Annual Meeting & Convention Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="AnnualRegForm" id="AnnualRegForm" method="post" action="annConRegInsert.html" onsubmit="return myvalidate();">
							
                               <input type="hidden" name="annProcess" value="insertAnnual">
							   
							   <p>Fields marked with an asterisk<span style="color:#FF0000;">(*)</span>are required.</p>
							   
							  
								
								 <%
							  	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
							  Vector memDet = (Vector)request.getAttribute("MEMBER_TYPE");
							 // out.print("memDet" + memDet);
							  String memberId = "";
							  String memberName = "";
							  String memberTypeId = "";
							  String nonMemberTypeId = "";
							  String juniorMemberTypeId = "";
							  
							  if(memDet!=null && memDet.size()!=0){
							  Enumeration eDet = memDet.elements();
							  while(eDet.hasMoreElements()){
									String[] det = (String [])eDet.nextElement();

									memberId = det[0];
									memberName = det[1];
									if(memberName.equals("USEA Member")) memberTypeId = memberId;
									if(memberName.equals("Non Member")) nonMemberTypeId = memberId;
									if(memberName.equals("Junior Member")) juniorMemberTypeId = memberId;
							
							  }
							  }
	//out.println("memberTypeId:" +memberTypeId);
	//out.println("<br>nonMemberTypeId:" +nonMemberTypeId);
	//out.println("<br>juniorMemberTypeId:" +juniorMemberTypeId);
							  %>
							   

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>I am  registering for: (choose one)</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-8 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="radio" size="10" name="rf" id="rself" value="mem" onclick="showId();switchDiv('member'), showHideRadio('rf','webUser','mem'), showHideRadio('rf','newUser','mem'), showHideRadio('rf','ponyClubber','mem'), clearNotHLCdetails(), clearNewdetails(); " />
								A current Member (requires ID number). <br />
								<input type="radio" size="10" name="rf" id="rself" value="web" onclick="showId1();switchDiv('webUser'), showHideRadio('rf','newUser','web'),showHideRadio('rf','ponyClubber','mem'); showHideRadio('rf','member','web'), clearNewdetails(), clearHLCdetails(); " />
								A Member with a webuser account (requires username).<b>Non-Member Pricing  </b><br />
								<input type="radio" size="10" name="rf" id="rself" value="new" onclick="showId2();switchDiv('newUser'), showHideRadio('rf','member','new'),showHideRadio('rf','ponyClubber','mem'); showHideRadio('rf','webUser','new'), clearHLCdetails(), clearNotHLCdetails();" />
								A Member without a webuser account.
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
									<input type="hidden" name="memberType" id="memberType" value="<%=memberTypeId%>">
									<input type="hidden" name="nonMemberType" id="nonMemberType" value="<%=nonMemberTypeId%>">
									<input type="hidden" name="juniorMemberType" id="juniorMemberType" value="<%=juniorMemberTypeId%>">
									<input type="hidden" name="membershipTypeFinalId" id="membershipTypeFinalId" value="">
									<input type="hidden" name="finalTypId" id="finalTypId" value="">   
									<input type="hidden" name="userId" id="userDetId" />
									<input type="hidden" name="dob" id="dobId" value="" />
									<input type="hidden" name="age" id="ageId" value="" />
									<input type="hidden" name="memberName" value="" />
									<input type="hidden" name="regPriceId" value=""/>
									<input type="hidden" name="areaIv" value=""/>
									<input type="hidden" id="membStat" name="membStat" value="" />

									
									<input type="hidden" name="luncheon" value=""/>
									<input type="hidden" name="fameDinner" value=""/>
								<p class="para col-md-offset-1">Membership Information:</p>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="userName" id="userNameId" class="form-control" size="20" onblur="userDetails(this);" />
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="firstName" class="form-control" id="firstNameId"  value=""  readonly="readonly" />
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="lastName" class="form-control" id="lastNameId"  value=""  readonly="readonly" />
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone: (Last 4 digits)</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             xxx-xxx-<input name="phone" class="form-control" id="phoneId" value=""  readonly="readonly" />
                                            </div>
                                        </div>

                                    </div> 
								</div>
									
								
								<p class="para col-md-offset-1">
								Web User Information:</p>
									
									
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Username:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="uName" id="userNameId1" class="form-control"  onblur="nonUserDetails(this);"/>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div> 
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="firstNameId1" class="form-control" id="firstNameId1"  value=" "  readonly="readonly" />
                                            </div>
                                        </div>

                                    </div> 
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="lastNameId1" class="form-control" id="lastNameId1"  value=" " readonly="readonly" />
                                            </div>
                                        </div>

                                    </div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone: (Last 4 digits)</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             xxx-xxx-<input name="ph" id="phoneId1" class="form-control"  value=" " readonly="readonly" />
                                            </div>
                                        </div>

                                    </div>
								</div>
									
					<p class="para col-md-offset-1">New User Information:</p>
									
									
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="newFirstName" id="newFirstNameId" class="form-control"  />
											    <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newLastName" id="newLastNameId" class="form-control" onblur="concatVal();" />
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Date of Birth:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<select name="newBirthmonth" id="newBirthmonthId" class="form-control" onchange="showAge();">
														  <option value="" selected="selected">Month</option>
														  <option value="01">January</option>
														  <option value="02">February</option>
														  <option value="03">March</option>
														  <option value="04">April</option>
														  <option value="05">May</option>
														  <option value="06">June</option>
														  <option value="07">July</option>
														  <option value="08">August</option>
														  <option value="09">September</option>
														  <option value="10">October</option>
														  <option value="11">November</option>
														  <option value="12">December</option>
												  </select>
												  <select name="newBirthday" id="newBirthdayId" class="selectboxOne" onchange="showAge();">
														  <option value="" selected="selected">Day</option>
														  <option value="01">01</option>
														  <option value="02">02</option>
														  <option value="03">03</option>
														  <option value="04">04</option>
														  <option value="05">05</option>
														  <option value="06">06</option>
														  <option value="07">07</option>
														  <option value="08">08</option>
														  <option value="09">09</option>
														  <option value="10">10</option>
														  <option value="11">11</option>
														  <option value="12">12</option>
														  <option value="13">13</option>
														  <option value="14">14</option>
														  <option value="15">15</option>
														  <option value="16">16</option>
														  <option value="17">17</option>
														  <option value="18">18</option>
														  <option value="19">19</option>
														  <option value="20">20</option>
														  <option value="21">21</option>
														  <option value="22">22</option>
														  <option value="23">23</option>
														  <option value="24">24</option>

														  <option value="25">25</option>
														  <option value="26">26</option>
														  <option value="27">27</option>
														  <option value="28">28</option>
														  <option value="29">29</option>
														  <option value="30">30</option>
														  <option value="31">31</option>
												  </select>
													<select name="newBirthyear" id="newBirthyearId" class="selectboxOne" onchange="showAge();">
														  <option value="" selected="selected" >Year</option>
															<%
															for(int i=1900;i<=2006;i++)
															{%>
															  <option  value="<%=i%>"><%=i%></option>
																												
															<%}%>
													</select>
													 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Gender:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           	<input type="radio" size="10" name="sex" id="sexId" value="male"> Male
											<input type="radio" size="10" name="sex" id="sexId" value="female"> Female
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newAddress" id="newAddressId" class="form-control" />
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<select name="newCountry" id="newCountryId" class="form-control" onchange="FillState(document.AnnualRegForm.newCountryId, document.AnnualRegForm.newStateId, '');">
                                                </select>
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<select name="newState" id="newStateId" class="form-control">
							 					 </select>
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newCity" id="newCityId" class="form-control"  />
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip Code::</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newZip" id="newZipId" class="form-control"  />
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>e-Mail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newEmail" id="newEmailId" class="form-control"/>
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newPhone" id="newPhoneId" class="form-control"/>
												 <span id="span_astriesk">*</span>
												 (xx yy zzzz)
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		  <input name="newFax" id="newFax" class="form-control"  />
                                            </div>
                                        </div>

                                    </div>
								</div>
								
<p class="para col-md-offset-1">Pony Club Details:</p>
									
									
								<div class='form-group'>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Is the participant a Pony Clubber?:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input type="radio" size="10" name="pclub" id="pclub" value="yes" onclick="clearByPony();showId3();enabDisabPony('pclub','newClubId','yes'), enable();"/>Yes
												  <input type="radio" size="10" name="pclub" id="pclub" checked="checked" value="no" onclick="clearByPony();showId4();disable();" />No
                                            </div>
                                        </div>

                                    </div>
								</div>
                                   								
									<div class="form-group">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Club Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newClub" id="newClubId" class="form-control"  value="" disabled="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Club Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newClubName" id="newClubNameId" class="form-control" value="" disabled="true" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								
								<p class="para col-md-offset-1">Badge Information:</p>
									
									
								<div class='form-group'>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Name of Badge:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input name="newBadge" id="newBadgeId" class="form-control"  />
												 <span id="span_astriesk">*</span> 
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<p class="para col-md-offset-1">Registration Information:
									
								</p>
									
									
								<div class='form-group'>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Registration Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		 <%
													  Vector regType = (Vector)request.getAttribute("DisplayRegTypeDetails");
													 %>
												<select name="newRegTypeId" id="newRegTypeId" class="selectboxOne" onchange="deSelectAll();showDates();getRegAmount();" >	
												<option selected="selected" value="">Select One</option>
											 <%   
												 
												  if(regType!=null && regType.size()!=0){
												  String specificationId ="";
												  String specificationName ="";
												  String specTransactionId = "";
												  Enumeration e = regType.elements();
															while(e.hasMoreElements()){
															String[] s = (String [])e.nextElement();
																		   
															specificationId = s[0];
															specificationName = s[1];
															specTransactionId = s[2];
															String trans_id = s[0]+"#"+s[2];
													%>
													<option value="<%=trans_id%>" ><%=specificationName%></option>
													<%		
													 }
												  }
																			
												%>
										</select>
										<span id="span_astriesk">*</span> 
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								
							<div class='form-group'>
								<div id="meeDates">
									
									 <%
								 ArrayList alist =(ArrayList)request.getAttribute("MEETING_DATES");
								 %>
								 <input type="hidden" id="meetDates" value="<%=alist.size()%>" name="meetDates" />
								 <%
								 if(alist!=null && alist.size()!=0){
								 	Iterator it = alist.iterator();
									while(it.hasNext()){
									String val =(String)it.next();
									String[] splitdte = val.split(",");
									%>
									
									<div class='col-md-offset-3'>
										<input type="checkbox" name="meetingDates" id="meetingDateId+<%=val%>" value="<%=splitdte[0]%>" onclick="calcTotalRegAmnt();checkAllValidation(); " /><%=val%>
									</div>
									
							
							<%}}%> 
							
									</div>
							</div>
							
							
							<div class='form-group'>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		 $<input type="text" name="regAmount" id="regAmountId" class="form-control"  value="0" readonly="true"/>
												  <input name="status" type="hidden" id="status" class="textboxOne" size="20" value=""/>
												  
												<input type="hidden" name="originalAmnt" id="originalAmntId" class="textboxOne" size="20" />
                                            </div>
                                        </div>

                                    </div>
								</div>
								
							<p>This person will participate in the following activities: (check all that apply)</p>
								
								<%
							  				Vector otherType = (Vector)request.getAttribute("OTHER_ACTIVITY");
										  //out.print(regType.size());
										  String priceIdLen = "0";
										  
										  if(otherType!=null){
										  	priceIdLen = String.valueOf(otherType.size());
										  }
										  
										  
							           %>
									   
									   <input type="hidden" name="priceIdLen" value="<%=priceIdLen%>" />
									   
									   <%
											if(otherType!=null && otherType.size()!=0){
											Enumeration otherEnum = otherType.elements();
											int txtCount = 0;
											while(otherEnum.hasMoreElements()){
											String[] s = (String [])otherEnum.nextElement();
											txtCount ++;
							     			%>
											<input type="hidden" value="<%=s[2]%>" name="activityId" />
											
											<div class="form-group">
											   <div class="container">
											      <div class="row">
												     <div class='col-md-3 col-md-offset-1 '>
										               <input type="checkbox" name="actCheckBox<%=txtCount%>" id="actCheckBox<%=txtCount%>" value="<%=s[0]%>" onclick="calculateAmount();getActivityAmount(this,<%=txtCount%>);calculateAmount();"/><%=s[1]%>
												      </div>	
													  <div class='col-md-4'>
                                                         $<input name="AmtBx<%=txtCount%>" class="form-control" type="text" id="AmtBx<%=txtCount%>" readonly style="background-color:#EEEBE3; font-weight:bold; border:0px;" value="0" />	
                                            	     </div> 
										          </div>
												</div>
                                               </div>												
											
												  
												<div class="col-md-4">
													<input type="hidden" name="trans<%=txtCount%>" id="trans<%=txtCount%>" value="<%=s[2]%>" />
													<input type="hidden" name="newPId<%=txtCount%>" id="newPId<%=txtCount%>" value="0" />
											    </div>
											
											
											
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		<input type="hidden" name="actVal<%=txtCount%>"  value="<%=s[1]%>">
											     
			     								</div>
                                             </div>
                                         </div>
									
									<%} }%> 		
								
								
							<div class='form-group'>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Other Activity Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           		
											$<input type="text" name="activityAmount" id='activityAmount' class="form-control" value="0"  readonly="true" />
                                            </div>
                                        </div>

                                    </div>
								</div>
								<p class="para col-md-offset-1">Special Services:</p>	
								
								<div class='form-group'>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Will this person require special accommodations?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           	<input type="radio" size="10" name="accom" id="accom" value="yes1" onclick="switchDiv('servDetail'),enableText();"/>Yes
										  <input type="radio" size="10" name="accom" id="accom" value="no1" checked="checked" onclick="disableText(),showHideRadio('accom','servDetail','no1');" />No		
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group'>
								 <div id="servDetail">
							       <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Please list any special accommodations or diet requests required to allow full participation:</label>
                                    <div class='col-md-4'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           	<textarea name="accomodation" id="accomId" class="form-control" rows="5" disabled="true" /></textarea>
											<span id="span_astriesk">*</span> 	
                                            </div>
                                        </div>

                                    </div>
								</div>
							</div>	


                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'  name="annButName" value="Register">Register</button>
										
                                    </div>
                                   
                                </div>
								
                            </form>
							
							<!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				

            </div>
			
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>
<script>
	FillCountry(document.AnnualRegForm.newCountryId, document.AnnualRegForm.newStateId, 'USA');
	FillState(document.AnnualRegForm.newCountryId, document.AnnualRegForm.newStateId, '--Select--');
</script>

</html>
