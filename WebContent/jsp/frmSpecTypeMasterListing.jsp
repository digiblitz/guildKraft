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
<script language="javascript">
	function validateSpecList(){
		if(document.frmMeeSpecMaster.status.value==""){
			alert("Please select any one Status.");
			document.frmMeeSpecMaster.status.focus();
			return false;
		}
		return true;
	}

</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


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
                            <h2>Meetings: Specification Detail Master</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				  
					<form class='form-horizontal' role='form' name="frmMeeSpecMaster" id="frmMeeSpecMaster" action="specification.html" method="post" onsubmit="return validateSpecList();" >
						 <input type="hidden" name="specProcess" value="listSpecMaster">
								   
								<div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                     <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <select name="status" id="status" class="form-control" >
													<option selected="selected" value="">Select One</option>
														<%			String statusStr = (String)request.getAttribute("status");
																	String[] status = {"Active","Deactive"};
																	String[] value = {"true","false"};
																	for(int i=0;i<2;i++){
																	if(statusStr!=null && statusStr.equalsIgnoreCase(value[i])){
																							%>
																	<option value="<%=value[i]%>" selected="selected"><%=status[i]%></option>
																 <%
																 }
																 else{
																 %>
																 <option value="<%=value[i]%>"><%=status[i]%></option>
																 <%
																 }
														  }
														
														  %>							
												 </select>		
											</div>
										</div>
									</div>
								</div>
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" name="search" value="Submit">Submit</button>
                                    </div>
								</div>
						</form>
								
						  <% String error = (String)request.getAttribute("Error");
					if(error!=null && error.equals("Error")){
					%>
					
					<p id="p_error">Specification Type Name is already Processed .</p>
					
					<%
					}
					%>
								  <div class="form-group">
									<div class="row">
										<div class="col-md-3">
											<label class="control-label label1" >Specification Type Name</label>
										</div>
										<div class="col-md-3">
											<label class="control-label label1" >Specification Description </label>
										</div>
										<div class="col-md-3">
											<label class="control-label label1" >Activity Type Name</label>
										</div>
										<div class="col-md-1">
											<label class="control-label label1" >Edit</label>
										</div>
										<div class="col-md-2">
											<label class="control-label label1" >Status</label>
										</div>
									</div>
								</div>
					<%
		   		
					 ArrayList objAllSpecDetails=(ArrayList)request.getAttribute("objAllSpecDetails");
					 if(objAllSpecDetails!=null && objAllSpecDetails.size()!=0){ 
					 Iterator itSpec = objAllSpecDetails.iterator();
					  while(itSpec.hasNext()){
						    String [] specDetail  = (String[]) itSpec.next();
							String specId = specDetail[0];
							String activityId = specDetail[1];
							String activityName = specDetail[2];
							String specName = specDetail[3];
							String specDesc = specDetail[4];
							String activeStatus = specDetail[5];
							String addDate = specDetail[6];
							boolean activeStat = Boolean.valueOf(activeStatus).booleanValue();
							String buttonValue ="";
							if(activeStat){
							 	buttonValue = "Deactivate";
							 }else{
							  	buttonValue = "Activate";
							 }
							 
							
							//String [] priceDetail  = {priceDetId,dueDatePrice,afterDueDatePrice,userTypeName};
		   %>
							<form  class='form-horizontal' role='form' name="frmDisplaySpecList" method="post" action="specification.html">		
							<input name="specProcess" type="hidden" value="selectSpecDet">
							<input name="specId" type="hidden" value="<%=specId%>">
							<input name="activityId" type="hidden" value="<%=activityId%>">
							
							<div class="form-group">
									<div class="row">
										<div class="col-md-3">
											<label class="control-label " ><%=specName%></label>
										</div>
										<div class="col-md-3">
											<label class="control-label " ><%=specDesc%> </label>
										</div>
										<div class="col-md-3">
											<label class="control-label " ><%=activityName%> </label>
										</div>
										<div class="col-md-1">
											  <button class='btn-sm btn-primary' name="btnSubmit" type="submit"  value="Edit">Edit</button>
										</div>
										<div class="col-md-2">
											  <button class='btn-sm btn-primary' name="btnSubmit" type="submit"  value="<%=buttonValue%>"><%=buttonValue%></button>
										</div>
									</div>
								</div>
						</form>
		   
					      <%	}
									}else {
								%>
								<div class='form-group'>
									<div class="container"> 
										<div class='col-md-4'>
											</div>
										
											<div class='col-md-4'>
												No Records Found
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
