<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import ="com.hlcmeeting.util.*" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script>
<%
String statusName = (String) request.getAttribute("statusName");
if(statusName==null) statusName="";
%>
</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
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
                            <h2>Meetings:Annual Meeting &amp; Convention List Page </h2>
						</div>
						
				<div class='panel-body'>
					<div class="margin marginn">
						<div class="form-group">
							<div class="col-md-10">
								<div class="col-md-2">
									<label class='control-label label1'>Badge Name </label>
								</div>
							<div class="col-md-2">
									<label class='control-label label1'>Full Name </label>
							</div>
							<div class="col-md-2">
									<label class='control-label label1'>Member Type </label>
								</div>
							<div class="col-md-2">
									<label class='control-label label1'>Request Status </label>
								</div>
							<div class="col-md-2">
									<label class='control-label label1'>View</label>
								</div>
							</div>
						</div>
					</div>
						

					<%
		   		
					 ArrayList memberDetail=(ArrayList)request.getAttribute("viewMemberDetails");
					 String firstName="";
							String memTypeName="";
							String badgeName="";
							String annualMeetingId ="";
							 String ardId  = "";
							 
							 			
					 if(memberDetail!=null && memberDetail.size()!=0){ 
						Iterator  enm1 = memberDetail.iterator(); 
							while(enm1.hasNext()){
							HLCAnnualRegistrationDetailVO objRegDet = (HLCAnnualRegistrationDetailVO)enm1.next();
							
							String reqStatus = objRegDet.getRequestStatus();
                    		Date date = objRegDet.getAddDate();
							String remarks = objRegDet.getRemarks();
							String lName = objRegDet.getLastName();
                    
                    
					 
							
							  ardId = objRegDet.getArdId();
							if(annualMeetingId!=null){
							  firstName = objRegDet.getFirstName();
							  memTypeName = objRegDet.getMemTypeName();
							  badgeName = objRegDet.getBadgeName();
							}  
							 if(memTypeName==null || memTypeName.trim().length()==0)  memTypeName = "N/A";
							 if(badgeName==null || badgeName.trim().length()==0)  badgeName = "N/A";							
		   %>
		   <!-- {annualMeetingId,badgeInfo,firstName,lastName,areaName,requestStatus,addDate,email};  -->

							<form name="frmDisplayAdminList" method="post" action="AnnualRegList.html">		
							<input name="memProcess" type="hidden" value="detailedUserDetails">
							<input name="ardId" type="hidden" value="<%=ardId%>">
						 <div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
									   <div class='col-md-2'>
									   		<label class='control-label'><%=badgeName%> </label>
										</div>
										
										<div class='col-md-2'>
									   		<label class='control-label'><%=firstName%>&nbsp;<%=lName%> </label>
										</div>
										
										<div class='col-md-2'>
									   		<label class='control-label'><%=memTypeName%></label>
											</div>
										<div class='col-md-2'>
									   		<label class='control-label'><%=reqStatus%></label>
											</div>
											
								<div class='col-md-2'>
										
								<button class='btn-lg btn-primary' type='submit'>View</button>
										</div>	
							
							
						</form>
		   
					      <%	}
									}else {
								%>
								<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
												No Records are available.
											</div>
										</div>
									</div>
								</div>
								
								<%}%>

						
	  
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
