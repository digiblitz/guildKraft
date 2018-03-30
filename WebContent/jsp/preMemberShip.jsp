<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcform.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/frmMembRegValidate.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#myform").validate({
		
		rules: {
			agree: "required",
			selDisp: "required"
		},
		messages: {
			agree: "Please agree our Terms and Policy",
			selDisp: "Please select any Membership type"
		},
		errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());
				else
					error.appendTo(element.parent());
			}
	});
	
	
});



function hideRegiOpt(){
	document.getElementById('regiOption').style.display="none";
	document.getElementById('regiSect').value=1;
}

function hideSubPubli(){
	document.getElementById('subscriberPubli').style.display="none";
	document.frmMembRegi.subsMailExist.value=0;
}
function fillFamId(){
	if(document.frmMembRegi.regiOpt[0].checked==true){
		var futurefamId = document.getElementById('futrefamId').value;
		var futurefamAmt = document.getElementById('futrefamPrice').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		document.getElementById('regiAct').value="Active";
	}
	else if(document.frmMembRegi.regiOpt[1].checked==true){
		var futurefamId = document.getElementById('currentfamId').value;
		var futurefamAmt = document.getElementById('currntAddAmt').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
	}
}
function fillDropDown(){
	if(document.frmMembRegi.regiOpt[0].checked==true){
		document.getElementById('regiOpt').value = "nxtYr";
		var futurefamId = document.getElementById('futrefamId').value;
		var futurefamAmt = document.getElementById('futrefamPrice').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		document.getElementById('regiAct').value="Active";
		var membType = document.getElementById('membTypes').value;
		
		var d = new Date();
		var curr_year = d.getFullYear();
		var curr_month = d.getMonth();		
		
		retrieveURL(membType,curr_year+1);
		document.getElementById('regiYear').value = curr_year+1;
	}
	else if(document.frmMembRegi.regiOpt[1].checked==true){
			document.getElementById('regiOpt').value = "curntYr";
			var futurefamId = document.getElementById('currentfamId').value;
			var futurefamAmt = document.getElementById('currntAddAmt').value;

			document.getElementById('famembId').value=futurefamId;
			document.getElementById('addOnAmount').value=futurefamAmt;
			var membType = document.getElementById('membTypes').value;

			var d = new Date();
			var curr_year = d.getFullYear();
			var curr_month = d.getMonth();
				
			retrieveURL(membType,curr_year);
			document.getElementById('regiYear').value = curr_year;
	}
	else{

		var futurefamId = document.getElementById('currentfamId').value;
		var futurefamAmt = document.getElementById('currntAddAmt').value;

		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		var membType = document.getElementById('membTypes').value;
		
		var d = new Date();
		var curr_year = d.getFullYear();
		var curr_month = d.getMonth();
		
		retrieveURL(membType,curr_year);
		document.getElementById('regiYear').value = curr_year;
		document.frmMembRegi.regiOpt[1].checked=false;
		document.frmMembRegi.regiOpt[0].checked=false;		
	}
}
function fillIdAmount(){
	var d = new Date();
	var curr_year = d.getFullYear();
	var curr_month = d.getMonth();
	var membType = document.getElementById('membTypes').value;

	if(curr_month==11){
		var futurefamId = document.getElementById('futrefamId').value;
		var futurefamAmt = document.getElementById('futrefamPrice').value;
		
		document.getElementById('famembId').value=futurefamId;
		document.getElementById('addOnAmount').value=futurefamAmt;
		document.getElementById('regiAct').value="Active";

		document.getElementById('regiOption').style.display="none";
		document.getElementById('regiSect').value=1;
		retrieveURL(membType,curr_year+1);
		document.getElementById('regiYear').value = curr_year+1;
	}
	else{
		if(curr_month>=9 && curr_month<=11){
			if(membType!="Life Member" && membType!="Subscribing Member"){
				document.getElementById('regiOption').style.display="block";
				document.getElementById('regiSect').value=0;
				retrieveURL(membType,curr_year);
				document.frmMembRegi.regiOpt[1].checked=false;
				document.frmMembRegi.regiOpt[0].checked=false;

				document.frmMembRegi.amount_txt.value = 0;
				clearMemAmt();
			}
			else{
				document.getElementById('regiOption').style.display="none";
				document.getElementById('regiSect').value=1;

				var futurefamId = document.getElementById('currentfamId').value;
				var futurefamAmt = document.getElementById('currntAddAmt').value;
	
				document.getElementById('famembId').value=futurefamId;
				document.getElementById('addOnAmount').value=futurefamAmt;
				retrieveURL(membType,curr_year);
				document.getElementById('regiYear').value = curr_year;
			}
		}
		else{
			document.getElementById('regiOption').style.display="none";
			document.getElementById('regiSect').value=1;

			var futurefamId = document.getElementById('currentfamId').value;
			var futurefamAmt = document.getElementById('currntAddAmt').value;

			document.getElementById('famembId').value=futurefamId;
			document.getElementById('addOnAmount').value=futurefamAmt;

			retrieveURL(membType,curr_year);
			document.getElementById('regiYear').value = curr_year;
		}
	}
   //parseandFillAmt();
}

var req;
function retrieveURL(membType,year)
{
	url = "RenewMembTypAjax.html?method=memberTypeIdandAmt&membType="+membType+"&year="+year;
//	alert(' URL is '+url);
	if (window.XMLHttpRequest) {
           req = new XMLHttpRequest();
		   
       } else if (window.ActiveXObject) {
           req = new ActiveXObject("Microsoft.XMLHTTP");
       }
       
       req.onreadystatechange = displayTypeChange;
	   
       req.open("GET", url, true);
       req.send(null);
    }
		
function displayTypeChange() {
	if (req.readyState == 4) { // Complete
		if (req.status == 200) { // OK response  
			var arnameXML = req.responseXML.getElementsByTagName("membValue")[0]; 
			var arnameText = arnameXML.childNodes[0].nodeValue; 		
			
			document.getElementById("memTyp_sel").value = arnameText;
			parseandFillAmt();
			showHideLife();showHideFam();Dispall();showHideMailAddress();dispAmateurDiv();
		} 
		else {
			alert("Problem: " + req.statusText);
		}
	}
}
function parseandFillAmt(){
	document.frmMembRegi.amount_txt.value=0;
	var str = document.getElementById("memTyp_sel").value;
	var splitstr = str.split("#");
	
	document.frmMembRegi.amount_txt.value = splitstr[2];
	Sumup();
}
function amatCard(cbxName){
	var chkObj = document.getElementById(cbxName);
	
	//alert(chkObj.value);
	var spval=chkObj.value;
	val=spval.split("#");
	//alert(val[1]);
	
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
	var selectedYear = document.getElementById('regiOpt').value;
	var dob = document.frmMembRegi.dob.value;
	var nowDate = new Date();
	var year = nowDate.getFullYear();
	
	if(selectedYear=="nxtYr") year = year+1;
	else year = year;

	var dobYear = new Date();
	dobYear.setMonth(dob.substring(5,6));
	dobYear.setDate(dob.substring(8,10));
	dobYear.setYear(dob.substring(0,4));

	var newYear = new Date();
	newYear.setDate(31);
	newYear.setMonth(11);
	newYear.setYear(year);
	

	var dobTime = dobYear.getTime();
	var newTime = newYear.getTime();
	var diff = (newTime - dobTime)/(1000*60*60*24*365);
	
	var selObj = document.getElementById('membTypes');
	var selIndex = selObj.selectedIndex;
	var selTxt = selObj.options[selIndex].text;
	var selVal = selObj.options[selIndex].value;
	if (selTxt == "Junior Member" ){
		if(diff >= 19){
			alert("Sorry the age you have specified doesn't  match as required for a Junior Member");
			document.getElementById('memTyp_sel').value = 0;
			document.getElementById('membTypes').value = "";
			document.getElementById('amount_txt').value = 0;
			document.getElementById('regiOption').style.display="none";
			document.getElementById('membTypes').focus();
		}
	}
}

</script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
</head>

<%

String logName=(String)session.getAttribute("loginName");
System.out.println("session.getAttribute(loginName) :"+logName);
double diff=0.0;
Date  dob = (Date) request.getAttribute("dobCnt");
Double convertLong = new Double(0.0);
String endDate = "";
//out.print("dob "+dob);
//out.print("dob" + dob);

	int ageCnt = 0;
	if(dob!=null){
		Date first = new Date();
		java.util.Calendar c7 = java.util.Calendar.getInstance();
		int calDay=31;
		int calMonth=12;
		int calMonth1=first.getMonth();
		int calYear = c7.get(Calendar.YEAR);
		if(calMonth1==11){
		calYear=calYear+1;
		}
		//out.println("calYear :"+calYear);
		endDate = calMonth+"/"+calDay+"/"+calYear;
		//out.println("P:"+endDate);
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyy");

		Date check_date = (Date)sdf1.parse(endDate);
		//out.println(check_date);
		double exTime=check_date.getTime();
		//out.println(exTime);
		//out.println(endDate);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String secondString = sdf.format(dob);
		//out.println(dob);
		
	
		double msPerDay = 1000 * 60 * 60 * 24 * 365;
		diff =
		(check_date.getTime() / msPerDay) - (dob.getTime() / msPerDay);
		System.out.println("******************************************: "+diff);
		convertLong = new Double(diff);
		}

 //
%>


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
                            <h2>Membership:Membership Application Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMembRegi" id="myform" method="post" class="formcss" action="./insertMembershipReg.html">
							
                                <input type="hidden" name="preMembProc" value="preMembProc" id="preMembProc"/>
								 <%String userIdPMS = (String)session.getAttribute("userId"); 
								 System.out.println("userIdPMS in preMemberShip jsp::::::::::"+userIdPMS);%>
								 <input type="hidden" name="userIdPMS" value="<%=userIdPMS %>" id="userIdPMS"/>
								 
								 <div class='panel-heading col-md-offset-1'>
									<h2> Membership Information:</h2>
								</div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                 <input type="radio" size="10" name="selDisp" id="selDisp" value="Free Membership"/>
                  Free Membership<label style="color:#FF0000">(Free for 1 year)</label><br></br>
                   <input type="radio" size="10" name="selDisp" id="selDisp" value="Full Membership"/>
                  Full Membership<label style="color:#FF0000">(99$ for 1 year)</label>
                                            </div>
                                        </div>

                                    </div>
									
									<div class='col-md-offset-1'>
									<label class='control-label'>Terms and Policy</label>
									</div>
									
									<div class='col-md-offset-1'>
									<input type="checkbox" name="agree" value="" />
									<label class='control-label'>I agree to the digiBlitz Terms of Service and Privacy Policy.</label>
									</div>
								
									
									
							
							
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-4'>
                                        <button class='btn-lg btn-primary' type='submit'  value="Become A Member" name="submit">Become A Member</button>
										 
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

</html>
