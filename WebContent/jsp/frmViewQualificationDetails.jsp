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
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
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
	if(document.frmSelEvents.eventType.value==""){
		alert("Select an Event Type");
		document.frmSelEvents.eventType.focus();
		return false;
	}
	
	if(document.frmSelEvents.userType.value==""){
		alert("Select an User Type");
		document.frmSelEvents.userType.focus();
		return false;
	}

	if(document.frmSelEvents.selArea.value!="" && document.frmSelEvents.chmpStatus.value==""){		
		alert("Select a Championship Status");
		document.frmSelEvents.chmpStatus.focus();
		return false;			
	}		
	return true;
}
</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

<%! 
String intCheck(int fieldName){
	String retValue = "";
		if(fieldName==0){
		retValue = "";
		}
	return retValue;
}

%>

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
						<h2>Online Entries: View Qualification Details</h2>
						</div>
				<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->


				  <%
						Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");
						ArrayList userTypeDetails = (ArrayList)request.getAttribute("userTypeDetails");
						ArrayList areaList = (ArrayList)request.getAttribute("areaDetails");
						ArrayList divisionTypeDetails = (ArrayList)request.getAttribute("divisionTypeDetails");
						System.out.println("divisionTypeDetails in jsp: "+divisionTypeDetails);
						
						String eventTypeId = (String)request.getAttribute("eventTypeId");
						String userTypeId = (String)request.getAttribute("userTypeId");
						String divisionId = (String)request.getAttribute("divisionId");
						System.out.println("divisionId in jsp: "+divisionId);
						String areaId = (String)request.getAttribute("areaId");
						String chmpStat = (String)request.getAttribute("chmpStatus");
						
				  %>

					 <form class='form-horizontal' role='form' name="frmSelEvents" id="frmSelEvents" action="OEEValidateView.html" method="post" onsubmit="return myValidate();">
					 <input type="hidden" name="method" value="qualificationView" />
		
						 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <select name="eventType" id="eventType" class="form-control">
												<option value="" selected="selected">Select One</option>
												<%
													if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
														Enumeration itr= (Enumeration)eventTypeDetails.elements();
														while(itr.hasMoreElements()){
															String[] s = (String[]) itr.nextElement();
															String typeId = s[0];
															String typeName = s[1];
															if(eventTypeId!=null && eventTypeId.equalsIgnoreCase(typeId)){
												%>
												<option value="<%=typeId%>" selected="selected" ><%=typeName%></option>
												<%}else{%>
												<option value="<%=typeId%>" ><%=typeName%></option>
												<%}}}%>
											 </select>
											 <span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
						
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <select name="userType" id="userType" class="form-control">
													<option value="" selected="selected">Select One</option>
													<%
														if(userTypeDetails!=null && userTypeDetails.size()!=0){
															Iterator it = userTypeDetails.iterator();
															while(it.hasNext()){
																String [] uDet = (String[])it.next();
																String uTypeId = uDet[0];
																String uTypeName = uDet[1];
																if(userTypeId!=null && userTypeId.equalsIgnoreCase(uTypeId)){
													%>
													<option value="<%=uTypeId%>" selected="selected" ><%=uTypeName%></option>
													<%}else{%>
													<option value="<%=uTypeId%>" ><%=uTypeName%></option>
													<%}}}%>
												 </select>
												 <span id="span_astriesk">*</span>
											</div>
									  </div>
								</div>
												 
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Division:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>			
												<select name="division" id="division" class="form-control">
												<option value="" selected="selected">Select One</option>
												<%
													if(divisionTypeDetails!=null && divisionTypeDetails.size()!=0){
														Iterator ite = divisionTypeDetails.iterator();
															while(ite.hasNext()){
																String [] divDet = (String[])ite.next();
																String divId = divDet[0];
																String divName = divDet[1];
													if(divisionId.trim().equalsIgnoreCase(divId)){
												%>
												<option  value="<%=divId%>" selected="selected"><%=divName%></option>
													<%
																	}
																	else{
															%>
													<option  value="<%=divId%>"><%=divName%></option>
													<%
						
													}
													}
												}					
												%>  
												 </select>
										</div>
									  </div>
								</div>
							
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>			
											 <select name="selArea" id="selArea" class="form-control">
												  <option selected="selected" value="">Select One</option>
															<%
														 if(areaList!=null&& areaList.size()!=0){
															Iterator areaLst = areaList.iterator();
															while(areaLst.hasNext()){
																	String AreaLstArr[] = (String [])areaLst.next();
																	String area_id = AreaLstArr[0];
																	String area_code = AreaLstArr[1];
																	String area_name = AreaLstArr[2];
																	out.print("area_id "+area_id);
																	if(areaId.trim().equalsIgnoreCase(area_id)){
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
													</div>
												</div>
											</div>

                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Championship Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>			
												 <select name="chmpStatus" id="chmpStatus" class="form-control" >
													<option selected="selected" value="" >Select One</option>
												<%	
												String[] status = new String[]{"Yes","No"};
													for(int k =0; k<status.length; k++){
												if(chmpStat!=null && chmpStat.equalsIgnoreCase(status[k])){
												%>
												<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
												<%}else{%>
												<option value="<%=status[k]%>"><%=status[k]%></option>
													<%}}%>
												</select>
											</div>
										</div>
									</div>
								</div>
								
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" value="Submit" type='submit'>Submit</button>
                                    </div>
								</div>
				 </form>
		 		
				<div class='form-group'>
					 <div class='col-md-12 gp'>
					 	 <div class='col-md-1'>
						 	<label class='control-label label1'>Event Level</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Rank</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Minimum Age</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Maximun Age</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Qual Period</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Minimum Rank</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Minimum Count</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Maximum Rank</label>
						 </div>
						 <div class='col-md-1'>
							<label class='control-label label1 '>Penalty Jump</label>
						</div>
						<div class="col-md-1">
							<label class="control-label label1">Penalty Time</label>
						</div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Registration Level</label>
						 </div>
						 <div class='col-md-1'>
						 	<label class='control-label label1'>Amateur Status</label>
						 </div>
					</div>
				</div>
						   <%
								HLCValidationVO valVO = new HLCValidationVO();
								boolean champStatus=false;
								boolean amaStatus=false;
								String chStatus="";
								String amStatus="";
								ArrayList areaChairList = (ArrayList)request.getAttribute("viewEventDetails");
								if(areaChairList!=null && areaChairList.size()!=0){
									Iterator itr = areaChairList.iterator();
									while(itr.hasNext()){
										valVO = (HLCValidationVO)itr.next();
										String eventLevelName = valVO.getEventLevelNames();
										champStatus = valVO.getChampStatus();
										if(champStatus==true){
										chStatus="Yes";
										}else{
										chStatus="No";
										}
										String divisionName = valVO.getDivisionName();
										String minRank = valVO.getMinRank();
										int minAge = valVO.getMinAge();
										int maxAge = valVO.getMaxAge();
										String qualPeriod = valVO.getQualicPeriod();
										String rank = valVO.getEveLevelRank();
										String maxRank = valVO.getMaxRank();
										int minCount = valVO.getMinCount();
										String jump = valVO.getMaxXcJmpenal();
										String time = valVO.getMaxXcTimepenal();
										String regLevel = valVO.getMembTypeName();
										amaStatus = valVO.getAmateurStatus();
										if(amaStatus==true){
										amStatus="Yes";
										}else{
										amStatus="No";
										}
							%>
							
					<div class='form-group'>
						 <div class='col-md-12 gp'>
							<div class='col-md-1'>
						 		<label class='control-label '><%=nullCheck(eventLevelName)%></label>
							 </div>
							<div class='col-md-1'>
						 		<label class='control-label'><%=nullCheck(rank)%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=minAge%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=maxAge%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=nullCheck(qualPeriod)%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=nullCheck(minRank)%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=minCount%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=nullCheck(maxRank)%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=nullCheck(jump)%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=nullCheck(time)%></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '<%=nullCheck(regLevel)%>></label>
							 </div>
							 <div class='col-md-1'>
						 		<label class='control-label '><%=nullCheck(amStatus)%></label>
							 </div>
							</div>
						</div>
			
		   <%
			}%>
		  						<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="button" name="process" value="Edit"  onclick="location.href='OEEValidate.html?cmd=validDetails&eventType=<%=eventTypeId%>&userType=<%=userTypeId%>&division=<%=divisionId%>&selArea=<%=areaId%>&chmpStatus=<%=chmpStat%>'">Edit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="button" onclick="javascript:history.back(-1);" value="Back" style=''>Back</button>
                                    </div>
                                </div>
			
			<%}else{
			%>
	  		
				<div class='form-group'>
					<div class='col-md-5'>
						</div>
					<div class='col-md-5'>
						No Records Found
						</div>
				</div>		
				
							<div class='form-group'>
                                    <div class='col-md-offset-5 col-md-1'>
                                        <button class='btn-lg btn-primary' type="button" onclick="javascript:history.back(-1);" value="Back">Back</button>
                                    </div> 
								</div>
		
				
						 
				
		   <%}%>
		   						
				
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
