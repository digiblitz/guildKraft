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
                            <h2>Meetings:Edit/Update Map Area Chair To An Area</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						

  
				
				 <%
					String mapAreaId = "";
					String areaId = "";
					String areaChairId = "";
					String areaName = "";
					String userCode = "";
					HLCAreaChairsVO objACVO = (HLCAreaChairsVO)request.getAttribute("areaChairDetailVO");
					if(objACVO!=null){
						mapAreaId = objACVO.getMapAreaId();
						areaId = objACVO.getAreaId();
						areaChairId = objACVO.getAreaChairId();
						areaName = objACVO.getAreaName();
						userCode = objACVO.getUserCode();
					}
			  %>
				
					
						<form class='form-horizontal' role='form' name="frmMeeMapACAreaMaster" id="frmMeeMapACAreaMaster" method="post" action="EventOrgRenewal.html" onsubmit="return validateMap();">
						<input type="hidden" name="eventProcess" value="editAreaChair">
						<input type="hidden" name="mapAreaId" value="<%=mapAreaId%>">
						
						<div class='panel-heading col-md-offset-2'>
                            <h2> Mapping Information</h2>
                        </div>
						 
					  		<%
							  String salespersonCodeErr = (String)request.getAttribute("err");
							  if(salespersonCodeErr!=null){
							  %>
							   <p>Required fields are marked with an asterisk*</p>
							
									<p id=p_error><%=salespersonCodeErr%> Area Chair ID Does not exist</p>
								
							  <%}%>
							  
							  
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
																	String areaIdVal = strAreaList[0];
																	String areaCode = strAreaList[1];
																	String tempAreaName = strAreaList[2];
																	if(areaId.equals(areaIdVal)){
																	
																	%>
																	<option value="<%=areaIdVal%>" selected="selected" ><%=tempAreaName%></option>
																	 <%
																	 }
																	 else{
																	%>
																	<option value="<%=areaIdVal%>" ><%=tempAreaName%></option>
																	 <%
						
																	 }
																}
															}
											%>
											</select> 
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Chair ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input name="areaChairId" type="text" class="form-control"  value="<%=areaChairId%>"/>
											</div>
										</div>
									</div>
								</div>
								
								

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="Submit" type="submit" value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="Submit" type="button" value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
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
