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

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
						<h2>Update Advertisment Form </h2>
						</div>
					<!--==============================Form Title=================================-->

		<!--==============================================content start here============================================-->
	
                     <div class='panel-body'>
						
				<!--==============================Form Description=================================-->
							    
				<p>Please fill in the following information.</p>
	
 					<% String statuscheck =(String)session.getAttribute("err");
						if(statuscheck!=null && statuscheck.equals("st")){
					%>
					<p id="p.error">Media  Name Already Exists. Try it Again</p>
				  
				  <%
					}
				%>
 
				<%
				String s [] = (String[])session.getAttribute("objSesAdvEditMedia");
					String mediaId= "";
					String mediaName= "";
					String mediaDesc= "";
				if (s!=null){
					mediaId= s[0];
					mediaName= s[1];
					mediaDesc= s[2];
				}
				%>
			
					
				<p>Required fields are marked with an asterisk<span style="color:#FF0000">*</p>
            
				 <form class='form-horizontal' role='form' name="frmAdvMediaMaster" method="post" action="./advertisement.html">
				 <input name="advProcess" type="hidden" value="advEditMedia" />
				 <input name="mediaId" type="hidden" value="<%=mediaId%>">
		   
		   			<div class='form-group'>
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Name :</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					 								 <input type="text" name="mediaName" value="<%=mediaName%>" class="form-control"/> <span id="span_astriesk">*</span>	
											</div>
										</div>
								</div>
					</div>				
						<div class='form-group'>
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments:</label>
									 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<textarea name="mediaDescription" rows="5" cols="27" class='form-control'><%=mediaDesc%></textarea>
													  <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>
						</div>				
						   <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' value="Update" type='submit'  onclick="return advMediaCheck();">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="button" value="Cancel" style=''  onclick="javascript:history.back(-1);">Cancel</button>
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
