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
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<script>
function Trim(sString) 
{
	while (sString.substring(0,1) == ' '){
	sString = sString.substring(1, sString.length);
	}
	while (sString.substring(sString.length-1, sString.length) == ' '){
	sString = sString.substring(0,sString.length-1);
	}
return sString;
}

function myValidate(){
		if(document.myform.selEventType.value==""){
			alert("Please select any one Event Type.");
			document.myform.selEventType.focus();
			return false;
		}
		
		if(Trim(document.myform.txtSpec.value)==""){
			alert("Please enter a Specification name.");
			document.myform.txtSpec.focus();
			return false;
		}
		/*if(document.myform.selEventType.value==""){
			alert("Please select any one User Type.");
			document.myform.selEventType.focus();
			return false;
		}*/
		

		return true;
	}

</script>


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
                            <h2>Meetings: Specification Detail Master</h2>
					</div>
					
					
			<div class='panel-body'>
	
<form name="myform" id="myform" action="specification.html" method="post" onsubmit="return myValidate();"  >
	<input type="hidden" name="specProcess" value="insertSpec">


	
			<p>Add A Specification Detail:</p>
				
				  <% String statuscheck = (String)request.getAttribute("err");
					if(statuscheck!=null && statuscheck.equals("st")){
					%>
					<p id="p_error">Specification Name already exists.</p>
					
					<%
					}
					%>
				  
				  <div class='form-group'>
				 	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type :</label>
					
					<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
								<select name="selEventType" id="selEventType" class="form-control" >
										<option selected="selected" value="">Select One</option>
										<%
										Vector activityDetails = (Vector)request.getAttribute("eventObj");
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
				 	 				<span class="asterisk" id="span_astriesk" >*</span>					 
								</div>
							</div>
						</div>
						
						
				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Specification:</label>
				   <div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
							 <input name="txtSpec" type="text" id="txtSpec" class="form-control" size="32" />
				 	 			<span class="asterisk" id="span_astriesk">*</span>		
							</div>
						</div>
					</div>

				
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
					 <div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   		<textArea name="txtDesc"  id="txtDesc" class="form-control" rows="3" size="30" /></textarea>	
							</div>
						</div>
					</div>
			   

			      <div class='col-md-offset-5 col-md-1'>
                      <button class='btn-lg btn-primary' type="submit" value="Add">Add</button>
				</div>
				
				 <div class='col-md-1'>
                      <button class='btn-lg btn-primary' type="button" value="Cancel" onclick="location.href='index.jsp'">Cancel</button>
				</div>
					
			</div>
		</form>	
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
