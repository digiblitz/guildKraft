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
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcmro.util.*"%>
<%@ page import ="com.hlcmro.util.HLCEventRequestVO"%>
<%@ page import="com.hlccommon.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmEndorseRetryPay.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
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
				
				   <div class='panel-heading'>
	  				 <h2>Meetings: Event Registration USEF Endorsed Competition-Retry Payment</h2>
					</div>
					
   <div class='panel-body'> 
	<%
		String eventId = (String) request.getAttribute("eventId");
		String paymentId = (String) request.getAttribute("paymentId");
		//eventId
		if(eventId==null){
			response.sendRedirect("index.jsp");
		}
		if(paymentId==null){
			response.sendRedirect("index.jsp");
		}
	
	%>
	
<form name="frmEvntOrgRenewal"  method="post" class="formcss" action="endorseRetryPay.html" onSubmit="return onEvnRenCheck();" >
<input type="hidden" name="eventProcess" value="updatePayment">
<input type="hidden" name="eventId" value="<%=eventId%>" />
<input type="hidden" name="paymentId" value="<%=paymentId%>" />

   
		<p>Fields mark with asterisk(<span class="asterisk" id="span_astriesk">*</span>) are required.</p>

	<p>Payments /General Information</p>
	<%
	String amt=(String)request.getAttribute("price"); 
	%>
	 <div class='form-group'>
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
			<div class='col-md-8'>
				<div class='col-md-4 indent-small'>
					<div class='form-group internal'>
	  					<input  type="text" name="amount" id="amount" class="form-control" size="10" readonly="true" value="<%=amt%>" />
    						<strong>$</strong>
					</div>
				</div>
			</div>
			
			
			<div class='col-md-8'>
				<div class='col-md-4 indent-small'>
					<div class='form-group internal'>
						<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
			  				<input type="radio" size="10" name="r11"  value="check" onclick="checkClear(),switchDiv('checkEncl'), showHideRadio('r11','chargeCard','check');" >  Check enclosed.
							</div>
						</div>
					</div>
				</div>
				
			<div class='col-md-8'>
				<div class='col-md-4 indent-small'>
					<div class='form-group internal'>
						<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'> 
							<input type="radio" size="10" name="r11" value="card" onclick="cardClear(),switchDiv('chargeCard'), showHideRadio('r11','checkEncl','card');" >Please charge my card.	
							</div>
						</div>
					</div>
				</div>
			</div>
			
			 <div class='form-group'>				
				<p>Check Details:</p>				
				
				<p>If paying by check please mail your payment to:  <br /><br />
						<br />
							Event Organizer Registration
						<br />
							525 Old Waterford Road, NW
						<br />
							Leesburg, VA 20176<br /><br />
							
							Note: Your registration status will be pending until check is processed. <br /><br /></p>
																				
					  
							
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
					<div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input type="text" name="checkNumber"  id="checkNumber" class="form-control" size="16" />
								<span class="asterisk" id="span_astriesk">*</span>						
							</div>
						</div>
					</div>
							
							<%
								String chkDat2="";
							
								java.util.Calendar c6 = java.util.Calendar.getInstance();
								int dyChk = c6.get(Calendar.DATE);
								int mnth = c6.get(Calendar.MONTH);
								
								int mnthChk = mnth+1;
								int yrChk = c6.get(Calendar.YEAR);
								
								if(mnthChk<10)
								{
									chkDat2 = "0"+mnthChk+"/"+dyChk+"/"+yrChk;
								}
								else
								{
									
									chkDat2 = mnthChk+"/"+dyChk+"/"+yrChk;
								}
							%>
							
							
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
					 
					 <div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
					    		<input type="text" name="checkDate"  id="checkDate" value="<%=chkDat2%>" readonly="true" class="form-control" size="10" />
								<a onclick="javascript:NewCssCal('checkDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
								</div>
							</div>
						</div>
						
						
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
					
					 <div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input type="text" name="bankName" id="bankName" class="form-control" size="30" />
								<span id="span_astriesk">*</span>						
							</div>
						</div>
					</div>
							
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Check:</label>
					
					<div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input name="nameOnchk" id="nameOnchk" type="text" class="form-control"  size="30" maxlength="25" /> 
								<span class="asterisk" id="span_astriesk">*</span>
							</div>
						</div>
					</div>
									
					<p>Card Details:</p>
					
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
					
					<div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<select name="ccType" id="ccType" class="form-control">
								  <option value="" selected="selected" >Select One</option>
								  <option value="Visa">Visa</option>
								  <option value="MasterCard">Master Card</option>
								  <option value="AmEx">AmEx</option>
								</select>
								<span class="asterisk" id="span_astriesk">*</span></span>							
							</div>
						</div>
					</div>
								
								
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No:</label>
					
					<div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input type="text" name="ccNumber" id="ccNumber" class="form-control" size="20" />
								<span class="asterisk" id="span_astriesk">*</span>
							</div>
						</div>
					</div>

					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV No.:</label>
					
					<div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input type="text" name="ccCvvid" id="ccCvvid" class="form-control" size="5" />
							</div>
						</div>
					</div>
								
								
								
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
					
					<div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							<div class='form-group internal'>
								<input type="text" name="ccName" id="ccName" class="form-control" size="15"/>
								<span class="asterisk" id="span_astriesk">*</span>
							</div>
						</div>
					</div>
								
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
					
					<div class='col-md-8'>
						<div class='col-md-4 indent-small'>
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
										  <option  value="2006">2006</option>
										  <option  value="2007">2007</option>
										  <option  value="2008">2008</option>
										  <option  value="2009">2009</option>
										  <option  value="2010">2010</option>
										  <option  value="2011">2011</option>
										  <option  value="2012">2012</option>
										  <option  value="2013">2013</option>
										  <option  value="2014">2014</option>
										  <option  value="2015">2015</option>
										   <option  value="2016">2016</option>
										   <option  value="2017">2017</option>
										   <option  value="2018">2018</option>
										   <option  value="2019">2019</option>
								</select>
								<span class="asterisk" id="span_astriesk">*</span>
							</div>
						</div>
					</div>
	
		<div class='col-md-offset-5 col-md-1'>
               <button class='btn-lg btn-primary' type="submit" name="submit" value="Submit">Submit</button>
		</div>
	</div>	
	
</form>
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

<script language="javascript">
	var cal2 = new calendar2(document.forms['frmEvntOrgRenewal'].elements['checkDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
	
</script>
</html>
