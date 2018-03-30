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
					  
					        <h2>Meetings: Division Event Detail Master</h2>
						</div>
						
								
				 <!--==============================Form Title=================================-->
						
			 <div class='panel-body'>

				 <p>To edit a Event Division name click on 'Edit'  button. To change the status click on the 'Activate/Deactivate' button.</p>
				 
				 <form name="frmMeeDivisionEventList" method="post" action="./actionDivisionEventType.html">	
							<input name="process" type="hidden" value="view">	
							
				 		<div class="form-group">
							<div class="col-md-12 gp">
								<div class="col-md-offset-2">
								<div class="col-md-3">
									<label class='control-label label1 mar'>Event Divisions</label>
								</div>
								
								<div class="col-md-3">
									<label class='control-label label1'>Status</label>
								</div>
								
								<div class="col-md-3">
									<label class='control-label label1'>Edit</label>
								</div>
							</div>
						  </div>
						</div>

					<%
		   		
					 Vector eventListView=(Vector)request.getAttribute("EventAllList");
					 if(eventListView!=null && eventListView.size()!=0){ 
					 Enumeration itEvent = eventListView.elements();
					  while(itEvent.hasMoreElements()){
						    String [] eventTypeDetail  = (String[]) itEvent.nextElement();
							String eventId = eventTypeDetail[0];
							String eventName = eventTypeDetail[1];
							String eventStatus= eventTypeDetail[2];
							String eventDate = eventTypeDetail[3];
							String val = "";
				    %>
							

							<input name="eventId" type="hidden" value="<%=eventId%>">
							<input name="eventName" type="hidden" value="<%=eventName%>" >
							
							<div class="form-group">
							<div class="col-md-12 gp">
								<div class="col-md-offset-2">
								<div class="col-md-3">
									<label class='control-label'><%=eventName%></label>
								</div>
								
			 <% if(eventStatus.equalsIgnoreCase("0")){ %>
			 
			 <div class="col-md-3 ">
				<button class='btn-sm btn-primary' style='' name="btnSubmit" type="submit" value="Activate" onclick="location.href='./actionDivisionEventType.html?process=activate&eventId=<%=eventId%>?eventName=<%=eventName%>'">Activate</button>
			</div>
		
		
		<%} else if(eventStatus.equalsIgnoreCase("1")){		%>
		
		 <div class="col-md-3 ">
				<button class='btn-sm btn-danger' style='' name="btnSubmit" type="submit" value="Deactivate" onclick="location.href='./actionDivisionEventType.html?process=deactivate&eventId=<%=eventId%>'">Deactivate</button>
				
		</div>
		 <% }%>
		 <div class="col-md-3 ">
				<button class='btn-sm btn-primary' style='' name="btnSubmit" type="button" value="Edit" onclick="location.href='./actionDivisionEventType.html?process=edit&eventId=<%=eventId%>?eventName=<%=eventName%>'">Edit</button>
			
		</div>
	</div>
</div>
</div>
		</form>
		   
	  <%	}
				}else {
			%>
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
									   		<div class='col-md-4'>
											
											</div>
									   
											<div class='col-md-4'>
										
					 							<p>No records are available. </p>
												
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

					
