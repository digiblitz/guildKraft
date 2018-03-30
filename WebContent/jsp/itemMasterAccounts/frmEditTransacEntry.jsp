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
<%@ page import="java.sql.*"%>
<%@ page import="com.hlcaccounts.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmAdvIssue.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->

<script language="javascript">
//Validating
function chkValid(){
	if(document.frmTransactionEntry.transacName.value=="" || document.frmTransactionEntry.transacName.value.indexOf(' ')==0){
		alert('Transaction Name Cannot Be Empty');
		document.frmTransactionEntry.transacName.focus();
		return false;
	}
	if(document.frmTransactionEntry.transacAccNo.value.length>50){
		alert('Enter a valid Acccount Number');
		document.frmTransactionEntry.transacAccNo.focus();
		return false;
	}
	if(document.frmTransactionEntry.transacAccNo.selected == 0){
		alert('Select Any of the Acccount Number');
		document.frmTransactionEntry.transacAccNo.focus();
		return false;
	}	
	if(document.frmTransactionEntry.transacClass.value=="" || document.frmTransactionEntry.transacClass.value.indexOf(' ')==0){
		alert('Select Any of the Class');
		document.frmTransactionEntry.transacClass.focus();
		return false;
	}
	if(document.frmTransactionEntry.transacClass.selected == 0){
		alert('Select Any of the Class');
		document.frmTransactionEntry.transacClass.focus();
		return false;
	}		
}
//Fill Item Number 
function fillItemNo(value){
	if(value!= null && value!=""){
		splitstr = value.split('#');
		document.frmTransactionEntry.transacAccNo.value=splitstr[1];
	}
	else{
		document.frmTransactionEntry.transacAccNo.value="";
	}
}
</script>
<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style></head>


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
						 <h2> <strong>Membership:</strong> <span class="styleBoldTwo">Edit</span> <span class="styleBoldTwo">Transaction Type Master </span></h2>
						 </div>
						 
 					<!--==============================Form Title=================================-->

  						<div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
    	
								<!--==============================Form Description=================================-->

 						
  
			
							<!--==============================Form Body=================================-->
	<form name="frmTransactionEntry" class='form-horizontal' method="post" action="TransactDet.html" onsubmit="return chkValid();" onmousemove="enableCombo();"> <!-- onmousemove="fillValues();" -->
					<input type="hidden" name="process" value="updatetransac">		
	
			<p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
			
				 <%	String existStat = (String) request.getAttribute("existStat");
					if(existStat!=null)
					{
					if(existStat.equalsIgnoreCase("yes"))
						{%>	
					  <tr>
						  <td class="styleError" colspan="4">Transaction Name and the Item Number Already Exists !!</td>
					  </tr>
					<%	}	
						}	%>
						
						<%
				 	HLCAccTxnTypeDetailVO accTxnTypVO ;
					accTxnTypVO  = (HLCAccTxnTypeDetailVO) request.getAttribute("TransactionDet");
					
			String transId = accTxnTypVO.getTransaction_type_id();
			String transName = accTxnTypVO.getTransaction_name();
			String transType = accTxnTypVO.getTransaction_type();
			String transAccNo = accTxnTypVO.getAccount_no();
			String transsubAccNo  = accTxnTypVO.getSub_account_no();
			String transItemNo  = accTxnTypVO.getItem_no();
			String transClassNme = accTxnTypVO.getClass_name();
					%>	
					 
					 <div class='form-group'>
					<input type="hidden" name="transId" value="<%=transId%>">
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Name:</label>
				  <div class='col-md-8'>
                   		 <div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>	
								 <input name="transacName" type="text" class='form-control' id="transacName" maxlength="50" value="<%=transName%>"  />									
									 <span id="span_astriesk" class="asterisk" style="color:#FF0000;"> *</span></div>
								</div>
						</div>
						
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Type:</label>
						   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
							<select name="transacType" class='form-control' >
								<%
								if(transType.equalsIgnoreCase("Credit")){
								%>
								<option value="Credit" selected="selected">Credit</option>
								<option value="Debit">Debit</option>
								<%
								}else{
								%>
									<option value="Credit">Credit</option>
									<option value="Debit" selected="selected">Debit</option>								
								<% } %>
								</select>
				 	 <span class="asterisk" id="span_astriesk" style="color:#FF0000;">*</span></div>
					 </div>
				 </div>
				 
				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name:</label>
						   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
				    
							<%							
								String[] DBValue = transItemNo.split(":");
								String itemDBNo = null;
								
								if(DBValue.length>0){
									itemDBNo = DBValue[DBValue.length-1];
								}
								System.out.print("itemDBNO"+itemDBNo);	
								ArrayList HLCItemMaster = (ArrayList) request.getAttribute("itemMaster");
								System.out.print("HLCItemMaster.size() :"+HLCItemMaster.size());
								
								HLCItemMaster itemVO = new HLCItemMaster();
								//String parentAccountNo=null;
								if(HLCItemMaster!=null){
									if(HLCItemMaster.size()>0){
							%>
								<select name="transacItemNo" class='form-control' onchange="fillItemNo(this.value);"><!---->
								<option selected="selected" value="">Select One</option>
							<%			
								Iterator it = HLCItemMaster.iterator();
								while(it.hasNext()){
												itemVO=(HLCItemMaster)it.next();
												
												String itemNo = itemVO.getItemNo();	
												String accountNo = itemVO.getAccountNo();	
												String itemDesc = itemVO.getItemDesc();	
												String optVal = itemNo+"#"+accountNo;
												String optName = itemNo+"-"+itemDesc;
							
											if(itemDBNo.equalsIgnoreCase(itemNo)){
											%>
											<option value="<%=optVal%>" selected="selected"><%=optName%></option>
											<% }
											else{ %>
										<option value="<%=optVal%>"><%=optName%></option>
							<%				}
										}
							%>
								</select>&nbsp;							
							<%		}
								}
							%>	
				 	 <span class="asterisk" id="span_astriesk" style="color:#FF0000;">*</span></div>
					 </div>
				 </div>
						
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Account Number:</label>
				  <div class='col-md-8'>
                   		 <div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>	
								 <input name="transacAccNo" type="text" class='form-control' id="transacAccNo" maxlength="6" value="<%=transAccNo%>"  />								
									 <span id="span_astriesk" class="asterisk" style="color:#FF0000;"> *</span></div>
								</div>
						</div>
						
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Class:</label>
						   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
				    
							<%
								ArrayList classMaster = (ArrayList) request.getAttribute("classMaster");
								HLCClassDetailsVO classDet = new HLCClassDetailsVO();
								if(classMaster!=null){
									if(classMaster.size()>0){
							%>
								<select name="transacClass" class='form-control'>
								<option selected="selected" value="">Select One</option>		
							<%	
										Iterator it = classMaster.iterator();
										while(it.hasNext()){
												classDet=(HLCClassDetailsVO)it.next();	
												String classId = classDet.getClass_id();
												String className = classDet.getClass_name();
												String classParentName = classDet.getParent_class_name(); 
												if(transClassNme.equalsIgnoreCase(className)){
												%>
													<option value="<%=className%>" selected="selected"><%=className%></option>
												<% }
												else{%>
													<option value="<%=className%>"><%=className%></option>											
										<%			}
										}		%>
								</select>&nbsp;
							<%		}
								}
							%>								
									
				 	 <span class="asterisk" id="span_astriesk" style="color:#FF0000;">*</span></div>
					 </div>
				 </div>
				 						
				</div>
			  
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
									
                                        <button  type='submit' value='Update' class='btn-lg btn-primary'>Update</button>
									</div>
									<div class='col-md-2'>
                                        <button type='reset'  value='Cancel' onclick="window.location.href='./TransactDet.html?process=listAllTransac'" class='btn-lg btn-danger' style=''> Cancel</button>
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
