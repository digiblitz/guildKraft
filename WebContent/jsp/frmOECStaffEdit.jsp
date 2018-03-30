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
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/calendar2.js" type="text/javascript"></script>
<script  src="js/ts_picker.js"></script>
<script src="js/datetimepicker_css.js"></script>
<script src="js/frmOECStaffEdit.js" type="text/javascript"></script>
<%
  String eveSecreId=(String)request.getAttribute("eveSecreId");
  String logName=(String)request.getAttribute("LogName");
  System.out.println("logName"+logName);
  System.out.println("eveSecreId"+eveSecreId);	 
   
 %>
 
 <script type="text/javascript">
 function focus_login()
{
	document.frmOECStaffEdit.txtEventTitle.focus();
}	


 function focus_chk()
{
 var tmpLog=document.frmOECStaffEdit.logName.value;
 //alert(tmpLog);
 document.getElementById('accUser').style.display="block";
 document.getElementById('ridAddUser').style.display="none";
 document.frmOECStaffEdit.userNameId1.value=tmpLog;
 }	

var arHttpRequest;

function memberDetails()
{
	//alert(document.frmOECStaffEdit.ownerUseaNo2_id.value);
	if(document.frmOECStaffEdit.ownerUseaNo2_id.value!="")
	{
    var memberid=document.frmOECStaffEdit.ownerUseaNo2_id.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
            
        var url = "./RiderInfoAjaxAction.html?memberid="+memberid; 

        if (window.ActiveXObject) 
        { 
            arHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
           
        } 
        else if (window.XMLHttpRequest) 
        { 
            arHttpRequest = new XMLHttpRequest(); 
        } 
     
        arHttpRequest.open("POST", url, true); 
        
        arHttpRequest.onreadystatechange = function() {membStatus(); } ; 
        arHttpRequest.send(null); 
   } 
	}
   
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function membStatus() 
    { 
   
        if (arHttpRequest.readyState == 4) 
        { 
            if(arHttpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var arnameXML = arHttpRequest.responseXML.getElementsByTagName("memberstatus")[0]; 
                 var arnameText = arnameXML.childNodes[0].nodeValue; 
				
				//alert
				
                if(arnameText=="false")
                {    
					alert("Member Id Doesn't Exists!"); 
					document.frmOECStaffEdit.ownerUseaNo2_id.value="";
					document.frmOECStaffEdit.ownerUseaNo2_id.focus();
					return false;
                }
				/*else    
				{
					famMemberStatus();
				}*/

            } 
            else 
            { 
                alert("Error loading page\n"+ arHttpRequest.status +":"+ arHttpRequest.statusText); 
            } 
        } 
    } 


//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.frmOECStaffEdit.userNameId1.value!="" && document.frmOECStaffEdit.userNameId1.value.indexOf(' ')!=0)
	{

   var chsUserName=document.frmOECStaffEdit.userNameId1.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "UsrSignupAjax.html?process=checkusrnam&chsUserName="+chsUserName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText == "false")
		{
			alert("User Name doesn't Exists !");
			document.frmOECStaffEdit.userNameId1.value="";
			document.frmOECStaffEdit.userNameId1.focus();
		}
		      
    } 


 </script>


</head>


<%if(eveSecreId!=null && eveSecreId.trim().length()!=0){%>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="focus_login();focus_chk();">

<%}else{
%>
<body onload="focus_login();">
<%}%>

<%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%! String dateCheck(Date fieldName){
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
		String detValue = "";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
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
                            <h2>Online Entries: Event Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							<p>Required fields are marked with an asterisk <span style="color:#FF0000">*</span></p>
      
								  <% 
								  String staffList = (String)request.getAttribute("staffList");
								  String statuscheck = (String)request.getAttribute("err");
											
											if(statuscheck!=null && statuscheck.equals("st")){
											%>
      						<p>Try Again!</p>
      
      					<%}%>
						
     <p class="para">Edit/Update Event Details:</p>
     
      <%
		HLCCalendarVO calVO = new HLCCalendarVO();
		
		calVO = (HLCCalendarVO)request.getAttribute("singleEventDetails");
		String forReadOnly = "";
		String provisionId = calVO.getCalenderId();
		Date startDate = calVO.getBeginDate();
		String tempDt =(startDate.toString()); 
		Date endDate = calVO.getEndDate();
		Date entryBeginDte = calVO.getEntryStrtDate();
		Date entryEndDte = calVO.getEntryEndDate();
		Date extDueDte = calVO.getExtDueDate();
		String eventTitle = calVO.getEventTitle();
		String selAreaId1 = calVO.getAreaId();
		String selStateId1 = calVO.getStateId();
		System.out.println("selAreaId1"+selAreaId1);
		System.out.println("selStateId1"+selStateId1);
		String orgStatus = calVO.getOrgApprovalStatus();
		String renewalStatus = calVO.getRenewStat().toString();
		String eventId = calVO.getEventId();
		String eventDesc = calVO.getEventDesc();
		String eventLevels = calVO.getEventLevel();
		String orgComments = calVO.getOrgComments();
		String acStatus = calVO.getArearChairApproStatus();
        String acComments = calVO.getAreaChairCommt();
        String usStatus = calVO.getApprovalStatus();
        String usComments = calVO.getStaffComments();
		String issueId1 = calVO.getEveIssueId();
		String eveOrgId = calVO.getOrganizerId();
		
		
		String rStat = "";
		if(renewalStatus.equalsIgnoreCase("true"))	rStat = "No";
		else rStat = "Yes";
		
		long stTime = calVO.getBeginDate().getTime();
		long eTime = calVO.getEndDate().getTime();
		long diffTime = eTime - stTime;
		int noDays = (int)(diffTime/(1000*60*60*24));
		int tempNo=noDays+1;
		String noOfDays=new Integer(tempNo).toString();
		System.out.println("noOfDays"+noOfDays);
		String modifyBy="";  
  %>
			
				<form class='form-horizontal' role='form' name="frmOECStaffEdit" id="frmOECStaffEdit" method="post" action="./calender.html"  onsubmit="return myvalidate();">
						<input type="hidden" name="method" value="updateStaff"/>
						<input type="hidden" name="provisionId" value="<%=provisionId%>" />
						<input type="hidden" name="noOfDays" value="<%=noOfDays%>" />
						<input type="hidden" name="modifyBy" value="<%=modifyBy%>" />
						<input type="hidden" name="compYear" value="<%=tempDt.substring(0,4)%>"/>
						<input type="hidden" name="tempstaffList" value="<%=staffList%>"/>
						<input type="hidden" name="eveOrgId" value="<%=eveOrgId%>"/>
						<input type="hidden" name="logName" value="<%=logName%>"/>
		
							<div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="txtEventTitle" id="txtEventTitle"  class="form-control" value="<%=nullCheck(eventTitle)%>" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Begin Date :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input  type="text" name="startDate1" id="startDate1" readonly="readonly" class="form-control" value="<%=dateCheck(startDate)%>" />
											   <a onclick="javascript:NewCssCal('startDate1')" href="javascript:show_calendar('document.frmEventRequestReg.beginDate', document.frmEventRequestReg.beginDate.value);"><i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event End Date :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input  type="text" name="endDate" id="endDate" readonly="readonly" class="textboxOne" value="<%=dateCheck(endDate)%>" />
              									 <a onclick="javascript:NewCssCal('endDate')" href="javascript:show_calendar('document.frmEventRequestReg.endDate', document.frmEventRequestReg.endDate.value);">
												<i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="selAreaId" id="selAreaId" class="form-control" >
											  <option selected="selected" value=" ">Select One</option>
												<%
												ArrayList areaList = (ArrayList)request.getAttribute("selectAreaDetails");
												if(areaList!=null && areaList.size()!=0){
												Iterator it1 = areaList.iterator();				
												while(it1.hasNext()){
												String sr1[] = (String[])it1.next();
												String selAreaId = sr1[0];
												String selArea  = sr1[2];
												if(selAreaId.equals(selAreaId1)){				
												%>
											   <option value="<%=selAreaId%>" selected="selected"> <%=selArea%> </option>
												<%
												}else{
												%>
												<option value="<%=selAreaId%>"> <%=selArea%> </option>	 
												<%}}}%>
											  </select>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
							    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="selStateId" id="selStateId" class="form-control" >
												  <option selected="selected" value=" ">Select One</option>
													<%
													ArrayList stateList = (ArrayList)request.getAttribute("selectStateDetails");
													if(stateList!=null && stateList.size()!=0){
													Iterator it1 = stateList.iterator();				
													while(it1.hasNext()){
													String sr1[] = (String[])it1.next();
													String selStateId = sr1[0];
													String selState  = sr1[1];
													if(selStateId.equals(selStateId1)){				
													%>
												   <option value="<%=selStateId%>" selected="selected"> <%=selState%> </option>
													<%
													}else{
													%>
													<option value="<%=selStateId%>"> <%=selState%> </option>	 
													<%}}}%>
												  </select>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Season:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="selIssue" id="selIssue" class="form-control" >
														<option selected="selected" value="">Select One</option>										
														<%
														ArrayList issDetails = (ArrayList)request.getAttribute("issueDetails");
														if(issDetails!=null && issDetails.size()!=0){
														Iterator itr = issDetails.iterator();               
														while(itr.hasNext()){
														String[] issueDet = (String[])itr.next();
														String issueId = issueDet[0];
														String issueName = issueDet[1];
												
													if(issueId.equals(issueId1)){				
											%>
										   <option value="<%=issueId%>" selected="selected"> <%=issueName%> </option>
											<%
											}else{
											%>
											<option value="<%=issueId%>"> <%=issueName%> </option>	 
											<%}}}%>
										  </select>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Entry Reg. Begin Date :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="entryBeginDate" id="entryBeginDate" readonly="readonly" class="form-control" value="<%=dateCheck(entryBeginDte)%>" />
              								<a onclick="javascript:NewCssCal('entryBeginDate')" href="javascript:show_calendar('document.frmEventRequestReg.beginDate', document.frmEventRequestReg.beginDate.value);"><i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Entry Reg. End Date :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input  type="text" name="entryEndDate" id="entryEndDate" readonly="readonly" class="form-control" value="<%=dateCheck(entryEndDte)%>"  />
              								<a onclick="javascript:NewCssCal('entryEndDate')" href="javascript:show_calendar('document.frmEventRequestReg.beginDate', document.frmEventRequestReg.beginDate.value);"><i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Extended Due Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input  type="text" name="extDueDate" id="extDueDate" readonly="readonly" class="form-control" value="<%=dateCheck(extDueDte)%>" size="25" maxlength="20" />
              								<a onclick="javascript:NewCssCal('extDueDate')" href="javascript:show_calendar('document.frmEventRequestReg.endDate', document.frmEventRequestReg.endDate.value);">
												<i id="calendar1" class="fa fa-calendar"></i></a>
											  
                                            </div>
                                        </div>

                                    </div>
									
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="orgnaizerId" type="text" id="orgnaizerId" class="form-control"  value="<%=eveOrgId%>" onBlur="orgMemberDetails();"/>
											  
                                            </div>
                                        </div>

                                    </div>
								</div>
									
							<%if(eveSecreId!=null && eveSecreId.trim().length()!=0){%>	
							<div class="form-group">
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose one option that apply: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="radio" size="10" name="regFor" id="regFor" value="mem1" onClick="switchDiv('ridAddUser'),showHideRadio('regFor','accUser','mem1'),clearMemberdetails(); clearUserdetails();" />
Secretary&rsquo;s Member ID<br />
<input type="radio" size="10" name="regFor" id="regFor" value="acc1" checked="checked" onClick="switchDiv('accUser'),  showHideRadio('regFor','ridAddUser','acc1'),clearMemberdetails(); clearUserdetails();" />
Login Name <br />
											  
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
			
		  					
							
								<div class='form-group' id="ridAddUser">
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="ownerUseaNo2_id" id="ownerUseaNo2_id" class="form-control"  onBlur="memberDetails();"/>
                                            </div>
                                        </div>

                                    </div>
								</div>
							
      
							
								<div class='form-group' id="accUser">
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Login Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="userNameId1" id="userNameId1" class="form-control" onblur="usrStat();" />
                                            </div>
                                        </div>

                                    </div>
								</div>
							
      
					<%}else{%>
					
							<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose one option that apply:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="radio" size="10" name="regFor" id="regFor" value="mem1" onClick="switchDiv('ridAddUser'),showHideRadio('regFor','accUser','mem1'),clearMemberdetails(); clearUserdetails();" />
Secretary&rsquo;s Member ID<br />
											 <input type="radio" size="10" name="regFor" id="regFor" value="acc1" onClick="switchDiv('accUser'),  showHideRadio('regFor','ridAddUser','acc1'),clearMemberdetails(); clearUserdetails();" />
Login Name <br />
                                            </div>
                                        </div>

                                    </div>
								</div>	

						
								<div class='form-group' id="ridAddUser">
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="ownerUseaNo2_id" id="ownerUseaNo2_id" class="form-control"  onBlur="memberDetails();"/>
                                            </div>
                                        </div>

                                    </div>
								</div>
						
						
						
 				
					  
								<div class='form-group' id="accUser">
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Login Name:</label>
										<div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<input name="userNameId1" id="userNameId1" class="form-control" onblur="usrStat();" />
												</div>
											</div>

										</div>
									</div>
						
					
					<%}%>
					
					<div class='form-group'>
                         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Chair Approval Status:</label>
                         <div class='col-md-8'>
                         	<div class='col-md-3 indent-small'>
                         		<div class='form-group internal'>
                       				 <label class='control-label'><%=nullCheck(acStatus)%></label>
                                 </div>
                            </div>

                         </div>
					</div>

                      <div class ='form-group'>					
						 
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Chair Approval Comments:</label>
                         <div class='col-md-8'>
                         	<div class='col-md-3 indent-small'>
                         		<div class='form-group internal'>
                       				 <label class='control-label'><%=nullCheck(acComments)%></label>
                                 </div>
                            </div>

                         </div>
					</div>	 
						<div class ='form-group'>	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organizer  Approval Status:</label>
								<div class='col-md-8'>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
											<label class='control-label'><%=nullCheck(orgStatus)%></label>
										</div>
									</div>

								</div>
						</div>
                         						
						 <div class ='form-group'>	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organizer  Approval Comments:</label>
								<div class='col-md-8'>
									<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
											<label class='control-label'><%=nullCheck(orgComments)%></label>
										</div>
									</div>

								</div>
						</div>
					
					<div class='form-group'>
						 <div class='col-md-12 gp'>
							<div class=" col-md-offset-2 col-md-2">
								<label class='control-label'>Event Levels :</label>
								<span style="color:#FF0000">*</span></div>

									<div class='col-md-4'>
										<label class='control-label'>Divisions :</label>
									</div>
												
									<div class='col-md-4'>
										<label class='control-label'>Championship Details :</label>
									</div>
						</div>
					</div>


          <%! String x1; %>
			
			<% 
            int countVal=0;           
			int chksfx=0;
			String cbx="divlevel";
			boolean entIdStatus=false;
			boolean chStatus=false;
			boolean checkStatus=false;
			String eventcnt="";
			ArrayList divisionList1 = (ArrayList)request.getAttribute("divisionDetails");
			java.util.Vector allTypesVect=new Vector();
			allTypesVect=(java.util.Vector)request.getAttribute("allTypesVect");
			Enumeration itrators= (Enumeration)allTypesVect.elements();
			int i=0;
			countVal=allTypesVect.size();
			while(itrators.hasMoreElements()){
			String[] s = (String[]) itrators.nextElement();                                    
			String code=s[4];
			String selEventId=s[2];
			String selEventTypeId=s[1];
			String mid=s[0];
			String cnct=selEventId+"#"+code+"#"+selEventTypeId;
			i++;
			ArrayList eventList1 = (ArrayList)request.getAttribute("selectedEventDetails");
						if(eventList1!=null && eventList1.size()!=0){
							Iterator it = eventList1.iterator();
							while(it.hasNext()){
								entIdStatus = false;
								String sr[] = (String[])it.next();
								String selectEventId = sr[0];
								String selectEvTypeId = sr[2];
								String champStatus =sr[5];
								boolean champSts=Boolean.parseBoolean(champStatus);


								eventcnt=selectEventId+"#"+selectEvTypeId;
								if(selEventTypeId.equals(selectEvTypeId)){
									if(selEventId.equals(selectEventId)){
									entIdStatus = true;
									if(champSts==true){
									chStatus=true;
									}else if(champSts==false){
									chStatus=false;
									}
									break;
									
									
									}
								}
				   			 }
					   }
			%>   
			    <%
				String cbxname=cbx+Integer.toString(chksfx);
				if(!(s[3].equals(x1))){
				x1=s[3];
				%>
					<div class='form-group'>
						<label class='control-label label1  col-md-offset-1'><%=x1%></label>
					</div>
		 
		  <%}%>
		
		  <%
		  if(entIdStatus==true){
		  
		  %>
		  
		  			<div class='form-group'>
					
						<div class='col-md-12 gp'>
							<div class='col-md-2 col-md-offset-2'>
								<input type="checkbox" size="10" name="txtEvent<%=i%>" id="txtEvent<%=i%>" value="<%=cnct%>" checked="checked" onclick="<%=forReadOnly%>"/><%=code%>
							</div>
					
						<div class="col-md-4">
		  <% ArrayList divisionList = (ArrayList)request.getAttribute("divisionDetails");
		 
		  String divisioncnt = "";
		  int j = 0;
						if(divisionList!=null && divisionList.size()!=0){
						
							Iterator it = divisionList.iterator();
							while(it.hasNext()){
								
								String sr[] = (String[])it.next();
								String divisionId = sr[0];
								String divisionName = sr[1];
								divisioncnt=divisionId+"#"+divisionName;
								ArrayList selectDivisionDetails = (ArrayList)request.getAttribute("selectDivisionDetails");
								checkStatus = false;
								if(selectDivisionDetails!=null && selectDivisionDetails.size()!=0){
							Iterator itr = selectDivisionDetails.iterator();
							while(itr.hasNext()){
							String str[] = (String[])itr.next();
							String seldivisionId = str[0];
							String selTypeId = str[1];
							String selLevelId = str[2];
							if(selEventTypeId.equals(selTypeId))
							{
							if(selEventId.equals(selLevelId))
							{
							if(seldivisionId == null && divisionName.equals("Open"))
							checkStatus = true;
							if(divisionId.equals(seldivisionId))
							{
									checkStatus = true;
									}
									}}
									}
								}
								
				   		if(checkStatus)	{  %>
			  
						
								
						
								<input type="checkbox" size="10" name="txtDiv<%=i%>_<%=j%>" id="txtDiv<%=i%>_<%=j%>" value="<%=divisioncnt%>" checked="checked" onclick="<%=forReadOnly%>"/><%=divisionName%>
								
							
							
						
			   <%
			    }else{
			   %>
						
								
								
								<input type="checkbox" size="10" name="txtDiv<%=i%>_<%=j%>" id="txtDiv<%=i%>_<%=j%>" value="<%=divisioncnt%>" onclick="<%=forReadOnly%>"/><%=divisionName%>
							
							
						
					
					
				<%}
				j++;}
				}
				%>
						
				</div>		
				
		  <%if(chStatus==true){ %>
		  
		  	
				
					<div class='col-md-4'>
						<input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" onclick="<%=forReadOnly%>" /> Yes
						
						<input type="radio" size="10" name="champ<%=i%>" value="no" onclick="<%=forReadOnly%>" checked="true"/> No 
					</div>
			
		
			
			<%}else{%>
			
			
				
							
					<div class='col-md-4'>
						<input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" onclick="<%=forReadOnly%>" />Yes
				
						<input type="radio" onclick="<%=forReadOnly%>" size="10" name="champ<%=i%>" value="no" checked="true"/>No 
           			</div>
				
		 
		  
			<%}%>
				</div>
			</div>
			
          <%}else{%>
		  
			<div class='form-group'>
				<div class='col-md-12 gp'>
					<div class='col-md-2 col-md-offset-2'>
		  
						<input type="checkbox" size="10" name="txtEvent<%=i%>" id="txtEvent<%=i%>" value="<%=cnct%>" onclick="<%=forReadOnly%>"/> <%=code%>
             
					</div>
					<div class="col-md-4">
			 
			  <% ArrayList divisionList = (ArrayList)request.getAttribute("divisionDetails");
			  String divisioncnt = "";
			  int j = 0;
						if(divisionList!=null && divisionList.size()!=0){
							Iterator it = divisionList.iterator();
							while(it.hasNext()){
							
								String sr[] = (String[])it.next();
								String divisionId = sr[0];
								String divisionName = sr[1];
								divisioncnt=divisionId+"#"+divisionName;
								
				   			  %>
			 
					
					
					
						<input type="checkbox" size="10" name="txtDiv<%=i%>_<%=j%>" id="txtDiv<%=i%>_<%=j%>" value="<%=divisioncnt%>" onclick="<%=forReadOnly%>"/><%=divisionName%>
						
					
			
			
			   
				<%
				j++;}
				}
				%>
					</div>
					<div class='col-md-4'>
						<input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" onclick="<%=forReadOnly%>" />
							Yes
						<input type="radio" size="10" name="champ<%=i%>" value="no" onclick="<%=forReadOnly%>" checked="true"/>
							No 
					</div>
				</div>
			</div>
		
          
		  <%}
			chksfx++; 
			
        }%>
			<input type="hidden" name="countVal" value="<%=countVal%>"/>
			<input type="hidden" name="allTypesVect" id="allTypesVect" value="<%=allTypesVect.size()%>" /> 
			<input type="hidden" name="allDivisions" id="allDivisions" value="<%=divisionList1.size()%>" /> 
	
	 		
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approval Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="uStaffStatus" id="uStaffStatus" class="form-control" >
												<option selected="selected" value="" >Select One</option>
													<%	String[] status = new String[]{"Approved","Pending","Rejected"};
														for(int k =0; k<status.length; k++){
															if(usStatus!=null && usStatus.equalsIgnoreCase(status[k])){
													%>
												<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
													<%}else{%>
												<option value="<%=status[k]%>"><%=status[k]%></option>
													<%}}%>
											</select>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
									
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Staff Comments :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <textarea id="txtStaffComm" name="txtStaffComm" rows="5" class="form-control" cols="25"><%=nullCheck(usComments)%></textarea>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                             
	
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="editButton" type="submit" value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="advDimButton" type="button"  value="Cancel" onclick="javascript:history.back(-1);" >Cancel</button>
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
<script language="javascript">
    var cal1 = new calendar2(document.forms['frmOECStaffEdit'].elements['startDate1']);
	 cal1.year_scroll = true; 
	 cal1.time_comp = false;
	 
    var cal2= new calendar2(document.forms['frmOECStaffEdit'].elements['endDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;	
	
	
	 var cal3 = new calendar2(document.forms['frmOECStaffEdit'].elements['entryBeginDate']);
	 cal3.year_scroll = true; 
	 cal3.time_comp = false;
	 
    var cal4= new calendar2(document.forms['frmOECStaffEdit'].elements['entryEndDate']);
	cal4.year_scroll = true;
	cal4.time_comp = false;	
	
		 
    var cal5= new calendar2(document.forms['frmOECStaffEdit'].elements['extDueDate']);
	cal5.year_scroll = true;
	cal5.time_comp = false;	
	
</script>
</body>
</html>
