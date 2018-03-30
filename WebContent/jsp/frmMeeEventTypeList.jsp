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
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<%@ page import="java.util.*" %> 
<script language="javascript">
function postData(dispId){
 
	frmMeeEventTypeListing.method="post";
	frmMeeEventTypeListing.action="./eventtype.html?process=list&status="+dispId;
	frmMeeEventTypeListing.submit();
}	
</script>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%
String  status ="";
/*String  status = (String)request.getAttribute("status");
if(status==null || status.equals("")){
	status="";
}*/
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
						
							<h2>Meetings: Event Type Detail Master</h2>
							
						 </div>
						 
						 <!-- ==================================================Add Dimension Details==============================================-->  
						<div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		
				 <p> To edit a Event Type name click on 'Edit' button. To change the status click on the 'Activate/Deactivate' button. </p>
	
						<div class="form-group">
									
									<div class="col-md-12 gp ">
										
									  		 <div class="row"> 
											 
												<div class='col-md-offset-2 col-md-3'>
										
													<label class='control-label label1'>Event Type Name</label>
												
												</div>
											<div class='col-md-2'>
												<label class='control-label label1'>Status</label>
											</div>
											
											<div class='col-md-2'>
												<label class='control-label label1'>Edit</label>
											</div>
											
										</div>
									</div>
								</div>
							

					<%
					 Vector eventTypeList=(Vector)request.getAttribute("EventTypeAllList");
					 if(eventTypeList!=null && eventTypeList.size()!=0){ 
					 Enumeration itEvent = eventTypeList.elements();
					  while(itEvent.hasMoreElements()){
						    String [] eventTypeDetail = (String[]) itEvent.nextElement();
							String eventId = eventTypeDetail[0];
							String eventName = eventTypeDetail[1];
							String eventStatus= eventTypeDetail[2];
							String val = "";
				    %>
							<form name="frmMeeEventTypeList" method="post"  class="formLayout" action="./eventtype.html" >	
							<input name="process" type="hidden" value="view">	
							<input name="eventId" type="hidden" value="<%=eventId%>">
							<input name="eventName" type="hidden" value="<%=eventName%>">
							
						<div class='form-group'>
								
									<div class="col-md-12 gp">
								
									  		 <div class="row"> 
											
												<div class='col-md-offset-2 col-md-3'>
												
													<label class='control-label '><%=eventName%></label>
													
												</div>
											
						<% if(eventStatus.equalsIgnoreCase("0")){ %>
						
						<div class='col-md-2'>
								<button class='btn-sm btn-primary' type='button' onclick="location.href='eventtype.html?process=activate&eventId=<%=eventId%>&status=<%=status%>'">Activate</button>
						</div> 
		
		<%} else if(eventStatus.equalsIgnoreCase("1")){		%>
		<div class='col-md-2'>
				<button class='btn-sm btn-danger' type='button' onclick="location.href='eventtype.html?process=deactivate&eventId=<%=eventId%>&status=<%=status%>'" >Deactivate</button>
		</div>
		 <% }%>
		 <div class='col-md-2'>
			<button class='btn-sms btn-primary' type='submit' value="Edit" name="btnSubmit">Edit</button>
										</div>
									
									</div>
										
									</div>
									
								</div>
						</form>
		   
					      <%	}
									}else {
								%>
								<div class='form-group'>
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
													No records are available
													
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
