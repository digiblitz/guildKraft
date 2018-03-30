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

<script language="javascript" type="text/javascript">
function showHideRadio(radioNam,divId,radVal){
		if(document.forms['myform'].elements[radioNam].value == radVal){
				document.getElementById(divId).style.display = "block";	
		}
		else {
				document.getElementById(divId).style.display = "none";	
		} 
}
function selType1(){
chosenType="";
	len = document.myform.selType.length ;
	for(i=0;i<len;i++){
		if(document.myform.selType[i].selected){
			chosenType= document.myform.selType[i].value;
		}
	}
	if(chosenType!=null && chosenType=="variable"){
	document.getElementById('ridAddUser').style.display = "block";
	//switchDiv('ridAddUser');
	}else if(chosenType!=null && chosenType=="Fixed"){
	document.getElementById('ridAddUser').style.display = "none";
	//showHideRadio('chosenType','ridAddUser','Fixed');
	//switchDiv('');
	}

}

function myValidate(){
	if(document.myform.txtItemName.value==""){
		alert("Please Enter Item Name");
		document.myform.txtItemName.focus();
		return false;
	}
	
	if((document.myform.txtItemName.value.indexOf('  ')!=-1)||(document.myform.txtItemName.value.indexOf(' ')==0)){
	alert("Enter valid Item Name");
	document.myform.txtItemName.focus();
	return false;
	}
	if(document.myform.txtItemName.value.length > 255){
	alert("Enter Item Name within 255 characters");
	document.myform.txtItemName.focus();
	return false;
	}
	chosen="";
	len = document.myform.selType.length ;
	for(i=0;i<len;i++){
	if(document.myform.selType[i].selected)
	{ chosen= document.myform.selType[i].value; }
	}
	if(chosen==""){
	alert("Please Select Item Type");
	return false;
	}else if(chosen=="variable"){
	chosen="";
	len = document.myform.varType.length ;
	for(i=0;i<len;i++){
	if(document.myform.varType[i].checked)
	{ chosen= document.myform.varType[i].value; }
	}
	if(chosen==""){
	alert("Please Select Variable type Option");
	return false;
	}
	}
	return true;
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
                            <h2>Online Event Entries: Create New Item</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						  
								<p>Please create the required Item Details. </p>
						 
							
								<form class='form-horizontal' role='form' name="myform" id="myform" action="./OEEAddPrice.html" method="post" onsubmit="return myValidate();">
								<input type="hidden" name="cmd" value="initPrice">
								<%String eventId=(String)request.getAttribute("eventId");%>
								<input type="hidden" name="eventId" value="<%=eventId%>">
							
									<p>Required fields are marked with an asterisk<span style="color:#FF0000">*</span></p>
										
										<% String statuscheck = (String)request.getAttribute("err");
										
										if(statuscheck!=null && statuscheck.equals("st")){
										%>
										
										<p id="span_error">Item Name Already Exists.Try Again</p>
										
										<%
										}
										%>
										<%String newItem=(String)request.getAttribute("newItem");%>
										<input type="hidden" name="newItem" value="<%=newItem%>">
									  
									  
									  
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input  type="text" name="txtItemName" id="txtItemName" class="form-control"  />
											  		<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
													
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="selType" id="selType" class="form-control"  onChange="selType1();">
												<option selected="selected" value="">Select One</option>
												<option value="fixed">Fixed</option>
												<option value="variable">Variable</option>
												</select>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
												
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Option for Variable Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="radio" size="10" style="margin:12px" name="varType" value="per day" />per day
												<input type="radio" size="10" style="margin:12px" name="varType" value="for each" />for each
												<span id="span_astriesk">*</span>
											
											</div>
										</div>
									</div>
								</div>
										  
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit"  value="Create">Create</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="reset"  value="Reset" style=''>Reset</button>
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
