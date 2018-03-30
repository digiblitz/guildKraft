<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.hlcaccounts.util.HLCAccTransactionVO"%>
<%@ page import="com.hlcform.util.*"%>
<%@ page import="com.hlcform.util.HLCPaymentDetailVO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/frmTransAdmin.js" type="text/javascript"></script>
<%! 
SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
String dateCheck(Date fieldName){
	String detValue = "N/A";
		if(fieldName!=null){
		 detValue = sdf.format(fieldName);
		}
	return detValue;
}
%>

<%! 				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
					String dateFormat(String fieldName){					
						Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}
						
						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
					}
					%>

</head>


<body onload="searchSec()">

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
                            <h2>Membership: Transaction Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				
				 <p>Fill in the following information.</p>
 
		  <form  class='form-horizontal' role='form'name="frmTransacDet" id="frmTransacDet" method="post" action="MemberRegiList.html" onSubmit="sumUp(); return myvalidate();">		<!--return myvalidate();-->
			
				 <% 
				 boolean rev_status = false; 
				 HLCPaymentDetails objPayment = (HLCPaymentDetails) request.getAttribute("objPayment");
				 ArrayList subTransac = (ArrayList) request.getAttribute("subTransac");
	
				float totAmt = 0.0f;
				float paidAmt = 0.0f;
				float initAmtPaid = 0.0f;
				float totSubPay = 0.0f;
				ArrayList itrAmount = new ArrayList();
				ArrayList chkDet = new ArrayList();
				
				String firstNme = (String) request.getAttribute("fnme");
				String lastNme = (String) request.getAttribute("lnme");	
				String memberId = (String) request.getAttribute("mid");			                                
				if(firstNme==null){
					firstNme = "";
				}
				if(lastNme == null){
					lastNme = "";
				}
				if(memberId == null){
					memberId = "";
				}				
				if(subTransac!=null){
					Iterator itr = subTransac.iterator();
					while(itr.hasNext()){
							HLCPaymentDetails subObjPay = (HLCPaymentDetails) itr.next();
							float chkAmt = subObjPay.getCheckAmount();
							double actAmt = subObjPay.getAmount();
							float pendAmt = subObjPay.getPendingAmount();
							String payMode = subObjPay.getPaymentStatus();
							String bankName = subObjPay.getBankName();
							String nmeOnChk = subObjPay.getCheckName();
							String chkNo = subObjPay.getCheckNumber();
							Date chkDte = subObjPay.getCheckDate();
							boolean nsfStatus = subObjPay.isNsf_charge_status();
							if(payMode.equalsIgnoreCase("check")){
								if(actAmt>0){
									if(chkAmt>actAmt){
										totSubPay += actAmt;
									}
									else{
										totSubPay += chkAmt;
									}
									String newEntry = chkAmt+"#"+subObjPay.getPaymentStatus()+"#"+payMode+"#"+chkNo+"#"+nmeOnChk+"#"+chkDte+"#"+bankName;
									itrAmount.add(String.valueOf(newEntry));
								}
							}
							else{
									String tmp = String.valueOf(actAmt);
									totSubPay += Float.parseFloat(tmp);
									String newEntry = actAmt+"#"+subObjPay.getCcType()+"#"+payMode;
									itrAmount.add(String.valueOf(newEntry));
							}
						}
				}
				if(objPayment != null){
					 double actualAmt = objPayment.getAmount();
					 float chkAmt = objPayment.getCheckAmount();
					 float pendAmt = objPayment.getPendingAmount();
					 String payModde = objPayment.getPaymentStatus();
					 initAmtPaid = Float.parseFloat(String.valueOf(actualAmt))-(totSubPay+pendAmt);
				 %>
				 
				 
				 		<div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Name</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=firstNme%> <%=lastNme%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=memberId%></label>
											</div>
										</div>
									</div>
				 
				
				
							 <label class='control-label label1'>History Of Payment</label>
				 
				 			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Actual Amount To Pay</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=actualAmt%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Pending Amount to be paid</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=pendAmt%></label>
											</div>
										</div>
									</div>
								</div>
					
				 <%
				 HLCPaymentDetailVO bounceDet = (HLCPaymentDetailVO) request.getAttribute("bounceDet");
				 if(bounceDet!=null && bounceDet.getNsfDate()!=null){
					float NFScheckAmt = bounceDet.getCheckAmount();
					String NFScheckNo = bounceDet.getCheckNumber();
					String NFSpayMode = bounceDet.getPaymentStatus();
					String NFScheckNme = bounceDet.getCheckName();
					Date NFScheckDte = bounceDet.getCheckDate();
					String NFSbankNme = bounceDet.getBankName();
	                float NFSpendingAmt = bounceDet.getPendingAmount();
                	String NFSPayId = bounceDet.getPaymentId();
                	String NFSParentPayId = bounceDet.getParentPaymentId();					
					Date NFSDte = bounceDet.getNsfDate();  
					rev_status = bounceDet.isReverse_entry_status();
				 %>				 
				 
				 
				  <label class='control-label label1'>NSF Check Details</label>
					
						<div class="form-group">
							
							<div class="row">
							
								<div class="col-md-12 gp">
								
									<div class="col-md-2">
										
										<label class='control-label label1'>Check Number</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Check Amount</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Check Date</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Name On Check</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Bank name</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>NSF Date</label>
									
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							
							<div class="row">
							
								<div class="col-md-12 gp">
								
									<div class="col-md-2">
										
										<label class='control-label '><%=NFScheckNo%></label>
									
									</div>
									
						
						
							 <%
							 if(NFSParentPayId!=null){
								 %>
										 <div class="col-md-2">
										 
										 	<label class="control-label"><%=NFScheckAmt%></label>
											
										</div>
								 <input name="NSFAmt" type="hidden" value="<%=NFScheckAmt%>" />
								 <%}
							 else{
								 %>
								 		<div class="col-md-2">
										 
										 	<label class="control-label"><%=NFSpendingAmt%></label>
											
										</div>
								 <input name="NSFAmt" type="hidden" value="<%=NFSpendingAmt%>" />
								 <%
							 }
							 %>		
							 			<div class="col-md-2">
										 
										 	<label class="control-label"><%=dateFormat(NFScheckDte.toString())%></label>
											
										</div>
										<div class="col-md-2">
										 
										 	<label class="control-label"><%=NFScheckNme%></label>
											
										</div>
										<div class="col-md-2">
										 
										 	<label class="control-label"><%=NFSbankNme%></label>
											
										</div>
										<div class="col-md-2">
										 
										 	<label class="control-label"><%=dateCheck(NFSDte)%></label>
											
										</div>
							 
										 <input type="hidden" name="NSFPayId" value="<%=NFSPayId%>" />
									</div>
								</div>
							</div>
							 	
				 <%
				 }else{
				 %>		
	 				 <input name="NSFAmt" type="hidden" value="0" />
				 <% 
				 } 
				 %>			
				 
				 		<div class="form-group">
							
							<div class="row">
							
								<div class="col-md-12 gp">
								
									<div class="col-md-2">
										
										<label class='control-label label1'>Payment Iteration</label>
									
									</div>
									
									<div class="col-md-1">
										
										<label class='control-label label1'>Amount Paid</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Payment Mode</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Check Number</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Name On Check</label>
									
									</div>
									
									<div class="col-md-1">
										
										<label class='control-label label1'>Check Date</label>
									
									</div>
									<div class="col-md-2">
										
										<label class='control-label label1'>Bank Name</label>
									
									</div>
								</div>
							</div>
						</div>	 
				
						<div class="form-group">
							
							<div class="row">
							
								<div class="col-md-12 gp">
								
									<div class="col-md-2">
										
										<label class='control-label'>Initial Paid Amt</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label'><%=initAmtPaid%></label>
									
									</div>
                             
						
							<% if(payModde.equalsIgnoreCase("check")){
							%>
							
									<div class="col-md-2">
										
										<label class='control-label'><%=objPayment.getPaymentStatus()%></label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label'><%=objPayment.getCheckNumber()%></label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label'><%=objPayment.getCheckName()%></label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label'><%=dateFormat(objPayment.getCheckDate().toString())%></label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label'><%=objPayment.getBankName()%></label>
									
									</div>
							
							<%}
							else{
							%>
									
									<div class="col-md-2">
										
										<label class='control-label'><%=initAmtPaid%></label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label'><%=objPayment.getPaymentStatus()%></label>
									
									</div>
									
									<div class="col-md-2">
										
									</div>
									
									<div class="col-md-2">
									
									</div>
									
									<div class="col-md-2">
																			
									</div>
							
													
							<% } %>
									</div>
								</div>
							</div>
						
						<%
						if(itrAmount!=null){
								if(itrAmount.size()>0){
								int j=1;
								Iterator itr = itrAmount.iterator();
									while(itr.hasNext()){
								%>
								
								
								<div class="form-group">
							
									<div class="row">
							
										<div class="col-md-12 gp">
								
											<div class="col-md-2">
										
												<label class='control-label'></label>
									
											</div>
									
										
									<%
											String val  = (String) itr.next();	
											String[] val_mode = val.split("#");
											if(val_mode[2].equalsIgnoreCase("check")){
									%>
												
											<div class="col-md-2">
										
												<label class='control-label'><%=val_mode[0]%></label>
									
											</div>
											<div class="col-md-2">
										
												<label class='control-label'><%=val_mode[2]%></label>
									
											</div>
											<div class="col-md-2">
										
												<label class='control-label'><%=val_mode[3]%></label>
									
											</div>
											<div class="col-md-2">
										
												<label class='control-label'><%=val_mode[4]%></label>
									
											</div>
											<div class="col-md-2">
										
												<label class='control-label'><%=dateFormat(val_mode[5])%></label>
									
											</div>
											<div class="col-md-2">
										
												<label class='control-label'><%=val_mode[6]%></label>
									
											</div>
											
													
									<%}
									else{ %>
												
												<div class="col-md-2">
										
													<label class='control-label'><%=val_mode[0]%></label>
									
												</div>
												<div class="col-md-2">
										
													<label class='control-label'><%=val_mode[2]%></label>
									
												</div>
												<div class="col-md-2">
																			
												</div>
												<div class="col-md-2">
										
												</div>
												<div class="col-md-2">
									
												</div>
												<div class="col-md-2">
									
												</div>
												
													  
									<%}
									j++;
									%>
											</div>
										</div>
									</div>
									
								<%	}
								%>
								<%}
							}
						 %>
					
					 <input type="hidden" name="amount" id="amount" value="<%=actualAmt%>" />
					 <%
				 }
				 %>			
										
						<div class="form-group">
							
							<div class="row">
							
								<div class="col-md-12 gp">
								
									<div class="col-md-2">
										
										<label class='control-label label1'>Item Name</label>
									
									</div>
									
									<div class="col-md-1">
										
										<label class='control-label label1'>Amount</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Reconcile Amount</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Sub Payment</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Transaction Mode</label>
									
									</div>
									
									<div class="col-md-2">
										
										<label class='control-label label1'>Payment Mode</label>
									
									</div>
									<div class="col-md-1">
										
										<label class='control-label label1'>NSF</label>
									
									</div>
								</div>
							</div>
						</div>	 
			 

			  
				<% int reconCount = 1;
					int recon =0;
					ArrayList entryList = (ArrayList)request.getAttribute("transacEntries");
					System.out.print("Inside entryList  "+entryList.size());
					if(entryList!=null){
					if(entryList.size()>0){
					System.out.print("Inside entryList");
						Iterator itr = entryList.iterator();
						int indx =0;
						int listSize = entryList.size();;
						String amtName;
						String payType; 
						String ccType; 
						String transId;
						String actualAmount;
						String revBox;
						String revamtName;
				%>
						
						<input type="hidden" value="<%=listSize%>" name="listSz" />
						<input type="hidden" value="1" name="count"> 
						
				<%		while(itr.hasNext()){
							HLCAccTransactionVO accTxnVO = (HLCAccTransactionVO) itr.next();
							
							String accType = accTxnVO.getAccount_type();
							String accNo = accTxnVO.getAccount_no();
							String subaccNo = accTxnVO.getSub_account_no();
							String accDesc = accTxnVO.getDescription();
							String accClassType = accTxnVO.getClass_Typ();
							int accQty = accTxnVO.getQuantity();
							float accAmt = accTxnVO.getAmount();
							Date accTransDte = accTxnVO.getTransaction_date();
							Date accSynDte = accTxnVO.getSync_date();
							boolean accSyncStat = accTxnVO.isSync_status();
							String accUserId = accTxnVO.getUser_id();
							boolean activeStat = accTxnVO.isActive_status();
							String accItemNo = accTxnVO.getItem_no();
							String accPayMode = accTxnVO.getPayment_mode();
							float accReconcileAmt = accTxnVO.getReconcile_amount();
							String accTransMode = accTxnVO.getTransaction_mode();
							boolean accReconcileStat = accTxnVO.isReconcile_status();
							String accTransId = accTxnVO.getTransaction_id();	
							amtName = "amtName"+indx;
							payType = "payType"+indx;
							ccType = "ccType"+indx;
							transId = "transId"+indx;
							revamtName = "revamtName"+indx;
							revBox = "revBox"+indx;							
							actualAmount = "actualAmount"+indx;
							String divValue = accDesc+"#"+accTransId+"#"+(indx+1);
							String revEntry = accType+"#"+accNo+"#"+subaccNo+"#"+accDesc+"#"+accClassType+"#"+accQty+"#"+accAmt+"#"+accUserId+"#"+accItemNo+"#"+accPayMode+"#"+accReconcileAmt+"#"+accTransMode+"#"+accTransId+"#"+objPayment.getPaymentId()+"#"+objPayment.getUserId();
							indx++;
					%>	
				
				<input type="hidden" name="transacId" value="<%=accTransId%>" />
				<input type="hidden" name="memRegiListProcess" value="adminEntry" />
				<input type="hidden" name="checkAmt" value="<%=objPayment.getCheckAmount()%>" />
				<input type="hidden" name="<%=actualAmount%>" id="<%=actualAmount%>" value="<%=accAmt%>" />
				
				
						<div class="form-group">
							
							<div class="row">
							
								<div class="col-md-12 gp">
								
									<div class="col-md-2">
										
										<label class='control-label '><%=accDesc%></label>
									
									</div>
									<div class="col-md-2">
										
										<label class='control-label '><%=accAmt%></label>
									
									</div>
				  			
					<%
					if(accAmt<0){
					%>
									<div class="col-md-2">
										
										<input name="<%=amtName%>" type="text" id="<%=amtName%>" value="<%=accReconcileAmt%>" class="form-control"  disabled="disabled" />
									
									</div>
					
					<% 
					}
					else{
						if(accDesc.equalsIgnoreCase("Over Payment")){					
						%>			
									<div class="col-md-2">
										
										<input name="<%=amtName%>" type="text" id="<%=amtName%>" value="0" class="form-control"  onblur="sumUp();" disabled="disabled"/>
									
									</div>

						<%
						}
						else{
						%>			
									<div class="col-md-2">
										
										<input name="<%=amtName%>" type="text" id="<%=amtName%>" value="<%=accReconcileAmt%>" class="form-control"  onblur="sumUp();"/>
										<input name="<%=revamtName%>" type="hidden" id="<%=revamtName%>" value="<%=accReconcileAmt%>" class="form-control"  onblur="sumUp();"/>
									</div>
																
						<%}
					}
					if(accReconcileAmt==0 || accAmt<=0){
					%>
					
									<div class="col-md-2">
										
										<input type="checkbox" value="snoVal" name="div<%=indx%>" id="div<%=indx%>" onclick="addRow('<%=divValue%>');" disabled="disabled"/>
									
									</div>
					
					<%}
					else if (accTxnVO.isCheckStatus()==true){
					%>
									
									<div class="col-md-2">
										
										<input type="checkbox" value="noVal" name="div<%=indx%>" id="div<%=indx%>" onclick="addRow('<%=divValue%>');" />
									
									</div>
					
					<% }
					else{ %>
									
									<div class="col-md-2">
										
										<input type="checkbox" value="snoVal" name="div<%=indx%>" id="div<%=indx%>" onclick="addRow('<%=divValue%>');" disabled="disabled"/>
									
									</div>
					                            
					<% } 
                    %>
									<div class="col-md-2">
					
										<select name="<%=payType%>" id="<%=amtName%>" class="form-control">
										<%
										if(accAmt<0){
										%>
										
										<option  selected="selected" value="Accept as Full" >Accept as Full</option>
										<%}
										else if(accDesc.equalsIgnoreCase("Over Payment")){
										%>
										<option  selected="selected" value="Accept as Full" >Accept as Full</option>
										<%
										}
										else if(accTransMode==null || accTransMode.trim().length()==0){%>
											<option selected="selected" value="" >Select One</option>
											<option value="Partial Payment">Partial Payment</option>
											<option value="Accept as Full">Accept as Full</option>
											<option value="Void">Void</option>						
										<% }
										else{
											if(accTransMode.equalsIgnoreCase("Partial Payment")){
											%>						
												<option value=""  selected="selected">Select One</option>
												<option  selected="selected" value="Partial Payment">Partial Payment</option>
												<option value="Accept as Full">Accept as Full</option>
												<option value="Void">Void</option>
											<% } 
											else if (accTransMode.equalsIgnoreCase("Accept as Full")){ %>
												<option value="">Select One</option>
												<option value="Partial Payment">Partial Payment</option>
												<option  selected="selected" value="Accept as Full">Accept as Full</option>
												<option value="Void">Void</option>
											<% } 
											else {
											%>
												<option value="" >Select One</option>
												<option value="Partial Payment">Partial Payment</option>
												<option value="Accept as Full">Accept as Full</option>
												<option selected="selected" value="Void">Void</option>
											<%}
										} %>
										</select>	
									</div>				
									
											<div class="col-md-2">
					
												<select name="<%=ccType%>" id="<%=ccType%>" class="form-control" >
						
												<%
												if(accReconcileAmt!=0){
												if(accPayMode==null){
												%>
												  <option selected="selected" value="">Select One</option>
												  <option value="Check">Check</option>
												  <option value="Visa">Visa</option>
												  <option value="MasterCard">Master Card</option>					
												  <option value="American Express">AmEx</option>						
												<%
												}
												else{
													if(accPayMode.equalsIgnoreCase("check")){
													%>
													  <option  value="">Select One</option>
													  <option selected="selected" value="Check">Check</option>
													  <option value="Visa">Visa</option>
													  <option value="MasterCard">Master Card</option>					
													  <option value="American Express">AmEx</option>
													  <%
													  }
													  else if(accPayMode.equalsIgnoreCase("Visa")){
													  %>
													  <option value="">Select One</option>
													  <option value="Check">Check</option>
													  <option selected="selected" value="Visa">Visa</option>
													  <option value="MasterCard">Master Card</option>					
													  <option value="American Express">AmEx</option>
													  <%
													  }
													  else if(accPayMode.equalsIgnoreCase("MasterCard")){
													  %>
													  <option value="">Select One</option>
													  <option value="Check">Check</option>
													  <option value="Visa">Visa</option>
													  <option selected="selected" value="MasterCard">Master Card</option>					
													  <option value="American Express">AmEx</option>
													  <%
													  }
													  else{
													  %>
													  <option value="">Select One</option>
													  <option value="Check">Check</option>
													  <option value="Visa">Visa</option>
													  <option value="MasterCard">Master Card</option>					
													  <option selected="selected" value="American Express">AmEx</option>
													 <% }
													 }
													}
													else if(accAmt<0){
														if(accPayMode!=null){
															if(accPayMode.equalsIgnoreCase("check")){
													%>
						
														  <option  value="">Select One</option>
														  <option selected="selected" value="Check">Check</option>
														  <option value="Visa">Visa</option>
														  <option value="MasterCard">Master Card</option>					
														  <option value="American Express">AmEx</option>
														  <%
														  }
														  else if(accPayMode.equalsIgnoreCase("Visa")){
														  %>
														  <option value="">Select One</option>
														  <option value="Check">Check</option>
														  <option selected="selected" value="Visa">Visa</option>
														  <option value="MasterCard">Master Card</option>					
														  <option value="American Express">AmEx</option>
														  <%
														  }
														  else if(accPayMode.equalsIgnoreCase("MasterCard")){
														  %>
														  <option value="">Select One</option>
														  <option value="Check">Check</option>
														  <option value="Visa">Visa</option>
														  <option selected="selected" value="MasterCard">Master Card</option>					
														  <option value="American Express">AmEx</option>
														  <%
														  }
														  else{
														  %>
														  <option value="">Select One</option>
														  <option value="Check">Check</option>
														  <option value="Visa">Visa</option>
														  <option value="MasterCard">Master Card</option>					
														  <option selected="selected" value="American Express">AmEx</option>
														 <% }								
														}
														else{
														%>
														  <option selected="selected" value="">Select One</option>
														  <option value="Check">Check</option>
														  <option value="Visa">Visa</option>
														  <option value="MasterCard">Master Card</option>					
														  <option value="American Express">AmEx</option>
														<%
														}								
													}
													else{ 
													if(accDesc.equalsIgnoreCase("Over Payment")){
													%>
													  <option value="">Select One</option>
													  <option selected="selected" value="Check">Check</option>
													  <option value="Visa">Visa</option>
													  <option value="MasterCard">Master Card</option>
													  <option value="American Express">AmEx</option>
													<%	
													}else{
													%> 
													  <option selected="selected" value="">Select One</option>
													  <option value="Check">Check</option>
													  <option value="Visa">Visa</option>
													  <option value="MasterCard">Master Card</option>					
													  <option value="American Express">AmEx</option>			
												  <% }
												  } %>							
												</select>					
											</div>
												
								<div class="col-md-2">
								
										<%
										if(rev_status==true){
										%>
											<input type="checkbox" name="<%=revBox%>" id="<%=revBox%>" disabled="disabled" />
										<%
										}
										else if(accSyncStat==true){
										%>
											<input type="checkbox" name="<%=revBox%>" id="<%=revBox%>" value="<%=revEntry%>" onclick="disableNSF();sumUpRev(<%=indx-1%>);" />
										<%
										}
										else{
										%>
											<input type="checkbox" name="<%=revBox%>" id="<%=revBox%>" disabled="disabled" />
										<%}
										%>					
										</div>
									</div>
								</div>
							</div>
				 
				  								<input type="hidden" name="<%=transId%>" value="<%=accTransId%>" />
				  
            			 <%       } }	}%>
				
				
				
				 <%
					boolean stat = true;
					ArrayList entryList1 = (ArrayList)request.getAttribute("transacEntries");
					if(entryList1!=null){
					if(entryList1.size()>0){
						Iterator itr1 = entryList1.iterator();				 
						while(itr1.hasNext()){
							HLCAccTransactionVO accTxnVO1 = (HLCAccTransactionVO) itr1.next();
							boolean accReconcileStat1 = accTxnVO1.isReconcile_status();
							if(accReconcileStat1 == false){
								stat = false;
								break;
							}
						}	

					}
					}
					if(entryList1!=null){
					if(entryList1.size()>0){
					%>

							<div class="form-group">
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount Entered</label>
									 <div class='col-md-8'>
    	                                    <div class='col-md-3 indent-small'>
        	                                    <div class='form-group internal'>
						 						<input type="text" class="form-control" name="totalAmt" id="totalAmt" value="0" readonly  />
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount Reversed</label>
									 <div class='col-md-8'>
    	                                    <div class='col-md-3 indent-small'>
        	                                    <div class='form-group internal'>
													<input type="text" class="form-control" name="revAmt" id="revAmt" value="0" readonly  /> 
												</div>
											</div>
										</div>
									</div>
															 
					
						<div class="form-group">
						
								<%                 
									if(stat == true){
									%>
										  <div class='col-md-offset-4 col-md-1'>
										  
                                        		<button class='btn-lg btn-primary' type='submit' name="submit" id="totsubmit" value="Submit" disabled="disabled">Submit</button>
												
											</div>

								
							
						<% }
						else{
						%>
										
										    <div class='col-md-offset-4 col-md-1'>
											
                                        		<button class='btn-lg btn-primary' type='submit' name="submit" value="Submit" >Submit</button>
												
                                   			 </div>

										 
						<% }
						%>
						
											 <div class='col-md-2'>
											 
                                        		<button class='btn-lg btn-danger'type="button"  value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
												
                                   			 </div>
											 
											  <div class='col-md-2'>
											  
                                       			 <button class='btn-lg btn-primary' type="submit"  name="submit" id="NSFPay" value="NSFPay" disabled="disabled">NSFPay</button>
                                   			
											 </div>
							
										</div>
                                <% }
								
                                 else{%>
								 <div class='form-group'>
								
                                 <div class="container"> 
								   
									   <div class="row"> 
									   
											<div class='col-md-4'>
											</div>
											
											<div class='col-md-4'>
												No records are available 
											</div>
											
										</div>
										
									 </div>
								
								</div>
                                 <%
                                 }
								 }
				 %>
						
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
			


<!--script type="text/javascript">


function onValidateDate()
{
	
	if(document.frmUserSignup.frmDate.value==""){
		alert("Startdate cannot be empty");
		document.frmUserSignup.frmDate.focus();
		return false;
	}
	if(document.frmUserSignup.toDate.value==""){
		alert("Lastdate cannot be empty");
		document.frmUserSignup.toDate.focus();
		return false;
	}
	
	return true;
}
</script-->
</body>
</html>
