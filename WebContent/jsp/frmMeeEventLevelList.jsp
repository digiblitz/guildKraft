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

</head>

<script language="javascript">
/*function postData(dispId){
 
	frmMeeEventLevelListing.method="post";
	frmMeeEventLevelListing.action="./actionEventLevel.html?process=list&status="+dispId;
	frmMeeEventLevelListing.submit();
}	*/
</script>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
			<%
			String  status ="";
			/*String  status = (String)request.getAttribute("status");
			if(status==null || status.equals("")){
				status="";
			} */
			%>
	
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
                            <h2>Meetings:Event Detail Master</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>To edit a Event Level Name click on 'Edit' button. To change the status click on the 'Activate/Deactivate' button. </p>
							
						<!--==============================Form Description=================================-->
							
                           		
                                <div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-3 col-md-offset-1">
											<label class='control-label label1'>Event Level Name </label>
										</div>
										
										<div class="col-md-3">
											<label class='control-label label1'>Event Level Code </label>
										</div>
											
							   
										<div class="col-md-2">
											<label class='control-label label1'>Status</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Edit</label>
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
											String eventlevel = eventTypeDetail[1];
											String eventcode = eventTypeDetail[2];
											String eventStatus= eventTypeDetail[4];
											String val = "";
									%>
							
							<!--==============================Form Body=================================-->
							
                            <form name="frmMeeEventLevelList" method="post" action="./actionEventLevel.html" class='form-horizontal' role='form' id="myform">
							
                               <input name="process" type="hidden" value="view">	
								<input name="eventId" type="hidden" value="<%=eventId%>">
								<input name="eventlevel" type="hidden" value="<%=eventlevel%>">
								<input name="eventcode" type="hidden" value="<%=eventcode%>">
								
								<div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-3 col-md-offset-1">
											<label class='control-label'>&emsp;<%=eventlevel%> </label>
										</div>
										
										<div class="col-md-3">
											<label class='control-label'>&emsp;<%=eventcode%> </label>
										</div>
											
							   
										<div class="col-md-2">
											<% if(eventStatus.equalsIgnoreCase("0")){ %>
											  <button class='btn-sm btn-primary' type='button' name="btnSubmit" value="Activate" onclick="location.href='actionEventLevel.html?process=activate&eventId=<%=eventId%>&status=<%=status%>'">Activate</button>
		
											<%} else if(eventStatus.equalsIgnoreCase("1")){		%>
											
											 <button class='btn-sm btn-danger' type='button' name="btnSubmit" value="Deactivate" onclick="location.href='actionEventLevel.html?process=deactivate&eventId=<%=eventId%>&status=<%=status%>'" >Deactivate</button>
		 
		 <% }%>
										</div>
										
										<div class="col-md-2">
											 <button  name="btnSubmit" class='btn-sm btn-primary' type='submit' value="Edit">Edit</button>
											
										</div>
		
									</div>
                                </div>
								
						</form>

                                <%	}}else {%>
								
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
