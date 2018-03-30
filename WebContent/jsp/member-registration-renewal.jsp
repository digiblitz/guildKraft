<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="com.hlcform.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlccommon.util.*"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html" charset="iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMembRegi.js" type="text/javascript" ></script>
<script src="javascripts/frmMembRegRenValidate.js" type="text/javascript" ></script>
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script type="text/javascript">
function fillMembType(selYear){
	var d = new Date();
	var curr_year = d.getFullYear();
	if(Number(selYear)==curr_year){
		var futureTypeId = document.getElementById('currmemberTypeId').value;
		var futureAmt = document.getElementById('currmembershipAmount').value;
		var futureName = document.getElementById('currmembershipName').value;		
		
		document.getElementById('memberTypeId').value=futureTypeId;
		document.getElementById('membershipName').value=futureName;			
		document.getElementById('membershipAmount').value=futureAmt; 
		
		var futurefamId = document.getElementById('currfamembId').value;
		var futurefamAmt = document.getElementById('curraddOnAmt').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
	}
	else{
		var futureTypeId = document.getElementById('futuremembId').value;
		var futureAmt = document.getElementById('futurePrice').value;
		var futureName = document.getElementById('currmembershipName').value;
		
		document.getElementById('memberTypeId').value=futureTypeId;
		document.getElementById('membershipName').value=futureName;
		document.getElementById('membershipAmount').value=futureAmt;
		
		var futurefamId = document.getElementById('futrefamId').value;
		var futurefamAmt = document.getElementById('futrefamPrice').value;

		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
	}
}
function fillAmt(){ 
	var selVal = document.getElementById('memTyp_sel').value;
	var splitSelVal = selVal.split('#');
	document.getElementById('amount_txt').value = splitSelVal[2];
}

function showOptBlk(){
	var d = new Date();
	var curr_year = d.getFullYear();
	var month = d.getMonth();
	var memType = document.frmMembRegi.memTypsel.value
	//alert("memType :"+memType);
	
	
	if(month==11 && document.frmMembRegi.memTypsel.value!="Life Member" && document.frmMembRegi.memTypsel.value!="Subscribing Member"){
		//if(document.frmMembRegi.memTypsel.value!="Life Member" && document.frmMembRegi.memTypsel.value!="Subscribing Member"){
		if(document.frmMembRegi.upcomeYr.value=="yes"){
			//alert("1");
			document.getElementById('monthbasedBlk').style.display="none";
			retrieveURL('upgrade',curr_year+1);
			fillMembType(curr_year+1);
			document.frmMembRegi.selYear.value=curr_year+1;
			document.frmMembRegi.upgradeOpt.value = 1;
			document.frmMembRegi.showOpt.value = 0;
			document.frmMembRegi.upgrdCurntYr.value = "no";
		}
		else{
		//alert("2");
			document.getElementById('monthbasedBlk').style.display="none";				
			retrieveUpcomingYrURL('',curr_year+1);
			document.frmMembRegi.upgradeOpt.value = 0;
			document.frmMembRegi.showOpt.value = 0;
			fillMembType(curr_year+1);
			document.frmMembRegi.selYear.value=curr_year+1;
		}
		//}
	}	
	
	else if(document.frmMembRegi.memTypsel.value!="Life Member" && document.frmMembRegi.memTypsel.value!="Subscribing Member" && month==9 || document.frmMembRegi.memTypsel.value!="Life Member" && document.frmMembRegi.memTypsel.value!="Subscribing Member" && month==10 ) {
	//if(document.frmMembRegi.memTypsel.value!="Life Member" && document.frmMembRegi.memTypsel.value!="Subscribing Member"){
	//alert("3");
		document.getElementById('monthbasedBlk').style.display="block";
		document.frmMembRegi.showOpt.value = 1;
	//}
	}
	
	else{
	//else{
	//alert("4");
		var tempD = document.frmMembRegi.expdate.value
		var d = new Date();
		var curr_year = d.getFullYear();
		var curr_month = d.getMonth();
		var splitDte = tempD.split('-');
		var noOfDays = document.frmMembRegi.noDays.value
		//alert("tempD :"+tempD);
		//alert("d :"+d);	
		//alert("noOfDays :"+noOfDays);
		if(noOfDays<=90 && document.frmMembRegi.memTypsel.value=="Subscribing Member"){//alert("6");
		//if(document.frmMembRegi.memTypsel.value=="Subscribing Member"){
		
		   	    retrieveUpcomingYrURL('',curr_year);
				fillMembType(curr_year);
				document.frmMembRegi.upgradeOpt.value = 0;			
				document.frmMembRegi.showOpt.value = 0;			
				document.frmMembRegi.selYear.value=curr_year;
		//}
		}		
		else if(Number(splitDte[0]) < Number(curr_year)){

		//alert("5");
			retrieveUpcomingYrURL('',curr_year);
			fillMembType(curr_year);
			document.frmMembRegi.upgradeOpt.value = 0;			
			document.frmMembRegi.showOpt.value = 0;			
			document.frmMembRegi.selYear.value=curr_year;
		}
		
		else if(Number(splitDte[0]) == Number(curr_year)){
			if(Number(splitDte[1]) < Number(curr_month)+1){
			//alert("7");
				retrieveUpcomingYrURL('',curr_year);
				fillMembType(curr_year);
				document.frmMembRegi.upgradeOpt.value = 0;			
				document.frmMembRegi.showOpt.value = 0;			
				document.frmMembRegi.selYear.value=curr_year;
			}else{
			//alert("8");
				retrieveURL('upgrade',curr_year);
				fillMembType(curr_year);
				document.frmMembRegi.selYear.value=curr_year;
				document.frmMembRegi.upgradeOpt.value = 1;
				document.frmMembRegi.showOpt.value = 0;
			}
		}
		else{  //alert("9");
				retrieveURL('upgrade',curr_year);
				fillMembType(curr_year);
				document.frmMembRegi.selYear.value=curr_year;
				document.frmMembRegi.upgradeOpt.value = 1;
				document.frmMembRegi.showOpt.value = 0;
		}
		document.getElementById('monthbasedBlk').style.display="none";
		document.frmMembRegi.upgrdCurntYr.value = "no";					
	}
}

function showOptClick(){
	var d = new Date();
	var curr_year = d.getFullYear();
	var month = d.getMonth();
	if(document.frmMembRegi.renewOpt[0].checked){
		if(document.frmMembRegi.status.value!="Active"){
			retrieveUpcomingYrURL('',curr_year);
			fillMembType(curr_year);
			document.frmMembRegi.showOpt.value = 1;
			document.frmMembRegi.upgradeOpt.value = 0;
			document.frmMembRegi.selYear.value=curr_year;
		}
		else{
			retrieveURL('upgrade',curr_year);
			fillMembType(curr_year);			
			document.frmMembRegi.showOpt.value = 1;
			document.frmMembRegi.upgradeOpt.value = 1;
			document.frmMembRegi.selYear.value=curr_year;
		}
	}
	else{
		if(document.frmMembRegi.status.value=="Active"){
			if(month<=11){
				if(document.frmMembRegi.upcomeYr.value=="yes"){
					alert('Your membership does not have the privilege for renewal right now');
					document.frmMembRegi.renewOpt[1].checked = false;
				}
				else{
					retrieveUpcomingYrURL('',curr_year+1);		
					document.frmMembRegi.upgradeOpt.value = 0;
					document.frmMembRegi.showOpt.value = 1;
					fillMembType(curr_year+1);
					document.frmMembRegi.selYear.value=curr_year+1;
					document.frmMembRegi.upgrdCurntYr.value = "no";
				}				
			}
			else{
				retrieveUpcomingYrURL('',curr_year+1);		
				document.frmMembRegi.upgradeOpt.value = 0;
				document.frmMembRegi.showOpt.value = 1;
				fillMembType(curr_year+1);
				document.frmMembRegi.selYear.value=curr_year+1;
				document.frmMembRegi.upgrdCurntYr.value = "no";				
			}
		}
		else{
			retrieveUpcomingYrURL('',curr_year+1);		
			document.frmMembRegi.upgradeOpt.value = 0;
			document.frmMembRegi.showOpt.value = 1;
			fillMembType(curr_year+1);
			document.frmMembRegi.selYear.value=curr_year+1;
			document.frmMembRegi.upgrdCurntYr.value = "no";			
		}
	}		
}
var req1;
function retrieveUpcomingYrURL(param,year){

	var membType = document.getElementById('memTypsel').value;
	if(membType!="Life Member"){
		url = "RenewMembTypAjax.html?method=regiMemberType&year="+year;
		if(window.XMLHttpRequest) {
			req1 = new XMLHttpRequest();
		} 
		else if (window.ActiveXObject) {
			req1 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req1.onreadystatechange = displayTypeUpcoming;
	   
		req1.open("GET", url, true);
		req1.send(null);
	}
}
		
function displayTypeUpcoming() {
	if (req1.readyState == 4) { // Complete
		if (req1.status == 200) { // OK response  
			var xmlDoc = req1.responseXML.documentElement;
			var xRows= xmlDoc.getElementsByTagName('entry');	   
			var objDDL = document.getElementById("memTyp_sel");          	          
			objDDL.innerHTML="";

			i = document.getElementById("memTyp_sel").length;
			option = document.createElement('option');
			option.value = "0";
			option.text = "Select One";
			document.getElementsByName('selDisp')[0].options.add(option,0);		

			for (var i=0; i<xRows.length; i++) {
				option = document.createElement('option');
				var nameNodes = xRows[i].getElementsByTagName("optionValue");
				var valueNodes = xRows[i].getElementsByTagName("optionText");


				if (nameNodes.length > 0 && valueNodes.length > 0) {
					var theValue = nameNodes[0].firstChild.nodeValue;
					var theText = valueNodes[0].firstChild.nodeValue;	
				}
				var currdobYr= document.frmMembRegi.dobYr.value;
				var flg = 0;
				var d = new Date();
				var curr_year = d.getFullYear();
				diff_age = curr_year - currdobYr;

				if(document.frmMembRegi.renewOpt[1].checked){
					diff_age = diff_age+1;
				}
				if(theText=="Junior Member"){
					if(diff_age >= 19){
						flg = 1;
					}
					else{
						flg = 0;
					}
				}
				if(flg==0){
					option.value = theValue;
					option.text = theText;
					document.getElementsByName('selDisp')[0].options.add(option,i+1);
				}
				else{
					flg = 0;
				}
			}
		}else{
			alert("Problem: " + req.statusText);
		}
	}
}

var req;
function retrieveURL(param,year){

	var membType = document.getElementById('memTypsel').value;
	if(membType!="Life Member"){
		url = "RenewMembTypAjax.html?method=memberType&process="+escape(param)+"&year="+year;		
		if (window.XMLHttpRequest){ 
			req = new XMLHttpRequest();
		}else if(window.ActiveXObject){
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		req.onreadystatechange = displayTypeChange;
		req.open("GET", url, true);
		req.send(null);
	}
}
		
function displayTypeChange() {
	if (req.readyState == 4) { // Complete
		if (req.status == 200) { // OK response  
			var xmlDoc = req.responseXML.documentElement;
			var xRows= xmlDoc.getElementsByTagName('entry');	   
			var objDDL = document.getElementById("memTyp_sel");          	          
			objDDL.innerHTML="";
			i = document.getElementById("memTyp_sel").length;
			option = document.createElement('option');
			option.value = "0";
			option.text = "Select One";
			document.getElementsByName('selDisp')[0].options.add(option,0);		
			for (var i=0; i<xRows.length; i++) {
				option = document.createElement('option');
				var nameNodes = xRows[i].getElementsByTagName("optionValue");
				var valueNodes = xRows[i].getElementsByTagName("optionText");
				if (nameNodes.length > 0 && valueNodes.length > 0) {
					var theValue = nameNodes[0].firstChild.nodeValue;
					var theText = valueNodes[0].firstChild.nodeValue;
				}
				option.value = theValue;
				option.text = theText;
				document.getElementsByName('selDisp')[0].options.add(option,i+1);
			}
		}else{
			alert("Problem: " + req.statusText);
		}
	}
}

function amatCard(cbxName){
	var chkObj = document.getElementById(cbxName);
	var spval=chkObj.value;
	val=spval.split("#");
	
	if (val[1] == "USEF" || val[1] == "usef" ){
		if(chkObj.checked==false){
			document.getElementById('amateurCrd').style.display="none";
			document.getElementById('amatCrd').checked=false;
		}
		else{
       		document.getElementById('amateurCrd').style.display="block";
			document.getElementById('amatCrd').checked=false;
		}
	}
}

function getText(){
	
		var selObj = document.getElementById('memTyp_sel');
		var selIndex = selObj.selectedIndex;
		var selTxt = selObj.options[selIndex].text;
		var selVal = selObj.options[selIndex].value;
	    var dobCnt = document.frmMembRegi.dobCnt.value;
		var expYr = document.frmMembRegi.expYr.value;
		if (selTxt == "Junior Member" ){
			month1 = document.frmMembRegi.dobMonth.value;
			month = (month1-1);
			date = document.frmMembRegi.dobDay.value;
			year=document.frmMembRegi.dobYr.value;
		
			var days1;
			var check=(year%4);
			if((check=="0")&&(month == 1)){
				days1 = "";
				if (month == 0 || month == 2 || month == 4 || month == 6 || month == 7 || month == 9 || month == 11) days1 = 31;
				if (month == 3 || month == 5 || month == 8 || month == 10) days1 = 30;
				if (month == 1) days1 = 29;
				if (date>29){
				return false;
			}
		}
		if ((check!="0")&&(month == 1)){
			days1 = "";
			if (month == 0 || month == 2 || month == 4 || month == 6 || month == 7 || month == 9 || month == 11) days1 = 31;
			if (month == 3 || month == 5 || month == 8 || month == 10) days1 = 30;
			if (month == 1) days1 = 28;
			if (date>28){
				return false;
			}
		}
		today = new Date();
		dateStr = 31;//today.getDate();
		monthStr = 11;//today.getMonth();
		yearStr = today.getFullYear();
	
		if(today.getFullYear()==expYr){
			if(today.getMonth()+1>8){		
				yearStr = today.getFullYear()+1;
			}
		}
		else{
			if(today.getMonth()+1==12){
				yearStr = today.getFullYear()+1;
			}
		}		
		var days;
		var check1=(yearStr%4);
		if (check1=="0"){
			days = "";
			if (monthStr == 0 || monthStr == 2 || monthStr == 4 || monthStr == 6 || monthStr == 7 || monthStr == 9 || monthStr == 11) days = 31;
			if (monthStr == 3 || monthStr == 5 || monthStr == 8 || monthStr == 10) days = 30;
			if (monthStr == 1) days = 29;
		}
		if (check1!="0"){
			days = "";
			if (monthStr == 0 || monthStr == 2 || monthStr == 4 || monthStr == 6 || monthStr == 7 || monthStr == 9 || monthStr == 11) days = 31;
			if (monthStr == 3 || monthStr == 5 || monthStr == 8 || monthStr == 10) days = 30;
			if (monthStr == 1) days = 28;
		}
		theYear = yearStr - year;
		theMonth = monthStr - month;
		theDate = dateStr - date;
		if (month < monthStr && date > dateStr){
			theYear = parseInt(theYear) + 1;
			theMonth = (theMonth - 1); 
		}
		if (month < monthStr && date <= dateStr) {
			theMonth = (theMonth); 
		}
		else if (month == monthStr && (date < dateStr || date == dateStr)) {
			theMonth = 0; 
		}
		else if (month == monthStr && date > dateStr) { 
			theMonth = 11; 
		}
		else if (month > monthStr && date <= dateStr) {
			theYear = theYear - 1;
			theMonth = ((12 - -(theMonth)) + 1); 
		}
		else if (month > monthStr && date > dateStr) { 
			theMonth = ((12 - -(theMonth))); 
		}
		if (date < dateStr) { 
			theDate = (theDate); 
		}
		if (date == dateStr) {
			theDate = 0; 
		}
		if(check=="0"){
			if (monthStr==2){
				theDate=days-((-theDate+2));
			}
		}
		if(check!=0){
			if (monthStr==2){
				theDate=days-((-theDate+3));
			}
		}
		else if(theDate < "0") { 
			theYear = (theYear - 1); 
			theDate = days - (-theDate); 
		}
		if(theYear >=19){
			alert("Sorry the age you have specified doesn't  match as required for a Junior Member");
			document.getElementById('memTyp_sel').value = "";
			document.getElementById('memTyp_sel').selectedIndex=0;
			document.frmMembRegi.amount_txt.value =0;
			Sumup();
		}
	}
}
		
function jrRen(){
	var dobCnt = document.frmMembRegi.dobCnt.value;
	var expYr = document.frmMembRegi.expYr.value;
		
	var selObj = document.getElementById('membershipName').value;
	if (selObj == "Junior Member" ){
		month1 = document.frmMembRegi.dobMonth.value;
		month = (month1-1);
		date = document.frmMembRegi.dobDay.value;
		year=document.frmMembRegi.dobYr.value;
		var days1;
		var check=(year%4);
		if ((check=="0")&&(month == 1)){
			days1 = "";
			if (month == 0 || month == 2 || month == 4 || month == 6 || month == 7 || month == 9 || month == 11) days1 = 31;
			if (month == 3 || month == 5 || month == 8 || month == 10) days1 = 30;
			if (month == 1) days1 = 29;
			if (date>29){
				return false;
			}
		}
		if ((check!="0")&&(month == 1)){
			days1 = "";
			if (month == 0 || month == 2 || month == 4 || month == 6 || month == 7 || month == 9 || month == 11) days1 = 31;
			if (month == 3 || month == 5 || month == 8 || month == 10) days1 = 30;
			if (month == 1) days1 = 28;
			if (date>28){
				return false;
			}
		}
		today = new Date();
		dateStr = 31;//today.getDate();
		monthStr = 11;//today.getMonth();
		yearStr = today.getFullYear();
	
		if(today.getFullYear()==expYr){
			if(today.getMonth()+1>8){		
				yearStr = today.getFullYear()+1;
			}
		}
		else{
			if(today.getMonth()+1==12){
				yearStr = today.getFullYear()+1;
			}
		}
		var days;
		var check1=(yearStr%4);
		if (check1=="0"){
			days = "";
			if (monthStr == 0 || monthStr == 2 || monthStr == 4 || monthStr == 6 || monthStr == 7 || monthStr == 9 || monthStr == 11) days = 31;
			if (monthStr == 3 || monthStr == 5 || monthStr == 8 || monthStr == 10) days = 30;
			if (monthStr == 1) days = 29;
		}
		if (check1!="0"){
			days = "";
			if (monthStr == 0 || monthStr == 2 || monthStr == 4 || monthStr == 6 || monthStr == 7 || monthStr == 9 || monthStr == 11) days = 31;
			if (monthStr == 3 || monthStr == 5 || monthStr == 8 || monthStr == 10) days = 30;
			if (monthStr == 1) days = 28;
		}
		theYear = yearStr - year;
		theMonth = monthStr - month;
		theDate = dateStr - date;
		if (month < monthStr && date > dateStr){
			theYear = parseInt(theYear) + 1;
			theMonth = (theMonth - 1); 
		}
		if (month < monthStr && date <= dateStr) {
			theMonth = (theMonth); 
		}
		else if (month == monthStr && (date < dateStr || date == dateStr)) {
			theMonth = 0; 
		}
		else if (month == monthStr && date > dateStr) { 
			theMonth = 11; 
		}
		else if (month > monthStr && date <= dateStr) {
			theYear = theYear - 1;
			theMonth = ((12 - -(theMonth)) + 1); 
		}
		else if (month > monthStr && date > dateStr) { 
			theMonth = ((12 - -(theMonth))); 
		}
		if (date < dateStr) { 
			theDate = (theDate); 
		}
		if (date == dateStr) {
			theDate = 0; 
		}
		if(check=="0"){
			if (monthStr==2){
				theDate=days-((-theDate+2));
			}
		}
		if(check!=0){
			if (monthStr==2){
				theDate=days-((-theDate+3));
			}
		}
		else if(theDate < "0") { 
			theYear = (theYear - 1); 
			theDate = days - (-theDate); 
		}
		if(theYear >= 19){
			alert("Sorry the age you have specified doesn't  match as required for a Junior Member");
			document.getElementById('memTyp_sel').value = "";
			document.getElementById('memTyp_sel').selectedIndex=0;
			document.frmMembRegi.amount_txt.value =0;
			document.frmMembRegi.rr21[0].checked=false; 				
		}
	}
}
	
var httpRequest;
function famDet(){
	if(document.frmMembRegi.membershipName.value == "Family Member"){
		clr2();
		if(document.frmMembRegi.memberid.value!="" && document.frmMembRegi.memberid.value.indexOf(" ")!=0){
			var rid=document.frmMembRegi.memberid.value;
			url= "RiderInfoAjaxAction.html?rid="+rid;
			if (window.ActiveXObject){
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			}
			else if (window.XMLHttpRequest){
				httpRequest = new XMLHttpRequest();
			} 
			httpRequest.open("GET", url, true); 
			httpRequest.onreadystatechange =processRequest15; 
			httpRequest.send(null); 
		}
	}
}
	
function processRequest15(){
	if (httpRequest.readyState == 4){
		if(httpRequest.status == 200){
		//get the XML send by the servlet 
        	var salutationXML = httpRequest.responseXML.getElementsByTagName("salutation")[0]; 
            var salutationText = salutationXML.childNodes[0].nodeValue; 
            updateHTML15(salutationXML); 
		} 
        else{ 
            alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
        } 
    } 
} 

function updateHTML15(salutationXML){ 
        //The node valuse will give actual data 
	var salutationText = salutationXML.childNodes[0].nodeValue; 
	var rdetails=new Array();
	rdetails=null;
	rdetails=salutationText.split("#");
	clr2();
	
	if(rdetails[1]==NaN || rdetails[1]==undefined || rdetails[1]==null || rdetails[1]=="null" || rdetails[1]==""){
		document.frmMembRegi.firstName.value="NA";
	}else document.frmMembRegi.firstName.value=rdetails[1];
	
	if(rdetails[3]==NaN || rdetails[3]==undefined || rdetails[3]==null || rdetails[3]=="null" || rdetails[3]==""){
		document.frmMembRegi.lastName.value="NA";
	}else document.frmMembRegi.lastName.value=rdetails[3];
	
	if(rdetails[10]==NaN || rdetails[10]==undefined || rdetails[10]==null || rdetails[10]=="null" || rdetails[10]==""){
		document.frmMembRegi.phone.value="NA";
	}else{
		if(rdetails[10].length>4){
			var phLen = rdetails[10].length;
			var minPhLen = phLen - 4;
			document.frmMembRegi.phone.value=rdetails[10].substring(minPhLen,phLen);
		}
		else{
			document.frmMembRegi.phone.value=rdetails[10];
		}
	} 
}

function clr2(){
	document.frmMembRegi.firstName.value="";
	document.frmMembRegi.lastName.value="";
	document.frmMembRegi.phone.value="";
}

</script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
 <style>
 .indent-small span {
    float: right;
    position: absolute;
    top: 8px;
    right: -68px;
    color: #000;
}
</style>



</head>

<%
Date  dob = (Date) request.getAttribute("dobCnt");

int mnth=0;
int day1=0;
int yr=0;

	String sessionMid = (String)session.getAttribute("memberId");

	int ageCnt = 0;
	if(dob!=null){
		Date first = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String secondString = sdf.format(dob);
		
		String[] tmpMonth=secondString.split("/");
		mnth=Integer.parseInt(tmpMonth[1]);

        day1=Integer.parseInt(tmpMonth[0]);
		yr=Integer.parseInt(tmpMonth[2]);
		 
		if(secondString==null) 
			secondString = "";
		Date second = new Date(secondString);
		long msPerDay = 1000 * 60 * 60 * 24;
		long diff =
		(first.getTime() / msPerDay) - (dob.getTime() / msPerDay);
		Long convertLong = new Long(diff);
		ageCnt = convertLong.intValue()/365;
		
		if(mnth<12)
		{
			ageCnt=ageCnt+1;
		}
	}
 // ----------- months calc for subscribing member --------------
	double diff1=0.0;

	Date expDat1=(Date)request.getAttribute("expDt");

	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	String secondString = sdf.format(expDat1);
		
	String[] tmpMonth=secondString.split("/");
		
	int yr1=Integer.parseInt(tmpMonth[2]);

	String subscribChrgStat = "NA";
	if(expDat1!=null){
		Date first1 = new Date();
			
		double msPerDay1 = 1000 * 60 * 60 * 24;
		
		if(expDat1.getTime()>first1.getTime()){
			diff1 = (expDat1.getTime() / msPerDay1) - (first1.getTime() / msPerDay1);
			diff1 = diff1+1;
			
			if(diff1<=182){
				subscribChrgStat = "chargable";
			}
		}
		else{
			subscribChrgStat = "chargable";
		}
	}  
%>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1"  onload="showOptBlk();initLife();Dispall();showHideLifeRen();showHideFamRen();showHideFamRenLoad();cardclear();Sumup();showHideFamRenOnLoad();famDet();">

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
                           <h2>Membership:: Membership Renewal</h2>
						</div>
					 <!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
			<form name="frmMembRegi" id="myform" method="post"  action="./MembershipRenewal.html" onsubmit="return myvalidate(this);">
			<input type="hidden" name="upgradeOpt" id="upgradeOpt" />
			<input type="hidden" name="upgrdCurntYr" id="upgrdCurntYr" />
                         <input type="hidden" name="armbandQty" value="0" />
                          <input type="hidden" name="armband" value="0" /> 
                          <input type="hidden" name="inVoiceId" id="inVoiceId" value="1"/>
				 <%
                                  String sessionInvoiceId = "1";
				session.setAttribute("sessionInvoiceId",sessionInvoiceId);
				String expiry="";
				String expyear="";
				String date="";
				String chkDat="";
				java.util.Calendar toDay = java.util.Calendar.getInstance();
				int newyear = toDay.get(Calendar.YEAR);
				int new_month = toDay.get(Calendar.MONTH);
				Vector memberTypeVect3=new Vector();
				memberTypeVect3=(Vector)request.getAttribute("userTypeVect3");
				String str1 [] = new String [15];
				
				if (  memberTypeVect3.elementAt(0) != null && memberTypeVect3.size() !=0) {
					str1   = (String[]) memberTypeVect3.elementAt(0);
				}
				
				String parentId="";
				
				if(str1[3]!=null){
					parentId =str1[3];
				}
				
				 Vector dispMembershipTypeVect=new Vector();
				 dispMembershipTypeVect=(Vector)request.getAttribute("dispMembershipTypeVect");
				 
				 Vector areUAMemberVect=new Vector();
				 areUAMemberVect=(Vector)request.getAttribute("areUAMemberVect");

				 Vector membershipToVect=new Vector();
				 membershipToVect=(Vector)request.getAttribute("membershipToVect");
				 
				 String[] addonPrice=(String[])request.getAttribute("addonPrice");
				 
				 ArrayList donDet=new ArrayList();
				 donDet=(ArrayList)request.getAttribute("donDet");

				Date expDat=(Date)request.getAttribute("expDt");
				
				HLCMemberDetails objMember = new HLCMemberDetails();
				objMember=(com.hlcform.util.HLCMemberDetails)request.getAttribute("objMember");
				String memTypsel=null;
				
				if(objMember.getMembershipTypeName()!=null) {
					memTypsel=objMember.getMembershipTypeName();
				} else {
					memTypsel="";
				}
				
				if(expDat!=null) {
					expiry=expDat.toString();
					expyear=expiry.substring(0,4);

					java.util.Calendar c5 = java.util.Calendar.getInstance();
					int day = c5.get(Calendar.DATE);
					int month1 = c5.get(Calendar.MONTH);
					
					int month=month1+1;
					int year = c5.get(Calendar.YEAR);
					
					if(month<10) {
						date = year+"-"+"0"+month+"-"+day;
						chkDat = "0"+month+"/"+day+"/"+year;
					} else {
						date = year+"-"+month+"-"+day;
						chkDat = month+"/"+day+"/"+year;
					}
				}
				
				String status=(String)request.getAttribute("status");
				ArrayList nonhlc=new ArrayList();
				ArrayList donSelect=new ArrayList();
				
				nonhlc=(ArrayList)request.getAttribute("nonhlc");
				donSelect=(ArrayList)request.getAttribute("donSelect");
				
				String country=(String)request.getAttribute("country");
				String memberTypeId1 ="";
				String membershipName1 = "";
				String membershipAmount1 = "";
				String cnct1=memberTypeId1+"#"+membershipName1+"#"+membershipAmount1;
				
				Vector dispMembershipTypeVect1=new Vector();
				dispMembershipTypeVect1=(Vector)request.getAttribute("dispMembershipTypeVect");
				Enumeration itrators= (Enumeration)dispMembershipTypeVect1.elements();
				
				while(itrators.hasMoreElements()){
					String[] sarray = (String[]) itrators.nextElement();
					
					String memberTypeId = sarray[0];
					String membershipName = sarray[1];
					String membershipAmount = sarray[2];
					String cnct=memberTypeId+"#"+membershipName+"#"+membershipAmount;
					memTypsel=objMember.getMembershipTypeName();
					
					if(memTypsel!=null) {
						if(memTypsel.equalsIgnoreCase(membershipName)) {
							
							memberTypeId1 = memberTypeId;
							membershipName1 = membershipName;
							membershipAmount1 = membershipAmount;
							cnct1=memberTypeId1+"#"+membershipName1+"#"+membershipAmount1;
						}}}
				
				
				String periodValue = (String) session.getAttribute("periodValue");
				String priority_value = (String) request.getAttribute("prior_value");
				
				ArrayList histValues = (ArrayList) request.getAttribute("histValues");
				boolean curr_link = false;
				if(histValues!=null && histValues.size()!=0){
				Iterator histItr = histValues.iterator();
					while(histItr.hasNext()){
						String[] histval = (String[]) histItr.next();
						String membTypName = histval[0];
						String membYr = histval[1];
						String statName = histval[2];
						String ExpDte = histval[3];		
						java.util.Calendar toDay2 = java.util.Calendar.getInstance();
						int newyear2 = toDay.get(Calendar.YEAR);
						int new_month2 = toDay.get(Calendar.MONTH);
						int dbYear =  Integer.parseInt(membYr);
						if(dbYear > newyear){
							curr_link = true;
						}
					}
				}
				if(curr_link==true){
				%>
					<input type="hidden" name="upcomeYr" value="yes" id="upcomeYr" />
				<%
				}
				else{
				%>
					<input type="hidden" name="upcomeYr" value="no" id="upcomeYr" />
				<%
				}
			   %>
				<input type="hidden" name="newMonth"  id="newMonth" value="<%=new_month%>" />
				<input type="hidden" name="newYear"  id="newYear" value="<%=newyear%>" />
				<input id="currmemberTypeId" name="currmemberTypeId" type="hidden" value="<%=memberTypeId1%>" />
				<input name="currmembershipName" id="currmembershipName" type="hidden" value="<%=membershipName1%>" />
				<input name="currmembershipAmount" id="currmembershipAmount" type="hidden" value="<%=membershipAmount1%>" />	
																							   
				<input id="memberTypeId" name="memberTypeId" type="hidden" value="<%=memberTypeId1%>" />
				<input name="membershipName" id="membershipName" type="hidden" value="<%=membershipName1%>" />
				<input id="membershipAmount" name="membershipAmount" type="hidden" value="<%=membershipAmount1%>" />	
				<%
				String futurePrice ="";
				String futureMembId = "";
				String membfuturePrice = (String) request.getAttribute("futurePrice");
				if(membfuturePrice!=null || membfuturePrice.trim().length()>0){
					String[] split_str = membfuturePrice.split("#"); 
					 futureMembId = split_str[0];
					 futurePrice = split_str[1];
				}
				String newFamilyPrice = "";
				String newFamilyId = "";
				String newFamilyPrice1 = (String) request.getAttribute("newFamilyPrice");
				if(newFamilyPrice1!=null || newFamilyPrice1.trim().length()>0){
					String[] split_str = newFamilyPrice1.split("#"); 																				
					 newFamilyId = split_str[0];
					 newFamilyPrice = split_str[1];
				}
				%>
			
				<input name="dobDay" type="hidden" value="<%=day1%>" />
				<input name="dobMonth" type="hidden" value="<%=mnth%>" />
				<input name="dobYr" type="hidden" value="<%=yr%>" />
				<input type="hidden" name="futuremembId" id="futuremembId" value="<%=futureMembId%>" />
				<input type="hidden" name="futrefamPrice" id="futrefamPrice" value="<%=newFamilyPrice%>" />
				<input type="hidden" name="futrefamId" id="futrefamId" value="<%=newFamilyId%>" />
				<input type="hidden" id="futurePrice" name="futurePrice" value="<%=futurePrice%>" />
				<input name="subscribChrgStat" type="hidden" value="<%=subscribChrgStat%>" />
				<input type="hidden" name="prior_value" value="<%=priority_value%>" />
				<input name="expYr" type="hidden" value="<%=expyear%>" />
				
				<input name="sessionMid" type="hidden" value="<%=sessionMid%>" />
				
				
				
		<p id="commonBG"> <span style="color:red"> IMPORTANT </span> --The only accepts payment by credit card for services purchased online. If you prefer to pay by check, please complete the appropriate form and mail with your check to the office.
				  </p>
						
											
							
						
							<div class='form-group'>
								<div style="display:inline-block;width:100%;">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Current Status:</label>
										
									<div class="col-md-8">
										<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
							<%
							
							String exSpl=expiry.substring(5,7);
							int exMth=Integer.parseInt(exSpl);
							String exSplYr=expiry.substring(0,4);
							int exYr=Integer.parseInt(exSplYr);
							
							String sysSpl=date.substring(5,7);
							int sysMth=Integer.parseInt(sysSpl);
							String sysSplYr=date.substring(0,4);
							int sysYr=Integer.parseInt(sysSplYr);
							
							int flag=0;
							String prDat="";
							
							if(sysYr == exYr)
							{
								if(sysMth>exMth){
										prDat=" Expired Since ";
									}
									else{
										prDat=" Registration Good thru ";
									}
							}
							else if(sysYr > exYr){
								prDat=" Expired Since ";
							}
							else{
								prDat=" Registration Good thru ";
							}
							
							if(memTypsel.equalsIgnoreCase("Life Member"))
							{
							%>
								<label class="control-label"><%=memTypsel%>, No Need to Renew </label>						
							<%}else{%>
								<label class="control-label"><%=memTypsel%>,<%=prDat+expiry%> </label>
							<%} %>
							</div>
						</div>
					  </div>
					</div> 
					</div>
						<%Date subExpDat=(Date)request.getAttribute("expDt");
						  Date subDate=new Date();
						  long stTime = subDate.getTime();
		                  long eTime = subExpDat.getTime();
		                  long diffTime = eTime - stTime;
		                  int noDays = (int)(diffTime/(1000*60*60*24));
						  System.out.println("noDays :"+noDays);
						%>
						<input name="noDays" type="hidden" value="<%=noDays%>" />						
						<input name="expdate" type="hidden" value="<%=expDat%>" />
						<input name="status" type="hidden" value="<%=status%>" />
						<input name="serverdate" type="hidden" value="<%=date%>" />
						<input name="prDat" type="hidden" value="<%=prDat%>" />
						<input type="hidden" name="showOpt" id="showOpt" />
						<input type="hidden" name="selYear" id="selYear" />
						<input type="hidden" name="memTypsel" id="memTypsel" value="<%=memTypsel%>" />
						
						<div id="monthbasedBlk" >
							
								<div class="form-group">
									<div class="col-md-offset-1">
										<input type="radio" value="curntYr" name="renewOpt" onclick="showOptClick();" /><label class="control-label">Renew/Join for current membership/competition year (ending November 30th) <%=newyear%></label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-1">
										<input type="radio" value="nxtYr" name="renewOpt" onclick="showOptClick();" /><label class="control-label">Renew/Join for upcoming membership/competition year (begins December 1) <%=newyear+1%></label>
									</div>
								</div>
							
						</div>
					
					<div id="part1" ></div>
					
					<div class="form-group" id="memberType">
							
						<div class="form-group">
							<div style="display:inline-block;width:100%;">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Type:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
							
													<select name="selDisp" id="memTyp_sel" class="form-control" onchange="fillAmt();showHideLifeRen(), showHideFamRen(), Dispall();clrAmt();Sumup();getText();showHideMailAddressRen();dispAmateurDiv();">
													  <option selected="selected" value="0">Select One</option>
													</select>
													<span id="span_astriesk">*</span>
												</div>
											</div>
										
							
										<label class="control-label">$</label>
											
												<div class='col-md-3 indent-small'>
													<div class='form-group internal'>
							
													<input id="amount_txt" name="amount_txt" class="form-control" type="text"  readonly="true" value="0"/>
												</div>
											</div>
										</div>
								</div>		
							<input type="hidden" id="currfamembId" name="currfamembId" value="<%=addonPrice[0]%>" />
							<input type="hidden" id="curraddOnAmt" name="curraddOnAmt" value="<%=addonPrice[1]%>" />
							<input type="hidden" id="famembId" name="famembId"/>
							<input type="hidden" name="addOnAmount" id="addOnAmount" />
							<input type="hidden" id="renewSect" name="renewSect" />
							<input type="hidden" id="downSect" name="downSect" />
							<input type="hidden" id="upgrdSect" name="upgrdSect" />
							<input type="hidden" id="onActive" name="onActive" />
							<input type="hidden" id="updActive" name="updActive" />
																				
						</div>
					</div>	
						<div id="forLife">		
								<p class="para">Current Full / Life Member Info:</p>
										
								<div id="commonBG" >
									
									<p>Your Family Membership will be linked to the following Full or Life Member Account.</p>
									
								</div>		
								
								<div class="form-group">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
										<%
											String parId="";
												if(objMember.getParentMemberId()!=null)
													{
														parId=objMember.getParentMemberId();	
													} else
													{
														parId="";
													}
										 %>
									
									<input name="memberid" id="memberid" type="text" class="form-control" size="20" value="<%=parentId%>" onblur="HLCMemberDetails();" /> 
									
									<input type="hidden" name="parentId" value="<%=parentId%>" />
									
									<span id="span_astriesk">*</span>
									</div>
								</div>
							</div>
							
							
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<input name="firstName" class="form-control" id="firstNameId5" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></span>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<input name="lastName" class="form-control" id="lastNameId5" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="20" readonly="readonly" /></span>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone: (Last 4 digits)</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<strong>xxx-xxx-</strong><input name="phone" class="form-control" id="phoneId5" style="background-color:#F4F4F4; font-weight:bold; border:0px;" value="" size="8" readonly="readonly" />
												</div>
											</div>
										</div>
									</div>
							
							
							
								<div id="commonBG" >
									<input type="checkbox" name="confFam" id="confFam_Id" value="" /> 
									<label class="control-label">I confirm that I am attached to the FULL/LIFE member whose details are shown above. </label>
								</div>
						</div>	
						
						<div id="amateurCrd">
							
							<p class="para">Amateur Rider Declaration:</p>
							
								<div id="commonBG" >
									
									<p>USEF Rules for Eventing Appendix 3, Section, 2.4:</p>
									

									<blockquote>
	AMATEUR RIDER (AR) - For the purposes of Eventing, an Amateur is a Senior Rider whose remuneration from the activities listed in GR808 does not exceed $2,500.00 in either the preceding or current calendar year. In order to compete as an Amateur a rider must possess either a USEF Amateur Card or have on file in the office a signed affidavit stating that he/she is in compliance with the above definition. Amateurs in Eventing are subject to the relevant provisions of GR809-810. 
	</blockquote>
									
									<br />
									
									<p>By typing in my full name in the box below, I hearby declare that I am eligible for Amateur status under the conditions set forth in the above USEF rule.</p>
								</div>	
								
								
								<div class="form-group">
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name (Type full name):</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
									
									
									<%
									String AmateurName="";
									String AmateurDec1="";
									String AmateurDec2="";
	
									boolean isAmateurDec2;
									boolean isAmateurDec1;  
										
									if(objMember.getAmateurName() !=null)
										{
											AmateurName=objMember.getAmateurName();
										}
										else
										{
											AmateurName="";
										}
										
										isAmateurDec1=objMember.isAmateurDec1();
																											
										if(isAmateurDec1 == true)
										{
											AmateurDec1="checked=checked";
										}
										else
										{
											 AmateurDec1="";   
										}
										
										
										
									   isAmateurDec2=objMember.isAmateurDec2();
										
										if(isAmateurDec2 == true)
										{
											AmateurDec2="checked=checked";
										}
										else
										{
											 AmateurDec2="";   
										}
	
										%>
										
									<input name="nameAmat" id="nameAmat_id" value="<%=AmateurName%>" type="text" class="form-control" size="20" /> 
									</div>
								</div>
							</div>
							
								
		
									<p >Select option that applies to you:</p>
										<div class="form-group">
												<div class="col-md-offset-1">
													<input type="checkbox" <%=AmateurDec1%> size="10" name="amatCrdPoss" id="amatCrdPoss" value="yes" onclick="tempValidate();"/><label class="control-label"> I am in the possession of a current USEF Amateur Card. </label><br>
													<input type="checkbox" <%=AmateurDec2%> size="10" name="amatCrdElig" id="amatCrdElig" value="yes" onclick="tempValidate();"/><label class="control-label">I am declaring my Amateur Status Eligibility with only.</label>
												</div>
									</div>
							
							<div id="commonBG" >
										
									<p class="para">NOTE:</p><p> A person's Amateur status must be declared for each competition season. To be eligible for the U.S. Eventing Association Year-End Awards, this section must be completed and signed</p>
								</div>
						
					   
					   

					  
					  
							
									
                                                                                                                          
	<%
              
			  int si=0; 
                          String logBy="user";
                          
                          if(session.getAttribute("loggedBy")!=null)
              {
																																				                  String loggedBy="";
																																								                  loggedBy=(String)session.getAttribute("loggedBy");
																																												                   logBy=loggedBy;
                     if(loggedBy.equalsIgnoreCase("Admin"))
																																						                  {
                                                                                                                                     %>
                       <div id="phoneReg">
							
							<p class="para">Phone Registration Information:	</p>
		
		
		<%  
                                int chksfx=0;
                                String cbx="classification";
                                Vector horsesertypVect = new Vector();
                                horsesertypVect =(Vector)request.getAttribute("serviceTypeVect");
								 								 
								 if(horsesertypVect!=null)
                                 {
                                 si=horsesertypVect.size();
                        
                                    if(si!=0)
                                    {
                                 Enumeration itrate= (Enumeration)horsesertypVect.elements();
                                 while(itrate.hasMoreElements()){
                            
                                String[] sarray1 = (String[]) itrate.nextElement();
                                String serviceTypeId1 = sarray1[0];
                                String serviceName1 = sarray1[1];
                                String serviceAmount1 = sarray1[2];
                                String cn=serviceTypeId1+"#"+serviceName1+"#"+serviceAmount1;
                                String cbxname=cbx+Integer.toString(chksfx);
								
                         %>
                        
			<div class="form-group">
				<input type="checkbox" id="<%=cbxname%>" name="<%=cbxname%>" value="<%=cn%>" size="10" onClick="Sumup();"><%=serviceName1%>	
			 
					<div class='col-md-8'>
                       <div class='col-md-3 indent-small'>
                          <div class='form-group internal'>
							<label class="control-label"><%=serviceAmount1%></label>
						  </div>
						 </div>
						</div>
                      </div>                            
                          <%chksfx++;}}}%>
		    
				</div>
				
	<%}%>
	                                <p class="para">Payment Information:</p>
										
								<div class="form-group">
							<div style="display:inline-block;width:100%;">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount($):</label>
										
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<input name="tot_amt" id="totalAmount" type="text" class="form-control" value="0" readonly size="10" /><span> U.S. Dollars</span>>
												</div>
											</div>
										</div>
										
									</div>
								</div>
							<div class="form-group">
							<div class="col-md-offset-2">
								<input type="radio" size="10" name="r11" value="check" onclick="switchDiv('chkEnc'), showHideRadio('r11','chrgCrd','check');clrRad(),hideImgDiv('cvvImg');" /><label class="control-label"> Check enclosed.</label>
								<input type="radio" size="10" name="r11" value="card" checked="checked" onclick="switchDiv('chrgCrd'), showHideRadio('r11','chkEnc','card');clrRad(),showImgDiv('cvvImg');" /> <label class="control-label"> Please charge my card.</label>
								
							</div></div>
							<input type="hidden" name="cc11" id="cc11" value="adsec1"/>								
								<div id="chkEnc">
								<p>Check Details:</p>
								</div>
							
							<p>
							If paying by check , please mail your payment to:  <br /><br />
							
							<b>
							<br />
							Member Registration
							<br />
							525 Old Waterford Road NW
							<br />
							Leesburg, VA 20176
							</b><br /><br />
							
							<p>Note:Your registration status will be pending until check is processed.</p> 
							</p>
							</div>
																			
																			
											<div class="form-group">
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Amount:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>
																		
																<input name="chckAmount" id="chckAmount" type="text" class="form-control"  size="30" maxlength="16" /> 																													
															</div>
														</div>
													</div>
																		   
																			
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>							

															  <input name="checkNo" type="text" id="txtChNumber" class="form-control"  size="16" />
															  <span id="span_astriesk">*</span>																			
																				
															</div>
														</div>
													</div>	
													
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>							
																<input name="checkDate" type="text" id="checkDate" class="form-control"  value="<%=chkDat%>" size="10" />
																<span id="span_astriesk"*</span>
																<a href="javascript:cal1.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a>
															</div>
														</div>
													</div>
													
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activation Date:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>						
																<input name="activeDate" type="text" id="activeDate" class="form-control"  value="<%=chkDat%>" size="10" />
																<span id="span_astriesk">*</span>
																<a href="javascript:cal2.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a>
															</div>
														</div>
													</div>
                                                      
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>							
																				
																<input name="inFavorof" id="inFavorof" type="text" class="form-control"  size="30" />
																<span id="span_astriesk">*</span>
															
															</div>
														</div>
													</div>
													
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Check:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>							
																<input name="nameOnchk" id="nameOnchk" type="text" class="form-control"  size="30" /> 
																<span id="span_astriesk">*</span>	
															</div>
														</div>
													</div>
												</div>
																	
										
										<div id="chrgCrd">
											<p>Card Details:</p>																		
											
											<div class="form-group">
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>	
																				
																			<select name="cardselect" id="ccTypeId" class="form-control">						
																				<option selected="selected">Select One</option>
																				<option value="Visa">Visa</option>
																				<option value="MasterCard">Master Card</option>
																				<option value="American Express">AmEx</option>
																			</select>
																				<span id="span_astriesk">*</span>
																				</div>
																			</div>
																		</div>
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>								
																<input name="cardNo" id="txtCard" type="text"  class="form-control" />
																<span id="span_astriesk">*</span>
															</div>
														</div>
													</div>

																		
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV No.:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>								
																<input name="cVVNo" id="txtCvvId" type="text" size="5" class="form-control" maxlength="4"/><span>(see details below)</span>
															</div>
														</div>
													</div>
													
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>
																<input type="text" name="printName" id="txtPrName" size="25" class="form-control" />
																<span id="span_astriesk">*</span>
																
															</div>
														</div>
													</div>
                                                                      
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activation Date:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>								
																<input name="activeDate2" type="text" id="activeDate2"  class="form-control" value="<%=chkDat%>"  size="10" />
																<span id="span_astriesk">*</span>
																<a href="javascript:cal3.popup();"><img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">	</a> 
															</div>
														</div>
													</div>
																		
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>								
															
																					<select name="expirymonth" id="selExpMonthId" class="form-control">
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
																					<select name="expiryyear" id="selExpYearId" class="form-control">
																						  <option value="" selected="selected" >Year</option>
																				<%
																		java.util.Calendar c5 = java.util.Calendar.getInstance();
																				int year5 = c5.get(Calendar.YEAR);
																				for(int f=year5;f<=year5+15;f++) 
																				{%>
																					<option  value="<%=f%>"><%=f%></option>
																				<%}
																				%>																		
																					</select>
																					<span id="span_astriesk">*</span>
																			</div>																											                                              
																		</div>	
																	</div>
																</div>
															</div>
                                 <%
								 }else{%>                                                                                         
												
														
										<p class="para">Payment Information:</p>
												
											<div class="form-group">
											<div style="display:inline-block;width:100%;">
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount($):</label>
												
													<div class='col-md-8'>
														<div class='col-md-3 indent-small'>
															<div class='form-group internal'>							
																 <input name="tot_amt" id="totalAmount" type="text" class="form-control" value="0" readonly size="10" /><span> U.S. Dollars</span>
															</div>
														</div>
													</div>
												</div>	
												</div>	
											<div class="form-group col-md-offset-2">
												<input type="radio" size="10" name="r11" value="card" checked="checked" onclick="switchDiv('chrgCrd'),showImgDiv('cvvImg');"/><label class="control-label"> Please charge my card.</label>
																
											</div>
											<input type="hidden" name="cc11" id="cc11" value="usrsec2"/>
															
				<div id="chrgCrd">
				
				<p class="para">Card Details:</p>
					
							<div class="form-group">
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
									<div class='col-md-8'>
										<div class='col-md-3 indent-small'>
											<div class='form-group internal'>												
																			
												<select name="cardselect" id="ccTypeId" class="form-control">						
													<option selected="selected">Select One</option>
													<option value="Visa">Visa</option>
													<option value="MasterCard">Master Card</option>
													<option value="American Express">AmEx</option>							
												</select>							
													<span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>
													
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No:</label>
									<div class='col-md-8'>
										<div class='col-md-3 indent-small'>
											<div class='form-group internal'>													
												<input name="cardNo" id="txtCard" type="text" size="20" class="form-control" />
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
																		
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV No.:</label>
									<div class='col-md-8'>
										<div class='col-md-3 indent-small'>
											<div class='form-group internal'>												
												<input name="cVVNo" id="txtCvvId" type="text" size="5" class="form-control" maxlength="4"/>
												<span id="span_astriesk">*</span>&nbsp;(see details below)</span>
											</div>
										</div>
									</div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
									<div class='col-md-8'>
										<div class='col-md-3 indent-small'>
											<div class='form-group internal'>										
												<input type="text" name="printName" id="txtPrName" size="25" class="form-control" />
												<span id="span_astriesk">*</span>
											</div>
                                         </div>
									</div>										 
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
									<div class='col-md-8'>
										<div class='col-md-3 indent-small'>
											<div class='form-group internal'>										
																				
													<select name="expirymonth" id="selExpMonthId" class="form-control">
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
																		
																<select name="expiryyear" id="selExpYearId" class="form-control">
															 <option value="" selected="selected" >Year</option>
							<%
					        java.util.Calendar c5 = java.util.Calendar.getInstance();
							int year5 = c5.get(Calendar.YEAR);
							for(int f=year5;f<=year5+15;f++) 
							{%>
								<option  value="<%=f%>"><%=f%></option>
							<%}
							%>																		
						</select>
						<span id="span_astriesk">*</span>
					</div>
				</div>
			</div>
						</div>	
						</div>
											
								<%}%>
								<input type="hidden" name="serct" value="<%=si%>" />
                                <input type="hidden" name="logBy" value="<%=logBy%>" />							
														 
									<div class='form-group'>
                                   		 <div class='col-md-offset-4 col-md-1'>
                                        	<button class='btn-lg btn-primary' type='submit' name="renstat" value="Renew Membership">Renew Membership</button>
										</div>
									</div>
												
						
											
							
							
					</form>
					<!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				

            </div>
			
			<!--==============================include chat Here=================================-->
			
			<!--%@ include file = "../../include/chat_new.jsp" %>
			<!--==============================include chat Here=================================-->

        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>


<script language="javascript">
<%  if(session.getAttribute("loggedBy")!=null){	%>
	var cal1 = new calendar2(document.forms['myform'].elements['checkDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	if(document.getElementById('activeDate'))
	{
	var cal2= new calendar2(document.forms['myform'].elements['activeDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	}
if(document.getElementById('activeDate2'))
	{
	var cal3= new calendar2(document.forms['myform'].elements['activeDate2']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	}	
	<%}%>
	</script>					
						
						
</html>
