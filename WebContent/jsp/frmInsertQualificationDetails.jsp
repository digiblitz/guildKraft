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
<script src="js/frmInsertQualificationDetails.js" type="text/javascript" ></script>
<script language="javascript" type="text/javascript">
function postData(userType){
//alert("dfdf"+userType);
	document.frmSelEvents.method="post";
	document.frmSelEvents.action="./OEEValidate.html?cmd=regLevel&usrTyp="+userType;
	document.frmSelEvents.submit();	
	return true;
}	
</script>

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
						
						 <h2>Online Entries: Insert Qualification Details</h2>
						 
						 </div>
<!--==============================================content start here============================================-->
  				
				<div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
						  <%
								Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");		
								ArrayList userTypeDetails = (ArrayList)request.getAttribute("userTypeDetails");
								System.out.println("userTypeDetails in jsp: "+userTypeDetails);		
								ArrayList areaList = (ArrayList)request.getAttribute("areaDetails");
								System.out.println("areaList in jsp: "+areaList);
								 ArrayList divisionTypeDetails = (ArrayList)request.getAttribute("divisionTypeDetails");
								System.out.println("divisionTypeDetails in jsp: "+divisionTypeDetails);
										
								String chmpStat = (String)request.getAttribute("chmpStat");
								System.out.println("chmpStat in jsp: "+chmpStat);
								String recExists = (String)request.getAttribute("recordExists");
								System.out.println("recExists in jsp: "+recExists);
								String eventTypeId = (String)request.getAttribute("eventTypeId");
								String userTypeId = (String)request.getAttribute("userTypeId");
								String areaId = (String)request.getAttribute("areaId");
								System.out.println("areaId in jsp: "+areaId);
								String divisionId = (String)request.getAttribute("divisionId");
								System.out.println("divisionId in jsp: "+divisionId);
								String insertStatus = (String)request.getAttribute("insertStatus");
								String iStatus = "";
							if(insertStatus!=null && insertStatus.equalsIgnoreCase("success")) iStatus = "Qualifications Details Inserted Successfully";
								else if(insertStatus!=null && insertStatus.equalsIgnoreCase("failed")) iStatus = "Qualifications Details Not Inserted";
						  %>

 
						 <%
							if(insertStatus!=null && insertStatus.trim().length()!=0){
						 %>
								<%=iStatus%>
		 
		 					<%}%>
		
							<form class='form-horizontal' role='form' name="frmSelEvents" id="frmSelEvents" action="OEEValidate.html" method="post" onsubmit="return myValidate();">
							 <input type="hidden" name="cmd" value="selEventLevels" />
		
							
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
											 
											 <select name="userType" id="userType" class="form-control" onchange="postData(this.value);">
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
											 </select><span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Division:</label>
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
                                        <button class='btn-lg btn-primary' name="submit" type="submit" value="Submit">Submit</button>
									</div>
							</div>
       
					 </form>
									 
									  <%
										 if(recExists!=null && recExists.equalsIgnoreCase("no")){%>
										 <div class="form-group">
										 <p id="p_error">Record Already Exists. <a class="linkFive" href="OEEValidate.html?cmd=validDetails&eventType=<%=eventTypeId%>&userType=<%=userTypeId%>&division=<%=divisionId%>&selArea=<%=areaId%>&chmpStatus=<%=chmpStat%>">
										 Click to Edit</a></p>
										 </div>
										  
										 <%}	 
										 
									%>
									<%
										
										ArrayList membershipTypeDetails = (ArrayList)request.getAttribute("membershipTypeDetails");
										 ArrayList eventLevelDetails = (ArrayList)request.getAttribute("eventLevelDetails");
										System.out.println("eventLevelDetails in jsp: "+eventLevelDetails);		 
										 if(eventLevelDetails!=null && eventLevelDetails.size()!=0){
										 %>
										 
										 
					 <form class='form-horizontal' role='form' name="frmInsertValidation" id="frmInsertValidation" action="OEEValidate.html" method="post" onsubmit="return insertValidate();">
					  <input type="hidden" name="cmd" value="insertDetails"  />
					   <input type="hidden" name="eventSize" id="eventSize" value="<%=eventLevelDetails.size()%>" />
						<input type="hidden" name="inEventId" id="inEventId" value="<%=eventTypeId%>" />
						<input type="hidden" name="inUserId" id="inUserId" value="<%=userTypeId%>" />
						<input type="hidden" name="indivisionId" id="indivisionId" value="<%=divisionId%>" />
						<input type="hidden" name="inAreaId" id="inAreaId" value="<%=areaId%>" />
						<input type="hidden" name="inChmp" id="inChmp" value="<%=chmpStat%>" />
		
							  <div class='form-group'>
									<div class="col-md-12 gp">
										 <div class="row"> 
												<div class='col-md-1'>
													<label class='control-label label1'>Event Level</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Event Level Rank</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Min. Age</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Max. Age</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Qual. Period</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Min. Rank</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Min. Count</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Max Rank</label>
												</div>
												<div class='col-md-2'>
													<label class='control-label label1 col-sm-offset-2'>Penalties</label>
														<div class="form-group">
															<div class='col-md-1 '>
																<label class='control-label label1'>Jump</label>
															</div>
															<div class='col-md-1 col-sm-offset-2'>
																<label class='control-label label1'>Time</label>
															</div>
														</div>
												</div>

												<div class='col-md-1'>
													<label class='control-label label1'>Reg Level</label>
												</div>
												<div class='col-md-1'>
													<label class='control-label label1'>Amateur Status</label>
												</div>
											</div>
										</div>
									</div>
									
									
											<%
												Iterator itl = eventLevelDetails.iterator();
												int i=0;
												while(itl.hasNext()){
													String [] levelDet = (String [])itl.next();
													String evId = levelDet[0];
													String evLevelId = levelDet[1];
													String evLevelCode = levelDet[2];
											%>
		 						<div class='form-group'>
									<div class="col-md-12 gp">
										 <div class="row"> 
												<div class='col-md-1'>
													<input type="checkbox" name="tmpEventLevel<%=i%>" id="tmpEventLevel<%=i%>" value="<%=evLevelId%>" /><%=evLevelCode%>
													<input type="hidden" name="eventLevel<%=i%>" id="eventLevel<%=i%>" value="<%=evLevelId%>" />
												</div>
												<div class='col-md-1'>
													<input type="text" name="levelRank<%=i%>" id="levelRank<%=i%>" class="form-control"  />
												</div>
												<div class='col-md-1'>
													<input type="text" name="minAge<%=i%>" id="minAge<%=i%>" class="form-control"  />
												</div>
												<div class='col-md-1'>
													<input type="text" name="maxAge<%=i%>" id="maxAge<%=i%>" class="form-control"  />
												</div>
												<div class='col-md-1'>
													<input type="text" name="qPeriod<%=i%>" id="qPeriod<%=i%>" class="form-control"  />
												</div>
												<div class='col-md-1'>
													<input type="text" name="minRank<%=i%>" id="minRank<%=i%>" class="form-control"  />
												</div>
												<div class='col-md-1'>
													<input type="text" name="minCount<%=i%>" id="minCount<%=i%>" class="form-control"  />
												</div>
												<div class='col-md-1'>
													<input type="text" name="maxRank<%=i%>" id="maxRank<%=i%>" class="form-control" />
												</div>
												<div class="col-md-2">
														<div class='col-md-1'>
															<input type="text" name="jumpPenalties<%=i%>" id="jumpPenalties<%=i%>" class="form-control"  />
														</div>
														<div class='col-md-1 col-sm-offset-2'>
															<input type="text" name="timePenalties<%=i%>" id="timePenalties<%=i%>" class="form-control"  />
															</div>
												</div>
												<div class='col-md-1'>
														<select name="membershipLevel<%=i%>" id="membershipLevel<%=i%>" class="form-control">
															<option value="" selected="selected">Select One</option>
															<%
																if(membershipTypeDetails!=null && membershipTypeDetails.size()!=0){
																	Iterator iter = membershipTypeDetails.iterator();
																	while(iter.hasNext()){
																		String [] membDet = (String[])iter.next();
																			String membId = membDet[0];
																			String membName = membDet[1];
															%>
															<option value="<%=membId%>#<%=membName%>" ><%=membName%></option>
															<%}}%>
														</select>			
												</div>
												<div class='col-md-1'>
													<input type="checkbox" name="amateurStatus<%=i%>" id="amateurStatus<%=i%>" value="yes" />	
												</div>
											</div>
										</div>
									</div>
		  
										   <%i++;}%>
										 
										
				  			<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" name="appButton" id="appButton" value="Submit">Submit</button>
                                    </div>
							</div>
				  </form>
		   <%}else{%>
				   <div class='form-group'>
				   		<div class='col-md-4'>
						</div>
						<div class='col-md-4'>
				   			<p>No Records Found</p>
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
