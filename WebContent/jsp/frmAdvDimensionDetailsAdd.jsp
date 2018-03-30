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

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->

<script src="js/frmCreateDimenDetail.js" type="text/javascript" ></script>
<script src="js/gen_validatorv2.js" type="text/javascript" ></script>
<script>
var req;
  
function retrieveURL(methodName,param) {  
  if(param.value.length>0 && param.value!="") {
 
 var paramName = param.name;
  var url = null;

  if(paramName=='selMediaType'){
    url = "dropDown.html?method="+escape(methodName)+"&mid="+escape(param.value);     
  }   else if (paramName=='selDisplayType') {
     url = "dropDown.html?method="+escape(methodName)+"&dispId="+escape(param.value);   
   } 

   
      if (window.XMLHttpRequest) {
           req = new XMLHttpRequest();
		   
       } else if (window.ActiveXObject) {
           req = new ActiveXObject("Microsoft.XMLHTTP");
       }
       if(paramName=='selMediaType'){
            req.onreadystatechange = displayTypeChange;
       } else if (paramName=='selDisplayType') {
           req.onreadystatechange = displaySubTypeChange;
       }       
       req.open("GET", url, true);
       req.send(null);

    } else { 
		//document.getElementById(objName);
	    setToDefault('selDisplayTypeId');
       setToDefault('selDisplaySubTypeId');
    }
  }  
  
  function displayTypeChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');	   
		var objDDL = document.getElementById("selDisplayTypeId");          	          
		objDDL.innerHTML="";
		setToDefault('selDisplayTypeId');
		setToDefault('selDisplaySubTypeId');
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
  
  function displaySubTypeChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	    var objDDL = document.getElementById("selDisplaySubTypeId");  
	    objDDL.innerHTML="";	
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
		  setDimensionName();
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }

function setDimensionName(){   
  var dimTypeObj = document.getElementById("selDimensionNameId");
  var subType = document.getElementById("selDisplaySubTypeId");
  var dimName = document.getElementById("txtDimensionalNameId");
    dimName.value=subType.options[subType.selectedIndex].text+" "+dimTypeObj.options[dimTypeObj.selectedIndex].text;

}


function DoSelectBoxValidation() {

var mediaObj = document.getElementById("selMediaTypeId");
var dispTypeObj = document.getElementById("selDisplayTypeId");
var dispSubTypeObj = document.getElementById("selDisplaySubTypeId");
   if(mediaObj.options[mediaObj.selectedIndex].value=""||mediaObj.options[mediaObj.selectedIndex].value.length==0
	   || mediaObj.options[mediaObj.selectedIndex].value==null){
   
      alert(mediaObj.name+": Please Select one option ");
	  return false;
   } else  if(dispTypeObj.options[dispTypeObj.selectedIndex].value=""||dispTypeObj.options[dispTypeObj.selectedIndex].value.length==0
	   || dispTypeObj.options[dispTypeObj.selectedIndex].value==null){
   
      alert(dispTypeObj.name+": Please Select one option ");
	  return false;
   } else if(dispSubTypeObj.options[dispSubTypeObj.selectedIndex].value=""||dispSubTypeObj.options[dispSubTypeObj.selectedIndex].value.length==0
	   || dispSubTypeObj.options[dispSubTypeObj.selectedIndex].value==null){
   
      alert(dispSubTypeObj.name+": Please Select one option ");
	  return false;
   }
  return true;
}

function setMethod() {
  var canObj = document.getElementById("MethodId");
  canObj.value="addCancel";
  document.forms[0].submit();
}

</script>
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
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
						
						<h2>Advertisement: Create Dimension Details</h2>
						
						</div>
					<!--==============================Form Title=================================-->
						
                       	 <div class='panel-body'>
						
					<!--==============================Form Description=================================-->
						

	        <p>Please create the required Dimension Names for all the advertisements that are to be placed in all the events  
		
		Select a Dimension Name given below and fill-in the relevant dimension details for the same depending on the media type. </p>
	
			<html:form method="post" action="/advertise" enctype="multipart/form-data">


				<INPUT TYPE="hidden" name="method" value="create" id="MethodId"/>

					<p>Required fields are marked with an asterisk<span style="color:#FF0000">*</span></p>
           	  				
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select A Media Type:</label>
				    				
										 <div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<html:select property="selMediaType" styleId="selMediaTypeId" class="form-control" styleClass="selectboxOne" 
															  onchange="retrieveURL('advType',this);">
								  
														 <option selected="selected"  value="">Select One</option>
	                     					  		
														<html:options collection="DisplayMediaDetails" property="value" labelProperty="label" />
			          						 
													 </html:select>	
				 							
											 	<span id="span_astriesk">*</span>
											 
											 	</div>
											</div>
										</div>
									</div>
									
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													 <select name="selDisplayType" id="selDisplayTypeId" class="form-control" onChange="retrieveURL('advSubType',this);">
														<option selected="selected">Select One</option>						
													  </select>
													  <span id="span_astriesk">*</span>	
																 
												</div>
											</div>
										</div>
									</div>
											 
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Type:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<select name="selDisplaySubType" id="selDisplaySubTypeId" class="form-control" onChange="setDimensionName()">
														<option selected="selected" value="">Select One</option>							
													</select>
				 									 <span id="span_astriesk">*</span>	
													 					 
												</div>
											</div>
										</div>
									</div>
									
							<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dimension Type:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
					
													<html:select property="selDimensionType" styleId="selDimensionNameId" class="form-control" styleClass="selectboxOne" onchange=                                                      "setDimensionName();">
													<%if(request.getAttribute("DisplayMediaDetails")!=null){%>
												   <html:options collection="DispDimensionDetails" property="value" labelProperty="label" />
													 <%}%>
													</html:select>
														 <span id="span_astriesk">*</span>
													
												</div>
											</div>
										</div>
									</div>
									
						 		<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dimensional Name:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<html:text property="txtDimensionalName" styleId="txtDimensionalNameId" styleClass="form-control" 
													size="25" readonly="true" />
												
												</div>
											</div>
										</div>
									</div>
									
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Height:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<html:text property="txtAdvHeight" styleClass="form-control" maxlength="20" styleId="txtAdvHeight" size="25" />
				 									 <span id="span_astriesk">*</span>	
													 
												</div>
											</div>
										</div>
									</div>
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Width:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<html:text property="txtAdvWidth" styleClass="form-control" maxlength="20"  size="25" />
													<span id="span_astriesk">*</span>	
													 
												</div>
											</div>
										</div>
									</div>
							
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dimensional Unit:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<html:text property="txtDimensionalUnit" styleId="txtDimensionalUnit"  maxlength="20" styleClass="form-control" size="25" />
													<span id="span_astriesk">*</span>	
													 
												</div>
											</div>
										</div>
									</div>
									
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Upload Dimension Sample:</label>
										 <div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<html:file property="fileUpload"  styleClass="form-control" size="25" />
													<span id="span_astriesk">*</span>	
													 
												</div>
											</div>
										</div>
									</div>
								
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' value="create" type='submit'>create</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="reset" value="Reset" style=''>Reset</button>
                                    </div>
                                </div>
			
					</html:form>
					
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

<script language="JavaScript" type="text/javascript">
var frmvalidator = new Validator("formAdvertisement");
frmvalidator.addValidation("txtAdvHeight","req","Please enter the Advertisement height"); 
frmvalidator.addValidation("txtAdvHeight","maxlen=20");
// frmvalidator.addValidation("txtAdvHeight","numeric");
frmvalidator.addValidation("txtAdvWidth","req","Please enter the Advertisement width"); 
frmvalidator.addValidation("txtAdvWidth","maxlen=20");
// frmvalidator.addValidation("txtAdvWidth","numeric");
frmvalidator.addValidation("txtDimensionalUnit","req","Please enter the dimension unit");  
frmvalidator.addValidation("txtDimensionalUnit","maxlen=20");
// frmvalidator.addValidation("txtDimensionalUnit","numeric");
frmvalidator.addValidation("selMediaType","dontselect=0","Select the Media Type");
frmvalidator.addValidation("selDisplayType","dontselect=0","Select the Advertisement Type");
frmvalidator.addValidation("selDisplaySubType","dontselect=0","Select Advertisement Sub-Type");
</script>
</html>
