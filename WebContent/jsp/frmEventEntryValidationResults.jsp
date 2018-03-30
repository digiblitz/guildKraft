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


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
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
                        <div class='panel-heading'>
                            <h2>Selected Event Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		<%
		String orgFirstName = (String)session.getAttribute("orgFirstName");
		String orgLastName = (String)session.getAttribute("orgLastName");

			String eventId = (String)session.getAttribute("eventId");
			String riderId = (String)request.getAttribute("riderId");
			String horseMemeberId = (String)request.getAttribute("horseMemberId");
			String horseName = (String)request.getAttribute("horseName");
			String divisionId = (String)request.getAttribute("divisionId");
			String chStatus = (String)request.getAttribute("championshipStatus");
			
			String horseResult = (String)request.getAttribute("horseResult");
			String riderResult = (String)request.getAttribute("riderResult");
			
			String horseRecordCount = (String)request.getAttribute("horseRecordCount");
			String riderRecordCount = (String)request.getAttribute("riderRecordCount");
			
			ArrayList horseDetails = (ArrayList)request.getAttribute("horseDetails");
			ArrayList riderDetails = (ArrayList)request.getAttribute("riderDetails");
			
			ArrayList horseValidationDetails = (ArrayList)request.getAttribute("horseValidationDetails");
			ArrayList riderValidationDetails = (ArrayList)request.getAttribute("riderValidationDetails");
			
			ArrayList horseValidEventDetails = (ArrayList)request.getAttribute("horseValidEventDetails");
			ArrayList riderValidEventDetails = (ArrayList)request.getAttribute("riderValidEventDetails");
			ArrayList finalEventResults = (ArrayList)request.getAttribute("finalEventResults");
			
			ArrayList eventLevelDetails = (ArrayList)request.getAttribute("eventLevelDetails");
			ArrayList eventTypeDetails = (ArrayList)request.getAttribute("eventTypeDetails");
			ArrayList objProCalList = (ArrayList)request.getAttribute("selectEventDetails");
			
			String horseAge = (String)request.getAttribute("horseAge");
			request.setAttribute("horseAge",horseAge);
			String divisionName = (String)request.getAttribute("divisionName");
			String compYear = (String)session.getAttribute("compYear");
			String eventLevelName = (String)request.getAttribute("eventLevelName");
			String eventTypeName = (String)request.getAttribute("eventTypeName");

			String hResult = "";
			String rResult = "";
			
			if(horseResult!=null && horseResult.equalsIgnoreCase("Success")) hResult = "Yes";
			else hResult = "No";
			
			if(riderResult!=null && riderResult.equalsIgnoreCase("Success")) rResult = "Yes";
			else rResult = "No";
		%>
		
     <form class='form-horizontal' role='form' name="myform" id="myform" method="post" action="validation.html" >
			<input type="hidden" name="cmd" value="startValidate" />
 			<input type="hidden" name="riderId" value="<%=riderId%>" />
			<input type="hidden" name="eventId" value="<%=eventId%>" />
			<input type="hidden" name="horseMemeberId" value="<%=horseMemeberId%>" />
			<input type="hidden" name="chStat" value="<%=chStatus%>" />
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
								<div class="col-md-12 gp">
									<div class="col-md-4">
									</div>
									<div class="col-md-4">
										No records are available
									</div>
								</div>
							</div>
						</div>
		<%}%>
	
							<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label label1"><%=eventTypeName%></label>
											</div>
										</div>
									</div>
												
		
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label label1"><%=eventLevelName%></label>
											</div>
										</div>
									</div>
			
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Division:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label label1"><%=divisionName%></label>
											</div>
										</div>
									</div>
				
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label label1"><%=horseMemeberId%></label>
											</div>
										</div>
									</div>
			
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label label1"><%=horseName%></label>
											</div>
										</div>
									</div>
									
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Qualified:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label label1"><%=hResult%></label>
											</div>
										</div>
									</div>
				
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider Qualified:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
												<label class="control-label label1"></label>
											</div>
										</div>
									</div>
								</div>
				
			<p>Validation Table</p>
								
						<div class="form-group">
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-2 col-md-offset-1">
										<label class="control-label label1">Event Type</label>
									</div>
									<div class="col-md-2">
										<label class="control-label label1">Event Level</label>
									</div>
									<div class="col-md-2">
										<label class="control-label label1">Horse Qualifiede</label>
									</div>
									<div class="col-md-2">
										<label class="control-label label1">Rider Qualified</label>
									</div>
									<div class="col-md-2">
										<label class="control-label label1">Choose</label>
									</div>
								</div>
							</div>
						</div>	
			
			
			<%
				if(finalEventResults!=null && finalEventResults.size()!=0){
					Iterator iter = finalEventResults.iterator();
					while(iter.hasNext()){
						String[] finalDet = (String[])iter.next();
						String eTId = finalDet[0];
						String eLId = finalDet[1];
						String eTName = finalDet[2];
						String eLName = finalDet[3];
						String horseValid = finalDet[4];
						String riderValid = finalDet[5];
						String cStat = finalDet[6];
						String choose = "";
						String chooseURL = "";
						if(horseValid.equalsIgnoreCase("Yes") && riderValid.equalsIgnoreCase("Yes")){
							choose = "Enter";
							chooseURL ="validation.html?cmd=startValidate&horseMemberId="+horseMemeberId+"&eventId="+eventId+"&memberId="+riderId+"&evLevel="+eLId+"|"+eTId+":"+cStat+"&divisionId="+divisionId+"&compYear="+compYear+"&horseName="+horseName;
						}else{
							choose = "View/Edit";
							chooseURL ="validation.html?cmd=viewEventValidationDetails&horseMemberId="+horseMemeberId+"&eventId="+eventId+"&memberId="+riderId+"&evLevel="+eLId+"|"+eTId+"&divisionId="+divisionId+"&compYear="+compYear+"&chStat="+cStat+"&horseName="+horseName;
						}
						
			%>
			
						<div class="form-group">
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-2 col-md-offset-1">
										<label class="control-label "><%=eTName%></label>
									</div>
									<div class="col-md-2">
										<label class="control-label "><%=eLName%></label>
									</div>
									<div class="col-md-2">
										<label class="control-label "><%=horseValid%></label>
									</div>
									<div class="col-md-2">
										<label class="control-label "><%=riderValid%></label>
									</div>
									<div class="col-md-2">
										<button class='btn-sm btn-primary' type="button" name="submit" value="<%=choose%>"  onclick="location.href='<%=chooseURL%>'"><%=choose%></button>
									</div>
								</div>
							</div>
						</div>	
			
			<%}}%>
		
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
