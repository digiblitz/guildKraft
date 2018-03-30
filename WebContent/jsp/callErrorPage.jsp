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
<!--  %@ page import="java.util.*"%-->
<!--  %@ page import="java.sql.*"%-->

<!--  %@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %-->
<!--  >%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %-->
<!--  %@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>guildKraft</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
 <script type="text/javascript" src="scripts/menuExpandable.js"></script>
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

<div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
			
	<div class="footer-new">
		<div class="container">
			 <div class="col-md-12">
			
                <div class='row'>
				
                    <div class='panel panel-primary dialog-panel panel1'>
					
							 <div class='panel1-body'>
    
       					<p align="center" class="para">Sorry for inconvenience...</p>
					
					<div class='form-group' align="center">
					 	
					 <a href="login.html?cmd=initLogin"><img src="images/signIn_icon.jpg" alt="" width="20px" height="20px"/>&nbsp;<strong>click to Sign In again</strong></a>
					</div>
				 		
						
						</div>
						
                    </div>
					
                </div>
				

            </div>
			</div>
			</div>
			

        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
