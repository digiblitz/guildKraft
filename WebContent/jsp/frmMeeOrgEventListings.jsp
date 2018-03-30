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
<script language="javascript">
function onValidate(){

	if(document.myform.acStatus.value==""){
		alert("Select a Status");
		document.myform.acStatus.focus();
		return false;
	}
	
	return true;
}
</script>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

	<%String status1 = (String)request.getAttribute("status");%>


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
                            <h2> Meetings:Organizer Endorsement  Application  Listings </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Listed below are the current Provisional Calendar Events listing you as the Organizer.
				 				To review the Event details, click on the Event ID.To edit event divisions, click the Edit button.Once payment is made, click Update button to create/update the Omnibus Listing</p>
							
						<!--==============================Form Description=================================-->
							
                            
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="myform" id="myform" method="post" action="./EventOrgRenewal.html" onsubmit="return onValidate();">
							
                               <!--<input name="eventProcess" type="hidden" value="listDetails">	-->					
							</form>
							
							
							<div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-1">
											<label class='control-label label1'>EventID </label>
										</div>
										
										<div class="col-md-3">
											<label class='control-label label1'>Event Tile</label>
										</div>
											
							   
										<div class="col-md-2">
											<label class='control-label label1'>Event Date</label>
										</div>
										
										<div class="col-md-1">
											<label class='control-label label1'>Status</label>
										</div>
										
										<div class="col-md-1">
											<label class='control-label label1'>Edit Event </label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Register Event</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Omnibus Listing</label>
										</div>
		
									</div>
                                </div>
								
								
					<%
						  String appStatus = "";
						  String reqAppStatus = "";	
						  String regStatus="";
						  String logBy="user";
						  String loggedBy="";
						if(session.getAttribute("loggedBy")!=null){
						
						loggedBy=(String)session.getAttribute("loggedBy");
						logBy=loggedBy;
						}
					//	System.out.println("logBy"+logBy);
							/*String loggedBy="";
							loggedBy=(String)session.getAttribute("loggedBy");
							String logBy=loggedBy;*/
						  SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
						  ArrayList eventList = (ArrayList) request.getAttribute("displayOrgAllEventDet");
						  
						 // out.print("MemberId:" + (String) session.getAttribute("memberId") + eventList.size());
						  
						  if(eventList!=null && eventList.size()!=0){
							  Iterator itEvent = eventList.iterator();
							  while(itEvent.hasNext()){
									HLCEventDetailsVO objEventDet = (HLCEventDetailsVO)itEvent.next();
									String eventId =  objEventDet.getEventId();									
									String organizerId =  objEventDet.getOrganizeId();
									String eventTitle =  objEventDet.getEventTitle();							
									String requestDate="N/G";
									String eveBegDt1="N/G";
									String paymentId=objEventDet.getPaymentId();
									if(objEventDet.getAddDate()!=null){
									    requestDate =  sdf.format(objEventDet.getAddDate());
										//System.out.println("requestDate in jsp"+requestDate);
									}
									String statusId =  objEventDet.getStatusId();
									String reqStatus=objEventDet.getRequestStatus();
									boolean payStat=objEventDet.isPayExist();
									String provisonalId =  objEventDet.getProvisId();
									boolean entryStat=objEventDet.isEntryFeeExist();
									
									//System.out.println("entryStat jsp"+entryStat);
									if(objEventDet.getEveBegDt()!=null){
									    eveBegDt1 =  sdf.format(objEventDet.getEveBegDt());
										//System.out.println("eveBegDt1 in jsp"+eveBegDt1);
									}
										
									if(statusId!=null && statusId.equalsIgnoreCase("Approved")) appStatus = "";
									else appStatus = "disabled";
									
									if(statusId!=null && statusId.equalsIgnoreCase("Approved") && paymentId!=null) regStatus = "";
									else regStatus = "disabled";
									
									if(reqStatus!=null && reqStatus.equalsIgnoreCase("Approved")) reqAppStatus = "";
									else reqAppStatus = "disabled";													
						%>
						
						 <form class='form-horizontal' role='form' name="eventList" method="post" action="OrganizerUSEAEventReg.html" />
						  <input type="hidden" name="process" value="initUpdate"/>					 
						  <input type="hidden" name="eventId" value="<%=eventId%>"/>
						  
						  <div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-1">
											<label class='control-label'>&emsp;&emsp;<a href="eventRegList.html?cmd=viewNewEventReg&eventId=<%=eventId%>"><%=eventId%></a> </label>
										</div>
										
										<div class="col-md-3">
											<label class='control-label'><%=eventTitle%></label>
										</div>
											
							   
										<div class="col-md-2">
											<label class='control-label'><%=eveBegDt1%></label>
										</div>
										
										<div class="col-md-1">
											<label class='control-label'><%=statusId%></label>
										</div>
										
										<%if(provisonalId!=null && !(provisonalId.equalsIgnoreCase(""))){%>
										
										<div class="col-md-1">
											
											<button class='btn-lg btn-primary' type="button" name="process2" value="Edit" onclick="location.href='calender.html?method=initUpdate&provisionalId=<%=provisonalId%>'">Edit</button>
										</div>
										
										<%}else{%>
										<div class="col-md-1">
										
										<button class='btn-lg btn-primary' type="button" name="process" value="Edit" onclick="location.href='calender.html?method=initUpdate&provisionalId=<%=provisonalId%>'" disabled="disabled">Edit</button>
										</div>
										
										<%}%>
	
										<%if(payStat==true){%>
										
										<div class="col-md-2">
											<button name="button" type="button" class="btn-lg btn-primary" value="View/Print" disabled="disabled" onclick="window.open('http://reports.useventing.com/ReportServer?/Public/USEF_endorsed_app&rs:Command=Render&rs:format=PDF&EVENTID=<%=eventId%>')" >View/Print</button>
										</div>
										<%}else if(appStatus!=null && appStatus.equalsIgnoreCase("disabled")){%>
										
										<div class="col-md-2">
											<button name="Submit4" type="button" class="btn-lg btn-primary" value="Submit/Pay" disabled="disabled" onclick="location.href='EventOrgRenewal.html?eventProcess=newReq&eventId=<%=eventId%>&requestDate=<%=requestDate%>'" >Submit/Pay</button>
											
										</div>
										
										<%}else{%>
										
										<div class="col-md-2">
										<button name="Submit4" type="button" class="btn-lg btn-primary" value="Submit/Pay" onclick="location.href='EventOrgRenewal.html?eventProcess=newReq&eventId=<%=eventId%>&requestDate=<%=requestDate%>'" >Submit/Pay</button>
										</div>
										
										<%}%>
										<%if(regStatus!=null && regStatus.equalsIgnoreCase("disabled")){%>
										
										<div class="col-md-2">
										<button name="Submit5" type="submit" value="Update" class="btn-lg btn-primary" disabled="disabled">Update</button>
										</div>
										
										<%}else{%>
										
										<div class="col-md-2">
										<button name="Submit5" type="submit" value="Update" class="btn-lg btn-primary">Update</button>
										</div>
										
										<%}%>
										
										</div>
                                	</div>	
										
							</form>	
						  				<%}}else{%>
		
									<div class='col-md-10'>
									<div class='col-md-4'>
									</div>
									<div class='col-md-6'>
										No Records are available.
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
