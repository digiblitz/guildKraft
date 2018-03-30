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
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlcutil.HLCCalendarVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmEventEntryPayment.js" type="text/javascript" ></script>
<script language="javascript" type="text/javascript">
function checkPrice(){
	var totalAmount = Number(document.getElementById('totalAmount').value);
	if(totalAmount<=0){
		document.getElementById('payment').disabled=true;
	}else{
		document.getElementById('payment').disabled=false;
	}
}
</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
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
					
                        <div class='panel-body'> 
	  
					  
						<%
							Integer totalAmount = (Integer)session.getAttribute("totalChargeablePrice");
						%>
		
     <form  class='form-horizontal' role='form' name="myform" id="myform" method="post" action="payment.html" onsubmit="return myvalidate();" >
			<input type="hidden" name="cmd" value="eventPayment" />
			      <p>Payment Details:</p>
				  <div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												 <i class="fa fa-dollar"></i> <input type="text" name="totalAmount" id="totalAmount" readonly="true" class="form-control"  value="<%=totalAmount%>" />
												  U.S. Dollars
										</div>
								  </div>
							</div>	
				           <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
                                              <input type="radio" size="10" name="r11" id="r11" value="check" onclick="forCheck();"/> Check enclosed.
							  	               <input type="radio" size="10" name="r11" id="r11" value="card" checked="checked" onclick="forCard();"/> Please charge my card.    
											 </div>
                                        </div>
								</div>
					         <p>Check Details:</p>
							
							<p>If paying by check , please mail your payment to: </p>
								
								<p>Horse  Registration</p>
								<p>525 Old Waterford Road NW</p>
								<p>Leesburg, VA 20176</p>												    
								<p>Note: Your registration status will be pending until check is processed.	</p>
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                             <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<input type="text" name="checkNumber" id="checkNumber" class="form-control"  />
												 <span id="span_astriesk">*</span>  
										</div>
								  </div>
							</div>
							<input type="hidden" name="chkdate" value="no">
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                             <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<input type="text" name="checkDate" id="checkDate" class="form-control" readonly="true" />
												 <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
												 <span id="span_astriesk">*</span>  
										</div>
								  </div>
							</div>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name :</label>
                             <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<input type="text" name="bankName" id="bankName" class="form-control" />
												  <span id="span_astriesk">*</span>  
										</div>
								  </div>
							</div>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Check:</label>
                             <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<input type="text" name="nameCheck" id="nameCheck" class="form-control" />
												  <span id="span_astriesk">*</span>  
										</div>
								  </div>
							</div>
						</div> 
				 <p>Card Details:</p>
				  <div class='form-group'>
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
					   <div class='col-md-8'>
						     <div class='col-md-3 indent-small'>
							         <div class='form-group internal'>			
							              <select name="ccType" id="ccType" class="form-control" >
											  <option selected="selected" value="">Select One</option>
											  <option value="Visa">Visa</option>
											  <option value="MasterCard">Master Card</option>
		
											  <option value="American Express">AmEx</option>
											</select>
									        <span id="span_astriesk">*</span>  
										</div>
								  </div>
							</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No.:</label>
					        <div class='col-md-8'>
						           <div class='col-md-3 indent-small'>
							               <div class='form-group internal'>	
							                    <input type="text" name="ccNumber" id="ccNumber" class="form-control"  />
								                   <span id="span_astriesk">*</span>  
										</div>
								  </div>
							</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
					        <div class='col-md-8'>
						           <div class='col-md-3 indent-small'>
							               <div class='form-group internal'>	
							                    <input type="text" name="ccCvvid" id="ccCvvid" class="form-control" />
								        </div>
								  </div>
							</div>
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
					        <div class='col-md-8'>
						           <div class='col-md-3 indent-small'>
							               <div class='form-group internal'>	
							                     <input type="text" name="ccName" id="ccName" class="form-control"  />
												  <span id="span_astriesk">*</span>  
								        </div>
								  </div>
							</div>
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
					        <div class='col-md-8'>
						           <div class='col-md-3 indent-small'>
							               <div class='form-group internal'>
														<select name="ccExpMonth" id="ccExpMonth" class="form-control">
					
														  <option value="" selected="selected">Month</option>
														  <option value="01">January</option>
														  <option value="02">February</option>
														  <option value="03">March</option>
														  <option value="04">April</option>
														  <option value="05">May</option>
														  <option value="06">June</option>
														  <option value="07">July</option>
														  <option value="08">August</option>
														  <option value="09">September</option>
														  <option value="10">October</option>
					
														  <option value="11">November</option>
														  <option value="12">December</option>
														</select>
													<select name="ccExpYear" id="ccExpYear" class="form-control">
														  <option value="" selected="selected" >Year</option>
																<%
																java.util.Calendar c6 = java.util.Calendar.getInstance();
																int year5 = c6.get(Calendar.YEAR);
																for(int f=year5;f<=year5+15;f++) 
																{
																%>
																<option  value="<%=f%>"><%=f%></option>
																<%
																}
																%>				
													</select>
								               <span id="span_astriesk">*</span>  
								        </div>
								  </div>
							</div>
						</div>	
			
			 <div class='form-group'>
					<div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-primary' type="submit" name="payment" id="payment" value="Submit Payment">Submit Payment</button>
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

</body>
<script language="javascript">
	var cal2 = new calendar2(document.forms['myform'].elements['checkDate']);
	 cal2.year_scroll = true;
	 cal2.time_comp = false;
</script>
</html>
