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
<%@ page import="com.hlcmro.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
                            <h2>Meetings: Endorsement Application Listings</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Color Legends:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'> Approve</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
									<div class='col-md-8'>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Event ID</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Organizer ID</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Event Title</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Date of Registration</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Approve</label>
										</div>
									</div>
								</div>	
								
									 <%
									  SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
									  ArrayList eventList = (ArrayList) session.getAttribute("displayAllEventDet");
									  if(eventList!=null && eventList.size()!=0){
										  Iterator itEvent = eventList.iterator();
										  while(itEvent.hasNext()){
												HLCEventDetailsVO objEventDet = (HLCEventDetailsVO)itEvent.next();
												String eventId =  objEventDet.getEventId();									
												String organizerId =  objEventDet.getOrganizeId();
												String eventTitle =  objEventDet.getEventTitle();
												//activityDate = sdf.format(objEventDet.getActivityDate());
												String requestDate =  sdf.format(objEventDet.getAddDate());
									  
									  %>
						
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="eventList" method="post" action="EventOrgRenewal.html">
							
                                <div class='form-group'>
									<div class='col-md-8'>
										
										<div class='col-md-2'>
										<label class='control-label'><%=eventId%></label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label '><%=organizerId%></label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label'><%=eventTitle%></label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label'><%=requestDate%></label>
										</div>
										
										<div class='col-md-2'>
									
										  <button class='btn-lg btn-primary' name="Submit2" type="submit" value="Approve">Approve</button>
										</div>
										
									</div>
								</div>
								
								
								 <%}}else{ %>	

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                       No Records Are Found.
                                    </div>
                                   
                                </div>
								
								<%}%>
								
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
