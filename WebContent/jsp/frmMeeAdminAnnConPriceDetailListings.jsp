<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>
<script language="javascript">


var req;
  
function retrieveURL(methodName,param) {  
  if(param.value.length>0 && param.value!="") {
 
 var paramName = param.name;
  var url = null;

  if(paramName=='eventTypeId'){
    url = "UsrSignupAjax.html?cmd="+escape(methodName)+"&meeCatagoryTyp="+escape(param.value);     
  } /*  else if (paramName=='selDisplayType') {
     url = "dropDown.do?method="+escape(methodName)+"&dispId="+escape(param.value);   
   } */
		  if (window.XMLHttpRequest) {
			   req = new XMLHttpRequest();
			   
		   } else if (window.ActiveXObject) {
			   req = new ActiveXObject("Microsoft.XMLHTTP");
		   }
		   
		   if(paramName=='eventTypeId'){
				req.onreadystatechange = displayTypeChange;
		   } //else if (paramName=='selDisplayType') {
			 //  req.onreadystatechange = displaySubTypeChange;
		  // }       
		   req.open("GET", url, true);
		   req.send(null);

    } else {       
        setToDefault('specId');
       // setToDefault('selDisplaySubTypeId');
    }
  }  
  
  function displayTypeChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');	   
		var objDDL = document.getElementById("specId");          	          
		objDDL.innerHTML="";
		setToDefault('specId');
		//setToDefault('selDisplaySubTypeId');
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
      } else {
        alert("Problem: " + req.statusText);
      }
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
  

	function validatePriceList(){
		if(document.frmMeePriceMaster.eventTypeId.value==""){
			alert("Please select any one Event Type.");
			document.frmMeePriceMaster.eventTypeId.focus();
			return false;
		}
		
		if(document.frmMeePriceMaster.specId.value==""){
			alert("Please select any one Specification.");
			document.frmMeePriceMaster.specId.focus();
			return false;
		}

		
		return true;
	}

</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<%
	String eventTypeIdVal = (String) request.getAttribute("eventTypeId");
	String specIdVal = (String) request.getAttribute("specId");
	if(eventTypeIdVal==null) eventTypeIdVal = "";
	if(specIdVal==null) specIdVal = "";
	

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
                            <h2>Meetings:Price Detail Master</h2>
						</div>
				  
					    <div class='panel-body'>
						
								   <form class='form-horizontal' role='form'  name="frmMeePriceMaster" id="frmMeePriceMaster" action="addPriceMasterList.html" method="post" onsubmit="return validatePriceList();"  >
									<input type="hidden" name="priceMasterProcess" value="selectPriceList">
								   
						<div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
								    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
	                                  <select  name="eventTypeId" id="eventTypeId" class="form-control" onchange="retrieveURL('advType',this);" >
													<option selected="selected" value="">Select One</option>
													<%
													Vector eventTypeList = (Vector)request.getAttribute("eventTypeList");
													if(eventTypeList!=null && eventTypeList.size()!=0){
													Enumeration itEventType = eventTypeList.elements();
													while(itEventType.hasMoreElements()){
														String[] eduDet =(String[])itEventType.nextElement();
														String ETid = eduDet[0];
														String activityName1 = eduDet[1];
														if(eventTypeIdVal.equals(ETid)){
													
													%>
													
													<option value="<%=ETid%>" selected="selected"><%=activityName1%></option>
												 <%
												 }
												 else{
												 %>
												 <option value="<%=ETid%>"><%=activityName1%></option>
												 <%
												 }
										  }
										}
										  %>
								    </select>
									  <span id="span_astriesk">*</span>
									  </div>
									</div>
							</div>								
								  
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Specification:</label>
									  <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
									    <select  name="specId" id="specId" class="form-control" >
									  	<option selected="selected" value="">Select One</option>
											<%
														Vector specList = (Vector)request.getAttribute("specList");
														if(specList!=null && specList.size()!=0){
														Enumeration it = specList.elements();
														while(it.hasMoreElements()){
														String[] speciList =(String[])it.nextElement();
														String specificationId = speciList[0];
														String specificationName = speciList[1];
														//String [] speciList  = {specificationId,specificationName};
														if(specIdVal.equals(specificationId)){
																				%>
														<option value="<%=specificationId%>" selected="selected"><%=specificationName%></option>
													 <%
													 }
													 else{
													 %>
													 <option value="<%=specificationId%>"><%=specificationName%></option>
													 <%
													 }
											  }
											}
											  %>							
									 </select>		
									 <span id="span_astriesk">*</span>
									 </div>
								</div>
							 </div>			 
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Search</button>
                                    </div>
									</div>
							
									   
								  </form>
								
									
				<div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-2 col-md-offset-1">
									<label class='control-label label1'>User Type </label>
								</div>
								
							<div class="col-md-2">
									<label class='control-label label1'>Normal Price</label>
								</div>
							<div class="col-md-2">
									<label class='control-label label1'>After Due Date Price</label>
								</div>
							<div class="col-md-2">
									<label class='control-label label1'>Edit</label>
								</div>
							<div class="col-md-2">
									<label class='control-label label1'>View</label>
								</div>
						   </div>
						 </div>
					</div>

					<%
		   		
					 ArrayList priceListView=(ArrayList)request.getAttribute("priceListView");
					 if(priceListView!=null && priceListView.size()!=0){ 
					 Iterator itPrice = priceListView.iterator();
					  while(itPrice.hasNext()){
						    String [] priceDetail  = (String[]) itPrice.next();
							String priceDetId = priceDetail[0];
							String dueDatePrice = priceDetail[1];
							String afterDueDatePrice = priceDetail[2];
							String userTypeName = priceDetail[3];
							
							//String [] priceDetail  = {priceDetId,dueDatePrice,afterDueDatePrice,userTypeName};
		   %>
							<form name="frmDisplayAdminList" method="post" action="addPriceMasterList.html">		
							<input name="priceMasterProcess" type="hidden" value="viewEditPriceList">
							<input name="priceDetId" type="hidden" value="<%=priceDetId%>">
					 <div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
									   <div class='col-md-2 col-md-offset-1'>
									   		<label class='control-label'><%=userTypeName%></label>
										</div>
										
							<div class='col-md-2'>
									   		<label class='control-label'><%=dueDatePrice%> </label>
									</div>
							<div class='col-md-2'>
									   		<label class='control-label'><%=afterDueDatePrice%> </label>
								</div>
						<div class='col-md-2'>
										
								<button name="btnSubmit" type="submit"  value="Edit"class='btn-sm btn-primary' type='submit'>Edit</button>
										</div>
										<div class='col-md-2'>
										
								<button class='btn-sm btn-primary' name="btnSubmit" type="submit"  value="View" class='btn-sm btn-primary' type='submit'>View</button>
										</div>		
							</div>
						</div>
					</div>
						</form>
		   
					      <%	}
									}else {
								%>
								<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
												No Records are available.
											</div>
										</div>
									</div>
								</div>
								
								<%}%>

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
