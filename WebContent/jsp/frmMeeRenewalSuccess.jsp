<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlccommon.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

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
			
				<%
					String eventId = (String)request.getAttribute("eventId");
					String paymentId = (String)request.getAttribute("paymentId");
					String amt=(String)request.getAttribute("price");
					/*String payResult = (String)request.getAttribute("payResult");
					String dispMessage = "";
					if(payResult!=null && payResult.trim().length()!=0){
					dispMessage = "You have successfully placed your Membership Registration Application with HLC! You will be intimated within 24 Hrs after formal approval.";
					}else{
					dispMessage = "Payment Process Failed. Please Try Again Later";
					}*/
					%>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Credit Card: Transaction Declined</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
							<div class='col-md-offset-2'>
                            	<label class='control-label'>Your transaction has been DECLINED!</label>
							</div>
							
							<p>An Error Occurred</p>
							
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number: 1</label>
                             </div>
							 
							 <p>Message: This transaction request has not been approved. You may elect to use another 
					 form of payment to complete this transaction or contact customer service for additional options. </p>
						
                            <form class='form-horizontal' role='form' name="myform" method="post" action="endorseRetryPay.html">
							
                                	<input type="hidden" name="eventProcess" value="initRetryPayment" />
								   <input type="hidden" name="eventId" value="<%=eventId%>" />
								   <input type="hidden" name="paymentId" value="<%=paymentId%>" />
								   <input type="hidden" name="amt" value="<%=amt%>" />

                                
                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="butSbmt" value="Retry Payment">Retry Payment</button>
                                    </div>
									
									<div class='col-md-3'>
									 <button class='btn-lg btn-primary' type='submit' name="butSbmt" value="Register OmniBus">Register OmniBus</button>
									</div>
                                    <div class='col-md-3'>
                                       <button class='btn-lg btn-primary' type='submit' name="butSbmt" value="Back To List">RBack To List</button>
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
