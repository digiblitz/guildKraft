<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->

<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
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
					 String amt = (String)request.getAttribute("amount");
					String eveId = (String)request.getAttribute("eventId");
					String eveTitle = (String)request.getAttribute("eveTitle");
				
                %>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>USEA Event Registration: Confirmation.	</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<form class='form-horizontal' role='form' name="confirmation" method="post" action="MemberLogin.html">
								
						<p>
								  <%
								
									Calendar c = Calendar.getInstance();
									int day = c.get(Calendar.DATE);
									int month = c.get(Calendar.MONTH);
									int year = c.get(Calendar.YEAR);
									month=month+1;
									String date = month+"-"+day+"-"+year;
									
								%>
								  
								  You have successfully made a payment of $ (<%=amt%>)  (U.S. Dollars) and registered for the Event. Event details are as follows:</p>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>  USEA Event ID #.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=eveId%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=eveTitle%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>

								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=date%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								 
								 
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'>Pending until signed USEA Event Registration Application received.</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								 
								
								<p>Click Print Event Reg App button below to save and print a copy of the USEA Event Registration - USEF Endorsed Competition/Management Application. This document MUST be printed, signed and returned to USEA to finalize event registration.</p>  
								  
								  
								<div class='form-group'>
                                    <div class='col-md-offset-3 col-md-3'>
                                       
										 <button name="button" type="button" class="btn-lg btn-primary" value="Print Event Reg App"  onclick="window.open('http://reports.useventing.com/ReportServer?/Public/USEF_endorsed_app&rs:Command=Render&rs:format=PDF&EVENTID=<%=eveId%>')" >Print Event Reg App</button>
                                    </div>
                                    <div class='col-md-3'>
                                     
										 <button name="button" type="button" class="btn-lg btn-primary" value="Update Omnibus Listing"  onclick="location.href='OrganizerUSEAEventReg.html?process=initUpdate&eventId=<%=eveId%>'">Update Omnibus Listing</button>
                                    </div>
									
									  <div class='col-md-3'>
                                        <button name="button" type="button" class="btn-lg btn-primary" value="View My Events"  onclick="location.href='EventOrgRenewal.html?eventProcess=eventViewOrg'" >View My Events</button>	
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
