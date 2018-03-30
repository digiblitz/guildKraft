<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.math.*" %>

<%@ page import = "com.hlcmeeting.util.*" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script type="text/javascript" >

 
            function chk(){
	
//==================================== For Radio Button ==============================	
			
		 
				if(document.frmMeeAnnualConvRegister.comments.value==""){
				alert("Enter a comments");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				if(document.frmMeeAnnualConvRegister.comments.value.indexOf(' ')==0){
				alert("Please avoid  unwanted white space");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				if(document.frmMeeAnnualConvRegister.comments.value.length>1024){
				alert("Comments is out of range");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				if(document.frmMeeAnnualConvRegister.comments.value.indexOf('  ')!==-1){
				alert("Please avoid  unwanted white space");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}


	return true;
}
 
 


</script>

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
                            <h2>Meetings: Annual Meeting &amp; Convention  Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							 <label class='control-label label1'>User Information</label>
							 
							 	<% 
									  try
									  {
									  float addAmt = 0.0f;
									  float fAmount = 0.00f;
										HLCAnnualRegistrationDetailVO  objAnnualRegDet = (HLCAnnualRegistrationDetailVO) request.getAttribute("viewMemberDetails");
										if(objAnnualRegDet!=null){
											 String ardID  = objAnnualRegDet.getArdId();
											 String meetingId  =  objAnnualRegDet.getAnnualMeetingId();
											 String userID  = objAnnualRegDet.getUserId();
											 String badgeName  = objAnnualRegDet.getBadgeName();
											 String fName  = objAnnualRegDet.getFirstName();
											 String memberName  = objAnnualRegDet.getMemTypeName();
											 String daysApplied  = objAnnualRegDet.getDaysApplied();
											 String amount  = objAnnualRegDet.getRegAmount();
											// boolean ponyStatus  = objAnnualRegDet.getPonyMemberStatus();
											 String poId  = objAnnualRegDet.getPonyMemId();
											 String poClubeName  = objAnnualRegDet.getPonyClubName();
											 boolean facStatus  = objAnnualRegDet.getAccomFaciStatus();
											 String AccomDet  = objAnnualRegDet.getAccomDetails();
											 String reqStatus = objAnnualRegDet.getRequestStatus();
											  String comments = objAnnualRegDet.getRemarks();
											 
											 if(memberName==null || memberName.trim().length()==0)  memberName = "N/A";
											 if(badgeName==null || badgeName.trim().length()==0)  badgeName = "N/A";
											 
											 if(daysApplied==null || daysApplied.trim().length()==0)  daysApplied = "N/A";
											 
											 if(poId==null || poId.trim().length()==0)  poId = "N/A";
											 if(poClubeName==null || poClubeName.trim().length()==0)  poClubeName = "N/A";
											 if(AccomDet==null || AccomDet.trim().length()==0)  AccomDet = "N/A";
											// String ardID  = objAnnualRegDet.getRequestStatus();
											 //String ardID  = objAnnualRegDet.getRemarks();
											// String ardID  = objAnnualRegDet.getAddDate();
									
									%>
							 	
							
                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=fName%></label> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Membership Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=memberName%></label> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Badge:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=badgeName%></label> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Pony Club Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=poId%></label> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Pony Club Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=poClubeName%></label> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Accommodation Details:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=AccomDet%></label> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Days Applied:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=daysApplied%></label> 
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								 <%if(reqStatus!=null && reqStatus.equals("Pending")){%>
								<%}%>
						  
									<%
									
									
									ArrayList priceDetails = (ArrayList)request.getAttribute("priceDetails");
									if(priceDetails!=null && priceDetails.size()!=0){
										Iterator it = priceDetails.iterator();
										%>
									 <label class='control-label label1'>Registered Activities</label>
									 <label class='control-label label1'>Amounts</label>
									 
									 	<%
										while(it.hasNext()){
											HLCAnnualPriceDetailVO objPriceDet = (HLCAnnualPriceDetailVO) it.next();
											String activityName = objPriceDet.getSpecificationName();
											String amt1 = objPriceDet.getAmount();
											int totalTicket = objPriceDet.getTotalTicket();
											boolean addTkt = objPriceDet.isAddTktStaus();
											//amt1 = amt1 +Integer.parseInt(amt);
											if(activityName==null) activityName = "";
											if(addTkt==false){
									%>
									 
									
								 <div class='form-group'>
                                    <div class='col-md-8'>
											<div class='col-md-3'>
                                        
                                               <label class='control-label'><%=activityName%></label> 
											   </div>
											   
											   <div class='col-md-2'>
                                            </div>
											
											<div class='col-md-3'>
											<label class='control-label'>$<%=amt1%></label> 
											</div>
										
                                    </div>
                                </div>
								
								<%}}%>
								
								<div class='form-group'>
                                    <div class='col-md-8'>
									
											<div class='col-md-3'>
                                                Addtional Tickets
											   </div>
											   
											   <div class='col-md-2'>
											   No of Tickets
                                            </div>
											
											<div class='col-md-3'>
											Amounts
											</div>
										
                                    </div>
                                </div>
								
								<%
							
							if(priceDetails!=null && priceDetails.size()!=0){
								Iterator tempIt = priceDetails.iterator();
								int chkValue =0;
								
								
								while(tempIt.hasNext()){
									float totAmt = 0.00f;
									HLCAnnualPriceDetailVO objPriceDet = (HLCAnnualPriceDetailVO) tempIt.next();
									String activityName = objPriceDet.getSpecificationName();
									String amt = objPriceDet.getAmount();
									int totalTicket = objPriceDet.getTotalTicket();
									boolean addTkt = objPriceDet.isAddTktStaus();
									
									if(activityName==null) activityName = "";
									if(addTkt==true){
									chkValue++;
									
									if(amt!=null)
									{
										totAmt = totAmt + Float.parseFloat(amt);
									}
							%>
							
							<div class='form-group'>
                                    <div class='col-md-8'>
									
											<div class='col-md-3'>
                                                <label class='control-label'><%=activityName%></label> 
											   </div>
											   
											   <div class='col-md-2'>
											 <label class='control-label'><%=totalTicket%></label> 
                                            </div>
											
											<div class='col-md-3'>
											<label class='control-label'>$<%=totAmt%></label> 
											</div>
										
                                    </div>
                                </div>
								
							<%
							fAmount = fAmount+totAmt;
							}

							}
							if(chkValue==0){
							%>
							 
							 <div class='col-md-offset-4 col-md-1'>
                                   No addtional tickets purchased.
                               </div>
							   
							   <%}}}%>
							   
							   
							   <%
								//float Aamount = Float.parseFloat(plan_amt);
								
								System.out.print("amount in JSP : "+amount);
								float exactAmont = 0.00f;
								
								if(amount!=null)
							    {
									exactAmont = Float.parseFloat(amount);
								}
								
								float totalActivityAmount = (exactAmont + fAmount);
								BigDecimal bdAmount = new BigDecimal(totalActivityAmount);
								bdAmount = bdAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
								if(bdAmount.doubleValue()>0){
								%>
								
								<div class='form-group'>
                                    <div class='col-md-8'>
									
											<div class='col-md-3'>
                                                <label class='control-label'>Total Amount</label> 
											   </div>
											   
											   <div class='col-md-2'>
											 
                                            </div>
											
											<div class='col-md-3'>
											<label class='control-label'>$<%=bdAmount%></label> 
											</div>
										
                                    </div>
                                </div>
								
								<%
								}
								else{
								%>
								<!--<td class="tblRowHead">$< %=addAmt%></td>-->
								<%
								}
								%>
								
								
								<%
							}
							}
							catch(Exception e)
							{
								System.out.print("Error in JSP : ");
								e.printStackTrace();
							}
							%>
								
							

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="annButName" type="button" value="Back" onclick="javascript:history.back(-1);">Back</button>
										
                                    </div>
                                   
                                </div>
								
                          
							
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
