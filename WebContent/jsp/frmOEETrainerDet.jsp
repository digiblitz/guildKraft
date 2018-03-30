<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlcutil.HLCMemberVO"%>
<%@ page import="com.hlcutil.HLCCalendarVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="js/HorseRegValidateAddTrainer.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/frmHorseRegisterAddTrainer.js" type="text/javascript"></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
<script type="text/javascript">
	
function hideOwner(){
document.getElementById('owner').style.display="none";
}
function resetRadioOne(){
	var chosen2="";
	len = document.myform.regAddFor.length ;
	for(i=0;i<len;i++){
		if(document.myform.regAddFor[i].checked){
		chosen2= document.myform.regAddFor[i].checked=false;
		
		document.getElementById('ridAddMemb').style.display = "none";
		document.getElementById('ridAddUser').style.display = "none";
		document.getElementById('accAddUser').style.display = "none";
		document.getElementById('newwAddUser').style.display = "none";
		document.getElementById('addOwn').style.display = "none";
		
		}
	}
}

function resetRadioTwo(){
	var chosen2="";
	len = document.myform.regFor.length ;
	for(i=0;i<len;i++){
		if(document.myform.regFor[i].checked){
		chosen2= document.myform.regFor[i].checked=false;
		}
	}
}

function userDetails1(param){
	var  url = null;
	if(param.value.length==0)
	return;
	url = "annualAjax.html?method=memberDetail&memberId="+escape(param.value);
	if (window.ActiveXObject){ 
		req = new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	else if (window.XMLHttpRequest){ 
		req = new XMLHttpRequest(); 
	} 
	req.onreadystatechange = processRequest11;         
	req.open("GET", url, true);
	req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
function processRequest11(){ 
	if (req.readyState == 4){ 
		if(req.status == 200){ 
			var xmlDoc = req.responseXML.documentElement;
			var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
			var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
			var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
			var userId =xmlDoc.getElementsByTagName('userId')[0].childNodes[0].nodeValue; 
									 
			var firstNameObj = document.getElementById("firstNameId2");
								    var lastNameObj = document.getElementById("lastNameId2");
									var phoneObj = document.getElementById("phoneId2"); 
							        var userObj = document.getElementById("addUserDetId"); 
								 
									
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
										 if(phone=="null"){
										 phone = "xxxx";
										 }
									 
										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
										userObj.value=userId;
								 
									
							} 
											if(req.status==500) {
											  alert("MembershipId does'nt exists");
											  clearFields2();
											  document.myform.userNameId2.focus();
											  return;
											}
											else{ 
												
											} 
						}	
						
					} 
		 
 function clearFields2() {
		document.getElementById("userNameId2").value = "";
		document.getElementById("firstNameId2").value = "";
		document.getElementById("lastNameId2").value = "";
 		document.getElementById("phoneId2").value = "";
		document.getElementById("addUserDetId").value = "";
		 
 }
 	
    function nonUserDetails1(param){
	
						if(param.value.length==0)
						return;
							var  url = null;
							url = "annualAjax.html?method=memDetails&nonmemberId="+escape(param.value);
						 

							if (window.ActiveXObject){ 
								req = new ActiveXObject("Microsoft.XMLHTTP"); 
							} 
							else if (window.XMLHttpRequest){ 
								req = new XMLHttpRequest(); 
							} 
						
							req.onreadystatechange = processRequest22;         
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processRequest22(){ 
						if (req.readyState == 4){ 
							if(req.status == 200){ 
									//clearDetails();
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
								
									var fNameObj = document.getElementById("cpAddfirstNameId1");
									var lNameObj = document.getElementById("cpAddlastNameId1");
									var phObj = document.getElementById("ecmpAddPhoneId1");  
									var usObj = document.getElementById("addUserDetId");  
								
									fNameObj.value= fName;
									lNameObj.value=lName;
									usObj.value=usId;
									if(ph=="null"){
									 	ph = "xxxx";
									 }
									 
										var phLen = ph.length;
										var minPhLen = phLen - 4;
										phObj.value=ph.substring(minPhLen,phLen);
							} 
							if(req.status==500) {
							  alert("companyName does'nt exists");
							  clear2();
							  document.myform.existAddCompNameId1.focus();
							  return;
							}
							else{ 
								//alert("Error loading page\n"+ req.status +":"+ req.statusText); 
							} 
							  
						}	
					} 


		          function clear2() {
						document.getElementById("cpAddfirstNameId1").value = "";
						document.getElementById("cpAddlastNameId1").value = "";
						document.getElementById("ecmpAddPhoneId1").value = "";
						document.getElementById("addUserDetId").value = "";
						document.getElementById("existAddCompNameId1").value = "";
					}					
					
		function nonUserDetails(param){
						if(param.value.length==0)
						return;
							var  url = null;
							url = "annualAjax.html?method=memDetails&nonmemberId="+escape(param.value);
						 

					 		if (window.ActiveXObject){ 
								req = new ActiveXObject("Microsoft.XMLHTTP"); 
							} 
							else if (window.XMLHttpRequest){ 
								req = new XMLHttpRequest(); 
							} 
						
							req.onreadystatechange = processRequest33;         
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processRequest33(){ 
						if (req.readyState == 4){ 
						   //alert(req.readyState);
							if(req.status == 200){ 
									//clearDetails();
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
									//var usrdob =xmlDoc.getElementsByTagName('userdob')[0].childNodes[0].nodeValue;
									//var usrage =xmlDoc.getElementsByTagName('userage')[0].childNodes[0].nodeValue; 

									var fNameObj = document.getElementById("firstNameId3");
									var lNameObj = document.getElementById("lastNameId3");
									var phObj = document.getElementById("phoneId3");  
									var usObj = document.getElementById("addUserDetId");  
									 
									fNameObj.value= fName;
									lNameObj.value=lName;
									usObj.value=usId;
								
									if(ph=="null"){
									 	ph = "xxxx";
									 }
									 
										var phLen = ph.length;
										var minPhLen = phLen - 4;
										phObj.value=ph.substring(minPhLen,phLen);
									//showAge();
							} 
							if(req.status==500) {
							  alert("userName does'nt exists");
							  clear();
							  document.myform.userNameId3.focus();
							  return;
							}
							else{ 
								
							} 
							  
						}	
					} 
		          function clear() {
						document.getElementById("userNameId3").value = "";
						document.getElementById("firstNameId3").value = "";
						document.getElementById("lastNameId3").value = "";
				
						document.getElementById("phoneId3").value = "";
						document.getElementById("addUserDetId").value = "";
					
					}				
</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="hideOwner();">


<%!
  		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
		String dateFormat(java.util.Date fieldName){					
		Calendar cal = Calendar.getInstance();
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(fieldName);
		cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						
		int tempDay = gc.get(Calendar.DAY_OF_WEEK);
		String holiday = null;
			switch(tempDay){
			case Calendar.SUNDAY:
				holiday ="SUN";
				break;
			case Calendar.MONDAY:
				holiday ="MON";
				break;
			case Calendar.TUESDAY:
				holiday ="TUE";
				break;
			case Calendar.WEDNESDAY:
				holiday ="WED";
				break;
			case Calendar.THURSDAY:
				holiday ="THU";
				break;
			case Calendar.FRIDAY:
				holiday ="FRI";
				break;
			case Calendar.SATURDAY:
				holiday ="SAT";
				break;
			}
			String dispDate = "N/A";
			if(fieldName!=null ){
				dispDate = sd1.format(cal.getTime()).toString()+" ("+holiday+")";
			}
			return dispDate;
		}
  %> 

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
                            <h2>Membership: Add Trainer Details Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		
		
     <%
	 
	 	String horseMemberId = (String)request.getAttribute("horseMemberId");
	   	String riderId = (String)request.getAttribute("riderId");
		String ownerId = (String)request.getAttribute("userName");
		System.out.println("ownerId"+ownerId);
	   	String compYear = (String)session.getAttribute("compYear");
	   	String eventTypeId = (String)session.getAttribute("eventTypeId");
	   	ArrayList objProCalList = (ArrayList)request.getAttribute("selectEventDetails");
		String horseName = (String)request.getAttribute("horseName");
		String orgFirstName = (String)session.getAttribute("orgFirstName");
		String orgLastName = (String)session.getAttribute("orgLastName");


	 %>
	
     <form class='form-horizontal' role='form' name="myform" id="myform" method="post" action="OEEAddTrainer.html" onSubmit="return myValidate();">
			<input type="hidden" name="process" value="insertTrainer" />
			<input type="hidden" name="horseMemberId" value="<%=horseMemberId%>">
			<input type="hidden" name="riderId" value="<%=riderId%>">
			<input type="hidden" name="addOwnerUserId" id="addUserDetId" />
			<input type="hidden" name="compYear" id="<%=compYear%>" />
			<input type="hidden" name="eventTypeId" id="<%=eventTypeId%>" />
			<input type="hidden" name="horseName" id="<%=horseName%>" />
		
			<p>Selected Event Details:</p>
					
					<div class="form-group">
						<div class="row">
							<div class="col-md-12 gp">
								<div class="col-md-2">
									<label class="control-label label1">Begin Date</label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">End Date </label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">Event Title</label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">Organizer Name</label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">Area Code</label>
								</div>
								<div class="col-md-1">
									<label class="control-label label1">Location</label>
								</div>
								<div class="col-md-1">
									<label class="control-label label1">Status</label>
								</div>
							</div>
						</div>
					</div>
			
		<%
			HLCCalendarVO calVO = new HLCCalendarVO();
			if(objProCalList!=null && objProCalList.size()!=0){
			Iterator itr =objProCalList.iterator();
        		while(itr.hasNext()){
					calVO =(HLCCalendarVO)itr.next();
					String evId = calVO.getEventId();
					String beginDate=dateFormat(calVO.getBeginDate());
					String endDate=dateFormat(calVO.getEndDate());
					String eventTitle=calVO.getEventTitle();
					String orgId=calVO.getOrganizerId();
					String areaCode=calVO.getAreaCode();
					String areaName=calVO.getAreaName();
					String stateName=calVO.getStateName();
					String areaChApprovStat=calVO.getOrgApprovalStatus();
					String status=calVO.getStatus();
		%>
		
		
					<div class="form-group">
						<div class="row">
							<div class="col-md-12 gp">
								<div class="col-md-2">
									<label class="control-label "><%=beginDate%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=endDate%> </label>
								</div>
								<div class="col-md-2">
									<a href="calender.html?method=eventView&eventId=<%=eventTypeId%>"><%=eventTitle%></a>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=orgFirstName%>&nbsp;<%=orgLastName%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=areaCode%></label>
								</div>
								<div class="col-md-1">
									<label class="control-label "><%=stateName%></label>
								</div>
								<div class="col-md-1">
									<label class="control-label "><%=status%></label>
								</div>
							</div>
						</div>
					</div>

				<%}}else{%>
				
				<div class="form-group">
						<div class="row">
							<div class="col-md-12 gp">
								<div class="col-md-2">
								</div>
								<div class="col-md-2">
										No records are available.
								</div>
							</div>
						</div>
					</div>
		<%}%>
						 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>			
												<label class="control-label label1"><%=horseMemberId%></label>
											</div>
										</div>
									</div>
									
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>			
												<label class="control-label label1"><%=horseName%></label>
											</div>
										</div>
									</div>
								</div>
		
						<p>Trainer Information Section:</p>
							
							 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose one option that apply:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
						
												 <input type="radio" size="10" name="regAddFor" id="regAddFor" value="mem1" onClick="switchDiv('ridAddUser'),showHideRadio('regAddFor','ridAddMemb','mem1'), showHideRadio('regAddFor','accAddUser','mem1'),  showHideRadio('regAddFor','companyAddUser','mem1'), showHideRadio('regAddFor','existAddComp','mem1'), showHideRadio('regAddFor','compAddQuest','mem1'), showHideRadio('regAddFor','owner','mem1'), clearHLCdetails1(); clearNotHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1(),arCheck(<%=riderId%>); " />
												The Trainer is the Rider. <br />
												<input type="radio" size="10" name="regAddFor" id="regAddFor" value="own" onClick="switchDiv('owner'),showHideRadio('regAddFor','ridAddUser','own'),showHideRadio('regAddFor','ridAddMemb','own'), showHideRadio('regAddFor','accAddUser','own'),  showHideRadio('regAddFor','companyAddUser','own'), showHideRadio('regAddFor','existAddComp','own'), showHideRadio('regAddFor','compAddQuest','own'), clearHLCdetails1(); clearNotHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1();ownerCheck('<%=ownerId%>'); " />
												The Trainer is the Owner. <br/>
												<input type="radio" size="10" name="regAddFor" id="regAddFor" value="rid" onClick="switchDiv('ridAddMemb'),showHideRadio('regAddFor','ridAddUser','rid'), showHideRadio('regAddFor','accAddUser','rid'),  showHideRadio('regAddFor','companyAddUser','rid'), showHideRadio('regAddFor','existAddComp','rid'), showHideRadio('regAddFor','compAddQuest','rid'), showHideRadio('regAddFor','owner','rid'), clearNotHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1();" />
												Trainer is HLC Member. <br />
												<input type="radio" size="10" name="regAddFor" id="regAddFor" value="acc" onClick="switchDiv('accAddUser'),showHideRadio('regAddFor','ridAddUser','acc'), showHideRadio('regAddFor','companyAddUser','acc'), showHideRadio('regAddFor','ridAddMemb','acc'), showHideRadio('regAddFor','existAddComp','acc'), showHideRadio('regAddFor','compAddQuest','acc'), showHideRadio('regAddFor','owner','acc'), clearHLCdetails1(); comRegClear1(); comNewClear1(); comRadioClear1();clear2();" />
												The Trainer has a Dashboard Username (Login ID)<br />
											<input type="radio" size="10" name="regAddFor" id="rself1" value="cmp" onClick="switchDiv('compAddQuest'),showHideRadio('regAddFor','ridAddUser','cmp'), showHideRadio('regAddFor','ridAddMemb','cmp'), showHideRadio('regAddFor','accAddUser','cmp'), showHideRadio('regAddFor','companyAddUser','cmp'), showHideRadio('regAddFor','existAddComp','cmp'), showHideRadio('regAddFor','owner','cmp'), clearHLCdetails1(); clearNotHLCdetails1();" />
												The Trainer is a Company.
											
										</div>
									</div>
								</div>
							</div>
									
							<p> Trainer - Rider </p>
									
								<div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="ownerUseaNoTwo" id="ownerUseaNo2_id" class="form-control" readonly="readonly"/>
										</div>
									</div>
								</div> 
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="ownerFNameTwo" id="ownerFname2_id"  class="form-control"  readonly="readonly"/>
										</div>
									</div>
								</div>  
										
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="ownerLNameTwo" id="ownerLname2_id"  class="form-control"  readonly="readonly"/>
										</div>
									</div>
								</div> 
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="ownerPhoneTwo" id="ownerPhone2_id"  class="form-control"  readonly="readonly"/>
										</div>
									</div>
								</div> 
							 </div>
							
				  			 <div class='form-group id="compAddQuest"'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Is the company already registered</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="radio" size="10" name="ecmp1" id="ecmp1" value="yes" onClick="switchDiv('existAddComp'); showHideRadio('ecmp1','companyAddUser','yes'); comNewClear1();"> Yes
												<input type="radio" size="10" name="ecmp1" id="ecmp1" value="no"  onClick="switchDiv('companyAddUser'); showHideRadio('ecmp1','existAddComp','no'); comRegClear1();"> No
											
											</div>
										</div>
									</div>
								</div>		
								
								
								<p>Trainer Information - Member</p>
								
								
							 <div class='form-group id="ridAddMemb"'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="userNameId2" id="userNameId2" class="form-control"  onblur="userDetails1(this);"/>	
												 <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>		
 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="firstNameId2" class="form-control" id="firstNameId2" value=""  readonly="readonly" />
											</div>
										</div>
									</div>
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="lastNameId2" class="form-control" id="lastNameId2"  value=""  readonly="readonly" />
											</div>
										</div>
									</div>
								
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone: (Last 4 digits)</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												xxx-xxx-<input name="phoneId2" class="form-control" id="phoneId2"size='8' value=""  readonly="readonly" />
											</div>
										</div>
									</div>
								</div>
										
							
						
							 <p> Trainer Information - Web User </p>
							 	
								 <div class='form-group id="accAddUser"'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Username:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="userNameId3" id="userNameId3" class="form-control"  onblur="nonUserDetails(this);" /> 
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									 
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="firstNameId3" class="form-control" id="firstNameId3"  value=""  readonly="readonly" />
											</div>
										</div>
									</div>
												
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="lastNameId3" class="form-control" id="lastNameId3" value="" readonly="readonly" />
											</div>
										</div>
									</div>
								
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone: (Last 4 digits)</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													xxx-xxx-<input name="phoneId3" id="phoneId3" class="form-control"  value="" readonly="readonly" size="8" />
												</div>
										</div>
									</div>
								</div>
								
							<p>Trainer Information - Company</p>
							
							
							<div class='form-group id="existAddComp"'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Company Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="existAddCompNameId1" id="existAddCompNameId1" class="form-control"  onblur="nonUserDetails1(this);"  /> 
												<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
							
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Contact Person First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="cpAddfirstNameId1" class="form-control" id="cpAddfirstNameId1" value=""  readonly="readonly" />
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Contact Person Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="cpAddlastNameId1" class="form-control" id="cpAddlastNameId1"  value=""  readonly="readonly" />
											</div>
										</div>
									</div>
										
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone: (Last 4 digits</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													xxx-xxx-<input name="ecmpAddPhoneId1" id="ecmpAddPhoneId1" class="form-control" value="" readonly="readonly" size="8" />
												</div>
										</div>
									</div>
								</div>
								
								
								<p>Trainer Information - New Company</p>
								
								
					
							<div class='form-group id="companyAddUser"'>
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Company Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="newAddFirstNameIdComp" id="newAddFirstNameIdComp" class="form-control"   onblur="usrStat();"/>
												<span id="span_astriesk">*</span> 
											</div>
									</div>
								</div> 
								 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="newAddAddressIdComp" id="newAddAddressIdComp" class="form-control"  />
												<span id="span_astriesk">*</span> 
											</div>
									</div>
								</div> 

								  
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<SELECT name="newAddCountryIdComp" id="newAddCountryIdComp" class="form-control"  onChange="FillState(document.myform.newAddCountryIdComp, document.myform.newAddStateIdComp, '--Select One--');">
												</SELECT>
												<span id="span_astriesk">*</span> 
											</div>
									</div>
								</div> 
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <SELECT name="newAddStateIdComp" id="newAddStateIdComp" class="form-control" ></SELECT>
									  				<span id="span_astriesk">*</span>
													</div>
											</div>
										</div> 
								  
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<input name="newAddCityIdComp" id="newAddCityIdComp" class="form-control"  />
													<span id="span_astriesk">*</span> 
												</div>
									</div>
								</div> 
													
													
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip Code</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="newAddZipIdComp" id="newAddZipIdComp" class="form-control" />
												<span id="span_astriesk">*</span> 
										</div>
									</div>
								</div> 
								 
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail-ID</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											   <input name="newAddEmailIdComp" id="newAddEmailIdComp" class="form-control"  />
											   <span id="span_astriesk">*</span> 
											 </div>
									</div>
								</div> 
								
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											   <input name="newAddPhoneIdComp" id="newAddPhoneIdComp" class="form-control"  />
											  <span id="span_astriesk">*</span> 
											</div>
									</div>
								</div> 
								 
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
									   			<input name="newAddFaxIdComp" id="newAddFaxIdComp" class="form-control" />
											</div>
									</div>
								</div> 
								 
						  	       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Contact Person First Name</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
										   <input name="cpAddFirstNameIdComp" id="cpAddFirstNameIdComp" class="form-control"  />
                                      		 <span id="span_astriesk">*</span> 
											</div>
									</div>
								</div> 
								 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Contact Person Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											   <input name="cpAddLastNameIdComp" id="cpAddLastNameIdComp" class="form-control"  />
											  <span id="span_astriesk">*</span> 
											</div>
										</div>
									</div>
								</div>
							
				 <p>Trainer - Owner </p>
				 
				 		<div class="form-group">
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="txtUserName" id="txtUserName" class="form-control"  readonly="readonly"/>
												</div>
									</div>
								</div> 
								
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<input name="txtFirstName" id="txtFirstName"  class="form-control"  readonly="readonly"/>
												</div>
											</div>
										</div> 
								
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<input name="txtLastName" id="txtLastName"  class="form-control" readonly="readonly"/>
												</div>
											</div>
										</div> 
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="txtPhone" id="txtPhone"  class="form-control"  readonly="readonly"/>
											</div>
										</div>
									</div>
								</div>
								
								
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' type="button" value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
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



<script language="javascript">
	FillCountry(document.myform.newAddCountryIdComp, document.myform.newAddStateIdComp, 'USA');
	FillState(document.myform.newAddCountryIdComp, document.myform.newAddStateIdComp, '---Select---');
</script>
</html>
