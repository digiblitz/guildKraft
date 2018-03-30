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
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/frmSponsReg.js" type="text/javascript" ></script>
<script src="js/ajax.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script>
var req;
var delObj;
  
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
        setToDefault('selDisplayTypeId');
    }
   
  }  
  
  function displayTypeChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');	   
		var objDDL = document.getElementById("selDisplayTypeId");          	          
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
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }



function deleteURL(param,rowObj) { 	
 if (confirm("Are you sure you want to delete the dimension?")==true){
      var url = "advertise.html?method=delete&dimId="+escape(param); 
	  delObj =  rowObj;
      if (window.XMLHttpRequest) {
           req = new XMLHttpRequest();
       } else if (window.ActiveXObject) {
           req = new ActiveXObject("Microsoft.XMLHTTP");
       }      
       req.onreadystatechange = deleteStateChange;      
       req.open("GET", url, true);
       req.send(null);
 }
}

function deleteStateChange() {
  if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
		/* src refers to the input button that was clicked.	
			   to get a reference to the containing <tr> element,
			   get the parent of the parent (in this case case <tr>)
			*/			
			var oRow = delObj.parentElement.parentElement;		

			//once the row reference is obtained, delete it passing in its rowIndex			
			document.all("searchTableId").deleteRow(oRow.rowIndex);		
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
							
							<h2>Advertisement: View Dimension Details</h2>
							
					<!--==============================Form Title=================================-->
					 </div>
				
				  				 <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
							
						<p>The Advertisement dimension details are available are as follows: </p>

				<html:form action="/advSearch.html">

							<INPUT TYPE="hidden" name="method" value="search"/>
							

<!--==============================================content start here============================================-->
						 <div class='form-group'>
						 
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Color Legends:</label>
								 
                                    <div class='col-md-8'>
									
                                        <div class='col-md-3 indent-small'>
										
                                            <div class='form-group internal'>
											
												<span class="legendTwo">&nbsp;</span>
												
											</div>
											
										</div>
										
									</div>
									
								</div>
				
						<div class="margin">
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4'>
										
											<label class='control-label label1'>Media Type:</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											 <html:select property="selMediaType" styleId="selMediaTypeId" styleClass="form-control" 
                          onchange="retrieveURL('advType',this);" >

						  						 <option value="">Select One</option>
												 
	                   							<html:options collection="DisplayMediaDetails" property="value" labelProperty="label" />
			        							
											 </html:select>				   
									
									 </div>
									 
									 <div class='col-md-4'>
										
											<label class='control-label label1'>Ad Type:</label>    
											
									</div>
									
									<div class='col-md-2'>
			
										  <html:select property="selDisplayType" styleId="selDisplayTypeId" styleClass="selectboxOne" >
											<option value="">Select One</option>	
											<%if(request.getAttribute("DisplayTypeDetails")!=null){%>
												<html:options collection="DisplayTypeDetails" property="value" labelProperty="label" />
											<%}%>
										</html:select>		    
										
									</div>
									
									<div class='col-md-2'>
									
										 <div class='col-md-offset-4 col-md-1'>
										 
                                       		 <button class='btn-lg btn-primary' name="Submit3" value="Search" type='submit'>Search</button>
											 
                                  		  </div> 
									</div>
								
								</div>
							
							</div>
						
						</div>
					
					</div>
					
						<div class="margin">
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4'>
										
											<label class='control-label label1'>Dimension Name</label>
											
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label label1'>Unit</label>
											
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label label1'>Edit</label>
											
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label label1'>Delete</label>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						</div>
										
													   
						   <logic:present name="searchAdvtForm" property="results">
							 <bean:size id="size" name="searchAdvtForm" property="results"/>
							 <logic:equal name="size" value="0">	
							 
							 <div class="margin">
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4'>	
										
											<label class='control-label'>No Records Found</label>
											
										</div>
										
									</div>
									
								</div>
								
							</div>
						
						</div>
													
							
						 </logic:equal>                 
						 <logic:greaterThan name="size" value="0">
						<logic:iterate id="searchList" name="searchAdvtForm" property="results">
						
							 <div class="margin">
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4'>	
										
											<label class='control-label'>
											
												  <a href='advertise.html?method=advDisplayDetails&dimId=<bean:write name="searchList" property="dimensionId"/>'>
													<bean:write name="searchList" property="dimensionalName"/>
										    		</a>
														
											</label>
											
										</div>
											
											<div class='col-md-2'>
											
												<label class='control-label'>
												
							                           <bean:write name="searchList" property="dimensionalUnit"/> 
												
												</label>
										   
										   </div>
										   
										<div class='col-md-offset-4 col-md-1'>
															
															<button class='btn-lg btn-primary' name="editName" type="button"  onClick="window.location='advertise.html?method=advEditDetails&dimId=<bean:write name=searchList property=dimensionId/>'" value="Edit" />Edit  </button>
																
											</div>
											
											 <div class='col-md-2'>
											 
											 	 <button class='btn-lg btn-danger' type="button" name="deleteName"  onClick="window.location='advertise.html?method=advDeleteDetails&dimId=<bean:write name=searchList property=dimensionId />'" value="Delete" style=''>Delete</button>
												 
											</div>
											
										</div>
										
									</div>
									
								</div>
								
							</div>
                                                   
                    </logic:iterate>    
					                
               </logic:greaterThan>     
			   
	    </logic:present>
			
</html:form>
														
														<!-- CONTENTS END HERE -->		
			 
			 
			 
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
