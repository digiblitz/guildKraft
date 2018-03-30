<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlcmro.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>
<script language="javascript">

	function validateMap(){
		
		if(document.frmMeeMapACAreaMaster.areaId.value==""){
			alert("Select any one Area");
			document.frmMeeMapACAreaMaster.areaId.focus();
			return false;
		}
		
		if(document.frmMeeMapACAreaMaster.areaChairId.value==""){
			alert("Enter Area Chair Code.");
			document.frmMeeMapACAreaMaster.areaChairId.focus();
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
							<h2> Meetings: Map Area Chair To An Area</h2>
						</div>
						
						
						<form name="frmMeeMapACAreaMaster" id="frmMeeMapACAreaMaster" method="post" action="EventOrgRenewal.html" onsubmit="return validateMap();">
						<input type="hidden" name="eventProcess" value="mapAreaChairAreaPerson">
							
						<div class='panel-body'>
							<p>Mapping Information</p>
						  
						  	<p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
							
						    <%
							  String salespersonCodeErr = (String)request.getAttribute("err");
							  if(salespersonCodeErr!=null){
							  %>
							 
							  <p id="p_error"><%=salespersonCodeErr%> Area Chair ID Does not exist</p>
								
							  <%
							  }
							  %>
						  
						 
					<div class='form-group'>
				 
                         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area: </label>
							
					<div class='col-md-8'>
                       <div class='col-md-3 indent-small'>
                          <div class='form-group internal'>
							<select name="areaId" id="areaId" class="form-control" >
							<option selected="selected" value="">Select One</option>
							<%
									ArrayList arrayAreaList = (ArrayList)request.getAttribute("allAreaList");
									if(arrayAreaList!=null && arrayAreaList.size()!=0){
										Iterator itAreaList = arrayAreaList.iterator();
										while(itAreaList.hasNext()){
											String[] strAreaList = (String [])itAreaList.next(); 
											//String[] strAreaList = {area_id, area_code, area_name};
											String areaId = strAreaList[0];
											String areaCode = strAreaList[1];
											String areaName = strAreaList[2];
											%>
											<option value="<%=areaId%>" ><%=areaName%></option>
											 <%
										}
									}
							%>
							</select>
							<span class="asterisk" id="span_astriesk">*</span> 
							</div>
						</div>
					</div>
					
					
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Area Chair ID:</label>
				
					<div class='col-md-8'>
                       <div class='col-md-3 indent-small'>
                          <div class='form-group internal'>	
							<input name="areaChairId" type="text" class="form-control" />
							<span class="asterisk" id="span_astriesk">*</span>	
							</div>
						</div>
					</div>						
				</div>
				
				<div class='form-group'>
                         <div class='col-md-offset-4 col-md-1'>
                              <button class='btn-lg btn-primary' type='submit' name="Submit" value="Assign">Assign</button>
						</div>
						
						<div class='col-md-1'>
                              <button class='btn-lg btn-danger'  name="Submit" type='reset' value="Reset">Reset</button>
						</div>
							
					</div>
					  </form>
				  
			<!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				

            </div>
			
					
    
</div>	
</div>	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

        
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
