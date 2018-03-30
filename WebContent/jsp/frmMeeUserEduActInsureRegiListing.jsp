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


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->

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
 							<h2>Meeetings: Insurance Release Registration Listing-Educational Activity </h2>
						</div>	
						<div class='panel-body'>	    
					 	<p><img src="images/usea_logo.jpg" class="imgFloatLeft" /> 
					  
					  Insurance Release Educational Activity Registrations placed by you are listed below. To view the details, 
					  click on the 'MemberID' link and to Delete a record click on the  button beside each record.</p>				
					
					
						 
				<div class="margin marginn">
					<div class="form-group">
						<div class="col-md-12">
						
							<div class="col-md-offset-1 col-md-2">
								<label class='control-label label1'>Meeting ID</label>
							</div>
							
							<div class="col-md-3">
								<label class='control-label label1'>Date of Registration </label>
							</div>
							
							<div class="col-md-3">
								<label class='control-label label1'>Approval Status</label>
							</div>
							
							<div class="col-md-3">
								<label class='control-label label1'>View</label>
							</div>
						</div>
					</div>
				</div> 
						 
						  <%
						  SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
						   ArrayList al = (ArrayList)session.getAttribute("DispAllUserDetail");
						  // out.println("Size:" + al.size());
						   if(al!=null && al.size()!=0){
                          	Iterator it = al.iterator();
							while(it.hasNext()){
								HLCActivityUserVO objActUser = (HLCActivityUserVO) it.next();
							   
								String releaseId =  objActUser.getReleaseId();
								String activityMeetingId = objActUser.getActivityMeetingId();
								String userIdVal =  objActUser.getUserId();
								String eventLevelId =  objActUser.getEventLevelId();
								String memberId =  objActUser.getMemberId();
								String noOfHorses =  objActUser.getNoOfHorses();
								String reqStatus =  objActUser.getRequestStatus();
								//out.print("reqStatus" + reqStatus);
								String reqDate = "" ;
								//out.print(objActUser.getAddDate());
								if(objActUser.getAddDate()!=null){
									 reqDate =  sdf.format(objActUser.getAddDate());
								}
						  
						  %>
						  <form name="frmMeeInsureICPListing" method="post" action="meeting.html">
						 <input type="hidden" name="meeProcess" value="userDetail">
						  <input type="hidden" name="releaseId" value="<%=releaseId%>">
						   <input type="hidden" name="activityMeetingId" value="<%=activityMeetingId%>">
						  
					<div class="margin marginn">
						<div class='form-group'>
							<div class="col-md-12">
								 <div class="container"> 
									 <div class="row"> 
										<div class='col-md-2'>
											<%=activityMeetingId%>
										</div>
										
										<div class='col-md-2'>
											<%=reqDate%>
										</div>
										
										<div class='col-md-2'>
											<%=reqStatus%>
										</div>
										
										<div class='col-md-offset-4 col-md-2 gp'>
                                       		 <button class='btn-lg btn-primary' type='submit'  value="View">View</button>
										</div>
									</div>
									</div>
								</div>
							</div>
						</div>	
					
						  </form>
						  
						  <%	}
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

