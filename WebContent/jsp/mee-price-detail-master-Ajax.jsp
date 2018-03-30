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

<script src="javascripts/frmGrossAmtMast.js" type="text/javascript" ></script>
<script>
var req;
  
function retrieveURL(methodName,param) {  
  if(param.value.length>0 && param.value!="") {
 
 var paramName = param.name;
  var url = null;

  if(paramName=='selCatagoryType'){
    url = "UsrSignupAjax.html?cmd="+escape(methodName)+"&meeCatagoryTyp="+escape(param.value);     
  } /*  else if (paramName=='selDisplayType') {
     url = "dropDown.html?method="+escape(methodName)+"&dispId="+escape(param.value);   
   } */
		  if (window.XMLHttpRequest) {
			   req = new XMLHttpRequest();
			   
		   } else if (window.ActiveXObject) {
			   req = new ActiveXObject("Microsoft.XMLHTTP");
		   }
		   
		   if(paramName=='selCatagoryType'){
				req.onreadystatechange = displayTypeChange;
		   } //else if (paramName=='selDisplayType') {
			 //  req.onreadystatechange = displaySubTypeChange;
		  // }       
		   req.open("GET", url, true);
		   req.send(null);

    } else {       
        setToDefault('selSpecificationId');
       // setToDefault('selDisplaySubTypeId');
    }
  }  
  
  function displayTypeChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');	   
		var objDDL = document.getElementById("selSpecificationId");          	          
		objDDL.innerHTML="";
		setToDefault('selSpecificationId');
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
		if(document.frmMeePriceMaster.selCatagoryType.value==""){
			alert("Please select any one Event Type.");
			document.frmMeePriceMaster.selCatagoryType.focus();
			return false;
		}
		
		if(document.frmMeePriceMaster.selSpecification.value==""){
			alert("Please select any one Specification.");
			document.frmMeePriceMaster.selSpecification.focus();
			return false;
		}
		if(document.frmMeePriceMaster.selUserType.value==""){
			alert("Please select any one User Type.");
			document.frmMeePriceMaster.selUserType.focus();
			return false;
		}
		
		if(document.frmMeePriceMaster.duePrice.value==""){
			alert("The Normal Amount Field can't be blank");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
	
		if(!Number(document.frmMeePriceMaster.duePrice.value)){
			alert("Enter valid Normal Amount");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
		
if((document.frmMeePriceMaster.duePrice.value.indexOf('+')!=-1)||(document.frmMeePriceMaster.duePrice.value.indexOf('-')!=-1)){
				alert("Enter valid Normal Amount");
				document.frmMeePriceMaster.duePrice.focus();
				return false;
			}
		if(document.frmMeePriceMaster.duePrice.value.indexOf('.')>7){
			alert("Enter valid Normal Amount");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
		if((document.frmMeePriceMaster.duePrice.value.indexOf('.'))==-1){
			if(document.frmMeePriceMaster.duePrice.value.length>7){
				alert("Enter valid Normal Amount");
				document.frmMeePriceMaster.duePrice.focus();
				return false;
			}
		}
			
		if(!(document.frmMeePriceMaster.duePrice.value=="")){
			if((document.frmMeePriceMaster.duePrice.value.indexOf('.'))!=-1){
				fstr=document.frmMeePriceMaster.duePrice.value;
				fstr1=document.frmMeePriceMaster.duePrice.value.lastIndexOf('.');
				mm = (fstr.substring(fstr1,document.frmMeePriceMaster.duePrice.value.length));
				str=(Number(mm.length));
				if((str)>3){
					alert("Normal Amount is not valid");
					document.frmMeePriceMaster.duePrice.focus();
					return false;
				}
			}
		}


		if(document.frmMeePriceMaster.afterPrice.value==""){
			alert("The After Due Amount Field can't be blank");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
	
		if(!Number(document.frmMeePriceMaster.afterPrice.value)){
			alert("Enter valid After Due Amount");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
		if(document.frmMeePriceMaster.afterPrice.value.indexOf('.')>7){
			alert("Enter valid After Due Amount");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
		
if((document.frmMeePriceMaster.afterPrice.value.indexOf('+')!=-1)||(document.frmMeePriceMaster.afterPrice.value.indexOf('-')!=-1)){
				alert("Enter valid After Due Amount");
				document.frmMeePriceMaster.afterPrice.focus();
				return false;
			}
		if((document.frmMeePriceMaster.afterPrice.value.indexOf('.'))==-1){
			if(document.frmMeePriceMaster.afterPrice.value.length>7){
				alert("Enter valid After Due Amount");
				document.frmMeePriceMaster.afterPrice.focus();
				return false;
			}
		}
			
		if(!(document.frmMeePriceMaster.afterPrice.value=="")){
			if((document.frmMeePriceMaster.afterPrice.value.indexOf('.'))!=-1){
				fstr=document.frmMeePriceMaster.afterPrice.value;
				fstr1=document.frmMeePriceMaster.afterPrice.value.lastIndexOf('.');
				mm = (fstr.substring(fstr1,document.frmMeePriceMaster.afterPrice.value.length));
				str=(Number(mm.length));
				if((str)>3){
					alert("After Due Amount is not valid");
					document.frmMeePriceMaster.afterPrice.focus();
					return false;
				}
			}
		}
		return true;
	}

</script>


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
                            <h2>Meetings: Price Detail Master</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeePriceMaster" id="frmMeePriceMaster" action="addPriceMasterList.html" method="post" onsubmit="return validatePriceList();" >
							
                               <input type="hidden" name="priceMasterProcess" value="addPriceMaster">
							   
							   <div class='panel-heading col-md-offset-2'>
								<h2> Add A Price Detail:</h2>
							</div>
							
								 <% String statuscheck = (String)request.getAttribute("err");
									if(statuscheck!=null && statuscheck.equals("st")){
									%>
							  <p id='p_error'>Specification Id And Activity Id Already Exists. Try it Again.</p>
							  
							  <%}%>
								
                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="selCatagoryType" id="selCatagoryTypeId" class="form-control" onchange="retrieveURL('advType',this);">
										<option selected="selected" value="">Select One</option>
										<%
										Vector activityDetails = (Vector)request.getAttribute("meeCataTypeVect");
										if(activityDetails!=null && activityDetails.size()!=0){
										Enumeration it = activityDetails.elements();
										while(it.hasMoreElements()){
										String[] eduDet =(String[])it.nextElement();
										String id = eduDet[0];
										String activityName1 = eduDet[1];
										
										%>
										
													<option value="<%=id%>"><%=activityName1%></option>
												 <%
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
											<select name="selSpecification" id="selSpecificationId" class="form-control" >
													<option selected="selected" value="">Select One</option>							
											</select>
												<span id="span_astriesk">*</span>					
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Type :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<select name="selUserType" id="selUserTypeId" class="form-control">
														<option selected="selected" value="">Select One</option>
														<%
														Vector userTypeDetail = (Vector)request.getAttribute("userTypeVec");
														if(userTypeDetail!=null && userTypeDetail.size()!=0){
														Enumeration it1 = userTypeDetail.elements();
														while(it1.hasMoreElements()){
														String[] eduDet1 =(String[])it1.nextElement();
														String userTypeId = eduDet1[0];
														String userTypeName = eduDet1[1];
														
														%>
														
														<option value="<%=userTypeId%>"><%=userTypeName%></option>
													 <%
											  }
											}
											  %>
										  </select>
										  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Normal Price :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i><input name="duePrice" type="text" class="form-control" size="8" />
											  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>After Due Date Price :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i> <input name ="afterPrice" type="text" class="form-control" size="8" />
											  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Add">Add</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="button" value="Cancel" onclick="javascript:history.back(-1);" >Cancel</button>
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
