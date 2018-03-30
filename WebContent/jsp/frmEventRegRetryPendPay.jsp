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
<script src="js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
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
					
            
					<%
					String eventId = (String)request.getAttribute("eventId");
					String paymentId = (String)request.getAttribute("paymentId");
					String amt=(String)request.getAttribute("price");				
					%>
					<p id="p_error"> Credit Card: Transaction Declined </p>
				    <p>Your transaction has been DECLINED!</p>
				     <p> An Error Occurred</p>
				     <p>Number: 1</p>
				  
					<p>Message: This transaction request has not been approved. You may elect to use another 
					 form of payment to complete this transaction or contact customer service for additional options.</p>					 
				   <form  class='form-horizontal' role='form' name="myform" method="post" action="eventPendPayment.html">
				   <input type="hidden" name="cmd" value="initPayment" />
				   <input type="hidden" name="eveId" value="<%=eventId%>" />
				   <input type="hidden" name="tempPayId" value="<%=paymentId%>" />
				   <input type="hidden" name="pendAmount" value="<%=amt%>" />
				   <div class='form-group'>
					<div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-danger' name="butSbmt" type="submit" value="Retry Payment">Retry Payment</button>
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

