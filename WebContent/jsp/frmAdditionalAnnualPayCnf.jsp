<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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
<%
String amt= (String) session.getAttribute("amount");
String payId = (String) session.getAttribute("payId");
String badgeName = (String) session.getAttribute("bdgeNme");
String meetingId = (String) session.getAttribute("meetId");
session.removeAttribute("amount");
session.removeAttribute("payId");
session.removeAttribute("bdgeNme");
session.removeAttribute("meetId");
%>


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
                            <h2>Annual Payment Confirmation</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
			<form class='form-horizontal' role='form' name="horseSuccess" action="" method="post">		

  				<%
						String totalAmount =(String)request.getAttribute("totalAmount");
						DecimalFormat myFormatter = new DecimalFormat("###,###.00");
						double finalAmt = Double.parseDouble(amt);
						System.out.print("finalAmt" + finalAmt);
						
		      			String output  = myFormatter.format(finalAmt);
						System.out.print("output" + output);
				%> 
   
 
					<%
					String paymode = (String) session.getAttribute("paymode");
					if(paymode!=null){
					if(paymode.trim().equalsIgnoreCase("CardPay")){
					%>
	
 				
						 
							<p> You have successfully made a payment of $<%=output%> towards the Annual Registration. </p>
							
							  
							   <p> You will receive an email from anandv@digiblitz.com regarding this transaction.</p> 
					    
						
						
							 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="button" type="button"  value="Home" onclick="location.href='./index.jsp'">Home</button>
                                    </div>
								</div>
						<%
						}
						else{
						%>
				<p>Details of the Check Payment for Additional Ticket Registration:</p>
			
			
							<div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Meeting Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <label class='control-label'><%=meetingId%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Badge Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <label class='control-label'><%=badgeName%></label>
											</div>
										</div>
									</div>
								
											
				
			 				<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <label class='control-label'><%=amt%></label>
											</div>
										</div>
									</div>
				
				
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <label class='control-label'>Pending Until Check Is Processed</label>
											</div>
										</div>
									</div>
				
				
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'></label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <label class='control-label'></label>
											</div>
										</div>
									</div>
								</div>
			
				<p>If paying by check please mail your payment (<%=amt%>) to: </p>
			
						<div class="form-group">
							<p>Annual Meeting Registration
							<br />
							525 Old Waterford Road NW
							<br />
							Leesburg, VA 20176<br />
							<br /></p>
						</div>
							
							
				<p>Note: Your registration status will be pending until check is processed. </p>
			
			<%
			}
			%>
			
		<%}
		%>

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
