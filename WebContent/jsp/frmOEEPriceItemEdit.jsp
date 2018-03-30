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
	len = document.myform.orgStatus.length ;
	for(i=0;i<len;i++){
	if(document.myform.orgStatus[i].checked)
	{ chosen= document.myform.orgStatus[i].value; }
	}
	if(chosen==""){
	alert("Please Select Organizer Edit status");
	return false;
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
						
						<h2>Online Event Entries: Edit</h2>
						
						</div>
			<!--==============================================content start here============================================-->
				
				  
				  <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						

 
				 <p>Required fields are marked with an asterisk<span style="color:#FF0000">*</span></p>
            
							<% String statuscheck = (String)request.getAttribute("err");
							
							if(statuscheck!=null && statuscheck.equals("st")){
							%>
						<p id="p_error">Item Name Already Exists. Try Again</p>
				
							<%
							}
							%>
           
								<%
								 ArrayList itemDetails=(ArrayList)request.getAttribute("singleDet");
								 if(itemDetails!=null && itemDetails.size()!=0){ 
								 Iterator it = itemDetails.iterator();
								  while(it.hasNext()){
										String [] itemDetail  = (String[])it.next();
										String itemId = itemDetail[0];
										String itemName = itemDetail[1];
										String orgStatus = String.valueOf(itemDetail[2]);
										String itemStatus= String.valueOf(itemDetail[3]);
										
								%>
		 
		 
					 <form class='form-horizontal' role='form' name="myform" id="myform" method="post" action="./OEEPriceItem.html" onsubmit="return myValidate();" >
					<input type="hidden" name="cmd" value="updateItem"/>
					<input type="hidden" name="itemId" value="<%=itemId%>">
           				
						 <div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
								              <input type="text" name="txtItemName" class="form-control" value="<%=itemName%>" />
                  								<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
						
						 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Editable By Organizer:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>  
											
												<%if(orgStatus!=null && orgStatus.trim().length()!=0){
												  if(orgStatus.equalsIgnoreCase("true")){ %> 
											<input type="radio" size="10" name="orgStatus" style="margin:12px" checked value="true" /> Yes
											<input type="radio" size="10" name="orgStatus" style="margin:12px" value="false" /> No
											<%}else if(orgStatus.equalsIgnoreCase("false")){%>
											<input type="radio" size="10" name="orgStatus" style="margin:12px" value="true" /> Yes
											<input type="radio" size="10" name="orgStatus" style="margin:12px" checked value="false" /> No
											<%}}else{%>
											<input type="radio" size="10" name="orgStatus"  style="margin:12px" value="true" /> Yes
											<input type="radio" size="10" name="orgStatus" style="margin:12px" value="false" /> No
											<%}%>
											<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
				
								<%}}%>
						
						 		<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="advDimButton" type='submit' value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="advDimButton" type="button" style='' value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
                                    </div>
                                </div>
  
  						</form>
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
