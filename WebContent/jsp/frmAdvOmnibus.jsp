<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmAdvertiseOmnibus.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script>

var req;

 function makePOSTRequest(url, parameters) {
      req = false;
      if (window.XMLHttpRequest) { // Mozilla, Safari,...
         req = new XMLHttpRequest();         
      } else if (window.ActiveXObject) { // IE
         try {
            req = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e) {
            try {
               req = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }
	  
      if (!req) {
         alert('Cannot create XMLHTTP instance');
         return false;
      }

      req.onreadystatechange = setAmount;
      req.open('POST', url, true);
      req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      req.setRequestHeader("Content-length", parameters.length);
      req.setRequestHeader("Connection", "close");      
	  req.send(parameters);
	  
   }

function getAmountDetails() {
		var selPlanDisp = document.getElementById("selPlanDispId").value;
		//alert(eval(selPlanDisp));
		selPlanDisp
		var mediaId = document.getElementById("mediaIdVal").value;
		
		var poststr = "";
		for(i = 1; i<=eval(selPlanDisp); i++){
			var chkIssueId = "chkIssueId" + i;
			var selWinTypeIdchkIssue = "selWinTypeIdchkIssue" + i;
			var selWinSubTypeIdchkIssue = "selWinSubTypeIdchkIssue" + i;
			var selWinDimchkIssue = "selWinDimchkIssue" + i;
			//var txtWinPlace = "txtWinPlace" + i;
			
			
			poststr	= poststr +  chkIssueId + "=" + encodeURI( document.getElementById(chkIssueId).value ) + "&" +
					selWinTypeIdchkIssue + "=" + encodeURI( document.getElementById(selWinTypeIdchkIssue).value ) + "&" + 
					selWinSubTypeIdchkIssue + "=" + encodeURI( document.getElementById(selWinSubTypeIdchkIssue).value ) + "&" + 
					selWinDimchkIssue + "=" + encodeURI( document.getElementById(selWinDimchkIssue).value ) + "&" ; 
		}
		poststr = "method=advGetAmount&selPlanDisp=" + encodeURI(selPlanDisp) +  "&mediaId=" + encodeURI(mediaId) + "&" + poststr
      	makePOSTRequest("dropDown.html", poststr);
		//alert(poststr);
   }
 
 function setAmount() {
 	//alert('Hi');
      if (req.readyState == 4) {
         if (req.status == 200) {
			var xmlDoc = req.responseXML.documentElement;
			var xRows= xmlDoc.getElementsByTagName('price');
			var nameNodes = xRows[0].firstChild.nodeValue;
			document.getElementById("amount").value = nameNodes;
           
         } else {
            alert('There was a problem with the request.');
         }
      }
   }

  
  
function retrieveURL(methodName,param) {

if(param.value.length>0 && param.value!="") {
 	var paramName = param.name;
  	var url = null;

  if(paramName=='selWinTypechkIssue1'){
    url = "dropDown.html?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }

 if(paramName=='selWinTypechkIssue2'){
     url = "dropDown.html?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }
  
  if(paramName=='selWinTypechkIssue3'){
     url = "dropDown.html?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }
  
  if(paramName=='selWinTypechkIssue4'){
     url = "dropDown.html?method="+escape(methodName)+"&dispId="+escape(param.value);  
  }
  
     
      if (window.XMLHttpRequest) {
           req = new XMLHttpRequest();
       } else if (window.ActiveXObject) {
           req = new ActiveXObject("Microsoft.XMLHTTP");
       }
       if(paramName=='selWinTypechkIssue1'){
            req.onreadystatechange = displaySubTypeChange;
       }
	   
	     if(paramName=='selWinTypechkIssue2'){
            req.onreadystatechange = displaySubTypeChange2;
       }     
	   
	   
	   if(paramName=='selWinTypechkIssue3'){
            req.onreadystatechange = displaySubTypeChange3;
       }     
	   
		if(paramName=='selWinTypechkIssue4'){
            req.onreadystatechange = displaySubTypeChange4;
       }
	   
	 
       req.open("GET", url, true);
       req.send(null);

    } 
	 else {   
	    //setToDefault('selWinSubTypechkIssue1');
		getAmountDetails();
    }
   
  }  
 
  
  function setToDefault(objName){
    var currObj = document.getElementById(objName);
    currObj.innerHTML="";
	var rootObj =  document.createElement("option");
	var attrib = document.createAttribute("value");
    attrib.value="";
	rootObj.setAttributeNode(attrib);
    newtext=document.createTextNode('Select One');
    rootObj.appendChild(newtext);
    currObj.appendChild(rootObj);

  }
  
  
  
  function displaySubTypeChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	    
	    var objDDL = document.getElementById("selWinSubTypechkIssue1");  
		
	    objDDL.innerHTML="";
		// setToDefault('selWinSubTypechkIssue1');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		 getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  
  
  function displaySubTypeChange2() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	   // setToDefault('selWinSubTypechkIssue2');
	    var objDDL = document.getElementById("selWinSubTypechkIssue2");  
	    objDDL.innerHTML="";
		//setToDefault('selWinSubTypechkIssue2');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  
  function displaySubTypeChange3() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	  //  setToDefault('selWinSubTypechkIssue3');
	    var objDDL = document.getElementById("selWinSubTypechkIssue3");  
	    objDDL.innerHTML="";
		//setToDefault('selWinSubTypechkIssue3');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  
  
    function displaySubTypeChange4() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	   // setToDefault('selWinSubTypechkIssue4');
	    var objDDL = document.getElementById("selWinSubTypechkIssue4");  
	    objDDL.innerHTML="";
		//setToDefault('selWinSubTypechkIssue4');
	         for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		getAmountDetails();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
  

</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>



<body hoe-navigation-type="vertical" hoe-nav-placement="left" onload="initIssue();" theme-layout="wide-layout" theme-bg="bg1">

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
                            <h2>Advertisement Onmibus: Agency and Contact person information</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
   
	    
		<p>Fill in the following information to place your Advertisements in Omnibus for any events being 
		conducted.</p>
		
 
		<p >Special Instructions:  Cancellations or changes in orders cannot be accepted after the 
		published closing date. All copy elements are subject to Publisher approval. Advertiser and/or its agency 
		acknowledges receipt of and agrees to the terms and conditions included in the publication's current rates. <br /> 
		Terms:  Pre-payment is required for all 1x frequency insertions. Advertiser will be invoiced 
		per issue of advertisement thereafter. If invoice is not paid within 30 days of invoice date a 1.5% interest 
		will be charged per month on past due accounts. Ads will be subject to cancellation if invoice is past die 
		60 days. Please see advertising rate sheet and follow the requirements on supplied artwork.</p>
	
	
	<%
		String mediaId = (String)request.getAttribute("mediaId");
		if(mediaId==null){
			response.sendRedirect("advertisement.html?advProcess=show");
		}
	%>

<!-- action="OmnibusInsert.html" -->	
	<form  class='form-horizontal' role='form' name="frmAdvOmni" id="frmAdvOmni" method="post" onsubmit="return myvalidate();" action="OmnibusInsert.html">
		<input type="hidden" name="advInsert" value="insert">
		<input type="hidden" name="mediaId" id="mediaIdVal" value="<%=mediaId%>" />
			
					<p>Required fields are mandatory with asterisk<span style="color:#FF0000" >*</span> 
					
					<div class='form-group'>
						<label class="control-label label1">Ad Agencies and Contact person information:</label>
					</div>
			 
			 			 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertiser's Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtAdvName" class="form-control"  />
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
		   
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ad Agency Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtAgentName" class="form-control"  />
											<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
									
			
							<div class='form-group'>
							
									<label class="control-label label1">Contact Person details:</label>
							</div>
							
			
						<div class="form-control">
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtFirstName"class="form-control"  />
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
			
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtMidName"class="form-control"  />
											</div>
										</div>
									</div>
		
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtLastName"class="form-control"/>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
											
			
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Street:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtStreetName"class="form-control"/>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
			
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suite:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtSuiteName" class="form-control"/>
											</div>
										</div>
									</div>
			
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="selConCountry" id="selConCountry" class="form-control" 
												onChange="FillState(document.frmAdvOmni.selConCountry, document.frmAdvOmni.selConState, '');">
												<option selected >Select One</option>
												</select>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
          
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="selConState" id="selConState" class="form-control">
												</select>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
          
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text"  name="txtConCity"class="form-control"/>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
			
				  				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text"  name="txtConZip" class="form-control"/>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
		    
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtConPhone"class="form-control"  maxlength="40" />
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
			
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text"  name="txtConFax"class="form-control"/>
											</div>
										</div>
									</div>
			
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text"  name="txtConMail"class="form-control"/>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
		
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Invoice to:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="radio" name="rdoAdvertising"   value="advertiser" />Advertiser 
												<input type="radio" name="rdoAdvertising" value="agency" />Advertising Agency	
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
		
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Have you advertised with us before?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="radio" name="rdoQuest"  value="yes" onclick="yesClear();"/>Yes
												<input type="radio" name="rdoQuest"   value="no" onclick="noClear();"/>No
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
			
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If yes, when?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtYesDate" id="txtYesDate" readonly="true" class="form-control" />
													
													<a href="javascript:cal1.popup();"> <i id="calendar1" class="fa fa-calendar"></i></a> 
													<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
				
						<p>Note: Pre-payment in full is required for all 1x frequency insertions. Advertiser will be involved per issue thereafter.</p>
		   
		   			<div class="form-group">
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Frequency Rate:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
			
												<select name="selPlanDisp" id="selPlanDispId"  class="form-control" onchange="displayRadios(selPlanDisp);">
													<option selected="selected">Select One</option>
													<%
													int incValue = 0;
													List listFreq = (ArrayList)request.getAttribute("dispFreqDetails");
													if(listFreq!=null && listFreq.size()!=0){
														Iterator elistFreq =listFreq.iterator();
														while(elistFreq.hasNext()){
															String[] strFerq  = (String [])elistFreq.next();
															//String freqlist [] = {frequencyId,frequencyName,mediaId};
															//Debug.print("===============================");
															String freq_id = strFerq[0];
															String freq_Name = strFerq[1];
															incValue++;
															if(incValue==5){
																break;
															}
													%>
													<option  value="<%=freq_id%>"><%=freq_Name%></option>
												<%
														}
													}
												%>
												</select>
			
           									 <span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
							</div>
							
							<%
							for(int i = 1 ; i <incValue; i++) {
							%>
							
			
					 			<div class="form-group" id="<%=i%>">
						 			<label class='control-label label1'>Frequence <%=i%>X </label>
								</div>
					  
					  	<div class="form-group">
					   		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Issue Types:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <select name="chkIssue<%=i%>" id="chkIssueId<%=i%>" class="form-control"  >
												   <option selected="selected">Select One</option>
												   <%
												Vector vIssueLst1 = (Vector)request.getAttribute("dispIssueDetails");
												if(vIssueLst1!=null && vIssueLst1.size()!=0){
														Enumeration eIssueLst1 =vIssueLst1.elements();
														while(eIssueLst1.hasMoreElements()){
															String[] sIss = (String [])eIssueLst1.nextElement();
															//Debug.print("===============================");
															String issue_id1=sIss[0];
															String issue_name1=sIss[1];
															String media_id1=sIss[2];
															String issue_status1=sIss[3];
															%>
												   <option value="<%=issue_id1%>"><%=issue_name1%></option>
												   <%}
												}
												%>
												 </select>
						     						<span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Types:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>			
						   
												 <select name="selWinTypechkIssue<%=i%>" id="selWinTypeIdchkIssue<%=i%>" class="form-control"  onchange="retrieveURL('advSubType',this);">
												  <option selected="selected">Select One</option>
												 <%
												Vector vType = (Vector)request.getAttribute("DisplayTypeDetails");
												if(vType!=null && vType.size()!=0){
													Enumeration eDisp = vType.elements();
													String displayTypeId =  "";
													String displayTypeName =  "";
													String mediaIdVal = "";
													while(eDisp.hasMoreElements()){
														String[] s = (String [])eDisp.nextElement();
														displayTypeId = s[0];
														displayTypeName = s[1];
														mediaIdVal  = s[2];
												%>
												   <option value="<%=displayTypeId%>"><%=displayTypeName%></option>
					
												   <%}
												}
												%>
												 </select>
						    						<span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
													 
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Types:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>						
											<select name="selWinSubTypechkIssue<%=i%>" id="selWinSubTypeIdchkIssue<%=i%>" class="form-control" onchange="getAmountDetails();"  >
												  <option selected="selected" value="">Select One</option>
												  </select>
														<span id="span_astriesk">*</span>
										</div>
									</div>
								</div>	
																			  				
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ad Dimension:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>		
							
											 <select name="selWinDimchkIssue<%=i%>" id="selWinDimchkIssue<%=i%>" class="form-control" >
											 <option selected="selected">Select One</option>
												<%
													Vector vDimLst = (Vector)request.getAttribute("DisplayDimensionDetails");
													if(vDimLst!=null && vDimLst.size()!=0){
														Enumeration eDimLst = vDimLst.elements();
														String dimListId = "";
														String dimListName = "";
														String dimListStatus = "";
													while(eDimLst.hasMoreElements()){
														String[] s = (String [])eDimLst.nextElement();
														dimListId = s[0];
														dimListName = s[1];
												%>
											 
											<option value="<%=dimListId%>"><%=dimListName%></option>
											<%}
											}%>
											</select>
											<span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
											
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Placement:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>		
					 	   						 <input type="text" name="txtWinPlace<%=i%>"  class="form-control"  />							
										</div>
									</div>
								</div>
							</div>
						   
				  <%
				  }
				  %>
				  		<div class="form-group">
				          <label class="control-label label1">Other Information</label>
						 </div>
							
						<div class="form-group">
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertising Material Coming From:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="txtMatName"class="form-control"  />
						 							 <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
				 			
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
				 									<input type="text" name="txtDetDate"  readonly="true" class="form-control"  />
													<a href="javascript:cal2.popup();">
					 								 <i id="calendar1" class="fa fa-calendar"></i></a>
                     								<span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
				 			
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ad Supplied on:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input type="radio" name="rdoSupply" value="cd" />CD
											<input type="radio" name="rdoSupply" value="email" />Email
				    							<span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
								
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Special Instruction:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
				    							<textarea name="txtAreaIns" class="form-control" rows="5"></textarea>
										</div>
									</div>
								</div>
							</div>
				 					
						
						<div class="form-group">
						 <label class='control-label label1'>Payment Information</label>
						</div>
				 
				 	<div class="form-group">
				 		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text"  name="amount" id= "amount" class="form-control"  readonly="readonly" />
				     								<span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
				  
				  		
						
								<input type="radio" size="10" name="r11" value="check" checked="checked" onclick="switchDiv('chkEnc'), showHideRadio('r11','chrgCrd','check'),cardClear();"/> Check enclosed.
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
									  				<input type="radio" size="10" name="r11" value="card" 
onclick="switchDiv('chrgCrd'), showHideRadio('r11','chkEnc','card'),checkClear();"  /> Please charge my card.	
								
													</div>
												</div>
											</div>
										</div>
										
					  		   <div class="form-group">
								 <label class='control-label'>Check Details:</label>
								</div>
                                   
								<div class="form-group"	>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
													<input type="text" name="checkNumber" class="form-control"  /> 
													<span id="span_astriesk">*</span>
												</div>
											</div>
										</div>				  
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>		
												<input type="text" name="checkDate" class="form-control" />
												  <a href="javascript:cal3.popup();">
					                 			 <i id="calendar1" class="fa fa-calendar"></i> </a>
										  			<span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												  <input type="text" name="bankName" class="form-control"  /> 
												  		<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
												  						  
									
							<div class="form-group" id="chrgCrd">
									
								<label class='control-label'>Card Details:</label>
							
                                   
							<div class="form-group">
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="ccNumber" class="form-control"  />
				                                  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
												  
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												  <input type="text" name="ccCvvid" class="form-control"  />
					                                 <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
												
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<select name="ccType" id="ccType" class="form-control">
														  <option selected="selected">Select One</option>
														  <option value="Visa">Visa</option>
														  <option value="Master Card">Master Card</option>
														  <option value="AmEx">AmEx</option>
														</select>
					                                    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>						
												
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="ccName" class="form-control"  />
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
														</select>
					                                   		<span id="span_astriesk">*</span>
														 </div>
													</div>
												</div>
											</div>	
										</div>	      
		
		
									<input type="hidden" name="finalValue" value="" />
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-3'>
                                        <button class='btn-lg btn-primary' name="subsub" type="submit">Place Advertisement</button>
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
	FillCountry(document.frmAdvOmni.selConCountry, document.frmAdvOmni.selConState, '---Select---');
	FillState(document.frmAdvOmni.selConCountry, document.frmAdvOmni.selConState, '');
</script>
<script language="javascript">
	var cal1 = new calendar2(document.forms['frmAdvOmni'].elements['txtYesDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;

	var cal2 = new calendar2(document.forms['frmAdvOmni'].elements['txtDetDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;

	var cal3 = new calendar2(document.forms['frmAdvOmni'].elements['checkDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;

</script>
</html>
