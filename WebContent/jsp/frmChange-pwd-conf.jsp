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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Klugwerks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link rel="stylesheet" type="text/css" media="screen" 
        href="styles/menuExpandable.css" />    

    <script type="text/javascript" src="scripts/menuExpandable.js"></script>

<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
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
			      <div class='panel-heading'>
                            <h2>Change Password Confirmation</h2>
					</div>
			  <div class='panel-body'>
  					<p>Dear User</p>
                              <%
								String stat=(String)request.getAttribute("status");
				
								if(stat!=null)
								{
								if(stat.equalsIgnoreCase("fail"))
								{%>
                              <br />
                           <p> Your request for changing the Password failed. Please give the right current Password !</p>
                            <br />
                            <%}}else{%>
                            
                            <p>Your request for changing the Password successful  for your Username! Please Re-Login to make your new Password effective !</p> <br />
                          
                            <%}%>
                            <p>Thank You,</p></br>
                            <p>guildKraft TEAM</p>
							
							
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
