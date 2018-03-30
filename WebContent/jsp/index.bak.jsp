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
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
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
		
		<!--==============================include Left Menu Here=================================-->
		
         <%@ include file = "../../include/NewLeftMenu.jsp" %>
			
		<!--==============================include Left Menu Here=================================-->
		
			</div>
     <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Services Available</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
					     
                                <div class='form-group'>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>

                                                      
                                                        <ul>
                                                            <li>Business Process Management</li>
                                                            <li>SOA</li>
                                                            <li>Artifact Management</li>
                                                            <li>Project Management</li>
                                                            <li>Learning Management</li>
                                                            <li>CRM</li>
                                                        </ul>
                                                        
                                                       </div>
										
									</div>
									
                                </div>
								
							</div>
						 <p>Right Column Content Here</p>
 
				 
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
