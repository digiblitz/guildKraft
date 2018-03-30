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
var httpRequest;
	function populateSubItem(val){
		if(val!="" && val.length!=0){
			//alert(document.frmItemMaster.servMasterNo.value);
		   //var servMasterNo=document.frmItemMaster.servMasterNo.value;
			
				url= "ItemMaster.html?process=subItemdisp&serviceName="+val; 
				
				if (window.ActiveXObject){ 
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
				} 
				else if (window.XMLHttpRequest){ 
					httpRequest = new XMLHttpRequest(); 
				}

				httpRequest.onreadystatechange =function(){
					if (httpRequest.readyState == 4) { // Complete
						if (httpRequest.status == 200) { // OK response

							var xmlDoc = httpRequest.responseXML.documentElement;
							var xRows= xmlDoc.getElementsByTagName('subList');
							var objDDL = document.getElementById('subItemNo');
							objDDL.innerHTML="";

							if(xRows.length==0){
								//setToDefault();
							}
						
							var rootObj =  document.createElement("option");
							var attrib = document.createAttribute("value");
							attrib.value="";
							rootObj.setAttributeNode(attrib);
							newtext=document.createTextNode('Select One');
							rootObj.appendChild(newtext);
							objDDL.appendChild(rootObj);
							//objDDL.add(rootObj,null);
							
							for (var i=0; i<xRows.length; i++) {
								var itemId = xRows[i].getElementsByTagName("itemId");
								var itemName = xRows[i].getElementsByTagName("serviceTypeName");
								var itemNumb = xRows[i].getElementsByTagName("itemNo");
								var parentitemNo = xRows[i].getElementsByTagName("parentItemNo");
								var itemDesc = xRows[i].getElementsByTagName("itemDesc");
								var accountNo = xRows[i].getElementsByTagName("accountNo");
								var theValue =null;
								var theText = null;
								
								if (itemName.length > 0 && itemName.length > 0) {
									theValue = itemNumb[0].firstChild.nodeValue;
									theText = itemDesc[0].firstChild.nodeValue;
								}
								
								var option = new Option( theValue + " - "+ theText,theValue,false,true);
								
								try {
									objDDL.add(option,null);
								}catch(e){
									objDDL.add(option,-1);
								}
							}
						} else {
							alert("Problem: " + httpRequest.statusText);
						}
				} 
				//httpRequest.send(null); 
		 }
		httpRequest.open("GET", url, true);
		httpRequest.send(null);
	}
	 else {
			document.getElementById('subItemNo').value =val;
			//setToDefault(relOpt, hrMemId);
		}
}

function setToDefault(){
	var currObj = document.getElementById('subItemNo');
	currObj.innerHTML="";
	var rootObj =  document.createElement("option");
	var attrib = document.createAttribute("value");
	attrib.value="";
	rootObj.setAttributeNode(attrib);
	newtext=document.createTextNode('Select One');
	rootObj.appendChild(newtext);
	currObj.appendChild(rootObj);
	//document.getElementById(hrMemId).value = "";
}

	function populateSelectedSubItem(val,parVal){
		if(val!="" && val.length!=0){
			//alert(document.frmItemMaster.servMasterNo.value);
		   //var servMasterNo=document.frmItemMaster.servMasterNo.value;
				url= "SubItemAjaxAction.do?process=subItemdisp&serviceName="+val; 
				
				if (window.ActiveXObject){ 
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
				} 
				else if (window.XMLHttpRequest){ 
					httpRequest = new XMLHttpRequest(); 
				}

				httpRequest.onreadystatechange =function(){
					if (httpRequest.readyState == 4) { // Complete
						if (httpRequest.status == 200) { // OK response

							var xmlDoc = httpRequest.responseXML.documentElement;
							var xRows= xmlDoc.getElementsByTagName('subList');
							var objDDL = document.getElementById('subItemNo');
							objDDL.innerHTML="";

							if(xRows.length==0){
								//setToDefault();
							}
						
							var rootObj =  document.createElement("option");
							var attrib = document.createAttribute("value");
							attrib.value="";
							rootObj.setAttributeNode(attrib);
							newtext=document.createTextNode('Select One');
							rootObj.appendChild(newtext);
							objDDL.appendChild(rootObj);
							//objDDL.add(rootObj,null);
							
							for (var i=0; i<xRows.length; i++) {
								var itemId = xRows[i].getElementsByTagName("itemId");
								var itemName = xRows[i].getElementsByTagName("serviceTypeName");
								var itemNumb = xRows[i].getElementsByTagName("itemNo");
								var parentitemNo = xRows[i].getElementsByTagName("parentItemNo");
								var itemDesc = xRows[i].getElementsByTagName("itemDesc");
								var accountNo = xRows[i].getElementsByTagName("accountNo");
								var theValue =null;
								var theText = null;
								var theparentNo = null;
								if (itemName.length > 0 && itemName.length > 0) {
									theValue = itemNumb[0].firstChild.nodeValue;
									theText = itemDesc[0].firstChild.nodeValue;
									theparentNo = parentitemNo[0].firstChild.nodeValue;
								}
								if(parVal==theValue){
									var option = new Option( theValue + " - "+ theText,theValue,false,true);
								}
								else{
									var option = new Option( theValue + " - "+ theText,theValue);
								}
								try {
									objDDL.add(option,null);
								}catch(e){
									objDDL.add(option,-1);
								}
							}
						} else {
							alert("Problem: " + httpRequest.statusText);
						}
				} 
		 }
		httpRequest.open("GET", url, true);
		httpRequest.send(null);
	}
	 else {
			document.getElementById('subItemNo').value =val;
			//setToDefault(relOpt, hrMemId);
		}
}


//Validating
function fillValues(){
	var servMasterNo=document.frmItemMaster.servMasterNo.value;
	var parVal = document.frmItemMaster.parentItemNoVO.value;
	populateSelectedSubItem(servMasterNo,parVal);
	var tempValue = document.frmItemMaster.subItemNo.value;
	//setToSelected(tempValue);
}
</script>

<script language="javascript">
var httpRequest;
	function populateSubItem(val){
		if(val!="" && val.length!=0){
			//alert(document.frmItemMaster.servMasterNo.value);
		   //var servMasterNo=document.frmItemMaster.servMasterNo.value;
			
				url= "ItemMaster.html?process=subItemdisp&serviceName="+val; 
				
				if (window.ActiveXObject){ 
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
				} 
				else if (window.XMLHttpRequest){ 
					httpRequest = new XMLHttpRequest(); 
				}

				httpRequest.onreadystatechange =function(){
					if (httpRequest.readyState == 4) { // Complete
						if (httpRequest.status == 200) { // OK response

							var xmlDoc = httpRequest.responseXML.documentElement;
							var xRows= xmlDoc.getElementsByTagName('subList');
							var objDDL = document.getElementById('subItemNo');
							objDDL.innerHTML="";

							if(xRows.length==0){
								//setToDefault();
							}
						
							var rootObj =  document.createElement("option");
							var attrib = document.createAttribute("value");
							attrib.value="";
							rootObj.setAttributeNode(attrib);
							newtext=document.createTextNode('Select One');
							rootObj.appendChild(newtext);
							objDDL.appendChild(rootObj);
							//objDDL.add(rootObj,null);
							
							for (var i=0; i<xRows.length; i++) {
								var itemId = xRows[i].getElementsByTagName("itemId");
								var itemName = xRows[i].getElementsByTagName("serviceTypeName");
								var itemNumb = xRows[i].getElementsByTagName("itemNo");
								var parentitemNo = xRows[i].getElementsByTagName("parentItemNo");
								var itemDesc = xRows[i].getElementsByTagName("itemDesc");
								var accountNo = xRows[i].getElementsByTagName("accountNo");
								var theValue =null;
								var theText = null;
								
								if (itemName.length > 0 && itemName.length > 0) {
									theValue = itemNumb[0].firstChild.nodeValue;
									theText = itemDesc[0].firstChild.nodeValue;
								}
								
								var option = new Option( theValue + " - "+ theText,theValue);
								
								try {
									objDDL.add(option,null);
								}catch(e){
									objDDL.add(option,-1);
								}
							}
						} else {
							alert("Problem: " + httpRequest.statusText);
						}
				} 
				//httpRequest.send(null); 
		 }
		httpRequest.open("GET", url, true);
		httpRequest.send(null);
	}
	 else {
			document.getElementById('subItemNo').value =val;
			//setToDefault(relOpt, hrMemId);
		}
}

function setToDefault(){
	var currObj = document.getElementById('subItemNo');
	currObj.innerHTML="";
	var rootObj =  document.createElement("option");
	var attrib = document.createAttribute("value");
	attrib.value="";
	rootObj.setAttributeNode(attrib);
	newtext=document.createTextNode('Select One');
	rootObj.appendChild(newtext);
	currObj.appendChild(rootObj);
	//document.getElementById(hrMemId).value = "";
}

//Validating

//Fill Item Number 
/*function fillItemNo(value){
	if(value!= null && value!=""){
		splitstr = value.split('#');
		document.frmItemMaster.transacItemNo.value=splitstr[0];
	}
	else{
		document.frmItemMaster.transacItemNo.value="";
	}
}*/
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
						 <h2> <strong>Accounts:</strong> <span class="styleBoldTwo">Item List Master (Edit/Update)  </span></h2>
						 </div>
						 
 					<!--==============================Form Title=================================-->

  						<div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
    	
								<!--==============================Form Description=================================-->

 						
  
			
							<!--==============================Form Body=================================-->
	<form name="frmItemMaster" class='form-horizontal' method="post" action="ItemMaster.html" onsubmit="return chkValid();" onmousemove="enableCombo();"> <!-- onmousemove="fillValues();" -->
					<input type="hidden" name="process" value="updateListMaster">		
			
			<p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
			
				 
				  <div class='form-group'>
                          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Service:</label>
						   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
				    
							<select name="servMasterNo" class="form-control" onchange="populateSubItem(this.value);"><!--   -->
							  <!--onchange="fillItemNo();"(this.value);-->
                              <option selected="selected" value="">Select One</option>
                              <%
							    HLCItemMaster itemMasterVO = (HLCItemMaster) request.getAttribute("HLCItemMaster");
								
								String itemVOID=null;
								String serTypNmeVO=null;
								String itemNoVO=null;
								String parentItemNoVO=null;
								String itemDescVO=null;
								float rateVO=0.0f;
								String accountNoVO=null;
								
							    if(itemMasterVO!=null){
									itemVOID = itemMasterVO.getItemId();
									serTypNmeVO = itemMasterVO.getServiceTypeName();
									itemNoVO = itemMasterVO.getItemNo();
									parentItemNoVO = itemMasterVO.getParentItemNo();
									itemDescVO = itemMasterVO.getItemDesc();
									rateVO = itemMasterVO.getRate();
									accountNoVO = itemMasterVO.getAccountNo();
								}
								
							    ArrayList serviceMaster = (ArrayList) request.getAttribute("serviceMaster");
								Iterator it_master = serviceMaster.iterator();
								while(it_master.hasNext()){
												String serviceTypeArray[] = (String[]) it_master.next();
												String serviceTypeId = serviceTypeArray[0];
												String serviceTypeName = serviceTypeArray[1];
									if(serTypNmeVO.trim().equalsIgnoreCase(serviceTypeName)){
									%>
									<option value="<%=serTypNmeVO%>" selected="selected"><%=serTypNmeVO%></option>
								<%	}
								else{
								%>
                              		<option value="<%=serviceTypeName%>"><%=serviceTypeName%></option>
                              <%}
										}
							%>
                            </select>
				
				 	 <span class="asterisk" id="span_astriesk" style="color:#FF0000;">*</span></div>
					 </div>
				 </div>
				
		     	 
				   
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name / Number:</label>
				  <div class='col-md-8'>
                   		 <div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>								 									
									<% if(itemDescVO!=null){
								%>
								<input name="itemDescrption" type="text" class='form-control' id="itemDescrption" value="<%=itemDescVO%>" maxlength="150"  />
								<%}
								else{
								%>
								<input name="itemDescrption" type="text" class='form-control' id="itemDescrption" maxlength="150"  />
								<% } %>
									 <span id="span_astriesk" class="asterisk" style="color:#FF0000;"> *</span></div>
								</div>
						</div>
						
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sub Item Of:</label>
						   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
				    
							<select name="subItemNo" id="subItemNo" class='form-control'>
									<%
									if(parentItemNoVO!=null){
									%>
										<option selected="selected" value="<%=parentItemNoVO%>"></option>
									<%
									}
									else{
									%>
										<option selected="selected" value="">Select One</option>
									<% } %>
									</select>
				 	 <span class="asterisk" id="span_astriesk" style="color:#FF0000;">*</span></div>
					 </div>
				 </div>
						
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
				  <div class='col-md-8'>
                   		 <div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>							 									
									<% if(itemDescVO!=null){
								%>
								<input name="itemDescrption" type="text" class='form-control' id="itemDescrption" value="<%=itemDescVO%>" maxlength="150"  />
								<%}
								else{
								%>
								<input name="itemDescrption" type="text" class='form-control' id="itemDescrption" maxlength="150"  />
								<% } %>
									 <span id="span_astriesk" class="asterisk" style="color:#FF0000;"> *</span></div>
								</div>
						</div>
						
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rate:</label>
				  <div class='col-md-8'>
                   		 <div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>										
									<input name="itemRate" type="text" class="form-control" id="itemRate" value="<%=rateVO%>"maxlength="6">
									 </div>
								</div>
						</div>
						
						
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Account:</label>
						   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
				    
							<%							
								ArrayList accMaster = (ArrayList) request.getAttribute("accMaster");
								HLCAccountsMasterVO accDet; 
								if(accMaster!=null){
									if(accMaster.size()>0){
							%>
							  <select name="AccountNo" class='form-control'>
                              <option selected="selected" value="">Select One</option>
                              <%	
										Iterator it = accMaster.iterator();
										while(it.hasNext()){
												accDet=(HLCAccountsMasterVO)it.next();	
												String accountId = accDet.getAccount_id();
												String accountType = accDet.getAccount_type();
												String accountNo = accDet.getAccount_no();
												String accountName = accDet.getAccount_name();
												String parentaccNo = accDet.getParent_account_no();
												String accountDesc = accDet.getAccount_desc();
												String bnkAccNo = accDet.getBank_account_no();												
												System.out.print("accountNo is "+accountNo);
												if(accountNoVO.trim().equalsIgnoreCase(accountNo)){
												%>
												<option value="<%=accountNo%>" selected="selected"><%=accountNo%> - <%=accountName%></option>
											<%  }
											else{ %>
											  <option value="<%=accountNo%>"><%=accountNo%> - <%=accountName%></option>
											  <%}		
							  			}		%>
                            </select>							
							&nbsp;							
							<%		}
								}
							%>
				
				 	 <span class="asterisk" id="span_astriesk" style="color:#FF0000;">*</span></div>
					 </div>
				 </div>
						
						
				</div>
			  
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
									<input type="hidden" name="itemID" value="<%=itemVOID%>" />
                                        <button  type='submit' value='Update' class='btn-lg btn-primary'>Update</button>
									</div>
									<div class='col-md-2'>
                                        <button type='reset'  value='Cancel' onclick="window.location.href='./ItemMaster.html?process=listAllMaster'" class='btn-lg btn-danger' style=''> Cancel</button>
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
