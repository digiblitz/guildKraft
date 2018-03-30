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
<title>guildKraft</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link rel="stylesheet" type="text/css" media="screen" 
        href="styles/menuExpandable.css" />    
    <script type="text/javascript" src="scripts/menuExpandable.js"></script>
</head>

<style>
    .vertical-line {
        width: 0;
        border: 1px solid #000000;
        height: 1px
		 
    }
</style>

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
                       
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
<%
String userId=(String)session.getAttribute("userId");
System.out.println("userId"+userId);
session.setAttribute("userId",userId);

%>

					 		<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Meet Industry standards & Compliances</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <img src="images/services_icon.jpg" alt="">
											</div>
										</div>
									</div>
								</div>
								
							<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'><a href="login.html?cmd=initIndex&userId=<%=userId%>">Reports</a></label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <img src="images/page1_img3.png" alt="">
												  <p>View Reports:Daily/Monthly</p>
											</div>
										</div>
									</div>
								</div>
								
						<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'><a href="#">Role Management</a></label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<img src="images/page1_img4.png" alt="">
												  <p>Controlling each action through role</p>
											</div>
										</div>
									</div>
								</div>
								
							<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'><a href="#">Governance Management</a></label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <img src="images/page1_img5.png" alt="">
												 <p> Governing the business process/services</p>
											</div>
										</div>
									</div>
								</div>
							
							<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'><a href="#">Business Service Management</a></label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<img src="images/page1_img6.png" alt="">
												 <p>Managing the business services</p>
											</div>
										</div>
									</div>
								</div>
			  
      
       	<!--=============================Content end here=================================-->
							
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
