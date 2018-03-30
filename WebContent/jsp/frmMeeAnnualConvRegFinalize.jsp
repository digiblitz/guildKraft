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
<%@ page import="java.math.*"%>
  <%
HLCAnnualMeetingStore sessRegList = (HLCAnnualMeetingStore)session.getAttribute("regList");
//out.print(regList);
if(sessRegList==null || sessRegList.getSize()==0){
//out.print("No records are found");
	response.sendRedirect("annualConRegAction.html?annProcess=initAnnual");
}
%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeAnnualConvRegister.js" type="text/javascript" ></script>
<script src="js/frmMeeAnnConFinalize.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/gen_validatorv2.js" type="text/javascript" ></script>
<script language="javascript">
function clearTkts(){
	if(document.getElementById('addTktRegistrarName').value!=""){
		var len = document.getElementById('priceIdLen').value;
		for(i=1;i<=len;i++){
			var actCheckBox = "actCheckBox"+i;
			var noOfTkt = "noofticket"+i;
			var indivAmt = "indivAmt"+i;
			var calculAmt = "calculAmt"+i;
						
			if(document.getElementById(actCheckBox).checked==true){
				document.getElementById(actCheckBox).checked =false;
				document.getElementById(noOfTkt).value=0;
				document.getElementById(indivAmt).value="0.00";
				document.getElementById(calculAmt).value="0.00";
			}
		}
	}
}
	function clearBasicLists(){
		var priceLen = document.frmAnnualConvRegFinalize.priceIdLen.value;
		for (i=1;i<=priceLen;i++){
			var noOfTkt = "noofticket"+i;
			var indivAmt = "indivAmt"+i;
			var calculAmt = "calculAmt"+i;
			
			document.getElementById(noOfTkt).value=0;
			document.getElementById(indivAmt).value="0.00";
			document.getElementById(calculAmt).value="0.00";
		}
		document.frmAnnualConvRegFinalize.activityAmount.value = "0.00";
	}

		function checkAll() {
			 el = document.forms['frmAnnualConvRegFinalize'].elements;
			 for (i=0; i < el.length; i++) {
			   if(el[i].type == "checkbox") {
				  void(el[i].checked=0);
			   }
			 }
		 }
		 
		 

		function resetAmount(){
			document.frmAnnualConvRegFinalize.totalAmount.value = document.frmAnnualConvRegFinalize.stTotal.value ;
		}

		function setTotalAmount(){
			var amt1 = document.getElementById("stTotal").value;
			var amt2 = document.getElementById("activityAmount").value;
			document.frmAnnualConvRegFinalize.totalAmount.value = (parseFloat(amt1) + parseFloat(amt2)).toFixed(2);
		}

		function clearAmtValues(){
			var priceLen = document.frmAnnualConvRegFinalize.priceIdLen.value;
			for (i=1;i<=priceLen;i++){		
				var noOfTkt = "noofticket"+i;
				var indivAmt = "indivAmt"+i;
				var calculAmt = "calculAmt"+i;
				var actCheckBox ="actCheckBox"+i;			
					if(document.getElementById(actCheckBox).checked==false){
						document.getElementById(noOfTkt).value=0;
						document.getElementById(indivAmt).value="0.00";
						document.getElementById(calculAmt).value="0.00";
					}
			}
		}

		function setAcAmount(ticketObj){
			var ticketObjName = "";
			var chkBoxName;
			
			var priceLen = document.frmAnnualConvRegFinalize.priceIdLen.value;
			for (i=1;i<=priceLen;i++){
				var noOfTkt = "noofticket"+i;
				var indivAmt = "indivAmt"+i;
				var calculAmt = "calculAmt"+i;
				var actCheckBox ="actCheckBox"+i;
				
				if(document.getElementById(actCheckBox).checked==true){
					var tkt = Number(document.getElementById(noOfTkt).value);
					var tktVal = Number(document.getElementById(indivAmt).value);
					var amt = (parseFloat(tkt)*parseFloat(tktVal)).toFixed(2);
					document.getElementById(calculAmt).value = amt;
					calculateAmount();
					setTotalAmount();
					//fillCalcAmt();
				}
				else{
					calculateAmount();	
					setTotalAmount();
				}
					clearAmtValues();
				/*
				else{
					document.getElementById(noOfTkt).value=0;
					document.getElementById(indivAmt).value="0.00";
					document.getElementById(calculAmt).value="0.00";
					calculateAmount();	
					setTotalAmount();				
				}*/
			}
		}

		function calculateAmount(){
			var priceLen = document.frmAnnualConvRegFinalize.priceIdLen.value;
			var amt=0;
			var tempAmt = 0;
			for (i=1;i<=priceLen;i++){
				var noOfTkt = "noofticket"+i;
				var indivAmt = "indivAmt"+i;
				var calculAmt = "calculAmt"+i;
				var actCheckBox ="actCheckBox"+i;
				
				if(document.getElementById(actCheckBox).checked==true){
					//amt = Number(amt) + Number(document.getElementById(indivAmt).value);
					var tkts = Number(document.getElementById(noOfTkt).value);
					var indAmt = Number(document.getElementById(indivAmt).value);
					tempAmt = Number((parseFloat(tkts)*parseFloat(indAmt)).toFixed(2)).toFixed(2);
					amt = Number(amt) + Number(tempAmt);
					document.frmAnnualConvRegFinalize.activityAmount.value = amt;
					document.getElementById(calculAmt).value = tempAmt;
				}
			}
			document.frmAnnualConvRegFinalize.activityAmount.value = Number(amt).toFixed(2);		
			setTotalAmount();	

		}



var httpRequest;
var gindivAmt;
var gcalculAmt;
var gtransId;
var gpriceId;
var gamtBx;
var gnoOfTkt;
	function getActivityAmount(param,paramthis,paramname){
					var  url = null;
				
					var memId = document.frmAnnualConvRegFinalize.memberShipTypeID.value;
					   
			 		url = "annualAjax.html?method=calcAmount&userTypeId="+escape(memId)+"&specId="+escape(param);

					if(paramthis.checked==true){
						if (window.ActiveXObject){ 
							httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
						} 
						else if (window.XMLHttpRequest){ 
							httpRequest = new XMLHttpRequest(); 
						}
						
						gindivAmt = "";
						gcalculAmt = "";
						gPriceId = "";
						gtransId = "";
						gamtBx = "";
						gpriceId="";
						
						gindivAmt = "indivAmt"+paramname;
						gcalculAmt = "calculAmt"+paramname;
						gtransId = "trans"+paramname;
						gpriceId = "priceId"+paramname;
						gnoOfTkt = "noofticket"+paramname;
						
						httpRequest.onreadystatechange = setOtherAmountonName;
						httpRequest.open("GET", url, true);
						httpRequest.send(null);
						
					}
					else{					
						/*document.getElementById(gindivAmt).value = "0.00";
						document.getElementById(gcalculAmt).value = "0.00";
						document.getElementById(gnoOfTkt).value = 0;
						calculateAmount();*/
					}
					setAcAmount(gnoOfTkt);
					setTotalAmount();
				   } 

		function setOtherAmountonName(){
		
			if(httpRequest.readyState==1){
				return;
			}
			if (httpRequest.readyState == 4){
				if(httpRequest.status == 200){
					var xmlDoc = httpRequest.responseXML;
					var priceVal = xmlDoc.getElementsByTagName('priceId')[0].childNodes[0].nodeValue;
					var regAmnt = xmlDoc.getElementsByTagName('amount')[0].childNodes[0].nodeValue;	
					if(priceVal==null && regAmnt==0){
						amntObj = 0.0;
						priceVal = "";
					}
					else{
						amntObj = eval(regAmnt).toFixed(2);
						priceIdField = priceVal;
					}
					document.getElementById(gindivAmt).value = amntObj;
					document.getElementById(gpriceId).value = priceIdField;
					document.getElementById(gnoOfTkt).value = 1;
					calculateAmount();
				}
				if(httpRequest.status==500) {
					amntObj.value="";
					return; 
				}
			}
			else{
			//alert("Error loading page\n");
			}
		}				
				  
		function denyBack(){
			window.history.clear();
			window.history.forward(1);
		}
				  
</script>

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
						
									  <%
									 String sessionInvoiceId = "1";
                                                                           session.setAttribute("sessionInvoiceId", sessionInvoiceId);		
                                                                          double totalAmount = 0.00d;
										BigDecimal rAmt = null;
										
									  	HLCAnnualMeetingStore regList = (HLCAnnualMeetingStore)session.getAttribute("regList");
										if(regList!=null){
										Enumeration e = regList.getEnumeration();
										while(e.hasMoreElements()){
											HLCAnnualUserVO tempObjAnnualUser = (HLCAnnualUserVO)e.nextElement();
											String delUserId = tempObjAnnualUser.getUserId();
											//String firstName = tempObjAnnualUser.getFirstName();
											String badgeName = tempObjAnnualUser.getBadgeInfo();
											double regAmount = tempObjAnnualUser.getRegAmount();
											double otherAmount = tempObjAnnualUser.getOtherActAmount();
											totalAmount +=(regAmount+otherAmount);
											
											String tempTotalAmount = String.valueOf(totalAmount);
											
											rAmt = new BigDecimal(Float.parseFloat(tempTotalAmount));
											rAmt = rAmt.setScale(2, BigDecimal.ROUND_HALF_UP);
											
											String memberType = tempObjAnnualUser.getMemberTypeName();
									  %>
									<%
									}
									}
									%>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmAnnualConvRegFinalize" id="frmAnnualConvRegFinalize" method="post" action="AnnRegPayment.html" onsubmit="return onPayCheck();">
							
                               <input type="hidden" name="annProcess" value="saveAnnualDetail"/>
							   
							   <p>Fields marked with an asterisk <span style="color:#FF0000;">*</span> are required.</p>
							   
							    <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Information</label>
								</div>
								

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Do you want any additional tickets?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="radio" size="10" name="rself" value="yes" onclick="switchDiv('member');checkAll();resetAmount();clearBasicLists();" />Yes 
								<input type="radio" size="10" name="rself" value="no" checked="checked" onclick="showHideRadio('rself','member','web');resetAmount();checkAll();clearBasicLists()" />No
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								
								<div id="member">
									<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ticket Information</label>
								</div>
								
								<%
							  				Vector otherType = (Vector)request.getAttribute("OTHER_ACTIVITY");
										  //out.print(regType.size());
										  String priceIdLen = "0";
										  
										  if(otherType!=null){
										  	priceIdLen = String.valueOf(otherType.size());
										  }
										  
											String memberShipTypeID = (String)request.getAttribute("memberShipTypeID");
											if(memberShipTypeID==null)
											memberShipTypeID = "";
											 
										  %>
										 
									   
									   <input id="priceIdLen" type="hidden" name="priceIdLen" value="<%=priceIdLen%>" />
										<input type="hidden" name="memberShipTypeID" value="<%=memberShipTypeID%>" />
									   
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Addtional Tickets Registered for:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select id="addTktRegistrarName" name="addTktRegistrarName" class="textboxOne" onchange="clearTkts();">
												<option value="">Select One</option>
												<%
													if(sessRegList!=null){
													Enumeration e = regList.getEnumeration();
													while(e.hasMoreElements()){
														HLCAnnualUserVO tempObjAnnualUser = (HLCAnnualUserVO)e.nextElement();
														String firstName = tempObjAnnualUser.getFirstName();
														String lastName = tempObjAnnualUser.getLastName();
														String uId = tempObjAnnualUser.getUserId();
														out.println("UserId:" + tempObjAnnualUser.getUserId());
											%>
													<option value="<%=uId%>"><%=firstName%>&nbsp;<%=lastName%></option>
													<%
													}
													}
													%>
												</select>

                                            </div>
                                        </div>

                                    </div>
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
									  <input name="noofticket<%=txtCount%>" id="noofticket<%=txtCount%>" value="" maxlength="4" class="form-control"  onblur="setAcAmount(this);"/>
									  </div>
									  
									  <input type="hidden" name="actVal<%=txtCount%>"  value="<%=s[1]%>">
									
									<div class='col-md-2'>
										<input type="hidden" name="priceId<%=txtCount%>" id = "priceId<%=txtCount%>" value="" />
									  <input name="indivAmt<%=txtCount%>" class="form-control" id="indivAmt<%=txtCount%>" readonly  value="0.00" />									
									</div>
									
									<div class='col-md-2'>
									<input name="calculAmt<%=txtCount%>" class="form-control" id="calculAmt<%=txtCount%>" readonly="readonly"  value="0.00" />
									</div>
									
								</div>
							</div>
							
							<%} }%> 
							
							
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>  Other Activity Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             $<input type="text" name="activityAmount" id="activityAmount" class="form-control" value="0.00"   readonly="true" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
							
							</div>
							
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             $<input type="text" id="stTotal" name="stTotal" readonly="true" class="form-control"  value="<%=rAmt%>" />
											 	<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
									
									
							
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Information</label>
								</div>
								
								 
								 <div class='form-group'>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             $<input type="text" name="totalAmount" readonly="true" class="form-control"  value="<%=rAmt%>" />
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								 <%if(session.getAttribute("loggedBy")!=null){%>
								 
								 <div class='form-group'>
								 	<div class='col-md-offset-2'>
									<input type="radio" size="10" name="r11" id="r11" value="check"  onclick="switchDiv('chkEncAcm'), showHideRadio('r11','chrgCrdAcm','check'), cardClear(),hideImgDiv('cvvImg');"/> Check enclosed.				
									 	
									 <input type="radio" size="10" name="r11" id="r11" value="card" checked="checked" onclick="switchDiv('chrgCrdAcm'), showHideRadio('r11','chkEncAcm','card'), checkClear(),showImgDiv('cvvImg');"  /> Please charge my card.	
									</div>
								 </div>
								 
								  <input type="hidden" name="c11" id="c11" value="adminSec">
									  <%}else{%>
								 
								 <div class='form-group'>
								 	<div class='col-md-offset-2'>
									<input type="radio" size="10" name="r11" id="r11" value="card" checked="checked" onclick="switchDiv('chrgCrdAcm'),showImgDiv('cvvImg');"  /> Please charge my card.				
									</div>
								</div>
								
									<input type="hidden" name="c11" id="c11" value="userSec">	  
									  <%}%>
							
							
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
                                             $ <input type="hidden" name="roughVal" value="yes">
											<input type="text" name="chkAmt" id="chkAmt" class="form-control"  />&nbsp; U.S. Dollars
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
                                            <select name="ccType" id="ccType" class="selectboxOne">
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
									
									<%if(session.getAttribute("loggedBy")!=null){%>	
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" name="ccCvvid" id="ccCvvid" class="form-control" />&nbsp;(see details below)
                                            </div>
                                        </div>

                                    </div>
									
									<%}else{%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" name="ccCvvid" id="ccCvvid" class="form-control" />&nbsp;(see details below)
											
                                            </div>
                                        </div>

                                    </div>
									
									<%}%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" name="ccName" id="ccName" class="form-control" size="25" />
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

<script language="javascript">
	var cal1 = new calendar2(document.forms['frmAnnualConvRegFinalize'].elements['checkDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
</script>

</html>



  
									
						 
						  
							  
								
								
								
						
	  
	  
	 
