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
                            <h2>Advertisement Home Page</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
	
	  <p>Media</p>
<a href="./advertisement.html?advProcess=advMediaPlanAddNew">Create Media </a><br>
<a href="advertisement.html?advProcess=advMediaLst">Show Media(View/Edit/Delete)</a><br> 

<p>Dimension</p>
<a href="advertisement.html?advProcess=advDimensionAdd">Create Dimension</a><br />
<a href="advertisement.html?advProcess=advLstDimension">Show Dimension(View/Delete/Edit)</a><br />

<p>Issue</p>
<a href="advertisement.html?advProcess=advIssueAdd">Create Issue</a><br />
<a href="advertisement.html?advProcess=advIssueLst">Show Issue(View/Delete/Edit)</a><br /> 

<p>Advertisement Type</p>
<a href="advertisement.html?advProcess=advDispTypeAdd">Create Display Type</a><br />
<a href="advertisement.html?advProcess=advDispTypeLst">Show Display Type(View/Delete/Edit)</a><br />

<p>Advertisement Sub Type</p>
<a href="advertisement.html?advProcess=advDispSubTypeAdd">Create Display Sub Type</a><br />
<a href="advertisement.html?advProcess=advDispSubTypeLst">Show Display Sub Type(View/Delete/Edit)</a><br />

<p>Dimensional Details</p>
<a href="advertise.html?method=newAdd">Create Dimensional Details</a><br />
<a href="advSearch.html?method=initSearch">Show Dimensional Details(View/Delete/Edit)</a><br />

<p>Admin View Page</p>
<a href="advertiseAdmin.html?advProcess=AdvAdmin">Main page </a><br />
<a href="advertiseAdmin.html?advProcess=AdvAdminManifest">View Manifest </a><br />

<p>User Page</p>
<a href="AdvertisePrice.html?advPrice=mediaView">Available Media </a><br />
<a href="AdvertisePrice.html?advPrice=userStatus">Request Status</a><br />

<p>Price Matrix</p>
<a href="AdvertisePrice.html?advPrice=userView">Show Price Matrix(View)</a>


	  
	  
	  
	  <!--==============================================import content code end here============================================-->
	  
	  
	 		
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

