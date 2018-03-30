<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/calendar2.js" type="text/javascript"></script>
</head>

<script type="text/javascript">

function callMapList()
{
	strURL = "./artifactMapping.html?artiMapProcess=listViewPointMap";
	window.location.href = strURL;
}



function callViewPoint(selViewPointId) {
	
	//alert('asi');
	strURL = "./artifactMapping.html?artiMapProcess=listViewBasedOnViewPoint&selVPointId="+selViewPointId;
	window.location.href = strURL; 	

}


function showArtifact() {

	//alert("test "+document.frmGroupsMap.viewId.selectedIndex+"=="+chkCount);

	
 /* if(document.frmGroupsMap.viewId.selectedIndex==0)
	{
		document.getElementById('divArtifact').style.visibility="hidden";
	}
	else
	{
		document.getElementById('divArtifact').style.visibility="visible";
	}*/
	var comboCnt =0;
	var showArtifactFlag = false;

      for(var i=0;i<document.frmGroupsMap.elements.length;i++) {
	  
		   if(document.frmGroupsMap.elements[i].type=='select-one') {

				//alert('if '+document.frmGroupsMap.elements[i].selectedIndex+"=="+comboCnt);

				if(comboCnt==0) {
					if(document.frmGroupsMap.elements[i].selectedIndex!=0) {
						showArtifactFlag=true;
					}
					else if(document.frmGroupsMap.elements[i].selectedIndex==0) {
						showArtifactFlag=false;
					}
				} 
				
				if(comboCnt==1) {
					if(document.frmGroupsMap.elements[i].selectedIndex!=0 && document.frmGroupsMap.elements[i-1].selectedIndex!=0) {
						showArtifactFlag=true;
					}
					else if(document.frmGroupsMap.elements[i].selectedIndex==0 && document.frmGroupsMap.elements[i-1].selectedIndex==0) {
						showArtifactFlag=false;
					}
				} 
			
				if(comboCnt>1) {
					if(document.frmGroupsMap.elements[i].selectedIndex!=0) {
						showArtifactFlag=false;
						break;
					}
					else if(document.frmGroupsMap.elements[i].selectedIndex==0) {
						showArtifactFlag=true;
						break;
					}
				
				}


				comboCnt++;
		   }
	  }

	  if(showArtifactFlag==true)
		  document.getElementById('divArtifact').style.visibility="visible";
	  else 
		  document.getElementById('divArtifact').style.visibility="hidden";	
}






function myValidate(){
	if(document.getElementById("viewId").value=="")
{alert("Select View point");
 document.getElementById("viewId").focus();
 return false;}
	

grpSize=document.getElementById("grpSize").value;

		for(d=0;d<grpSize;d++){
		
		masteName=document.getElementById("masteName"+d).value;

//alert(masteName);
	
	if(document.getElementById("viewId").value!="")
{
if(document.getElementById("grpsDet"+d)!=null){
if(document.getElementById("grpsDet"+d).value==""){

alert("Select any one"+masteName);
document.getElementById("grpsDet"+d).focus();
return false;
}



}
}
	}	
		

	 return true;
	 
	 
}
	



var requ;
  
function retrieveURL(methodName) {  
 
// alert(methodName);



  var url = null;

		viewPntId=document.getElementById("viewId").value;
		
	grpSize=document.getElementById("grpSize").value;
	lobId=null;
	viewId=null;
	grpId=null;
	procDom=null;
	
	
	
	
	for(d=0;d<grpSize;d++){	
	if(document.getElementById("grpsDet"+d)!=null){
	//masterId=document.getElementById("masterId"+d).value;
	var grpDet=document.getElementById("grpsDet"+d).value;	
	
	if(grpDet!=null && lobId==null){	
var splitval = grpDet.split("#");	
	
	lobId=splitval[1];
	}else if(grpDet!=null && lobId!=null && viewId==null){
	
	var splitval = grpDet.split("#");	
	
	viewId=splitval[1];
	
	}else if(grpDet!=null && lobId!=null && viewId!=null && grpId==null){
	
	var splitval = grpDet.split("#");	
	
	grpId=splitval[1];
	
	}else if(grpDet!=null && lobId!=null && viewId!=null && grpId!=null && procDom==null){
	
	var splitval = grpDet.split("#");	
	
	procDom=splitval[1];
	
	}
	
}	
	}
	
if(viewPntId!=null && lobId!=null && viewId!=null && grpId!=null && procDom!=null)	{	
 urlsd = "UsrSignupAjax.html?cmd="+escape(methodName)+"&viewPntId="+escape(viewPntId)+"&lobId="+escape(lobId)+"&viewId="+escape(viewId)+"&grpId="+escape(grpId)+"&domProcId="+escape(procDom);  
 
 } 
  
      if (window.XMLHttpRequest) {
           requ = new XMLHttpRequest();
		   
       } else if (window.ActiveXObject) {
           requ = new ActiveXObject("Microsoft.XMLHTTP");
       }
     
           requ.onreadystatechange = displayExistsStatus;
		 
           
       requ.open("GET", urlsd, true);
       requ.send(null);

  
  }  
  
  
  function displayExistsStatus() {
	if (requ.readyState == 4) { // Complete
		if (requ.status == 200) { // OK response  
			var arnameXML = requ.responseXML.getElementsByTagName("outValue")[0]; 
			var arnameText = arnameXML.childNodes[0].nodeValue; 		
			
			 updateHTML(arnameXML); 
			
		} 
		else {
			alert("Problem: " + requ.statusText);
		}
	}
}
  
  
   function updateHTML(arnameXML) 
    { 
        //The node valuse will give actual data 
        var arnameText = arnameXML.childNodes[0].nodeValue; 

		if(arnameText != "false")
		{
			alert("Records are already Mapped. Choose another set");
			document.getElementById("viewId").value="";
			grpSizes=document.getElementById("grpSize").value;
		
		for(d=0;d<grpSizes;d++){
		if(document.getElementById("grpsDet"+d)!=null){
		document.getElementById("grpsDet"+d).value="";
		}
		}
		document.getElementById("subutton").disabled = true;
		
		document.getElementById("subutton").className='styleNew';
		}else{
		
		document.getElementById("subutton").disabled = false;
	
		document.getElementById("subutton").className='btn-lg btn-primary';
		
		}
		      
    } 


</script>




<style type="text/css">

.styleNew {font-family:Tahoma; color:#FFF;	font-size:11px;	font-weight:bold; background:url(file:../images/grad_02.jpg); cursor:hand;
			height:20px; background-color:#aaaaaa; border:1px solid #003366;}


</style>
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
                            <h2>View Point Mapping with Groups</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						

                <% String success = (String)request.getAttribute("success");%>
               
			  		
                    <% if(success!=null && success != ""){%>
                     <p id="p_error">Note: Successfully Mapped</p>
                      <% }else{%>
                     <p id="p_error">Note: Please select any value from all the dropdowns</p>
                  <%}%>
               
						<form class='form-horizontal' role='form' name="frmGroupsMap" id="frmGroupsMap" action="artifactMapping.html"  method="post" onsubmit="return myValidate();">
						  <input type="hidden" name="artiMapProcess" value="insertArtifactMap">
                  
                       		 <%String viewPointId=(String)request.getAttribute("viewPointId");
  								%>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Point:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                        
												 <select name="viewId" id="viewId" class="form-control" onchange="callViewPoint(this.value);">
												 <option selected="selected" value="">Select One</option>
													  <%
															 ArrayList viewList = (ArrayList) request.getAttribute("viewList");
													 if(viewList!=null && viewList.size()!=0){
													Iterator it = viewList.iterator();
													while(it.hasNext()){
														String[] s = (String[])it.next();
														String viewId = s[0];
														String viewName = s[1];		
														
																	
														if (viewId.equals(viewPointId)){
																	 %>
													  <option value="<%=viewId%>" selected="selected"><%=viewName%></option>
													  <%
																	 }
														 
													   else{
													   %>
													  <option  value="<%=viewId%>" ><%=viewName%></option>
													  <%
													   }
																}}
															
		
		
													%>
										  </select>
										  
										 	</div>
										</div>
									</div>
								</div>
                      
												<%
										
										 ArrayList grpList = (ArrayList) request.getAttribute("grpList");
										 
										  if(grpList!=null && grpList.size()!=0){
										   grpList.remove(grpList.size() - 1);
													 int i=0; 
													 int iViewsCnt=0;
													Iterator itgrp = grpList.iterator();
													while(itgrp.hasNext()){
														String[] sgrp = (String[])itgrp.next();
														String masteId = sgrp[0];
														String masteName = sgrp[1];
									
										 ArrayList grpDetList = (ArrayList) request.getAttribute("grpDetList");
										 
													 if(grpDetList!=null && grpDetList.size()!=0){
													
													 String layerId=null;
													Iterator itlob = grpDetList.iterator();
													%>
                      
					  		 <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'><%=masteName%>:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                         						<input type="hidden" name="masteName<%=i%>" id="masteName<%=i%>" value="<%=masteName%>" />
												  <select name="grpsDet<%=i%>" id="grpsDet<%=i%>" class="form-control" onchange="retrieveURL('mappingExist');">
													<option selected="selected" value="">Select One</option>
													<%	
												while(itlob.hasNext()){
													String[] slob = (String[])itlob.next();
													String masteIds = slob[0];
													String masteNames = slob[1];	
													String layerVak = slob[2];
													 layerId = slob[3];	
													String sqe = slob[4];
													
											  if(masteId.equals(masteIds)){
											
											 String cntValue=masteIds+"#"+layerId+"#"+sqe;
											if(i==1 ){
												String tempVpointName="";
												
												ArrayList viewPointList = (ArrayList) request.getAttribute("viewPointList");
												//System.out.println("viewPointList=="+viewPointList.size());
												
												if(viewPointList!=null && viewPointList.size()!=0 && iViewsCnt < viewPointList.size()){
													Iterator itViewPoint = viewPointList.iterator();
													while(itViewPoint.hasNext()){
														String[] sViewPoint = (String[])itViewPoint.next();
														String vPointId = sViewPoint[0];
														String vPointName = sViewPoint[1];	
														tempVpointName=vPointName;
														 String cntValue1=masteIds+"#"+vPointId+"#"+sqe;
														//System.out.println("inside if"+i+"=====vPointName==="+vPointName+"=====cntValue1==="+cntValue1);
												
																 %>
													<option value="<%=cntValue1%>"><%=vPointName%></option>
													<%
													iViewsCnt++;
																 }}}else {
																	// System.out.println("inside else"+i);%>
													<option value="<%=cntValue%>"><%=layerVak%></option>
													<%}
																 }
											
																 } %>
													<%
									
					
									
												%>
												  </select>
											</div>
										</div>
									</div>
								</div>
								
                            				<%}
											%>
                        
                       							 <%
					
															i++;}
																  }
																						
												%>
										 	
                       					 <input type="hidden" name="grpSize" id="grpSize" value="<%=grpList.size()%>" />
                      			
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-danger'  value="Map" name="subutton" id="subutton" type='submit' disabled="disabled">Map</button>
                                    </div>
                                    <div class='col-md-2'>
                                         <button class='btn-lg btn-primary' style='' name="button" type="button" onclick="callMapList();" value="Go to List Page">Go to List Page                                         </button>
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

