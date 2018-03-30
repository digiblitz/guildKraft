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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>

<script language="javascript">
	function validateMapAreaZip(){
		if(document.frmMeeMapACAreaMaster.areaId.value == "" ){
			alert ( "Please select Area Name." );
			document.frmMeeMapACAreaMaster.areaId.focus();
			return false;
    	}
		
		if(document.frmMeeMapACAreaMaster.stateId.value == "" ){
			alert ( "Please select any one State." );
			document.frmMeeMapACAreaMaster.stateId.focus();
			return false;
    	}
		
		if(document.frmMeeMapACAreaMaster.zipCodeFrom.value == "" ){
			alert ( "Enter From Zip Code." );
			document.frmMeeMapACAreaMaster.zipCodeFrom.focus();
			return false;
    	}
		
		if(document.frmMeeMapACAreaMaster.zipCodeTo.value == "" ){
			alert ( "Enter To Zip Code." );
			document.frmMeeMapACAreaMaster.zipCodeTo.focus();
			return false;
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
                            <h2>Meetings:Map Area To State &amp; Zipcode</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Mapping Information</p>
							<p>Fields mark with asterisk(*) are mandatory</p>
							
						<!--==============================Form Description=================================-->
							
                            <%
						  	String err = (String) request.getAttribute("err");
							if(err!=null){
						  %>
						  
						  <p>The zip code range provided by you for this area and state already exists and the data got replaced with new data.</p>
						  
						   <%}%>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmMeeMapACAreaMaster" id="frmMeeMapACAreaMaster" action="EventOrgRenewal.html" onsubmit="return validateMapAreaZip();">
							<input type="hidden" name="eventProcess" value="mapAreaState">

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
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
													<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="stateId" id="stateId" class="form-control" >
													<option selected="selected" value="">Select One</option>
													<%
														ArrayList arrayStateList = (ArrayList)request.getAttribute("allStateList");
														if(arrayStateList!=null && arrayStateList.size()!=0){
															Iterator itStateList = arrayStateList.iterator();
															while(itStateList.hasNext()){
																String[] strStateList = (String [])itStateList.next(); 
																//String[] strStateList = {state_id, state_name, state_code};
																String stateId = strStateList[0];
																String stateName = strStateList[1];
																String stateCode = strStateList[2];
																%>
																<option value="<%=stateId%>" ><%=stateName%></option>
																 <%
															}
														}
													%>
													</select>
													<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode From:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="zipCodeFrom" type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode To:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="zipCodeTo" type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type='reset' style=''>Reset</button>
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
