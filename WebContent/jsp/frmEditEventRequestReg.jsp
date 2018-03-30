<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import ="com.hlcmro.util.HLCEventRequestVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/frmEditEventRequestReg.js" type="text/javascript"></script>

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

function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}

function onValidate(){
	if(document.frmEditEventRequestReg.eventTitle.value==""){
	alert(" Event Title cannot be empty");
	document.frmEditEventRequestReg.eventTitle.focus();
	return false; 
	}
	if(document.frmEditEventRequestReg.eventTitle.value.indexOf(' ')==0){
	alert("Enter Event Title ");
	document.frmEditEventRequestReg.eventTitle.focus();
	return false;
	}	
	if(Dospace(document.frmEditEventRequestReg.eventTitle.value)){
	alert("Enter Valid Event Title ");
	document.frmEditEventRequestReg.eventTitle.focus();
	return false;
	}
	if(document.frmEditEventRequestReg.eventTitle.value.length>255){
	alert("Enter within 255 characters for Event Title" );
	document.frmEditEventRequestReg.eventTitle.focus();
	return false; 
	}
	if(document.frmEditEventRequestReg.txtCity.value==""){
	alert("City can not be empty");
	document.frmEditEventRequestReg.txtCity.focus();
	return false;
	}
	if(document.frmEditEventRequestReg.txtCity.value.indexOf(' ')==0){
	alert("Enter City ");
	document.frmEditEventRequestReg.txtCity.focus();
	return false;
	}	
	if(Dospace(document.frmEditEventRequestReg.txtCity.value)){
	alert("Enter Valid City ");
	document.frmEditEventRequestReg.txtCity.focus();
	return false;
	}
	if(document.frmEditEventRequestReg.txtLocation.value==""){
	alert("Location can not be empty");
	document.frmEditEventRequestReg.txtLocation.focus();
	return false;
	}
	if(document.frmEditEventRequestReg.txtLocation.value.indexOf(' ')==0){
	alert("Enter Location");
	document.frmEditEventRequestReg.txtLocation.focus();
	return false;
	}	
	if(Dospace(document.frmEditEventRequestReg.txtLocation.value)){
	alert("Enter Valid Location");
	document.frmEditEventRequestReg.txtLocation.focus();
	return false;
	}
	
	if(document.frmEditEventRequestReg.beginDate.value==""){
	alert("Select a Begin Date of the Event");
	document.frmEditEventRequestReg.beginDate.focus();
	return false;
	}
	var retStr = document.frmEditEventRequestReg.beginDate.value;
	var currTime = new Date();
	var startTime = new Date();
	retMonth = retStr.substring(0,2);
	retDay = retStr.substring(3,5);
	retYear = retStr.substring(6,retStr.length);
	startTime.setMonth(retMonth-1);
	startTime.setYear(retYear);
	startTime.setDate(retDay);
	/*if(Number(currTime.getTime()-startTime.getTime())>0){
	alert("Select a future Date for Event Begin Date");
	document.frmEditEventRequestReg.beginDate.focus();
	return false;
	}*/
	var tempYrs = document.frmEditEventRequestReg.tempYr.value;
	
	if(retStr.substring(6,10)!=tempYrs){
	alert("Enter valid Begin Date");
	document.frmEditEventRequestReg.beginDate.focus();
	return false;
    }
	if(document.frmEditEventRequestReg.endDate.value==""){
	alert("Select a End Date of the Event");
	document.frmEditEventRequestReg.endDate.focus();
	return false;
	}
	
	var endStr = document.frmEditEventRequestReg.endDate.value;
	var endTime = new Date();
	endMonth = endStr.substring(0,2);
	endDay = endStr.substring(3,5);
	endYear = endStr.substring(6,retStr.length);
	endTime.setMonth(endMonth-1);
	endTime.setYear(endYear);
	endTime.setDate(endDay);
	if(Number(endTime.getTime()-startTime.getTime())<0){
	alert("Select a future Date for Event End Date");
	document.frmEditEventRequestReg.beginDate.focus();
	return false;
	}
	if(endStr.substring(6,10)!=retYear){
	alert("Enter valid End Date");
	document.frmEditEventRequestReg.endDate.focus();
	return false;
}
	if(Trim(document.frmEditEventRequestReg.orgnaizerId.value)==""){
	alert("Enter an Organizer ID");
	document.frmEditEventRequestReg.orgnaizerId.focus();
	return false;
	}	
	if(document.frmEditEventRequestReg.selIssue.selectedIndex ==0){
	alert("Select any Season");
	document.frmEditEventRequestReg.selIssue.focus();
	return false;
	}
	/*if(document.frmEditEventRequestReg.eventType.selectedIndex ==0){
	alert("Select any of the Event Type for the Event");
	document.frmEditEventRequestReg.eventType.focus();
	return false;
	var retTime = new Date();
	retMonth = retStr.substring(
	retTime.setMonth(retMonth-1);
	retTime.setYear(retYear);
	retTime.setDate(retDay);
	var depDiffTime = depTime.getTime();
	var retDiffTime = retTime.getTime();
	var nowDiffTime = new Date().getTime();
	var diff = Number(retDiffTime - depDiffTime);
	var pastDiff = Number(depDiffTime - nowDiffTime);

	}*/
	var levelCount = document.frmEditEventRequestReg.levelCount.value;
	var checkSelected = true;
	for (i = 1;  i <= Number(levelCount);i++){
	
	  if (document.getElementById('eventLevels'+i).checked == true){
		checkSelected = false;
	  }
	}
	if (checkSelected){
	  alert("Please select any of the Event Levels");

	  return (false);
	}	
	
return true;
}
function focus_login()
{
	document.frmEditEventRequestReg.eventTitle.focus();
}	
</script>
<title>Integrated Enterprise Dashboard</title>
<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="HLCMemberDetails();">


<%! 
String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>

 <%! 				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM/dd/yyyy");
					
					String dateFormat(String fieldName){					
						java.util.Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}
						
						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
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
                            <h2>HLC Meetings: Edit Event Registration</h2>
						</div>
  <!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
<!--==============================Form Description=================================-->
			<p>Edit  Event Details:</p>
				
				<% 
				
				HLCEventRequestVO objEventReqVO = new HLCEventRequestVO();
				objEventReqVO = (HLCEventRequestVO)request.getAttribute("EVENT_REQUEST_VO");
				
			 String event_id = "";
             String organizer_id = "";
             String event_title = "";
           		 		 
             String competition_location = "";
             String competition_city = "";
             String competition_state = "";
             String competition_country = "";
             String competition_zip = "";
             String championship_area = "";
             String status_id = "";
			 String eveIssId="";
			 String eveIssName="";
			 int tempYr=0;
			 ArrayList mappingTypeIds = new ArrayList();
			 
			 String eventSubTypes = "";
			 java.util.Date eventBeginDate=null;
			 java.util.Date eventEndDate=null;
			 
			 if(objEventReqVO!= null ){
			  event_id = objEventReqVO.getEvent_id();
			  System.out.println("event_id in jsp" +event_id);
              organizer_id = objEventReqVO.getOrganizer_id();
			  System.out.println("organizer_id in jsp" +organizer_id);
              event_title = objEventReqVO.getEvent_title();
              eventBeginDate = objEventReqVO.getEveBegDate();		 
			
              eventEndDate = objEventReqVO.getEveEndDate();			 			
              competition_location = objEventReqVO.getCompetition_location();
			  System.out.println("competition_location in jsp" +competition_location);
              competition_city = objEventReqVO.getCompetition_city();
              competition_state = objEventReqVO.getCompetition_state();
              competition_country = objEventReqVO.getCompetition_country();
              competition_zip = objEventReqVO.getCompetition_zip();
              championship_area = objEventReqVO.getChampionship_area();
              status_id = objEventReqVO.getStatus_id();
			  eveIssId = objEventReqVO.getIssueId();
			  eveIssName = objEventReqVO.getIssueName();
			  tempYr = objEventReqVO.getCompYear();
			  System.out.println("tempYr in jsp" + tempYr);
			  mappingTypeIds = objEventReqVO.getMaping_type_id();
			  	if(mappingTypeIds!= null && mappingTypeIds.size()!=0){	  
                	Iterator itrMapTypeIds = mappingTypeIds.iterator();
                
	                while(itrMapTypeIds.hasNext()){
                    String mappingTypeId = (String)itrMapTypeIds.next();
                    eventSubTypes = mappingTypeId+"#"+eventSubTypes;
    	            }
				}
			}
			String areaId = "";
			String areaStr = "";
			String[] areaDetails = (String []) request.getAttribute("AREA_DETAILS");
			if(areaDetails != null){
			 areaId = areaDetails[0];
			 areaStr = areaDetails[1];
			 }
			
				%>
	<form name="frmEditEventRequestReg" id="frmEditEventRequestReg" action="./eventRegList.html" method="post" onsubmit="return onValidate();"  >
		<input type="hidden" name="cmd" value="updateEventRequestReg">
		<input type="hidden" name="eventId" id="eventId" value="<%=event_id%>" />
		<input type="hidden" name="tempYr" id="tempYr" value="<%=tempYr%>" />	
					
		<div class='form-group'>
           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
		   
		    <div class='col-md-8'>
               <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
					 <input name="eventTitle" type="text" id="eventTitle" class="form-control" size="30" maxlength="40" value="<%=event_title%>"/>
				 	 <span class="asterisk" id="span_astriesk">*</span>				
					</div>
				</div>
			</div>
			
			
		 <p>Event Location:</p>
		 
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
			<div class='col-md-8'>
               <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
				  		USA
					</div>
				</div>
			</div>
				  
		    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State :</label>
				
		 <div class='col-md-8'>
               <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
						<%
						boolean stateStatus = true;
						String stateId="";
										ArrayList stateDetails = (ArrayList)request.getAttribute("stateDetails");
										if(stateDetails!=null && stateDetails.size()!=0){
										Iterator itr = stateDetails.iterator();
                
                						while(itr.hasNext()){
                						String[] stateDet = (String[])itr.next();
										 stateId = stateDet[0];										
										String stateName = stateDet[1];
										String stateCode = stateDet[2];
										if(competition_state!=null && competition_state.equalsIgnoreCase(stateId)){
										stateStatus = false;
										%>										
				 <input type="text" name="selState"  id="selState" class="form-control" readonly="true" size="20" maxlength="20" value="<%=stateName%>"/>
				 <input type="hidden" name="stateId" id="stateId" value="<%=stateId%>" />
				
										<%}								
											  }
											} %>					 
										</div>
									</div>
								</div>
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
				 
			 <div class='col-md-8'>
               <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
				     <input type="text" name="txtCity" id="txtCity" class="form-control" size="20" value="<%=nullCheck(competition_city)%>" />
					 <span class="asterisk" id="span_astriesk">*</span>
					 </div>
					</div>
				</div>				
		     	
				
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>ZipCode:</label>
				  <div class='col-md-8'>
               		<div class='col-md-3 indent-small'>
					  <div class='form-group internal'>
					 	<input name="zipCode" type="text" id="zipCode" class="form-control" readonly="true" size="20" maxlength="20" value="<%=competition_zip%>"/>	
					</div>
				</div>
			</div>			 					
			
		     	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
				 
				  <div class='col-md-8'>
               		<div class='col-md-3 indent-small'>
					  <div class='form-group internal'>
					  	<input type="text" name="areaTxt"  id="areaTxt" class="form-control" readonly="true" size="20" maxlength="20" value="<%=areaStr%>"/>	
					 	<input type="hidden" name="areaId" id="areaId" value="<%=areaId%>" />
						</div>
					</div>
				</div>
					 
					 
		     	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
				  <div class='col-md-8'>
               		<div class='col-md-3 indent-small'>
					  <div class='form-group internal'>
					  	<input type="text" name="txtLocation" id="txtLocation" class="form-control" size="20" value="<%=nullCheck(competition_location)%>"/>
							<span class="asterisk" id="span_astriesk">*</span><
						</div>
					</div>
				</div>
				
				
           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Begin Date:</label>
            	<div class='col-md-8'>
               		<div class='col-md-3 indent-small'>
					  <div class='form-group internal'>
					  		<input type="text" name="beginDate" id="beginDate" value="<%=dateFormat(eventBeginDate.toString())%>" class="form-control" size="25" readonly="true"/>				 								<a onclick="javascript:NewCssCal('beginDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
						</div>
					</div>
				</div>
				 
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>End date:</label>
           			 <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
								<input type="text" name="endDate" id="endDate" value="<%=dateFormat(eventEndDate.toString())%>" class="form-control" size="25" readonly="true"/>
								<a onclick="javascript:NewCssCal('endDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
							</div>
						</div>
					</div>
          	
				
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer ID:</label>
				     <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
					 			<input name="orgnaizerId" type="text" id="orgnaizerId" value="<%=organizer_id%>" class="form-control" size="20" maxlength="20" onblur="HLCMemberDetails();"/>
				 	 		<span class="asterisk" id="span_astriesk">*</span>
							</div>
						</div>
					</div>
				
				
 				<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Name:</label>
				   <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
					 			<input name="name" type="text" id="name" class="form-control" size="20" readonly="true"/>
							</div>
						</div>
					</div>
					
					
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone:</label>
				   <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
					 			<input name="phone" type="text" id="phone" class="form-control" size="20" readonly="true"/>
							</div>
						</div>
					</div>
					
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
				    <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
					 			<input name="address" type="text" id="address" class="form-control" size="20" readonly="true"/>
							</div>
						</div>
					</div>
					 
					 
		     	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
				   <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
					 			<input name="city" type="text" id="city" class="form-control" size="20" readonly="true"/>
							</div>
						</div>
					</div>
		     	
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
				     <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
					 			<input name="fax" type="text" id="fax" class="form-control" size="20" readonly="true"/>
							</div>
						</div>
					</div>
				
				
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
				    <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
					 			<input name="email" type="text" id="email" class="form-control" size="20" readonly="true"/>
							</div>
						</div>
					</div>
				
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Season:</label>
				     <div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
								<select name="selIssue" id="selIssue" class="form-control" >
										<option selected="selected" value="">Select One</option>										
										<%
										ArrayList issDetails = (ArrayList)request.getAttribute("issueDetails");
										if(issDetails!=null && issDetails.size()!=0){
										Iterator itr = issDetails.iterator();               
                						while(itr.hasNext()){
                						String[] issueDet = (String[])itr.next();
										String issueId = issueDet[0];
										String issueName = issueDet[1];
									if(eveIssId!=null && eveIssId.equalsIgnoreCase(issueId)){	
								
										%>										
										<option selected="selected" value="<%=issueId%>"><%=issueName%></option>
									 <%
									 }else {
									 %>
									 <option value="<%=issueId%>"><%=issueName%></option>
									 <%
									 }
							  }
							}
							  %>
						    </select>
				 	 <span class="asterisk" id="span_astriesk">*</span>	
					</div>
				</div>
			</div>				

				<p>Event Types &amp; Event Levels :<span class="asterisk" id="span_astriesk">*</span></p>
				
				<%
										Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");
										HashMap eventTypeMap = (HashMap)request.getAttribute("eventTypeMap");
										int levelCount =0;

										if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
										Enumeration it = eventTypeDetails.elements();
										while(it.hasMoreElements()){
										String[] eventDet =(String[])it.nextElement();
										String eventTypeId = eventDet[0];
										String eventTypeName = eventDet[1];
										System.out.println("event name"+eventTypeName);
										%>
					<div class='col-md-8'>
               			<div class='col-md-3 indent-small'>
					  		<div class='form-group internal'>
								<%=eventTypeName%>
							</div>
						</div>
					</div>
					
									
								<%
										ArrayList subLevelMap = (ArrayList)eventTypeMap.get(eventTypeId);
					                    if(subLevelMap!=null && subLevelMap.size()!=0)
											{
					                    Iterator itrSub = subLevelMap.iterator();
                    					while(itrSub.hasNext()){
				                        String[] subEntry = (String[])itrSub.next();
                				        String mapId = subEntry[0];
				                        String levelId = subEntry[1];
                				        String levelCode = subEntry[2];
				                        String levelName = subEntry[3]; 
									    levelCount = levelCount + 1;
										String cbxName = "eventLevels"+levelCount;
										System.out.println("cbxName....."+cbxName);
										System.out.println("mapid....."+mapId);
										System.out.println("eventSubTypes"+eventSubTypes);
										System.out.println("levelCount......"+levelCount);

										boolean chkStatus = false;
										if(mapId!=null && eventSubTypes.contains(mapId)){
											chkStatus=true;
										}%>
										
										
                      <div class='col-md-8'>
                    	<div class='col-md-3 indent-small'>
                          	<div class='form-group internal'>
								 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
									<input type="checkbox" name="<%=cbxName%>" value="<%=mapId%>" id="<%=cbxName%>" <%if(chkStatus){%> checked="checked"<%}%>/>&nbsp;&nbsp;<%=levelCode%>
									</div>
								</div>
							</div>
						</div>
									
				    		<%}
							  }
							}
							}
						  %>
						 <input type="hidden" name="levelCount" id="levelCount" value="<%=levelCount%>" />
							
				<div class='col-md-offset-5 col-md-1'>
                      <button class='btn-lg btn-primary' type="submit" value="Update">Update</button>
				</div>
					
				<div class='col-md-1'>
                      <button class='btn-lg btn-primary' type="button" value="Cancel" onclick="location.href='eventRegList.html?cmd=eventReg'">Cancel</button>
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
<script language="javascript">
	var cal1 = new calendar2(document.forms['frmEditEventRequestReg'].elements['beginDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar2(document.forms['frmEditEventRequestReg'].elements['endDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
</script>
