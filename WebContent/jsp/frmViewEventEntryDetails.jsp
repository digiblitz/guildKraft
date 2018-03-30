<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlcutil.HLCCalendarVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="js/calendar2.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript" >
function onValidate(){
	var path = document.getElementById('fileUpload').value;
	if(path==""){
		alert("Please Upload Competition Result Details");
		document.getElementById('fileUpload').focus();
		return false;
	}
	if(path != ""){
		if(navigator.platform == "Win32" || navigator.platform == "Windows" ){		
			if((path.charAt(0) != "\\" && path.charAt(1) != "\\") && (path.charAt(0) != "/" && path.charAt(1) != "/")){
				if(!path.charAt(0).match(/^[a-zA-z]/)){
					alert("Enter valid File location");
					return false;
				}
				if(path.charAt(1) == "" ||!path.charAt(1).match(/^[:]/) || !path.charAt(2).match(/^[\/\\]/)){
					alert("Enter valid File location");
					return false;
				}
			}
		}
		else if(navigator.platform == "Linux"){
			if(path.charAt(0) != "/"){
				alert("Enter valid File location");
				return false;
			}
			if(path.charAt(0) == "/" && path.charAt(1) == "/"){
				alert("Enter valid File location");
				return false;
			}
		}
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
  		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
		String dateFormat(java.util.Date fieldName){					
		Calendar cal = Calendar.getInstance();
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(fieldName);
		cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						
		int tempDay = gc.get(Calendar.DAY_OF_WEEK);
		String holiday = null;
			switch(tempDay){
			case Calendar.SUNDAY:
				holiday ="SUN";
				break;
			case Calendar.MONDAY:
				holiday ="MON";
				break;
			case Calendar.TUESDAY:
				holiday ="TUE";
				break;
			case Calendar.WEDNESDAY:
				holiday ="WED";
				break;
			case Calendar.THURSDAY:
				holiday ="THU";
				break;
			case Calendar.FRIDAY:
				holiday ="FRI";
				break;
			case Calendar.SATURDAY:
				holiday ="SAT";
				break;
			}
			String dispDate = "N/A";
			if(fieldName!=null ){
				dispDate = sd1.format(cal.getTime()).toString()+" ("+holiday+")";
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
		<%
		String orgFirstName = (String)session.getAttribute("orgFirstName");
		String orgLastName = (String)session.getAttribute("orgLastName");

			String eventId = (String)session.getAttribute("eventId");
			String riderId = (String)request.getAttribute("riderId");
			String horseMemberId = (String)request.getAttribute("horseMemberId");
			String horseName = (String)request.getAttribute("horseName");
			String divisionId = (String)request.getAttribute("divisionId");
			String evLevel = (String)request.getAttribute("evLevel");
			String chStat = (String)request.getAttribute("championshipStatus");
			
			String horseRecordCount = (String)request.getAttribute("horseRecordCount");
			String riderRecordCount = (String)request.getAttribute("riderRecordCount");
			String horseAge = (String)request.getAttribute("horseAge");
			ArrayList horseDetails = (ArrayList)request.getAttribute("horseDetails");
			ArrayList riderDetails = (ArrayList)request.getAttribute("riderDetails");
			String eventLevelName = (String)request.getAttribute("eventLevelName");
			String eventTypeName = (String)request.getAttribute("eventTypeName");

			ArrayList horseValidationDetails = (ArrayList)request.getAttribute("horseValidationDetails");
			ArrayList riderValidationDetails = (ArrayList)request.getAttribute("riderValidationDetails");

			ArrayList objProCalList = (ArrayList)request.getAttribute("selectEventDetails");
			String divisionName = divisionId.substring((1+(divisionId.indexOf("|"))),divisionId.length());
		%>
		
						<div class='panel-heading'>
                            <h2>Selected Event Details</h2>
                        </div>
	
		<!--==============================Form Title=================================-->
						
               <div class='panel-body'>
			   
			   
					 <html:form method="post" action="/upload.html" enctype="multipart/form-data" onsubmit="return onValidate();" >
							<input type="hidden" name="cmd" value="upload" />
							<input type="hidden" name="riderId" value="<%=riderId%>" />
							<input type="hidden" name="eventId" value="<%=eventId%>" />
							<input type="hidden" name="horseMemberId" value="<%=horseMemberId%>" />
							<input type="hidden" name="divId" value="<%=divisionId%>" />
							<input type="hidden" name="evLevel" value="<%=evLevel%>" />
							<input type="hidden" name="chStat" value="<%=chStat%>" />
							<input type="hidden" name="horseName" value="<%=horseName%>" />
			
								<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-2">
										
											<label class="control-label label1">Begin Date</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">End Date</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Event Title</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Organizer Name</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Area Code</label>
										
										</div>
										
										<div class="col-md-1">
										
											<label class="control-label label1">Location</label>
										
										</div>
										
										<div class="col-md-1">
										
											<label class="control-label label1">Status</label>
										
										</div>
									</div>
								</div>
							</div>
			
								<%
									HLCCalendarVO calVO = new HLCCalendarVO();
									if(objProCalList!=null && objProCalList.size()!=0){
									Iterator itr =objProCalList.iterator();
										while(itr.hasNext()){
											calVO =(HLCCalendarVO)itr.next();
											String evId = calVO.getEventId();
											String beginDate=dateFormat(calVO.getBeginDate());
											String endDate=dateFormat(calVO.getEndDate());
											String eventTitle=calVO.getEventTitle();
											String orgId=calVO.getOrganizerId();
											String areaCode=calVO.getAreaCode();
											String areaName=calVO.getAreaName();
											String stateName=calVO.getStateName();
											String areaChApprovStat=calVO.getOrgApprovalStatus();
											String status=calVO.getStatus();
								%>
								
								<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-2">
										
											<label class="control-label "><%=beginDate%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=endDate%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<a href="calender.html?method=eventView&eventId=<%=eventId%>"><%=eventTitle%></a>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=orgFirstName%>&nbsp;<%=orgLastName%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=areaCode%></label>
										
										</div>
										
										<div class="col-md-1">
										
											<label class="control-label "><%=stateName%></label>
										
										</div>
										
										<div class="col-md-1">
										
											<label class="control-label "><%=status%></label>
										
										</div>
										
									</div>
									
								</div>
								
							</div>
							
		<%}}else{%>
							
							<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-4">
										</div>
											
										<div class="col-md-4">
											No records are available.
										</div>
										
									</div>
								</div>
		
		<%}%>

							<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label"><%=eventTypeName%></label>	
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label"><%=eventLevelName%></label>
											</div>
										</div>
									</div>
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Division:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label"><%=divisionName%></label>
											</div>
										</div>
									</div>
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label"><%=horseMemberId%></label>
											</div>
										</div>
									</div>
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label"><%=horseName%></label>	
											</div>
										</div>
									</div>
								</div>
												
												
				<p>Horse Validation Record Vs Available Validation Criteria</p>
				
				
							<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-1">
										
											<label class="control-label label1">&nbsp;</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Jump Penalties</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Time Penalties</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Rank Details</label>
										
										</div>
										
										<div class="col-md-1">
										
											<label class="control-label label1">Horse Age</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Membership Type</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label label1">Event Division</label>
										
										</div>
									</div>
								</div>
							</div>
						
			
			<%
				System.out.println("horseDetails.size(): "+horseDetails.size());
				if(horseDetails!=null && horseDetails.size()!=0){
					Iterator itr = horseDetails.iterator();
					while(itr.hasNext()){
						String hDet[] = (String[])itr.next();
                        
                        String horseMembId = hDet[0];
                        String colorCode = hDet[1];
                        String jumpPenalties = hDet[2];
                        String timePenalties = hDet[3];
                        String finalPoints = hDet[4];
                        String membTypeId = hDet[5];
						String membTypeName = hDet[8];
						
			%>
			
							<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-1">
										
											<label class="control-label ">Horse Record:</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(jumpPenalties)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(timePenalties)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(finalPoints)%></label>
										
										</div>
										
										<div class="col-md-1">
										
											<label class="control-label "><%=nullCheck(horseAge)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(membTypeName)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(divisionName)%></label>
										
										</div>
										
									</div>
									
								</div>
								
							</div>
			
			<%		}
				}else{
			%>
						<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-1">
										
											<label class="control-label ">Horse Record:</label>
										
										</div>
									
										<div class="col-md-3">
										</div>
											
										<div class="col-md-4">
											No records are available.
										</div>
										</div>
									</div>
								</div>
			<%
				}
				if(horseValidationDetails!=null && horseValidationDetails.size()!=0){
                    Iterator itv = horseValidationDetails.iterator();
                    while(itv.hasNext()){
                        String vDet[] = (String[])itv.next();
						String userTypeId = vDet[0];
						String evTypeId = vDet[1];
						String evLevelId = vDet[2];
						String eventDivisionId = vDet[3];
						String membershipTypeName = vDet[4];
						String minAge = vDet[5];
						String eventLevelRank = vDet[6];
						String qualificationPeriod = vDet[7];
						String minRank = vDet[8];
						String maxRank = vDet[9];
						String minCount = vDet[10];
						String jumpPenalty = vDet[11];
						String timePenalty = vDet[12];
						String membershipTypeId = vDet[13];
						String priority = vDet[16];
						String dvName = vDet[14];
						String maxAge = vDet[15];
			%>
			
			
						<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-1">
										
											<label class="control-label ">Eligibility Criteria:</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(jumpPenalty)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(timePenalty)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(minRank)%>&nbsp;-&nbsp;<%=nullCheck(maxRank)%></label>
										
										</div>
										
										<div class="col-md-1">
										
											<label class="control-label "><%=nullCheck(minAge)%>&nbsp;-&nbsp;<%=nullCheck(maxAge)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(membershipTypeName)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(dvName)%></label>
										
										</div>
										
									</div>
									
								</div>
								
							</div>
			
							
							<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Record Count:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label "><%=horseRecordCount%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Minimum Record Count For Qualification:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label "><%=minCount%></label>
											</div>
										</div>
									</div>
								</div>
				
			<%}}else{%>
						
						<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-1">
										
											<label class="control-label ">Eligibility Criteria:</label>
										
										</div>
									
										<div class="col-md-3">
										</div>
											
										<div class="col-md-4">
											No records are available.
										</div>
										</div>
									</div>
								</div>

			<%}%>
			<p>Rider Validation Record Vs Available Validation Criteria</p>
			
						
			
			<%
				if(riderDetails!=null && riderDetails.size()!=0){
					Iterator itr = riderDetails.iterator();
					while(itr.hasNext()){
						String hDet[] = (String[])itr.next();
						String rEventId = hDet[0];
						String rEventTypeId = hDet[1];
						String rEventDivisionId = hDet[2];
						String rFinalPoints = hDet[3];
						String rJumpPenalties = hDet[4];
						String rTimePenalties = hDet[5];
						String rMembershipTypeId = hDet[6];
						String rMembershipTypeName = hDet[7];
			%>
			
						<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-2">
										
											<label class="control-label ">Rider Record:</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(rTimePenalties)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(rFinalPoints)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(rMembershipTypeName)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(divisionName)%></label>
										
										</div>
										
										
									</div>
								</div>
							</div>
			

			<%}}else{%>
			
						<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-2">
										
											<label class="control-label ">Rider Record:</label>
										
										</div>
										
										<div class="col-md-2">
										</div>
										
										<div class="col-md-4">
											No Records Found
										</div>
									</div>
								</div>
							</div>
			
			<%}
				if(riderValidationDetails!=null && riderValidationDetails.size()!=0){
					Iterator itv = riderValidationDetails.iterator();
					while(itv.hasNext()){
						String vDet[] = (String[])itv.next();
						String rUserTypeId = vDet[0];
						String rEvTypeId = vDet[1];
						String rEvLevelId = vDet[2];
						String rEventDivisionId = vDet[3];
						String rMembershipTypeName = vDet[4];
						String rMinAge = vDet[5];
						String rEventLevelRank = vDet[6];
						String rQualificationPeriod = vDet[7];
						String rMinRank = vDet[8];
						String rMaxRank = vDet[9];
						String rMinCount = vDet[10];
						String rJumpPenalty = vDet[11];
						String rTimePenalty = vDet[12];
						String rMembershipTypeId = vDet[13];
						String rPriority = vDet[16];
						String rDivName = vDet[14];
						String rMaxAge = vDet[15];
			%>
			
			
						<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-2">
										
											<label class="control-label ">Eligibility Criteria:</label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(rTimePenalty)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(rMinRank)%>&nbsp;-&nbsp;<%=nullCheck(rMaxRank)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(rMembershipTypeName)%></label>
										
										</div>
										
										<div class="col-md-2">
										
											<label class="control-label "><%=nullCheck(rDivName)%></label>
										
										</div>
										
										
									</div>
								</div>
							</div>
			
			
						<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider Record Count:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <label class='control-label'><%=riderRecordCount%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Minimum Record Count For Qualification:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <label class='control-label'><%=rMinCount%></label>
											</div>
										</div>
									</div>
								</div>
			

			<%}}else{%>
			
						<div class="form-group">
									
									<div class="row">
									
										<div class="col-md-12 gp">
									
										<div class="col-md-2">
										
											<label class="control-label ">Eligibility Criteria:</label>
										
										</div>
										
										<div class="col-md-2">
										</div>
										
										<div class="col-md-4">
											No Records Found
										</div>
									</div>
								</div>
							</div>
			
			<%}%>
			
							<div class="form-group">
							
								<div class="col-md-offset-1 col-md-3">
									
									<a href="OEEAddTrainer.html?process=initTrainer&horseMemberId=<%=horseMemberId%>&eventTypeId=<%=eventId%>&horseName=<%=horseName%>" class="linkFive">Change Event & Divisional Details</a>
								
								</div>
								
								<div class="col-md-3">
									
									<a href="OEEDemo.html?process=UserListing" class="linkFive">Upgrade or Edit Membership Details</a>
								
								</div>
							</div>
			
			
					<div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Result File:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												<html:file  property="fileUpload" styleClass="form-control"  />	
													<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class='form-group'>
                                    <div class='col-md-offset-1 col-md-3'>
                                        <button class='btn-sm btn-primary' type='submit' name="redir" id="redir" value="Upload & Select Another Horse">Upload & Select Another Horse</button>
                                    </div>
                                    <div class='col-md-3'>
                                        <button class='btn-sm btn-danger' style='' type="submit" name="redir" id="redir" value="Upload & Proceed To Payment">Upload & Proceed To Payment</button>
                                    </div>
                                </div>
				
			  </html:form> 
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
