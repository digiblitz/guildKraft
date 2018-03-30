<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
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
                            <h2>Event Organizer Registration: Confirmation</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
	
	<form class='form-horizontal' role='form' name="confirmation" method="post" action="MemberLogin.html" />
				<%String isExists=(String)request.getAttribute("alreadyExists");
				if(isExists!=null && isExists.equalsIgnoreCase("alreadyExists")){
				%>
	
   					 <p id="p_error">Event Details for the event exists! </p>
					 
					 
								  <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="button"   value="Back" onclick="javascript:history.back(-1);" >Back</button>
                                    </div>
								</div>
   
   
   
				<%}else{%>
				
    		     <p > You should be an existing member in order to register as a event organizer</p>

   
					<p id="p_error">Do You Want To Become a Member ??</p>
					
					
							 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="button" type="button"  value="Yes" onclick="window.location.href('./MembershipReg.html?process=reg');" >Yes</button>
                                    </div>
									 <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' name="button" type="button"  value="No" onclick="window.location.href('./index.jsp');">No</button>
                                    </div>
								</div>
            
<%}%>			 
   
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
