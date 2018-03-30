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
<%@ page import="com.hlcmeeting.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/frmHorseReg.js" type="text/javascript" ></script>

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<%! 
	DecimalFormat result  = new DecimalFormat("0.00");
	String amtFormat(String amtVal){
	String amountValue = "0.00";
		if(amtVal!=null && amtVal.trim().length()!=0){
		System.out.print(Double.parseDouble(amtVal));
		amountValue = result.format(Double.parseDouble(amtVal));
		}
	return amountValue;
}

%>
<%! 
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%! String dateCheck(Date fieldName){
	String detValue = "N/A";
		if(fieldName!=null){
		 detValue = sdf.format(fieldName);
		}
	return detValue;
}

%>
<%! float floatCheck(float fieldName){
	float floateValue = 0;
		if(fieldName!=0.0){
		 floateValue = fieldName;
		}
	return floateValue;
}
%>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="cardClear();">

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
                            <h2>Membership: Annual Registration Payment Failed Details</h2>
                        </div>
						<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
							<p>Annual Meeting Information Section:</p>
						
									<%
										SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
										ArrayList pendInfo = (ArrayList) request.getAttribute("pendInfo");
										Iterator itr = pendInfo.iterator();
										while(itr.hasNext()){
										
										HLCAnnualDetVO detailVO  = (HLCAnnualDetVO) itr.next();
										
										String badgeName =  detailVO.getBadge_name();
										String ccName =  detailVO.getCc_name();
										String ccType =  detailVO.getCc_type();
										String daysApplied =  detailVO.getDays_applied();
										String meetingId =  detailVO.getMeetId();
										String paymentId =  detailVO.getPayment_id();
										String registId =  detailVO.getRegistrat_id();
										String remarks =  detailVO.getRemarks();
										String reqstatus =  detailVO.getRequest_status();
										String txnId =  detailVO.getSsl_txn_id();
										float totalAmt =  detailVO.getTotal_amount();
									%>
									
					       <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Meeting ID:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(meetingId)%></label>
										    </div>
								       </div>
							       </div>	
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Badge Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(badgeName)%></label>
										    </div>
								       </div>
							       </div>	
								   
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Days Applied:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                                <%
												if(daysApplied==null || daysApplied.trim().length()==0){
													daysApplied="Full Registration";
												}
												%>
												<label class="control-label"><%=daysApplied%></label>
										    </div>
								       </div>
							       </div>	
					              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Badge Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(badgeName)%></label>
										    </div>
								       </div>
							       </div>	
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Status:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(reqstatus)%></label>
										    </div>
								       </div>
							       </div>
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Remarks:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(remarks)%></label>
										    </div>
								       </div>
							       </div>	
								 </div>   	
				
					     <p>Annual Meeting Payment Information:</p>
						<div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name On Card:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(ccName)%></label>
										    </div>
								       </div>
							       </div>	
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(ccType)%></label>
										    </div>
								       </div>
							       </div>	
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(txnId)%></label>
										    </div>
								       </div>
							       </div>	
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount($):</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=totalAmt%></label>
										    </div>
								       </div>
							       </div>	 
								 </div>  
					<form class='form-horizontal' role='form' name="annualfailPayDet" action="AnnualPendDet.html" method="post">
					<input type="hidden" name="execute" value="payProceed"  />
					<input type="hidden" name="meet_id" value="<%=meetingId%>" />
					<input type="hidden" name="pa_id" value="<%=paymentId%>" />
					<input type="hidden" name="registId" value="<%=registId%>" />
					<input type="hidden" name="badgeName" value="<%=badgeName%>"/>
					<input type="hidden" name="amt" value="<%=totalAmt%>" />
			    <div class='form-group'>
					  <div class='col-md-offset-4 col-md-2'>
						<button class='btn-lg btn-primary' type="submit" value="Pay Amount" name="back">Pay Amount</button>
					    </div>
				 </div>	
					</form>
		
			<%
			}
			%>
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
