<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->

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
 							<h2>Meetings: List of EDU Meetings</h2>	
						</div>	
						
						<div class='panel-body'>
				 			<p>EDU Meetings placed by Organizers are listed below. To view the details,click on the 'View' button beside each record and to apply for the meeting click on the 'Apply' button.</p>	
							
				<div class="margin marginn">
					<div class="form-group">
						<div class="col-md-12">
						
						<div class="col-md-1"></div>
					
							<div class="col-md-2">
								<label class='control-label label1'>Meeting ID</label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>Activity Name</label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>Date to be Held</label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>View</label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>Apply</label>
							</div>
						</div>
					</div>
				</div>	
						
						  
							<%
						
		           
          	SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
         	String meetingId ="";
		    String activityDate ="";
			String requestDate ="";
			String meetingName ="";
			ArrayList vPendingAds = (ArrayList)request.getAttribute("displayApprovedDetails");
			if(vPendingAds!=null && vPendingAds.size()!=0){
						Iterator e = vPendingAds.iterator();
						ArrayList finalList = new ArrayList();
						while(e.hasNext()){
						 ArrayList exaVal = (ArrayList)e.next();
						 Iterator enumPub1 = exaVal.iterator();
						 while(enumPub1.hasNext()){
								HLCActivityOrganizerVO objActDet = (HLCActivityOrganizerVO)enumPub1.next();
									Vector publication = (Vector)enumPub1.next();
									 meetingName =objActDet.getActivityName();							
									 meetingId =	objActDet.getActivityMeetingId();
									 if(objActDet.getActivityDate()!=null){
									 activityDate = sdf.format(objActDet.getActivityDate());
									 }
									 if(objActDet.getAddDate()!=null){
									 requestDate =  sdf.format(objActDet.getAddDate());
									 }
					
					%>
				
							
							
					   <form name="frmMembRegi" id="myform" method="post" class="formcss" action="meeting.html">
					   <input type="hidden" name="orgMeetingId" value="<%=meetingId%>" />
					     <input type="hidden" name="meeProcess" value="showOrgMee" />
						 
					<div class="margin marginn">
						<div class='form-group'>
							<div class="col-md-12">
								 <div class="container"> 
									 <div class="row"> 
									 
									    <div class="col-md-1"></div>
										<div class='col-md-2'>
						  					<%=meetingId%>
										</div>
										
										<div class='col-md-2'>
											<%=meetingName%>
										</div>
										
										<div class='col-md-2'>
											<%=activityDate%>
										</div>
										
										<div class='col-md-offset-4 col-md-2 gp'>
                                       		 <button class='btn-lg btn-primary' type='submit' name="butName" value="View">View</button>
										</div>
										
										<div class='col-md-2'>
                                       		 <button class='btn-lg btn-primary' type='submit' name="butName" value="Apply">Apply</button>
										</div>
										
										</div>
									</div>
								</div>
							</div>
						</div>
						</form>	
  
                                           
							<%}
							}
							}
							else {
					%>
					 <div class='form-group'>
								
                                 <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-10'>
											<div class='col-md-5'>
											</div>
											<div class='col-md-5'>
												</p>No records are available </p>
											</div>
										</div>
									 </div>
								</div>
							</div>
					<%}%> 
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
