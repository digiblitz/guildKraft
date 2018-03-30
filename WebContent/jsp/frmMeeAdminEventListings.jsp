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

<script src="javascripts/frmMeeICPAssessment.js" type="text/javascript" ></script>

<script language="javascript">

function postData(){
	document.frmRewalList.eventProcess.value = "eventViewAdminStaus";
	//alert(frmRewalList.eventProcess.value);
    document.frmRewalList.method="post";
    document.frmRewalList.action="EventOrgRenewal.html";
    document.frmRewalList.submit();
}
</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%
String  requestStatus = (String)request.getAttribute("requestStatus");
if(requestStatus==null || requestStatus.equals("")){
	requestStatus="";
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
                            <h2>Meetings:Endorsement Application  Listings</h2>
                        </div>
						
						
						<div class='panel-body'>
						
						  <form name="frmRewalList" id="frmRewalList">
						   <input type="hidden" name="eventProcess" value="" />
						   
						 		<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Status </label>
					 					<div class='col-md-8'>
                          					<div class='col-md-3 indent-small'>
                               					<div class='form-group internal'>
												  <select name="requestStatus" class="form-control" onChange="postData();">
													<option selected="selected" value="">Select One</option>
														<%
															if(requestStatus.equals("Pending")){
														%>
														<option value="Pending" selected="selected" >Pending</option>
														<%
															}
															else{
														%>
															<option value="Pending" >Pending</option>
														<%
															}
															if(requestStatus.equals("Approved")){
														%>
														<option value="Approved" selected="selected" >Approved</option>
														
														<%
														}
														else{
														%>
															<option value="Approved" >Approved</option>
														<%
														}
														if(requestStatus.equals("Rejected")){
														%>
														
														<option value="Rejected" selected="selected" >Rejected</option>
														<%
														}
														else{
														%>
														<option value="Rejected" >Rejected</option>
														<%
														}
														%>
													  </select>
					   						</div>
                                        </div>
                                    </div>
							</div>
                            
				  </form>
				  
						
								
								
								<div class="margin marginn">
									<div class="form-group">
									<div class="col-md-12">
												
												<div class="col-md-2">
													<label class='control-label label1'>Event ID</label>
												</div>
												
												<div class="col-md-2">
													<label class='control-label label1'>Organizer ID</label>
												</div>
										
												<div class='col-md-2'>
													<label class='control-label label1'>Event Title</label>
												</div>
												
												<div class='col-md-2'>
													<label class='control-label label1'>Date of Registration </label>
												</div>
												
												<div class='col-md-2 text-center'>
													<label class='control-label label1'>View</label>
												</div>
												<div class='col-md-2'>
													<label class='control-label label1'>Approve</label>
												</div>
										
										</div>
									</div>
								</div>
								
								  <%
						  SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
						  			String eventId =  "";							
									String organizerId =  "";	
									String eventTitle =  "";	
									String requestDate =  "";	
									String status =  "";	
						  ArrayList eventList = (ArrayList) request.getAttribute("displayAllEventDet");
						  
						  if(eventList!=null)
						  {
						  	System.out.print(" eventList.size() :"+ eventList.size());
							
						  }
						  else
						  {
						  	System.out.print(" empty ");						  
						  }
						  
						  
						  if(eventList!=null){
							  Iterator itEvent = eventList.iterator();
							  while(itEvent.hasNext()){
							        	HLCEventDetailsVO objEventDet = (HLCEventDetailsVO)itEvent.next();
									  eventId =  objEventDet.getEventId();									
									  organizerId =  objEventDet.getOrganizeId();
									  eventTitle =  objEventDet.getEventTitle();
									  if(objEventDet.getAddDate()!=null)
									  {
										  requestDate =  sdf.format(objEventDet.getAddDate());
									  }
									  else
									  {
									  	requestDate = "";
									  }
									  
									  status =  objEventDet.getStatusId();
									if(status==null)
										status = "";
						  
						  %>
						  <form name="eventList" method="post" action="EventOrgRenewal.html">
						  
						  <div class="margin marginn">
							
							<div class='form-group'>
								<div class="col-md-12">
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2'>
										
											<label class='control-label'><%=eventId%></label>
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label'><%=organizerId%></label>
										</div>
										
										<div class='col-md-2'>
											<label class='control-label'><%=eventTitle%></label>
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label'><%=requestDate%></label>
										</div>
										
										<div class='col-md-2'>
										
											<button class='btn-lg btn-primary' type='submit' onclick="location.href='editEventDetails.html?process=view&eventId=<%=eventId%>'" >View</button>
										</div>
										
										<div class='col-md-2'>
										
											 <button class='btn-lg btn-primary' style='' onclick="location.href='EventOrgRenewal.html?eventProcess=approve&eventId=<%=eventId%>'" >Approve</button>
										</div>
										
										</div>
										
									</div>
									
								</div>
									
                             </div>
								
						</div>
							
						  
						</form>	
						
							  <%
						  }
						  }
						  else{
						  %>
								<div class='form-group'>
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
												No records are available.
											</div>
										</div>
									</div>
								</div>
						  
						  <%
						  }
						  %>
                        </div>
					</div>
                   </div>
                </div>
            </div>
		</div>
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

        </div>
		
 
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
