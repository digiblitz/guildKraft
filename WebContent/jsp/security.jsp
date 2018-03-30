<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="com.hlchorse.form.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Profile Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/EditMemberUserReg.js" type="text/javascript" ></script>
</head>
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

<%String days=(String)request.getAttribute("days"); %>

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
                            <h2>Security</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
	
      
    
                <form class='form-horizontal' role='form' action="login.html?loginProcess=profile_det=<%=userId%>" method='post' name="uploadfile">


						 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Your Account Permission:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<input  type="text" name="acc_permission" class='form-control'  
																		value="<%=nullCheck((String)request.getAttribute(""))%>" />
														<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Recovery Phone Number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input  type="text" name="Rec_phno" class='form-control'  
															value="<%=nullCheck((String)request.getAttribute(""))%>" >
															<span id='span_astriesk'>*</span>
										
											</div>
										</div>
									</div>
									
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Recovery E-mail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input  type="text" name="rec_email" class='form-control' 
value="<%=nullCheck((String)request.getAttribute(""))%>" >
												<span id='span_astriesk'>*</span>
											
											</div>
										</div>
									</div>
							
							
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Login:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input  type="text" name="last_login" id="Subs_expiry" class='form-control'  
  value="<%=nullCheck((String)request.getAttribute("days"))%>" >
  												
												<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
											
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Notification Setting:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input  type="text" name="notifi_setting" id="notifi_setting" class='form-control' 
  value="<%=nullCheck((String)request.getAttribute(""))%>" >
											<span id='span_astriesk'>*</span>
							 				</div>
										</div>
									</div>
  								</div>
								
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="Insert" value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' name="button" type="button"    onClick="javascript:history.back(-1);" value="Cancel">Cancel
										</button>
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
