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
<script src="js/frmAdvMedia.js" type="text/javascript" ></script>
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

<!--==============================================content start here============================================-->


  	<div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                       
			 <div class='panel-heading'>
				<h2> Advertisment: Create Advertisement Media Name</h2>
            </div>
 					 <!--==============================Form Title=================================-->
			<div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
	    
		<p>Please create the required Media Name for all the advertisements that are to be placed for all the event. </p>
  
 
		<form name="frmAdvMediaMaster" class='form-horizontal' role='form' method="post" action="./advertisement.html" onsubmit="return advMediaCheck();">
		<input name="advProcess" type="hidden" value="advInsertNewMedia" />

			
			
					<% String statuscheck = (String)request.getAttribute("err");
					
						if(statuscheck!=null && statuscheck.equals("status")){
					%>
					<p>&nbsp;Media  Name Already Exists. Try it Again</p>
				   
				  <%
					}
					%>

				 <p>&nbsp; &nbsp; Fields mark with asterisk(<span class="asterisk" style="color:#FF0000;">*</span>) are mandatory</p>
				  <div class='form-group'>	
				    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Name :</label>
						<div class='col-md-8'>
                           <div class='col-md-3 indent-small'>
                                  <div class='form-group internal'>
					                     <input type="text" name="mediaName" class="form-control"/> <span class="asterisk" id="span_astriesk" >*</span>
								  </div>
						   </div>
					  </div>
					
				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments:</label>
				  		<div class='col-md-8'>
                           <div class='col-md-3 indent-small'>
                                  <div class='form-group internal'>
								<textarea name="mediaDescription" rows="5" cols="25"></textarea> <span class="asterisk" id="span_astriesk" >*</span>
					           </div>
						    </div>
						 </div>
					</div>
						
                                <div class='form-group'>
                                   		 <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' value='Add'  type='submit'>Add</button>
										 </div>
                                   		   <div class='col-md-2'>
                                        			<button class='btn-lg btn-danger' value='Reset' style=''type='reset'>Reset</button>
									       </div>
						        </div>
								  
			       </form>
				   
				 </div>
			</div>
		</div>
   </div>
												<!-- CONTENTS END HERE -->		
			
	  
	  
	  
	  
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
