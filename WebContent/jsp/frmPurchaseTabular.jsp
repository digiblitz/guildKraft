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
		
	    	 <div class='panel-body'>
						
	  
				  <jsp:root version="1.2" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:display="urn:jsptld:http://displaytag.sf.net/el"
			 xmlns:c="urn:jsptld:http://java.sun.com/jstl/core">
			  <jsp:directive.page contentType="text/html; charset=UTF-8" />
			  <jsp:directive.page import="org.displaytag.sample.*" />
			  <jsp:include page="inc/header.jsp" flush="true" />


 <jsp:scriptlet> request.setAttribute( "test", session.getAttribute("demo")); </jsp:scriptlet>
 
			<!--==============================Form Description=================================-->
				  <div class='form-group'>
					 <div class='col-md-8'>
						 <div class='col-md-3 indent-small'>
							<div class='form-group internal'>

      
  <display:table name="test" export="true" id="currentRowObject">
  <display:caption>Purchase Requisition Status Wise from <jsp:scriptlet>out.print(session.getAttribute("fromDate"));</jsp:scriptlet> To <jsp:scriptlet>out.print(session.getAttribute("toDate"));</jsp:scriptlet>  </display:caption>
    <display:column property="status" media="csv excel xml pdf"  />
    <display:column property="purcahseRequistion" media="csv excel xml pdf" title="Purchase Requistion " />
   <display:setProperty name="export.pdf" value="true" />
  </display:table>
  
 					 </div>
				</div>
			</div>
		</div>
  

</jsp:root>

	  
	  
	  
	  <!--==============================Form Body=================================-->
							
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
