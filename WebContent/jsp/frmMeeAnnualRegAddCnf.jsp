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
<%@ page import="java.math.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>

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
                            <h2>Annual Meeting  &amp; Convention Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
								<%
									double totalAmount = 0.00d;
									HLCAnnualMeetingStore regList = (HLCAnnualMeetingStore)session.getAttribute("regList");
									//out.print(regList);
									if(regList!=null && regList.getSize()!=0){
									//out.print("No records are found");
							%>
							
                           <p>Note: If you want to Edit the user information, please delete the entry and re-enter.</p>
						   
						    <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Completed Registrations for the Annual Meeting &amp; Convention</label>
							</div>
							
							 <%
								Enumeration e = regList.getEnumeration();
								while(e.hasMoreElements()){
								HLCAnnualUserVO tempObjAnnualUser = (HLCAnnualUserVO)e.nextElement();
								String delUserId = tempObjAnnualUser.getUserId();
								String firstName = tempObjAnnualUser.getFirstName();
								String lastName = tempObjAnnualUser.getLastName();
								String badgeName = tempObjAnnualUser.getBadgeInfo();
								double regAmount = tempObjAnnualUser.getRegAmount();
								double otherAmount = tempObjAnnualUser.getOtherActAmount();
								totalAmount +=(regAmount+otherAmount);
								ArrayList priceList = tempObjAnnualUser.getPriceList();
																				
								String tempRegAmt = String.valueOf(regAmount);
								String tempOtherAmount = String.valueOf(otherAmount);
									
								String memberType = tempObjAnnualUser.getMemberTypeName();
																				


								BigDecimal rAmt = new BigDecimal(Float.parseFloat(tempRegAmt));
								rAmt = rAmt.setScale(2, BigDecimal.ROUND_HALF_UP);
																				
								BigDecimal oAmt = new BigDecimal(Float.parseFloat(tempOtherAmount));
								oAmt = oAmt.setScale(2, BigDecimal.ROUND_HALF_UP);
						%>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmAnnual" id="frmAnnual" method="post" action="annConRegInsert.html">
							
                              	<input type="hidden" name="annProcess" value="remove"/>
								<input type="hidden" name="deluserId" value="<%=delUserId%>"/>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Full Name:</label>
                                    <div class='col-md-8'>
                                        
										<div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label '> <%=firstName%>&nbsp;<%=lastName%></label>
                                            </div>
                                        </div>
										
										<div class='col-md-2'>
										<button name="Submit2" type="submit" class="btn-lg btn-danger" value=" Delete " >Delete</button>
										</div>

                                    </div>
                                </div>
							
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Detail:</label>
								</div>
								
								
							<div class='form-group'>
								<div class='col-md-8'>
									
									<div class='col-md-2'>
									<label class='control-label label1'>Badge Name</label>
									</div>
									
									<div class='col-md-2'>
									<label class='control-label label1'>Registered Amount	($)</label>
									</div>
									
									<div class='col-md-2'>
									<label class='control-label label1'>Member Type</label>
									</div>
									
								</div>
							</div>
								
								
								<div class='form-group'>
								<div class='col-md-8'>
									
									<div class='col-md-2'>
									<label class='control-label'><%=badgeName%></label>
									</div>
									
									<div class='col-md-2'>
									<label class='control-label'><%=rAmt%></label>
									</div>
									
									<div class='col-md-2'>
									<label class='control-label'><%=memberType%></label>
									</div>
									
								</div>
							</div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other activities they opted for</label>
								</div>
								
								<div class='form-group'>
								<div class='col-md-8'>
									
									<div class='col-md-2'>
									<label class='control-label label1'>Activity Name</label>
									</div>
									
									<div class='col-md-2'>
									<label class='control-label label1'>Amount ($)</label>
									</div>
									
								</div>
							</div>
							
							<%
								if(priceList!=null && priceList.size()!=0){
								Iterator itPriceList = priceList.iterator();
								while(itPriceList.hasNext()){
								String[] strPrice = (String [])itPriceList.next();
								String priceId = strPrice[0];
                                String priceAmount = strPrice[1];
								String actName = strPrice[2];
								if(priceId!=null && priceId.trim().length()!=0){
							%>
                               
							   
							   <div class='form-group'>
								<div class='col-md-8'>
									
									<div class='col-md-2'>
									<label class='control-label'><%=actName%></label>
									</div>
									
									<div class='col-md-2'>
									<label class='control-label label1'><%=priceAmount%></label>
									</div>
									
								</div>
							</div> 
							
							<%}}%>
							
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Other Activity Amount:</label>
                                    <div class='col-md-8'>
										<div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label '><%=oAmt%></label>
                                            </div>
                                        </div>
										
                                    </div>
                                </div>
								
								 <%}else{%>
								 
								 <div class='form-group'>
                                    <div class='col-md-offset-4 '>
                                       No other activities are registered
                                    </div>
                                    
                                </div> 
								
								<%}%>
								
								 </form>
								 
								 <%}}%>	
								 
								  <form class='form-horizontal' role='form' name="frmAnnual" id="frmAnnual" method="post" action="annConRegInsert.html">
									<input type="hidden" name="annProcess" value="payment" />
									
									 <p>You have successfully registered a participant(s) for the Annual Meeting &amp; Convention.
										Would you like to register for another person? </p>
								    
                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-3'>
                                       
										<button name="annButName" type="button" class="btn-lg btn-primary" value="Yes, Register Another" onClick="javascript:location.href='annualConRegAction.html?annProcess=initAnnual'" >Yes, Register Another</button>
                                    </div>
									
									<%if(regList.getSize()!=0) {%>
												
                                    <div class='col-md-2'>
                                       <button name="annButName" type="submit" class="btn-lg btn-danger" value="No, Proceed to Payment">No, Proceed to Payment</button>
                                    </div>
									
									<%}%>	
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
