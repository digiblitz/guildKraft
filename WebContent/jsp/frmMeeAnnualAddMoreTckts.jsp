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
<%@ page import="com.mee.ann.*"%>
<%@ page import="com.hlcmeeting.util.*"%>
<%@ page import="java.math.*"%>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/frmMeeAddtnltckt.js" type="text/javascript"></script>

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
                            <h2>Meetings: Annual Meeting & Convention Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmAnnualConvRegFinalize" id="frmAnnualConvRegFinalize" method="post" action="AnnualAdditionalTckt.html" onsubmit="return myvalidate();">
							
                             <input type="hidden" name="execute" value="insertAddTckt"/>
							<input type="hidden" name="calcValue" value="0" />
							<input type="hidden" name="totTckt" value="0" />
							 <%
								Vector otherType = (Vector)request.getAttribute("OTHER_ACTIVITY");
							  //out.print(regType.size());
							  String priceIdLen = "0";
							  
							  if(otherType!=null){
								priceIdLen = String.valueOf(otherType.size());
							  }
								String memberShipTypeID = (String) request.getAttribute("memberShipTypeID");
								String memberId = (String) session.getAttribute("memberId");
								String fname = (String) session.getAttribute("firstName");
								String lname = (String) session.getAttribute("lastName");
								String name = fname+" "+lname;
                                                                 String sessionInvoiceId = "1";
                                                               session.setAttribute("sessionInvoiceId",sessionInvoiceId);
							  %>							
							<input id="priceIdLen" type="hidden" name="priceIdLen" value="<%=priceIdLen%>" />
							<input type="hidden" name="memberShipTypeID" value="<%=memberShipTypeID%>" />
							<input type="hidden" name="addTktRegistrarName" value="<%=name%>" />
							
							<p>Fields marked with an asterisk<span style="color:#FF0000;">(*)</span>are required.</p>	
							
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Information</label>
								</div>						
							

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID</label>
									
									 <%
									  if(memberId==null || memberId.trim().length()==0){
										memberId= "N/G";
									  }
									  %>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=memberId%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Name</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=fname%> <%=lname%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ticket Information</label>
								</div>
								
								<div class='form-group'>
								<div class="col-md-8">
								
									<div class="col-md-2">
									<label class='control-label label1'>Other Activity Name</label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label label1'>No. of tickets</label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Amount ($) </label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Total Amount ($)</label> 
									</div>
									
								</div>
							</div>
							
							<%
								if(otherType!=null && otherType.size()!=0){
								Enumeration otherEnum = otherType.elements();
								%>
							<input type="hidden" name="actSize" value="<%=otherType.size()%>">
								<%
								int txtCount = 0;
								while(otherEnum.hasMoreElements()){
								String[] s = (String [])otherEnum.nextElement();
								txtCount ++;
								//out.print("id:" + s[0]);
								String spId = s[0];
								String spTransId = s[2];
							   %>
								<input type="hidden" name="tktactivityId" id="tktactivityId" value="<%=spTransId%>" />
														
							<div class='form-group'>
										<div class='col-md-8'>
									
									<div class='col-md-2'>
										 <input type="checkbox" name="actCheckBox<%=txtCount%>" id="actCheckBox<%=txtCount%>" value="<%=spId%>" onclick="getActivityAmount('<%=spId%>',this,<%=txtCount%>);"/><%=s[1]%>
									</div>
									
									<div class='col-md-2'>
									 <input name="noofticket<%=txtCount%>" id="noofticket<%=txtCount%>" value="" maxlength="4" class="form-control"  onblur="checkForInt(this);"/>
									</div>
									
									<input type="hidden" name="actVal<%=txtCount%>"  value="<%=s[1]%>">
									
									<div class='col-md-2'>
									<input type="hidden" name="priceId<%=txtCount%>" id = "priceId<%=txtCount%>" value="" />
									  <input name="indivAmt<%=txtCount%>" class="form-control" id="indivAmt<%=txtCount%>" readonly  value="0.00"  />	
									</div>
									
									<div class='col-md-2'>
									 <input name="calculAmt<%=txtCount%>" class="form-control" id="calculAmt<%=txtCount%>" readonly="readonly" value="0.00"  />
									</div>
									
								</div>
							</div>
							
							<%}} %>
							
							 <div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Information</label>
							</div>
							
							<input type="hidden" id="stTotal" name="stTotal" readonly="true" class="form-control" value="" />
							
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             $<input type="text" name="totalAmount" readonly="true" class="form-control"  value="" />
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
									<div class='col-md-offset-2'>
										<input type="radio" size="10" name="r11" id="r11" value="check"  onclick="switchDiv('chkEncAcm'), showHideRadio('r11','chrgCrdAcm','check'), cardClear();"/> Check enclosed.
									 
									 		<input type="radio" size="10" name="r11" id="r11" value="card" checked="checked" onclick="switchDiv('chrgCrdAcm'), showHideRadio('r11','chkEncAcm','card'), checkClear();"  /> Please charge my card.	
									</div>
								</div>
								
									<div id="chkEncAcm">
									
									 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Details:</label>
									
								</div>
								
								 <p>If paying by check please mail your payment to:  <br />   <br />
										
									 Annual Meeting Registration  <br />
												  
									525 Old Waterford Road NW    <br />
												
									 Leesburg, VA 20176	</p>											
												   
									<p>Note: Your registration status will be pending until check is processed.	</p>
									
									<input type="hidden" name="status" value="no">
											<%
														int si=0;

														String logBy="user";
														if(session.getAttribute("loggedBy")!=null){
														String loggedBy="";
														loggedBy=(String)session.getAttribute("loggedBy");
														logBy=loggedBy;
														if(loggedBy.equalsIgnoreCase("Admin")){
											%>
									
									
									<input type="hidden" name="status" value="yes">
									
									
							<div class='form-group'>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="hidden" name="roughVal" value="yes">
												 $<input type="text" name="chkAmt" id="chkAmt" class="form-control"  />&nbsp; U.S. Dollars	
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<%}}%>
								
								<div class='form-group'>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" name="checkNumber" id="checkNumber" class="form-control"/>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" name="checkDate" id="checkDate" class="form-control" readonly="yes" />
											 <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" name="bankName" id="bankName" class="form-control"/>
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
								
							</div>
							
							<div id="chrgCrdAcm">
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Details:</label>
									
								</div>
							
							<div class='form-group'>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <select name="ccType" id="ccType" class="form-control">
														  <option selected="selected" value="">Select One</option>
														  <option value="Visa">Visa</option>
														  <option value="MasterCard">Master Card</option>
														  <option value="AmEx">AmEx</option>
														</select>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" name="ccNumber" id="ccNumber" class="form-control" />
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
															  <option  value="2020">2020</option>
															  <option  value="2021">2021</option>
															  <option  value="2022">2022</option>
															  <option  value="2023">2023</option>
															  <option  value="2024">2024</option>															  
														</select>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
							</div>
							
						


                               <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' type='submit' value="Submit Payment">Submit Payment</button>
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


 
						
										
										
										
										</td>
									  </tr>
									  <tr>
										<td colspan="2">
										<div id="chrgCrdAcm">
											<table width="100%" align="center" cellpadding="0" cellspacing="0" border="0" class="tableInner">
												
												<tr>
													<td class="tblMainHead" colspan="2"><strong>Card Details:</strong></td>
												</tr>
												
													<tr>
													<td class="tableLeft">Card Type:</td>
												  <td class="tableRight">
														<select name="ccType" id="ccType" class="selectboxOne">
														  <option selected="selected" value="">Select One</option>
														  <option value="Visa">Visa</option>
														  <option value="MasterCard">Master Card</option>
														  <option value="AmEx">AmEx</option>
														</select>
					                                    <span class="asterisk">*</span>								</td>
												</tr>
												
												<tr>
													<td class="tableLeft">Card No.:</td>
												  <td class="tableRight">
												  <input type="text" name="ccNumber" id="ccNumber" class="textboxOne" size="16" />
					                                  <span class="asterisk">*</span></td>
												</tr>
												<tr>
													<td class="tableLeft">Card CVV No.:</td>
												  <td class="tableRight">
												  <input type="text" name="ccCvvid" id="ccCvvid" class="textboxOne" size="5" /></td>
												</tr>
											
												<tr>
													<td class="tableLeft">Print Name On Card:</td>
												  <td class="tableRight">
												  <input type="text" name="ccName" id="ccName" class="textboxOne" size="25" />
					                                  <span class="asterisk">*</span></td>
												</tr>
												<tr>
													<td class="tableLeft">Expiry Date:</td>
												  <td class="tableRight">
														<select name="ccExpMonth" id="ccExpMonth" class="selectboxOne">
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
														<select name="ccExpYear" id="ccExpYear" class="selectboxOne">
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
															  <option  value="2020">2020</option>
															  <option  value="2021">2021</option>
															  <option  value="2022">2022</option>
															  <option  value="2023">2023</option>
															  <option  value="2024">2024</option>															  
														</select>
					                                    <span class="asterisk">*</span>																         </td>
								      </tr>
								 </table>	
								 </div>
	 							</td>
							</tr>
							<tr>
							  <td colspan="2" class="alignCenter" align="center">
												<input type="submit" value="Submit Payment" class="btn text_3 color_3" />&nbsp;</td>
						    </tr>
						  </form>
					  </table>
					<!-- CONTENTS START HERE -->
				</td>
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
<script language="javascript">
	var cal1 = new calendar2(document.forms['frmAnnualConvRegFinalize'].elements['checkDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
</script>
</html>
