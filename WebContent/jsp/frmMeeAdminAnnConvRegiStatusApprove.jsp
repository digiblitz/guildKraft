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
<%@ page import = "java.text.*" %>
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
				if(document.frmMeeAnnualConvRegister.comments.value==""){
				alert("Enter a comments");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				
				if(document.frmMeeAnnualConvRegister.comments.value.length>1024){
				alert("Comments is out of range");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
	return true;
}
 
 


</script>
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
                            <h2> Meetings:Annual Meeting &amp; Convention  Details</h2>
						</div>
						
						 <div class='panel-body'>
							<p>User Information</p>
							
						  <% 
						  	
							SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
							HLCAnnualRegisterVO  objAnnualRegDet = (HLCAnnualRegisterVO) request.getAttribute("viewMemberDetails");
							if(objAnnualRegDet!=null){
								 String annualMeetingId  =  objAnnualRegDet.getAnnualMeetingId();
								 String userId  = objAnnualRegDet.getAnnualMeetingId();
								 String fName  = objAnnualRegDet.getFirstName();
								 String lastname = objAnnualRegDet.getLastName();
								 String emailId = objAnnualRegDet.getEmail();
								 //String noOfAddTickets  = objAnnualRegDet.getNoOfAddTickets();
								 String amount  = objAnnualRegDet.getTotalAmount();
								// String reqStatus = objAnnualRegDet.getRequestStatus();
								 //String comments = objAnnualRegDet.getComments();
								 Date addDate = objAnnualRegDet.getAddDate();
								 String checkNumber = objAnnualRegDet.getCheckNumber();
								 String paymentMode = objAnnualRegDet.getPaymentMode();
								 String checkName = objAnnualRegDet.getPaymentBy();
								 String txId = objAnnualRegDet.getTransactionId();
								 String bankName = objAnnualRegDet.getBankName();
                    			 Date checkDate = objAnnualRegDet.getCheckDate();
								 
								 String checkDateValue = "";
								 
								 // if(comments==null || comments.trim().length()==0)  comments = "";
								 
								 if(emailId==null || emailId.trim().length()==0)  emailId = "N/A";
								 if(fName==null || fName.trim().length()==0)  fName = "N/A";
								 if(lastname==null || lastname.trim().length()==0)  lastname = "N/A";
								 if(checkNumber==null || checkNumber.trim().length()==0)  checkNumber = "N/A";
								 if(checkName==null || checkName.trim().length()==0)  checkName = "N/A";
								 if(bankName==null || bankName.trim().length()==0)  bankName = "N/A";
								 if(txId==null || txId.trim().length()==0)  txId = "N/A";
								 if(amount==null || amount.trim().length()==0)  amount = "0.00";
								 
								 				
						%>
						   <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Registered By :</label>
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=fName%> &nbsp;<%=lastname%>
											</div>
										</div>
									</div>
							
						   <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Email:</label>
							<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=emailId%>
											
											</div>
										</div>
									</div>

						
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Registered Date:</label>
							<%
							if(addDate!=null && !addDate.equals(""))
							{
							%>
							  <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=sdf.format(addDate)%>
											</div>
										</div>
									</div>
							<%
							}
							else
							{
							%>
							 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>N/A
											</div>
										</div>
									</div>
										
 						    <%
							}
							%>
						 
					
							<%if(paymentMode!=null && !paymentMode.equals("") && paymentMode.equals("Check")){%>
						  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Number:</label>
							<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=checkNumber%>
											</div>
										</div>
									</div>
									
						  </tr>
						    <tr>
						      <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
						    	<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=bankName%>
											</div>
										</div>
									</div>
					     
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>  Name on Check:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=checkName%>
											</div>
										</div>
									</div>
						  
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Check Date:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
							<%
							 if(checkDate==null) { checkDateValue = "N/A";
							%>
							<%=checkDateValue%>
							<%
							}
							else{
							%>
							<%=sdf.format(checkDate)%>
							<%
							}
							%>
							
							</div>
						</div>
					</div>
						 
							<%}
							else{%>
							
						 
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id:</label>
							<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=txId%>
											</div>
										</div>
									</div>
						
							<%}%>
						
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Amount:</label>
							<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=amount%>
											</div>
										</div>
									</div>
						 
						  <%
						  }
						  %>
						  
					 
					  
							<%
							float totAmt = 0.00f;
							HLCAnnualRegistrationDetailVO  objAnnualUserDet = (HLCAnnualRegistrationDetailVO) request.getAttribute("viewRegUserDetails");
							if(objAnnualRegDet!=null){
							if(objAnnualUserDet.getArdId()!=null){
							%>					  
							<p>User Information</p>
							
						  <% 

								 String ardID  = objAnnualUserDet.getArdId();
								 String meetingId  =  objAnnualUserDet.getAnnualMeetingId();
								 String userId  = objAnnualUserDet.getUserId();
								 String badgeName  = objAnnualUserDet.getBadgeName();
								 String fName  = objAnnualUserDet.getFirstName();
								 String memberName  = objAnnualUserDet.getMemTypeName();
								 String daysApplied  = objAnnualUserDet.getDaysApplied();
								 String amount  = objAnnualUserDet.getRegAmount();
								// boolean ponyStatus  = objAnnualRegDet.getPonyMemberStatus();
								 String poId  = objAnnualUserDet.getPonyMemId();
								 String poClubeName  = objAnnualUserDet.getPonyClubName();
								 boolean facStatus  = objAnnualUserDet.getAccomFaciStatus();
								 String AccomDet  = objAnnualUserDet.getAccomDetails();
								 String reqStatus = objAnnualUserDet.getRequestStatus();
								 String comments = objAnnualUserDet.getRemarks();
								 
								  if(daysApplied==null || daysApplied.trim().length()==0)  daysApplied = "N/A";
								 
								 if(poId==null || poId.trim().length()==0)  poId = "N/A";
								 if(poClubeName==null || poClubeName.trim().length()==0)  poClubeName = "N/A";
								 if(AccomDet==null || AccomDet.trim().length()==0)  AccomDet = "N/A";
								// String ardID  = objAnnualRegDet.getRequestStatus();
								 //String ardID  = objAnnualRegDet.getRemarks();
								// String ardID  = objAnnualRegDet.getAddDate();
						
						%>
						   <label class='control-label col-md-2 col-md-offset-2' for='id_title'> First Name:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=fName%>&nbsp;
											</div>
										</div>
									</div>
						 
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Membership Name:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=memberName%>&nbsp;
											</div>
										</div>
									</div>
						  
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Name on Badge:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=badgeName%>&nbsp;
											</div>
										</div>
									</div>
						  
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Pony Club Id:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=poId%>&nbsp;
											</div>
										</div>
									</div>
						  
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Pony Club Name:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=poClubeName%>&nbsp;
											</div>
										</div>
									</div>
						 
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Accommodation Details:</label>
							<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=AccomDet%>
											</div>
										</div>
									</div>
						  
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Days Applied:</label>
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'><%=daysApplied%>&nbsp;
											</div>
										</div>
									</div>
							
						 
							<%						  
							
							ArrayList priceDetails = (ArrayList)request.getAttribute("priceDetails");
							if(priceDetails!=null && priceDetails.size()!=0){
								Iterator it = priceDetails.iterator();
								%>
								<p> Registerted Activities</p>
						  	    
							   <p>Amounts</p>
						
								<%
								while(it.hasNext()){
									HLCAnnualPriceDetailVO objPriceDet = (HLCAnnualPriceDetailVO) it.next();
									String activityName = objPriceDet.getSpecificationName();
									String amt = objPriceDet.getAmount();
									int totalTicket = objPriceDet.getTotalTicket();
									boolean addTkt = objPriceDet.isAddTktStaus();
									
									if(activityName==null) activityName = "";
									if(addTkt==false){
							%>
							 <tr>
							<td height="25" class="tableRight"><%=activityName%></td>
						  	<td height="25" class="tableRight">&nbsp;</td>
						    <td height="25" class="tableRight">$<%=amt%></td>
						    </tr>
							
							<%
							}
							}
							%>
							<tr>
								<td class="tblRowHead"> Addtional Tickets </td>
						  	    <td class="tblRowHead">No of Tickets </td>
							    <td class="tblRowHead">Amounts</td>
							</tr>
							<%
							if(priceDetails!=null && priceDetails.size()!=0){
								Iterator tempIt = priceDetails.iterator();
								int chkValue =0;
								
								while(tempIt.hasNext()){
									HLCAnnualPriceDetailVO objPriceDet = (HLCAnnualPriceDetailVO) tempIt.next();
									String activityName = objPriceDet.getSpecificationName();
									String amt = objPriceDet.getAmount();
									int totalTicket = objPriceDet.getTotalTicket();
									boolean addTkt = objPriceDet.isAddTktStaus();
									
									if(activityName==null) activityName = "";
									if(addTkt==true){
									chkValue++;
									totAmt = totAmt + Float.parseFloat(amt);
							%>
							 <tr>
							<td height="25" class="tableRight"><%=activityName%></td>
						  	<td height="25" class="tableRight"><%=totalTicket%></td>
						    <td height="25" class="tableRight">$<%=amt%></td>
						    </tr>
							
							<%
							}
							}
							if(chkValue==0){
							%>
							<tr>
							<td colspan="3" height="25" class="tableRight"> No addtional tickets purchased.</td>
						    </tr>
							<%
							}
							}
						
							%>
							<tr>
								<td class="tblRowHead"> Total Amount </td>
						  	    <td class="tblRowHead">&nbsp;</td>
								<%
								//float Aamount = Float.parseFloat(plan_amt);
								
								
								float exactAmont = Float.parseFloat(amount);
								float totalActivityAmount = (exactAmont + totAmt);
								BigDecimal bdAmount = new BigDecimal(totalActivityAmount);
								bdAmount = bdAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
								%>
							    <td class="tblRowHead">$<%=bdAmount%></td>
							</tr>
							
						
							<form name="frmMeeAnnualConvRegister" method="post" action="AnnualRegList.html" onsubmit="return chk();">
						<input type="hidden"  name="ardId" value="<%=ardID%>" />	
								<input type="hidden"  name="memProcess" value="updateStatus" />	
	 
								<tr>
									<td  class="tableLeft">Do you want Approve or Reject:</td>
									  <td colspan="2" class="tableLeftTxtArea" >	
									  <%
									  	if(reqStatus!=null && reqStatus.equals("Pending")){
									  %>
									<input  type="radio" value="Registered" name="requestStatus" checked="checked" />Approve &nbsp;&nbsp;&nbsp;&nbsp;
									<input  type="radio" name="requestStatus" value="Rejected" />Reject
									<%
									}
									else{
									%>
									<input type="radio" name="requestStatus" value="Registered" />Approve &nbsp;&nbsp;&nbsp;&nbsp;
									<input  type="radio" name="requestStatus" value="Rejected" checked="checked"  />Reject
									<%
									}
									if(comments==null) comments = "";
									%>
									</td>
							  </tr>	  
								  <tr> 
									<td class="tableLeftTxtArea">Comments:</td>
									<td colspan="2" class="tableRight"><textarea name="comments" class="textAreaOne" rows="5"><%=comments%></textarea>
								    <span class="asterisk">*</span></td>
								  </tr>
								  <tr>
								  <td class="alignCenter" colspan="2" align="center">	
								    <input type="submit" value="Submit" class="btn text_3 color_3" />&nbsp;&nbsp;&nbsp;
									<input type="button" value="Cancel" class="btn text_3 color_3" onclick="javascript:history.back(-1);"/>&nbsp;</td></tr>
								<tr> 
									
							  </tr>
						  </form>
						  	<%
							}
						}
						}
							%>
					  </table>
				  
			  </table>
			<!-- CONTENTS END HERE -->			</td>
		  </tr>
	  </table>
	  
	  
	  
	  
	  
	  <!--==============================================import content code end here============================================-->
	  
	  
	  </td>
    </tr>
	
		

  </table>
  </section>
  
<!--==============================================content end here============================================-->

<!--==============================================footer start here============================================-->
 <div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>
<!--==============================================footer end here============================================-->

</body>
</html>
