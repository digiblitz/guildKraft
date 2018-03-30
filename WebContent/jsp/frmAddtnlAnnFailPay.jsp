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
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/horseFailPay.js" type="text/javascript"></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>



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
                            <h2>Membership: Annual Registration Payment Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				 
				
 		
			<%
                String amount = (String) session.getAttribute("amount");
                String payId = (String) session.getAttribute("payId");
                String bdgeNme = (String) session.getAttribute("bdgeNme");
                String meetId = (String) session.getAttribute("meetId");
            %>
						<form class='form-horizontal' role='form' name="myform" id="myform" method="post"  action="AnnualPendDet.html" onsubmit="return myValidate();">
						<input type="hidden" name="paymentId" value="<%=payId%>" />
						<input type="hidden" name="act" value="payment" />
						<input type="hidden" name="meetId" value="<%=meetId%>" />
						<input type="hidden" name="bdgeNme" value="<%=bdgeNme%>" />
						<input type="hidden" name="totalAmount" value="<%=amount%>" />
						<input type="hidden" name="execute" value="payment" />
	   
				<p>Payment Information:</p>
	 
				  			 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
										<input type="hidden" name="tempAmount" readonly="true" class="readOnly" size="10" value="<%=amount%>" />
										<i class="fa fa-dollar"></i><input type="text" name="totalAmount" size="10" value="<%=amount%>" class="readOnly" readonly="readonly"/>&nbsp; U.S. Dollars
										</div>
									</div>
								</div>
							</div> 
							
					
					 
						<div class="form-group">
							<input type="radio" size="10" name="r11" id="r11" value="check" onclick="switchDiv('chkEncAcm'), showHideRadio('r11','chrgCrdAcm','check'), checkClear();cardClear();"/> Check enclosed.
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>				 
												<input type="radio" size="10" name="r11" id="r11" value="card" checked="checked"
onclick="switchDiv('chrgCrdAcm'), showHideRadio('r11','chkEncAcm','card'), cardClear();checkClear();"/> Please charge my card.					
												
												</div>
											</div>
										</div>
									</div>
									
						 <p>Check Details:</p>
							
							 <p> If paying by check please mail your payment to:  <br />
								<br />
								
								<br />
								Annual Meeting Registration
								<br />
								525 Old Waterford Road NW
								<br />
								Leesburg, VA 20176												
								<br /></p>

							<p>Note: Your registration status will be pending until check is processed.	</p>
							
						<%
						System.out.print("newRoleName in horse registration:" + newRoleName);
						if(session.getAttribute("loggedBy")==null){%>
						<input type="hidden" name="status" value="no">	
							<%}
							int si=0;
							String logBy="user";
							if(session.getAttribute("loggedBy")!=null){
							String loggedBy="";
							loggedBy=(String)session.getAttribute("loggedBy");
							logBy=loggedBy;
							if(loggedBy.equalsIgnoreCase("Admin")){
						%>
							
							
							<div class='form-group' id='chrgCrdAcm'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
							   					 <input type="hidden" name="roughVal" value="yes">
													<i class="fa fa-dollar"></i> <input type="text" name="chkBalAmt" id="chkBalAmt" class="form-control"  maxlength="10" />                                                     &nbsp; U.S. Dollars	
												</div>
											</div>
										</div>
										
									<%
									}
									else{%>
									 <input type="hidden" name="roughVal" value="no">
									<%}
									}%> 						  
							 
							 	
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
							  					<input type="text" name="checkNumber" id="checkNumber" class="form-control"  />
													<span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>						
						
						<%	if(session.getAttribute("loggedBy")!=null){%>
						
							<input type="hidden" name="chkdate" value="yes">
							 
							 	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
												<input type="text" name="checkDate" id="checkDate" class="form-control" maxlength="13"/>
							   						<a href="javascript:cal2.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
														<span id="span_astriesk">*</span>	
												</div>
											</div>
										</div>
				  
							<%}
							else{%>
							
							<input type="hidden" name="chkdate" value="no">
							
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
													<input type="text" name="checkDate" id="checkDate" class="form-control" readonly="true"  />
													   <a href="javascript:cal2.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
													   	<span id="span_astriesk">*</span>	
													</div>
												</div>
											</div>
				  										  
				<%}%>	
							 
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
												  <input type="text" name="bankName" id="bankName" class="form-control"  />
												  <span id="span_astriesk">*</span>	
												</div>
											</div>
										</div>							  
						
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Check:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
													 <input type="text" name="nameCheck" id="nameCheck" class="form-control"  /> 
													<span id="span_astriesk">*</span>	
												</div>
											</div>
										</div>
									</div>						  
				
					
								<p>Card Details:</p>
							
							<div class="form-group"  id="chrgCrdAcm">
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type::</label>
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
											  <input type="text" name="ccNumber" id="ccNumber" class="form-control"/>
													<span id="span_astriesk">*</span>	
												</div>
											</div>
										</div>
										
										
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
											  <input type="text" name="ccCvvid" id="ccCvvid" class="form-control"  />							 
											  </div>
											 </div>
											</div>
											
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
													  <input type="text" name="ccName" id="ccName" class="form-control" />
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
																							java.util.Calendar c5 = java.util.Calendar.getInstance();
																							//int day = c.get(Calendar.DAY);
																							//int month = c.get(Calendar.MONTH);
																							int year5 = c5.get(Calendar.YEAR);
																							//String date = day+" / "+month+" / "+year;
																							System.out.println("Current Date = "+year5);
			
																							for(int f=year5;f<=year5+15;f++) 
																							{%>
																								<option  value="<%=f%>"><%=f%></option>
																							<%}
																							%>								
												</select>
														<span id="span_astriesk">*</span>	
												</div>
											</div>
										</div>
									
						<!--						  							<tr>
									<td class="tableLeft">Activation Date:</td>
									<td class="tableRight">
									<input type="text" name="activeDatVal" id="activeDatVal" class="textboxOne" readonly="true" size="16" value="< %=chkDat%>" /> 	
									<a href="javascript:cal3.popup();">
								   <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a>
								  <span class="asterisk">*</span></td>		
						  </tr>	-->
				
								<%
								String logby = null;			
								if(session.getAttribute("loggedBy")!=null){	
									logby = "yes";
								%>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activation Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											  <div class='form-group internal'>
										
													<%
															  String finalDate="";
																 
																 
																//java.util.Calendar c5 = java.util.Calendar.getInstance();
																int day = c5.get(Calendar.DATE);
																int month1 = c5.get(Calendar.MONTH);
																
																int month=month1+1;
																int year = c5.get(Calendar.YEAR);
																String date="";
																String chkDat="";
																
																if(month<10)
																{
																	date = year+"-"+"0"+month+"-"+day;
																	 
																	chkDat = "0"+month+"/"+day+"/"+year;
																}
																else
																{
																date = year+"-"+month+"-"+day;
																chkDat = month+"/"+day+"/"+year;
																}%>			
										
										
														<input type="text" name="activeDatVal" id="activeDatVal" class="form-control"  value="<%=chkDat%>" /> 	
														<a href="javascript:cal3.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
													<span id="span_astriesk">*</span>	
												</div>
											</div>
										</div>
									</div>
										
			<%
			}
			%>	
			<input type="hidden" name="logby" value=<%=logby%> />				 
			
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' type="submit" value="Submit Payment" >Submit Payment</button>
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



<script language="javascript">
 	var cal2 = new calendar2(document.forms['myform'].elements['checkDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
	if(document.myform.logby.value=="yes"){
		var cal3 = new calendar2(document.forms['myform'].elements['activeDatVal']);
			cal2.year_scroll = true;
			cal2.time_comp = false;	
	}	
 </script>
</html>
