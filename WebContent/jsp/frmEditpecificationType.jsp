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
<script src="js/basic.js" type="text/javascript" ></script>
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
		if(document.frmEditSpecific.eventTypeId.value==""){
			alert("Please select any one Event Type.");
			document.frmEditSpecific.eventTypeId.focus();
			return false;
		}
		
		if(Trim(document.frmEditSpecific.txtSpec.value)==""){
			alert("Please enter a Specification name.");
			document.frmEditSpecific.txtSpec.focus();
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
                            <h2> Meetings: Specification Detail Master</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->


  
                    <% String statuscheck = (String)request.getAttribute("err");
					if(statuscheck!=null && statuscheck.equals("st")){
					%>
					<p id="p_error">Specification Name already exists.</p>
					
					<%
					}
					%>
  
 
  
		<form  class='form-horizontal' role='form' name="frmEditSpecific" id="frmEditSpecific" action="specification.html" method="post" onsubmit="return myValidate();" >
				<input type="hidden" name="specProcess" value="update">
	
	
				 <% ArrayList objSingleSpecDet=(ArrayList)request.getAttribute("objSingleSpecDet");
					 if(objSingleSpecDet!=null && objSingleSpecDet.size()!=0){ 
					 Iterator itSpec = objSingleSpecDet.iterator();
					  while(itSpec.hasNext()){
						    String [] specDetail  = (String[]) itSpec.next();
							String specId = specDetail[0];
							String activityId = specDetail[1];
							String activityName = specDetail[2];
							String specName = specDetail[3];
							String specDesc = specDetail[4];
							String activeStatus = specDetail[5];
							String addDate = specDetail[6];
				%>
				  <input type="hidden" name="specId" value="<%=specId%>">				
				   
				   		  <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											
												<select name="eventTypeId" id="eventTypeId" class="form-control" >
												<option selected="selected" value="">Select One</option>
												<%
												Vector eventTypeList = (Vector)request.getAttribute("eventObj");
												if(eventTypeList!=null && eventTypeList.size()!=0){
												Enumeration itEventType = eventTypeList.elements();
												while(itEventType.hasMoreElements()){
													String[] eduDet =(String[])itEventType.nextElement();
													String ETid = eduDet[0];
													String activityName1 = eduDet[1];
													if(activityId!=null && activityId.equals(ETid)){
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

				 	 						<span id-"span_astriesk">*</span>					
								</div>
							</div>
						</div>
						
						       
							    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Specification:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					 							<input name="txtSpec" type="text" id="txtSpec" class="form-control" value="<%=specName%>"  />
				 										<span id-"span_astriesk">*</span>	
											</div>
										</div>
									</div>
						
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					 							<textArea name="txtDesc" type="textArea" class="form-control" id="txtDesc"  /><%=specDesc%></textArea>
				 										<span id-"span_astriesk">*</span>	
											</div>
										</div>
									</div>
								</div>
			
									<%
								}
								}
								%>
		   
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style=''  type="button" value="cancel"  onclick="javascript:history.back(-1);">Cancel</button>
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
