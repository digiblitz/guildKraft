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
<script src="js/validate.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head><%! 
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
                            <h2>Meeting: Event Registration Payment Failed Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				<!-- CONTENTS START HERE -->
	
				
	
		    			<p  id="parta" >Event Registration Details:</p>
						
        <%
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
 	HLCEventRegPendingVO evePendDets = (HLCEventRegPendingVO) request.getAttribute("objPendingVO");
	String eveId=evePendDets.getEventId();
                String orgId=evePendDets.getOrgId();
                String compName=evePendDets.getCompName();                                           
                String compLocat=evePendDets.getCompLocation();
                String compCity=evePendDets.getCompCity();
                String compStat=evePendDets.getCompState();
                String compCont=evePendDets.getCompCountry();
                String compZip=evePendDets.getCompZip();
                String compAr=evePendDets.getCompArea();
                String payId=evePendDets.getPaymentId();
                String ccName=evePendDets.getCcName();
                String ccTyp=evePendDets.getCcType();
                String ccNumb=evePendDets.getCcNumber();
                int expMonth=evePendDets.getCc_exp_Month();
                int expYear=evePendDets.getCc_exp_Year();
                int ccVVid=evePendDets.getCc_CvvId();             
                float totAmount=evePendDets.getAmt();
                Date payDt=evePendDets.getPaymentDate();
                String payStat=evePendDets.getPaymentStatus();              
                String ssTxnId=evePendDets.getSslTxnId();
                String ssEmail=evePendDets.getSslEmail();                
                String statName=evePendDets.getStatName();
                String areaName=evePendDets.getAreaName();
				String sslResultMsg=evePendDets.getSslResultMessage();

	%>
				 			<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eveId)%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(compName)%></label>
											</div>
										</div>
									</div>
									
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(orgId)%></label>
											</div>
										</div>
									</div>
									
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(compCity)%></label>
											</div>
										</div>
									</div>
									
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(statName)%></label>
											</div>
										</div>
									</div>
									
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(compZip)%></label>
											</div>
										</div>
									</div>
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(compCont)%></label>
											</div>
										</div>
									</div>
									
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(areaName)%></label>
											</div>
										</div>
									</div>
								</div>
									
									<p>Pending Payment  Details:</p>
									
							<div class="form-group">
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Credit Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(ccTyp)%></label>
											</div>
										</div>
									</div>
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Credit Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(ccName)%></label>
											</div>
										</div>
									</div>
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(sslResultMsg)%></label>
											</div>
										</div>
									</div>
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(ssTxnId)%></label>
											</div>
										</div>
									</div>
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Pending Amount ($):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=totAmount%></label>
											</div>
										</div>
									</div>
								</div>
								
					
  					<form class='form-horizontal' role='form' name="myForm" id="myForm" action="eventPendPayment.html" method="post">
					<input type="hidden" name="cmd" value="initPayment"  />
					<input type="hidden" name="eveId" value="<%=eveId%>" />
					<input type="hidden" name="pendAmount" value="<%=totAmount%>" />
					<input type="hidden" name="tempPayId" value="<%=payId%>" />		
					
					
					
							 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' type='submit' value="Pay Amount" name="back">Pay Amount</button>
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
