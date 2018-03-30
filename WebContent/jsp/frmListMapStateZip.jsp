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
<%@ page import="com.hlcmro.util.HLCAreaStateZipVO"%>
<%@ page import="com.hlccommon.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
<script language="javascript">
function postData(areaId){
	var form = document.getElementById('frmListMapStateZip'); 
if(areaId==""){
		alert("Select Any of the Area Name");
		document.frmListMapStateZip.areaSelect.focus();
		return false;
}
else{
	form.method="post";
	document.frmListMapStateZip.submit();
	return true;
	}
}
</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
</head>
<%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>


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
                            <h2>HLC Meetings: Listing Area State Zip Entries</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
					<p> Zip Code  values  are listed here based on the Area Name: </p>
					 
							 <form class='form-horizontal' role='form' name="frmListMapStateZip" id="frmListMapStateZip" method="post" action="EventOrgRenewal.html" onsubmit="return myValidate();">
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
															<div class='form-group internal'>
												<%	
													String areaId = (String) request.getAttribute("area_id");
													if(areaId==null) areaId = "";
				
													ArrayList allAreaList = (ArrayList)request.getAttribute("allAreaList");
													if(allAreaList!=null&& allAreaList.size()!=0){
														Iterator areaLst = allAreaList.iterator();
												%>
													  <select name="areaSelect" class="form-control" onchange="return postData(this.value)"> 
														<option value="" selected="selected">Select One</option>
												<%	while(areaLst.hasNext()){
															String AreaLstArr[] = (String [])areaLst.next();
															String area_id = AreaLstArr[0];
															String area_code = AreaLstArr[1];
															String area_name = AreaLstArr[2];
															out.print("area_id "+area_id);
															if(area_id.trim().equalsIgnoreCase(areaId)){
																%>
																	<option  value="<%=area_id%>" selected="selected"><%=area_name%></option>
																<%
																}
																else{
																%>
																	<option  value="<%=area_id%>"><%=area_name%></option>
																<%
				
																}
														}
													}
												 %>
												  </select>
								<!--<input type="submit" name="click2" value="Submit" class="gradBtn"/>	-->	
								<input type="hidden" name="eventProcess" value="OnLstMapStateZip"/>							
											
											</div>
										</div>
									</div>
								</div>
								 
 								
							  
						   	</form>
				     				
									<div class="form-group">
										<div class="row">
											<div class="col-md-12 gp">
												<div class="col-md-2 col-md-offset-1">
													<label class="control-label label1">State Name</label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label label1">State Code</label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label label1">Area Name</label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label label1">Zip Code From</label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label label1">Zip Code To</label>
												</div>
											</div>
										</div>
									</div>
									
							<%
								ArrayList ValueList = (ArrayList)request.getAttribute("ValueList");
							
								if((ValueList!=null && ValueList.size()!=0)){
									Iterator itr = 	ValueList.iterator();
										while(itr.hasNext()) {	
											HLCAreaStateZipVO objAreaSteVO = (HLCAreaStateZipVO) itr.next();
										//State Masters
											String area_code  = objAreaSteVO.getArea_code();
											String area_id  = objAreaSteVO.getArea_id();
											String area_name = objAreaSteVO.getArea_name();
											String map_zip_id  = objAreaSteVO.getMap_zip_id();
											String state_code = objAreaSteVO.getState_code();
											String state_id = state_id = objAreaSteVO.getState_id();
											String state_name = objAreaSteVO.getState_name();
											String zip_code_from = objAreaSteVO.getZip_code_from();
											String zip_code_to = objAreaSteVO.getZip_code_to();
										
							%>
								
									 <div class="form-group">
										<div class="row">
											<div class="col-md-12 gp">
												<div class="col-md-2 col-md-offset-1">
													<label class="control-label "><%=nullCheck(state_name)%></label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label "><%=nullCheck(state_code)%></label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label "><%=nullCheck(area_name)%></label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label "><%=nullCheck(zip_code_from)%></label>
												</div>
												<div class="col-md-2 ">
													<label class="control-label "><%=nullCheck(zip_code_to)%></label>
												</div>
											</div>
										</div>
									</div>
									
									<!--<td bgcolor="#E3E1D2" class="alignCenter">< %=nullCheck(area_code)%></td>-->
									
								<%
											}
								} 
								else{
							   %>
								
								<div class="form-group">
									<div class="col-md-12 gp">
							 		<div class='col-md-4'>
									 </div>		
							 		 <div class='col-md-4'>
						    
										No records available. 
								
										</div>
									</div>
								</div>
							<% } %>
							
	  
	  
	  
	  
	  
	  <!--==============================================import content code end here============================================-->	  </td>
  		
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
