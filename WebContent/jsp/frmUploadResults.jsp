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
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="js/uploadHorseComp.js" type="text/javascript" ></script>

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
                            <h2>Membership: Upload Results</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		 
						
					<p>You can upload your competition result excel files here . 
					Please make sure whether the source document is formatted as per the standards before uploading.</p>
				  
			
				 <html:form method="post"  class='form-horizontal' role='form' action="/upload" enctype="multipart/form-data" onsubmit="return myValidate();">
         
				<input type="hidden" name="cmd" value="upload" />
				<input type="hidden" name="eventId" value="<%=(String)session.getAttribute("eventId")%>" />
				
				
			  		
								<%
									Vector eventDetail = new Vector();
									eventDetail = (Vector) request.getAttribute("HLCEventDetails");
								%>
									
							<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
									
												 <select name="eventType" id="eventType" class="form-control">
													<option value="" selected="selected">Select One</option>
													<%
														if(eventDetail!=null && eventDetail.size()!=0){
															Enumeration itr= (Enumeration)eventDetail.elements();
															while(itr.hasMoreElements()){
																String[] s = (String[]) itr.nextElement();
																String typeId = s[0];
																String typeName = s[1];
													%>
													<option value="<%=typeId%>"><%=typeName%></option>
													<%}}%>
												 </select>	
											</div>
										</div>
									</div>							

							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												   <input type="text" name="upEventId" id="upEventId" class="form-control" />	
											</div>
										</div>
									</div>	
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>							
												<input type="text" name="eventName" id="eventName" class="form-control" />	
											</div>
										</div>
									</div>	
									
																				
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Competition Result File:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<html:file  property="fileUpload" styleClass="form-control"  />	
													<span id="span_astriesk">*</span>	
												</div>
										</div>
									</div>	
								</div>							
								
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" value="Upload">Upload</button>
                                    </div>
								</div>
									
			  </html:form> 
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
