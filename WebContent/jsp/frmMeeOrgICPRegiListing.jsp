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
<%@ page import="com.mee.action.*"%>



<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>


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
                            <h2>Meetings: Organizer ICP Registration Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>ICP Registerations placed by you are listed below. To view the details,
					click on the 'View' button beside each record.</p>
							
						<!--==============================Form Description=================================-->

  
						  <%
						 ArrayList orgDet=(ArrayList)request.getAttribute("orgDetails");
						 
						  %>
						  
						  <div class='from-group'>
						  	<div class='col-md-12'>
								
								<div class='col-md-2'>
								<label class='control-label label1'>Organizer ID</label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label label1'>Assessment Level</label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label label1'>Date of Event</label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label label1'>Date of Registration</label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label label1'>Approval Status</label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label label1'>View</label>
								</div>
				 
							</div>
						</div>
					
								   
						 
							   <form>
								  <input type="hidden" name="method" id="method" value="viewOrg"/>
								 <%
								 
								 if(orgDet!=null && orgDet.size()!=0){
							Iterator it1 = orgDet.iterator();				
							while(it1.hasNext()){
							AdminOrgVO orgVo = (AdminOrgVO)it1.next();
							String instrId = orgVo.getInstructorId();
	                       String reqStatus=orgVo.getRequestStatus();
	                      String assessDt= orgVo.getAssesmentDate();
	                       String regDt=orgVo.getAddDate();
	                       String icpMeetId=orgVo.getIcpMeetingId();
	                       String hostMembId=orgVo.getHostMemberId();
	                       String assessLevl=orgVo.getAssesmentLevel();
							
								 %> 
								  
									  <input type="hidden" name="icpMeetingId" value="<%=icpMeetId%>"/>
									  
						<div class='from-group'>
						  	<div class='col-md-12'>
								
								<div class='col-md-2'>
								<label class='control-label'><%=hostMembId%></label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label'><%=assessLevl%></label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label'><%=assessDt%></label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label'><%=regDt%>n</label>
								</div>
								
								<div class='col-md-2'>
								<label class='control-label'><%=reqStatus%></label>
								</div>
								
								<% if(reqStatus.equalsIgnoreCase("Approved")){	%>
								
								<div class='col-md-2'>
								<button name="viewButton" type="button" class="btn-lg btn-primary" value="view" onclick="location.href='listAdminOrg.html?method=viewOrg&icpMeetingId=<%=icpMeetId%>'">view</button>
								</div>
								
								<%}else if(reqStatus.equalsIgnoreCase("Rejected")){%>
								
								<div class='col-md-2'>
								<button name="viewButton" type="button" class="btn-lg btn-primary" value="Edit" onclick="location.href='ICPOrgListApp.html?process=edit&icpMeetingId=<%=icpMeetId%>'">Edit</button>
								</div>
								
								<%	}else{	%>
								
								<div class='col-md-2'>
								<button name="viewButton" type="button" class="btn-lg btn-primary" value="view" onclick="location.href='listAdminOrg.html?method=viewOrg&icpMeetingId=<%=icpMeetId%>'" >view</button>
								</div>
				 
							</div>
						</div>
						
						 <%}}}else{%>
						 
						 	<div class='form-group'>
                                <div class='col-md-8 col-md-offset-4'>
                                       No Records Found
                                    </div>
								</div>
					
									  
								
								<%} %>	  
									  
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
