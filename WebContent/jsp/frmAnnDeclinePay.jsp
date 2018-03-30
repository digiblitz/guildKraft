<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="com.hlcmee.ann.*"%>
<%@ page import="com.hlcmeeting.util.*"%>
<%@ page import="java.text.*"%>
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
                            <h2>Credit Card: Transaction Declined</h2>
                        </div>
					<!--==============================Form Title=================================-->
	           
			        <p id="p_error">Your transaction has been DECLINED!</p>
				 
					 <p>Click 'Return to Order' button to return to your payment details page and verify your 
				     payment information. </p>
			          <p>An Error Occurred</p>
				         <p>Number: 1
				  
					<p>Message: This transaction request has not been approved. You may elect to use another 
					 form of payment to complete this transaction or contact customer service for additional options. 
					</p>
				  
					  <form  class='form-horizontal' role='form' name="frmdecline" action="AnnualPendDet.html" method="post">
					 
								<%
								String amt = (String) session.getAttribute("amount");
								String pa_id = (String) session.getAttribute("payId");
								String meet_id = (String) session.getAttribute("meetId");
								String badge_name =(String)  session.getAttribute("bdgeNme");						
								%>
				 <div class='form-group'>
					  <div class='col-md-offset-3 col-md-3'>
						<button class='btn-lg btn-primary'  name="submit2" type="submit" value="Try Again">Try Again</button>
					    </div>
					 </div>		
								  										
								  <input type="hidden" name="execute" value="payProceed" />
								  <input type="hidden" name="amt" value="<%=amt%>"/>
								  <input type="hidden" name="pa_id" value="<%=pa_id%>" />
								  <input type="hidden" name="meet_id" value="<%=meet_id%>" />					  					  
								  <input type="hidden" name="badgeName" value="<%=badge_name%>" />	
																						  
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
