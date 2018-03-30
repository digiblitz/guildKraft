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

 
/*function chk(){
			
				if(document.frmMeeAnnualConvRegister.comments.value==""){
				alert("Enter Comments");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				
				if(document.frmMeeAnnualConvRegister.comments.value.length>1024){
				alert("Comments is out of range");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				if(document.frmMeeAnnualConvRegister.comments.value.indexOf('  ')!==-1){
				alert("Please avoid unwanted white space");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}


	return true;
}*/
	
</script>
<%! 
	String  nullCheck(String fieldName){
	String retValue = "NA";
	if(fieldName!=null && fieldName.trim().length()!=0){
	retValue = fieldName;
	}
	return retValue;
	}
	%>

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
						
								<div class='panel-heading col-col-offset-2'>
									<h2>User Information</h2>
								</div>
								
								
								<% 
						  try
						  {
						  
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
								 String reqStatus = objAnnualRegDet.getRequestStatus();
								 String comments = objAnnualRegDet.getComments();
								 Date addDate = objAnnualRegDet.getAddDate();
								 String checkNumber = objAnnualRegDet.getCheckNumber();
								 String paymentMode = objAnnualRegDet.getPaymentMode();
								 String checkName = objAnnualRegDet.getPaymentBy();
								 String txId = objAnnualRegDet.getTransactionId();
								 String bankName = objAnnualRegDet.getBankName();
								 String paymentId = objAnnualRegDet.getPaymentId();
								 System.out.println("getPaymentId :"+paymentId);
                    			 Date checkDate = objAnnualRegDet.getCheckDate();
								 String checkDateValue = "N/A";
								 
								  if(comments==null || comments.trim().length()==0)  comments = " ";
								 
								 if(emailId==null || emailId.trim().length()==0)  emailId = "N/A";
								 if(fName==null || fName.trim().length()==0)  fName = "N/A";
								 if(lastname==null || lastname.trim().length()==0)  lastname = "N/A";
								 if(checkNumber==null || checkNumber.trim().length()==0)  checkNumber = "N/A";
								 if(checkName==null || checkName.trim().length()==0)  checkName = "N/A";
								  if(bankName==null || bankName.trim().length()==0)  bankName = "N/A";
								   
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=lastname%></label> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'> <%=emailId%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%if(reqStatus!=null && reqStatus.equals("Pending")){%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=paymentMode%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%}else{%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=reqStatus%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=paymentMode%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%}%>
							<%if(paymentMode!=null)
							{
							if(paymentMode.equals("Check")){%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Check Number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=checkNumber%></label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=bankName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Check:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=checkName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%}else{%>
							
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=nullCheck(txId)%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'>$ <%=amount%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								
								<div class='form-group'>
									<div class='col-md-8'>
									
										<div class='col-md-2'>
										<label class='control-label label1'>Badge Name</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Full Name</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Member Type </label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Request Status</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>Request Date</label>
										</div>
									</div>
								</div>
										
										
								<%
					
									 ArrayList viewAllUserDetails=(ArrayList)request.getAttribute("viewAllUserDetails");
									 if(viewAllUserDetails!=null && viewAllUserDetails.size()!=0){ 
										Iterator  enm1 = viewAllUserDetails.iterator(); 
											while(enm1.hasNext()){
											HLCAnnualRegistrationDetailVO objRegDet = (HLCAnnualRegistrationDetailVO)enm1.next();
											
											String requestStatus = objRegDet.getRequestStatus();
											Date date = objRegDet.getAddDate();
											String remarks = objRegDet.getRemarks();
											String lName = objRegDet.getLastName();
											String firstName="";
											String memTypeName="";
											String badgeName="";
											//String annualMeetingId ="";
											//String ardId  = "";
											//ardId = objRegDet.getArdId();
											firstName = objRegDet.getFirstName();
											memTypeName = objRegDet.getMemTypeName();
											badgeName = objRegDet.getBadgeName();
											
						   %>
						   
						   
						   			<div class='form-group'>
									<div class='col-md-8'>
									
										<div class='col-md-2'>
										<label class='control-label'><%=badgeName%></label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label'><%=firstName%>&nbsp;<%=lName%></label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label'><%=memTypeName%> </label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label'><%=requestStatus%></label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label1'><%=sdf.format(date)%></label>
										</div>
										
									</div>
								</div>
								
								<%}}}%>

						  
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeAnnualConvRegister" method="post" action="AnnualRegList.html" onsubmit="return chk();">
							
                                <input type="hidden"  name="annualMeetingId" value="<%=annualMeetingId%>" />
								<input type="hidden" name="paymentId" value="<%=paymentId%>" />
								<input type="hidden"  name="memProcess" value="massUpdateStatus" />	

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Do you want Approve or Reject:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <%if(reqStatus!=null && reqStatus.equals("Pending")){%>
											
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
											%>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<textarea name="comments" class="textAreaOne" rows="5"></textarea>
											</div>
										</div>
									</div>
									
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Submit">Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger'  type="button" value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
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
