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
                            <h2> Meetings:Organizer Educational Activity Registration Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Educational Activity Registerations placed by you are listed below. To view the details,
					click on the 'View' button beside each record.</p>
							
						<!--==============================Form Description=================================-->
						
						
					<div class='form-group'>
						<div class='col-md-16'>
							<div class='col-md-2'>
							<label class='control-label label1'>Meeting ID</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Date of Event</label>
							</div>
							
							<div class='col-md-3'>
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
				
				
				
							<%
		           
									SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
									String meetingId ="";
									String activityDate ="";
									String requestDate ="";
									String meetingName ="";
									String approvalStatus ="";
									ArrayList orgDet = (ArrayList)request.getAttribute("dispOwnOrgDetails");
									if(orgDet!=null && orgDet.size()!=0){
												Iterator e = orgDet.iterator();
												ArrayList finalList = new ArrayList();
												while(e.hasNext()){
												 ArrayList exaVal = (ArrayList)e.next();
												 Iterator enumPub1 = exaVal.iterator();
												 while(enumPub1.hasNext()){
														HLCActivityOrganizerVO objActDet = (HLCActivityOrganizerVO)enumPub1.next();
															Vector publication = (Vector)enumPub1.next();
															 meetingName =objActDet.getActivityName();
															 if(objActDet.getActivityMeetingId()!=null){
																meetingId =	objActDet.getActivityMeetingId();
															 }							
															 
															 if(objActDet.getActivityDate()!=null){
																activityDate = sdf.format(objActDet.getActivityDate());
															 }
															  if(objActDet.getAddDate()!=null){
																requestDate =  sdf.format(objActDet.getAddDate());
															 }
															 
															 
															 approvalStatus = objActDet.getRequestStatus();
															 System.out.print("approvalStatus" + approvalStatus);
															 if(approvalStatus==null)					
															 approvalStatus="Pending";
								%>
												   
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeOrgReqView" action="meeting.html" method="post">
							
                               <input type="hidden" name="meeProcess" value="viewOwnList">
								<input type="hidden" name="activityMeeId" value="<%=meetingId%>">
								
									<div class='form-group'>
										<div class='col-md-16'>
											<div class='col-md-2'>
											<label class='control-label'><%=meetingId%></label>
											</div>
											
											<div class='col-md-2'>
											<label class='control-label'><%=activityDate%></label>
											</div>
											
											<div class='col-md-3'>
											<label class='control-label'><%=requestDate%></label>
											</div>
											
											<div class='col-md-2'>
											<label class='control-label'><%=approvalStatus%></label>
											</div>
											
											<div class='col-md-2'>
												<%if(approvalStatus.equals("Rejected")){%>
												 <button class='btn-lg btn-primary' type='submit' name="submitApproval">Edit</button>
												
												<%}else{%>
												<button class='btn-lg btn-primary' type='submit' name="submitApproval">View</button>
													
											</div>
							
                                <%}%>
											
									</div>
							 </form>
							 
							 		<%}} }else {%>
									
									<div class='form-group'>
										<div class='col-md-8'>
											<div class='col-md-6'>
											</div>
											<div class='col-md-4'>
											No records are available. 
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
