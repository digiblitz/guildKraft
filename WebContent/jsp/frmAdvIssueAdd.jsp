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
<script src="js/frmAdvIssue.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style></head>


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
						 <h2> Advertisement: Create Issue Master</h2>
						 </div>
						 
 					<!--==============================Form Title=================================-->

  						<div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
    
	<p>  Please create the required Advertisement Issue Master for all the advertisements that are to be placed both in Magazine &amp; Omnibus for all the event. 
		
		Select a Media Type given below and fill-in the relevant Issue Master details.</p>
		
								<!--==============================Form Description=================================-->

 						
  
			<%
			Vector vvIssue = (Vector)session.getAttribute("objSesAdvAddIssue");
			if(vvIssue!=null && vvIssue.size()!=0){
			%>
							<!--==============================Form Body=================================-->

		<form name="frmCreateIssueMast" method="post" action="./advertisement.html"  class='form-horizontal' role='form' onsubmit="return advIssueAddCheck();">
		<input type="hidden" name="advProcess" value="advIssueInsert">
			 
			<p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
			
            
				<% String statuscheck = (String)request.getAttribute("err");
					
						if(statuscheck!=null && statuscheck.equals("st")){
					%>
					
					 
				<p id="p_error">Issue  Name Already Exists. Try it Again</p>
				    
				  <%
					}
					%>
				 
			
				 
				 
				  <div class='form-group'>
                          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select A Media Type:</label>
						   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
				    
					 		<select name="mediaId" class='form-control'>
							<option selected="selected" value="">Select One</option>
							<%
								Enumeration eIssue = vvIssue.elements();
								String mediaId = "";
								String mediaName = "";
								String mediaDesc  = "";
								String mediaStatus = "";
								while(eIssue.hasMoreElements()){
									String[] s = (String [])eIssue.nextElement();
									mediaId = s[0];
									mediaName = s[1];
									mediaDesc  = s[2];
									mediaStatus = s[3];
							%>
							<option value="<%=mediaId%>"><%=mediaName%></option>
							<%}%>
						</select>
						<%}%>
				 	 <span class="asterisk" id="span_astriesk" style="color:#FF0000;">*</span></div>
					 </div>
				 </div>
				
		     	 
				   
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Issue Name:</label>
				  <div class='col-md-8'>
                   		 <div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>
									<input type="text" class='form-control' name="txtIsssueName"/> 
									 <span id="span_astriesk" class="asterisk" style="color:#FF0000;"> *</span></div>
								</div>
						</div>
					
				</div>
			  
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button  type='submit' value='Create' class='btn-lg btn-primary'>Create</button>
									</div>
									<div class='col-md-2'>
                                        <button type='reset'  value='Reset' class='btn-lg btn-danger' style=''> Reset</button>
                                    </div>
                     	  </div>
									
					 
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
