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
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script> 
<script  src="js/ts_picker.js"></script>
 <script language="javascript" type="text/javascript">

//-----------------------------------is not alpha1----------------------------------------------------------------
function isnotAlpha1(str){
stringCheck="!@#$%^&*|<>?/=~`;:"+"\\"+"\'"+"\"";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
{ f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}

//------------------------DOSPACE--------------------------------------------------------------------------
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}

function isnotInteger(str){
stringCheck="0123456789.";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
{ f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}

function myValidation(){
		
	if(document.frmlifecycleproc.frmDate.value==""){
	alert("Select Date");
	document.frmlifecycleproc.frmDate.focus();
	return false;
	}
	
		
	if(document.frmlifecycleproc.SelArtifacttype.value==""){
	alert("Select Artifact Type");
	document.frmlifecycleproc.SelArtifacttype.focus();
	return false;
	}
	if(document.frmlifecycleproc.txtLifeProcees.value==""){
	alert("Lifecycle Process Name can not be empty");
	document.frmlifecycleproc.txtLifeProcees.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtLifeProcees.value.indexOf(" ")==0)
 {alert("Please enter a Lifecycle Process Name");
  document.frmlifecycleproc.txtLifeProcees.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtLifeProcees.value))
{ alert("Please enter a valid Lifecycle Process Name. Numbers and Symbols are not allowed");
  document.frmlifecycleproc.txtLifeProcees.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtLifeProcees.value)){
			alert("Please enter a valid Lifecycle Process Name");
	     	document.frmlifecycleproc.txtLifeProcees.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtLifeProcees.value)){
			alert("Enter Valid Lifecycle Process Name");
	     	document.frmlifecycleproc.txtLifeProcees.focus();
	  		return false;
			}
	if(document.frmlifecycleproc.txtLifeProcees.value.length>30)
  {alert("Lifecycle Process Name too long");
  document.frmlifecycleproc.txtLifeProcees.focus();
  return false;}
	
	if(document.frmlifecycleproc.selNolifeStage.value==""){
	alert("Select number of lifecycle stages");
	document.frmlifecycleproc.selNolifeStage.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.selNolifeStage.value=="1"){
	alert("Select more than 1 number of lifecycle stages");
	document.frmlifecycleproc.selNolifeStage.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.selStages.value==""){
	alert("Select the lifecycle stage");
	document.frmlifecycleproc.selStages.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.selStages.value!=""){
	var totstagesss=document.frmlifecycleproc.selNolifeStage.value;
	if(document.frmlifecycleproc.selStages.value>totstagesss){
	alert("Stage exceeded the number of lifecycle stages.");
	document.frmlifecycleproc.selStages.focus();
	return false;
	}
	}
	
	
	if(document.frmlifecycleproc.txtstagename.value==""){
	alert("Enter Stage Name");
	document.frmlifecycleproc.txtstagename.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtstagename.value.indexOf(" ")==0)
 {alert("Enter a Stage Name");
  document.frmlifecycleproc.txtstagename.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtstagename.value))
{ alert("Enter Valid Stage Name");
  document.frmlifecycleproc.txtstagename.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtstagename.value)){
			alert("Enter Valid Stage Name");
	     	document.frmlifecycleproc.txtstagename.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtstagename.value)){
			alert("Enter Valid Stage Name");
	     	document.frmlifecycleproc.txtstagename.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtstagename.value.length>30)
			  {alert("Enter Stage Name within 30");
			  document.frmlifecycleproc.txtstagename.focus();
			  return false;}
	
	if(document.frmlifecycleproc.txtInput.value==""){
	alert("Enter Input");
	document.frmlifecycleproc.txtInput.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtInput.value.indexOf(" ")==0)
 {alert("Enter a Input");
  document.frmlifecycleproc.txtInput.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtInput.value))
{ alert("Enter Valid Input");
  document.frmlifecycleproc.txtInput.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtInput.value)){
			alert("Enter Valid Input");
	     	document.frmlifecycleproc.txtInput.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtInput.value)){
			alert("Enter Valid Input");
	     	document.frmlifecycleproc.txtInput.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtInput.value.length>30)
			  {alert("Enter Input within 30");
			  document.frmlifecycleproc.txtInput.focus();
			  return false;}
	
	
	if(document.frmlifecycleproc.txtprocess.value==""){
	alert("Enter process");
	document.frmlifecycleproc.txtprocess.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtprocess.value.indexOf(" ")==0)
 {alert("Enter a process");
  document.frmlifecycleproc.txtprocess.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtprocess.value))
{ alert("Enter Valid process");
  document.frmlifecycleproc.txtprocess.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtprocess.value)){
			alert("Enter Valid process");
	     	document.frmlifecycleproc.txtprocess.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtprocess.value)){
			alert("Enter Valid process");
	     	document.frmlifecycleproc.txtprocess.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtprocess.value.length>30)
			  {alert("Enter Process within 30");
			  document.frmlifecycleproc.txtprocess.focus();
			  return false;}
		
			
	if(document.frmlifecycleproc.txtDesc.value==""){
	alert("Enter Description");
	document.frmlifecycleproc.txtDesc.focus();
	return false;
	}
	if(document.frmlifecycleproc.selControls.value==""){
	alert("Select number of controls/votes");
	document.frmlifecycleproc.selControls.focus();
	return false;
	}
	if(document.frmlifecycleproc.selVotes.value==""){
	alert("Select number of votes required by");
	document.frmlifecycleproc.selVotes.focus();
	return false;
	}
	
	if(document.frmlifecycleproc.txtOutput.value==""){
	alert("Enter output");
	document.frmlifecycleproc.txtOutput.focus();
	return false;
	}
	if(document.frmlifecycleproc.txtOutput.value.indexOf(" ")==0)
 {alert("Enter a output");
  document.frmlifecycleproc.txtOutput.focus();
 return false;}
 
 if(isnotAlpha1(document.frmlifecycleproc.txtOutput.value))
{ alert("Enter Valid output");
  document.frmlifecycleproc.txtOutput.focus();
   return false; }
   
    if(Dospace(document.frmlifecycleproc.txtOutput.value)){
			alert("Enter Valid output");
	     	document.frmlifecycleproc.txtOutput.focus();
	  		return false;
			}
			
			 if(isnotInteger(document.frmlifecycleproc.txtOutput.value)){
			alert("Enter Valid output");
	     	document.frmlifecycleproc.txtOutput.focus();
	  		return false;
			}
			 if(document.frmlifecycleproc.txtOutput.value.length>30)
			  {alert("Enter Output within 30");
			  document.frmlifecycleproc.txtOutput.focus();
			  return false;}
	
	
	return true;
}


var version = navigator.appVersion; 

function showKeyCode(e) { 
var keycode = (window.event) ? event.keyCode : e.keyCode; 

if ((version.indexOf('MSIE') != -1)) { 
if (keycode == 116) { 
event.keyCode = 0; 
event.returnValue = false; 
return false; 
} 
} 
else { 
if (keycode == 116) { 
return false; 
} 
} 
} 

var message="Sorry, right-click has been disabled"; 
/////////////////////////////////// 
function clickIE() {if (document.all) {(message);return false;}} 
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) { 
if (e.which==2||e.which==3) {(message);return false;}}} 
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;} 
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;} 
document.oncontextmenu=new Function("return false") 

window.onbeforeunload = function() {
  return "Data will be lost if you leave the page, are you sure?";
};


//-------------------------------- Lifecycle validation Ajax Script ------------------------------------------------

var httpRequest;

function lifecyceStat()
{

if(document.frmlifecycleproc.txtLifeProcees.value!="" && document.frmlifecycleproc.txtLifeProcees.value.indexOf(' ')!=0)
	{

   var chsLifecycleName=document.frmlifecycleproc.txtLifeProcees.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "UsrSignupAjax.html?process=checkLifecycle&lifecycleN="+chsLifecycleName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText != "false")
		{
			alert("Lifecycle Name already Exists Choose Another !");
			document.frmlifecycleproc.txtLifeProcees.value="";
			document.frmlifecycleproc.txtLifeProcees.focus();
		}
		      
    } 


document.getElementById('txtDesc').addEventListener('keyup', function () {
			this.style.height = 0; // this is necessary to make it shrink when deleting
			this.style.height = this.scrollHeight + 'px';
		}, false);
		
		

		
function stageStat(){


//alert(1);

var artCnt=document.frmlifecycle.artCount.value;
//alert(artCnt);

if(artCnt!=0){
for(var k=1;k<=artCnt;k++){
var chName = "staCount"+k;

 var stageName1=document.getElementById(chName).value; 
 //alert(stageName1);
 if(stageName1==document.frmlifecycleproc.txtstagename.value){
alert("Stage Name already Exists");
document.frmlifecycleproc.txtstagename.value="";
document.frmlifecycleproc.txtstagename.focus();
return false;
}

}
}
return true;
}		
	












</script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<%
 
            String fstname=(String)session.getAttribute("firstName");
			  String userLname=(String)session.getAttribute("lastName");
			  
			  
			  String fullNam=fstname+" "+userLname;
                String lifecycleProNameinputType = (String) request.getAttribute("lifecycleProName");
                String numStage = (String) request.getAttribute("numofStage");
                String dateofCreat = (String) request.getAttribute("dateofCreation");
                String addArtitype = (String) request.getAttribute("addArtifacttype");	
                                
                String cntValue = (String) session.getAttribute("cntValue");
                
                String CurStage=(String) request.getAttribute("CurStage");
                
                String descripitions=(String) request.getAttribute("descripition");
                
				String dupmsg=(String) request.getAttribute("dupMsg");
 
 
 if(dupmsg==null){
 dupmsg="";
 
 }else{
 }
 
                boolean butStatus=true;
                String curStage="";
                if(CurStage==null){
                	 curStage="1";
                }else{
 int tempCurSt=Integer.parseInt(CurStage);
 int finalCurSt=0;
 if(dupmsg!=""){
 finalCurSt=tempCurSt;
 }else{
 finalCurSt=tempCurSt++;
 
 }
 curStage=String.valueOf(tempCurSt);
 
 int tempNumSts=Integer.parseInt(numStage);
 
 if(tempCurSt>tempNumSts){
                	
                		butStatus=false;
                		dateofCreat = "";
                		addArtitype = "";	
                		lifecycleProNameinputType = "";
                		numStage = "";
						curStage="";
						descripitions="";
										 
                	}else{
                		butStatus=true;
                	}
 

                }
                                           
                System.out.println("butStatus"+butStatus);
             /*   if(cntValue.equalsIgnoreCase("0")){
                	
                	cntValue="1";	
                }else{
                	cntValue=cntValue;
                }*/
                if (addArtitype == null) {

                	addArtitype = "";
				}
                
                else{
                	
                	if(addArtitype.equalsIgnoreCase("hpsoaProjectArtifact")){
                		addArtitype="Project";               		
                	}else if(addArtitype.equalsIgnoreCase("hpsoaApplicationArtifact")){
                		addArtitype="Application";  
                	}else if(addArtitype.equalsIgnoreCase("businessServiceArtifact")){
                		addArtitype="Service";  
                	}else if(addArtitype.equalsIgnoreCase("implementationArtifact")){
                		addArtitype="Implementaion";  
                	}else if(addArtitype.equalsIgnoreCase("hpsoaProcessArtifact")){
                		addArtitype="Business Process";  
                	}
                	 
                }
                
                if (descripitions == null) {

                	descripitions = "";
				}
                
                else{
                	
                	
                }
				
                if (lifecycleProNameinputType == null) {

                	lifecycleProNameinputType = "";
				}
				
                
                if (numStage == null) {

                	numStage = "";
				}
                if (dateofCreat == null) {

                	dateofCreat = "";
				}
               
    %>

	
	



<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout"  onload="JavaScript:document.body.focus();" onkeydown="return showKeyCode(event)" theme-bg="bg1">

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
                            <h2>Lifecycle Process: Create</h2>
							   <% String msg=(String)request.getAttribute("Success");%>
					  
                                            
                            <%if(msg!=null) {%>
                            <script language="JavaScript" type="text/javascript">
		
								 function popitup(url) {
									 if(confirm(msg))
									 {
										newwindow=window.open(msg,'name','height=450,width=800,scrollbars=no,resizable=no,top=300,left=500,toolbar=no,menubar=no,dialog=yes');
														if (window.focus) {newwindow.focus()}
														return false;
									 }
									 else
									 {
										 return;
									 }
								
								}
                              </script>
                            <%}%>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
                  
                   
						  
                        <form class='form-horizontal' role='form' name="frmlifecycleproc" id="frmlifecycleproc" method="post" action="SysMgmt.html?process=callArtadd"  onsubmit="return myValidation();">
						<input type="hidden" name="fullName" value="<%=fullNam%>" />

                             
							<div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Lifecycle:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
								               <input name="frmDate" type="text" id="frmDate"  class="form-control" value="<%=dateofCreat%>"  readonly="true"/>
                               					<a href="javascript:show_calendar('document.frmlifecycleproc.frmDate', document.frmlifecycleproc.frmDate.value);"><i id="calendar1" class="fa fa-calendar"></i></a> 
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
							   					
							   				
											
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Artifact Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
						 
											  <select name="SelArtifacttype" class="form-control" id="SelArtifacttype">
												<option selected="selected" value="">Select One</option>
												<%
																	   
																			Map<String,String> artiType = (HashMap) session.getAttribute("artifactType");
																			if (artiType != null && artiType.size() != 0) {
																		   Iterator iter = artiType.entrySet().iterator();
																				//String [] userType = {ID, name };
																				while (iter.hasNext()) {
																					Map.Entry me = (Map.Entry)iter.next();
																					String artifactType =(String) me.getValue();
																					String artifactId =(String) me.getKey(); 
																					if (artifactId.equals(addArtitype)) {
				
																%>
												<option value="<%=artifactId%>" selected="selected" ><%=artifactType%></option>
												<%
																 } else {
																%>
												<option value="<%=artifactId%>" ><%=artifactType%></option>
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
							   					
												
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Lifecycle Process Name:</label>
                                    
                             	 <% if(lifecycleProNameinputType.equalsIgnoreCase("")){ %>
									
									 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
							  						 
                            					<input type="text" name="txtLifeProcees" id="txtLifeProcees" class="form-control" />
												 <span id="span_astriesk">*</span>
											
											</div>
										</div>
									</div>
							   					
							
                           					 <%} else { %>
											 
										 <div class='col-md-8'>
                                      		  <div class='col-md-3 indent-small'>
                                            		<div class='form-group internal'>
							
												<input type="text" name="txtLifeProcees" value="<%=lifecycleProNameinputType %>" readonly="readonly"  class="form-control" />
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
							   					
							   

                            					<% } %>
											
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of Lifecycle Stages:</label>
                                    
								
								<% if(numStage=="") {%>
									
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="selNolifeStage" class="form-control" id="selNolifeStage">
												  <option selected="selected" value="">Select One</option>
												  <%
																	   
																			ArrayList numlifeCycle = (ArrayList) session.getAttribute("lifeCycle");
																			if (numlifeCycle != null && numlifeCycle.size() != 0) {
																				Iterator  lifeCycle = numlifeCycle.iterator();
																				//String [] userType = {ID, name };
																				while (lifeCycle.hasNext()) {
																					String strType = (String) lifeCycle.next();
																					String numlifeStage = strType;
																				 
																				   
				
																%>
												  <option value="<%=numlifeStage%>"><%=numlifeStage%></option>
												  <%
																					
																				}
																			}
																%>
												</select>
                                 			<span id="span_astriesk">*</span>
								  		
											</div>
										</div>
									</div>
							   					
                                <%}else{%>
								
								<div class='col-md-8'>
                                     <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
								            <input type="text" name="selNolifeStage" id="selNolifeStage" value="<%=numStage%>" readonly="readonly"  class="form-control"/>
                                				<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
							   					
								
                                <%}%>
							
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Stage:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
						  
												<select name="selStages" class="form-control" id="selStages">
												  <option selected="selected" value="">Select One</option>
													<%
																		   
																				ArrayList StageCycle = (ArrayList) session.getAttribute("StageCycle");
																				if (StageCycle != null && StageCycle.size() != 0) {
																					Iterator  StaCycle = StageCycle.iterator();
																				  
																					while (StaCycle.hasNext()) {
																						String strType = (String) StaCycle.next();
																						String Stage = strType;
																					 
																						if (Stage.equals("")) {
					
																	%>
													<option value="<%=Stage%>" selected="selected" ><%=Stage%></option>
													<%
																	 } else {
																	%>
													<option value="<%=Stage%>" ><%=Stage%></option>
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
							 	
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Stage Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
                            					<input type="text" name="txtstagename" class="form-control"  id="txtstagename"/>
                              						<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
							  	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Input:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<input type="text" name="txtInput" class="form-control" id="txtInput"/>
												  <span id="span_astriesk">*</span>
							  				</div>
										</div>
									</div>
						  
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Process:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<input type="text" name="txtprocess" class="form-control"  id="txtprocess"/>
											   <span id="span_astriesk">*</span>
											 </div>
											</div>
										</div>
								
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<textarea rows="4" cols="20" name="txtDesc" class="form-control" id="txtDesc"></textarea>
											   <span id="span_astriesk">*</span>
											 </div>
										</div>
									</div>
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Numbers of Controls/Votes:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												  <select name="selControls" class="form-control" id="selControls">
													<option selected="selected" value="">Select One</option>
													  <%
																		   
																				ArrayList numberVoters = (ArrayList) session.getAttribute("numberVoters");
																				if (numberVoters != null && numberVoters.size() != 0) {
																					Iterator  numberContrVoters = numberVoters.iterator();
																					//String [] userType = {ID, name };
																					while (numberContrVoters.hasNext()) {
																						String strType = (String) numberContrVoters.next();
																						String ContrVoters = strType;
																					 
																						if (ContrVoters.equals("")) {
					
																	%>
													  <option value="<%=ContrVoters%>" selected="selected" ><%=ContrVoters%></option>
													  <%
																	 } else {
																	%>
													  <option value="<%=ContrVoters%>" ><%=ContrVoters%></option>
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
							  
							   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Votes Required By:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<select name="selVotes" class="form-control" id="selVotes">
												  <option selected="selected" value="">Select One</option>
												  <%
																	   
																			Map<String,String> votesReq = (HashMap) session.getAttribute("votesReq");
																			if (votesReq != null && votesReq.size() != 0) {
																				 Iterator iter = votesReq.entrySet().iterator();
																				while (iter.hasNext()) {
																					Map.Entry me = (Map.Entry) iter.next();
																					String Voters =(String)me.getValue() ;
																					String votersId=(String)me.getKey();
																					if (Voters.equals("")) {
				
																%>
												  <option value="<%=votersId%>" selected="selected" ><%=Voters%></option>
												  <%
																 } else {
																%>
												  <option value="<%=votersId%>" ><%=Voters%></option>
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
							  
							   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Output:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
											  <input type="text"name="txtOutput" class="form-control"  id="txtOutput"/>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
							
						   
                           
                                 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' type='submit' value="ADD/SAVE STAGE"  name="method" onClick="return(onValidate());">ADD/SAVE STAGE</button>
                                    </div>
                                  </div>
                             
                           
                              <s:text name="Please fill in the form below:" />
                              <!-- **************************************** Part A of the form Ends here *********************************************** -->
                         
                        </form>
                 			
							  <p> Displaying results 1-5 </p>
                     
					 		<div class="form-group">
								<div class="col-md-12 gp">
									<div class="row">
										
										<div class="col-md-1">
											<label class="control-label label1">Lifecycle</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Total Stages</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Date of Creation</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Created By</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Stage</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Stage Name</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Input</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Process</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Control</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Output</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1">Description</label>
										</div>
									</div>
								</div>
							</div>
                       
                      <form class='form-horizontal' role='form' name="frmlifecycle" id="frmlifecycle" method="post" action="SysMgmt.html?process=systinetLifecycle"  onsubmit="">
                       
					    <% ArrayList artifactName=(ArrayList)session.getAttribute("artifactData");
     
								 if (artifactName != null && artifactName.size() != 0) { 
									 Iterator evotesartifactName = artifactName.iterator();
									 //String [] userType = {ID, name };
									 while (evotesartifactName.hasNext()) {
										 String strType[] = (String[]) evotesartifactName.next();
										
										String lifecycleProName=strType[0];
									String numofStage=strType[1];
									String dateofCreation=strType[2];
									String createdBy=strType[3];
									String stage=strType[4];
									String stageName=strType[5];
									String input=strType[6];
									String process=strType[7];
									String voter=strType[8];
									String output=strType[9];
									String descripition=strType[10];
									String addArtifacttype=strType[11]; 
									String votes=strType[12]; 		
								   
							
							%>
							
							<div class="form-group">
								<div class="col-md-12 gp">
									<div class="row">
										
										<div class="col-md-1">
											<label class="control-label "><%=lifecycleProName%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=numofStage%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=dateofCreation%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=fullName%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=stage%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=stageName%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=input%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=process%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=voter%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=output%></label>
										</div>
										<div class="col-md-1">
											<label class="control-label "><%=descripition%></label>
										</div>
									</div>
								</div>
							</div>
                       
                        <%
							}
						   }
						   else{
							   %>
                       			 <div class="form-group">
									<div class="col-md-12 gp">
										<div class="row">
											<div class="col-md-5">
											</div>
											<div class="col-md-5">
												No DATA
										  </div>
										</div>
									</div>
								</div>
                       
                                 <%	} if (artifactName != null && artifactName.size() != 0) { %>
                                 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="submit"  type='submit'>Submit</button>
                                    </div>
                       			</div>
                        <% } %>
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
			


<script type="text/javascript">


function onValidate()
{
	
	if(document.frmlifecycleproc.frmDate.value==""){
		alert("Startdate cannot be empty");
		document.frmlifecycleproc.frmDate.focus();
		return false;
	}
	if(document.frmUserSignup.toDate.value==""){
		alert("Lastdate cannot be empty");
		document.frmUserSignup.toDate.focus();
		return false;
	}
	
	return true;
}
</script>
</body>


</html>
