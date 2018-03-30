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

<script src="js/calendar2.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">
function forCheck(){
	document.getElementById('chkEncAcm').style.display = "block";
	document.getElementById('chrgCrdAcm').style.display = "none";
}
function forCard(){
	document.getElementById('chkEncAcm').style.display = "none";
	document.getElementById('chrgCrdAcm').style.display = "block";
}
</script>




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
 
		<%
			String fstName=(String)session.getAttribute("firstName");
			String lastName=(String)session.getAttribute("lastName");
		
			String eventId = (String)session.getAttribute("eventId");
			String riderId = (String)request.getAttribute("riderId");
			String horseMemeberId = (String)request.getAttribute("horseMemberId");
			String horseName = (String)request.getAttribute("horseName");
			
			String horseResult = (String)request.getAttribute("horseResult");
			String riderResult = (String)request.getAttribute("riderResult");
			
			String horseRecordCount = (String)request.getAttribute("horseRecordCount");
			String riderRecordCount = (String)request.getAttribute("riderRecordCount");
			String horseAge = (String)request.getAttribute("horseAge");
			
			ArrayList horseDetails = (ArrayList)request.getAttribute("horseDetails");
			ArrayList riderDetails = (ArrayList)request.getAttribute("riderDetails");
			
			ArrayList horseValidationDetails = (ArrayList)request.getAttribute("horseValidationDetails");
			ArrayList riderValidationDetails = (ArrayList)request.getAttribute("riderValidationDetails");
			
			ArrayList horseValidEventDetails = (ArrayList)request.getAttribute("horseValidEventDetails");
			ArrayList riderValidEventDetails = (ArrayList)request.getAttribute("riderValidEventDetails");
			
			ArrayList eventLevelDetails = (ArrayList)request.getAttribute("eventLevelDetails");
			ArrayList eventTypeDetails = (ArrayList)request.getAttribute("eventTypeDetails");
			
			ArrayList objProCalList = (ArrayList)request.getAttribute("selectEventDetails");
			String divisionName = (String)request.getAttribute("divisionName");
			
			String evLevel = (String)request.getAttribute("evLevel");
			String chStatus = (String)request.getAttribute("championshipStatus");
			String eventLevelName = (String)request.getAttribute("eventLevelName");
			String eventTypeName = (String)request.getAttribute("eventTypeName");
			
			String hResult = "";
			String rResult = "";
			
			if(horseResult!=null && horseResult.equalsIgnoreCase("Success")) hResult = "Yes";
			else hResult = "No";
			
			if(riderResult!=null && riderResult.equalsIgnoreCase("Success")) rResult = "Yes";
			else rResult = "No";

		%>
		
	<div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Selected Event Details:</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<div class='form-group'>
							<div class='col-md-12'>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Begin Date</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>End Date</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Event Title</label>
							</div>
							
							<div class='col-md-3'>
							<label class='control-label label1'>Organizer Name</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Area Code</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Location</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Status</label>
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
							
							<div class='form-group'>
							<div class='col-md-12'>
							
							<div class='col-md-2'>
							<label class='control-label'><%=beginDate%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=endDate%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><a href="calender.html?method=eventView&eventId=<%=eventId%>"><%=eventTitle%></a></label>
							</div>
							
							<div class='col-md-3'>
							<label class='control-label'><%=fstName+" "+lastName%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=areaName%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=stateName%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=status%></label>
							</div>
							
						</div>
					</div>
					
				<%}}else{%>
				
				<div class='form-group'>
					<div class='col-md-offset-4'>
						No records are available.
					</div>
				</div>
			<%}%>
		
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=eventTypeName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=eventLevelName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Division:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=divisionName%></label>
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=horseMemeberId%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=horseName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Qualified:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=hResult%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider Qualified:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=rResult%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
						<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Validation Record Vs Available Validation Criteria</label>
						</div>
						
						<div class='form-group'>
							<div class='col-md-12'>
							
							<div class='col-md-2'>
							<label class='control-label label1'>&nbsp;</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Jump Penalties</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Time Penalties</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Rank Details</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Horse Age</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Membership Type</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Event Division</label>
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
			
						<div class='form-group'>
							<div class='col-md-12'>
							
							<div class='col-md-2'>
							<label class='control-label'>Horse Record:</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(jumpPenalties)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(timePenalties)%></label>
							</div>
							
							<div class='col-md-3'>
							<label class='control-label'><%=nullCheck(finalPoints)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(horseAge)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(membTypeName)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(divisionName)%></label>
							</div>
							
						</div>
					</div>
			
			
				<%}}else{%>
				
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Record:</label>
								
								<div class='col-md-offset-4'>
                                    No Records Found
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
			
			<div class='form-group'>
							<div class='col-md-12'>
							
							<div class='col-md-2'>
							<label class='control-label'>Eligibility Criteria:</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(jumpPenalty)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(timePenalty)%></label>
							</div>
							
							<div class='col-md-3'>
							<label class='control-label'><%=nullCheck(minRank)%>&nbsp;-&nbsp;<%=nullCheck(maxRank)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(minAge)%>&nbsp;-&nbsp;<%=nullCheck(maxAge)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(membershipTypeName)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(dvName)%></label>
							</div>
							
						</div>
					</div>
					
					
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Record Count:</label>
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=horseRecordCount%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Minimum Record Count For Qualification:</label>
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=minCount%></label>
                                            </div>
                                        </div>

                                    </div>
								</div>
			
						<%}}else{%>
						
						<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Eligibility Criteria:</label>
								
								<div class='col-md-offset-4'>
                                    No Records Found
                                </div>
                            </div>

						<%}%>
						
							<div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider Validation Record Vs Available Validation Criteria</label>
							</div>
							
						<div class='form-group'>
							<div class='col-md-8'>
							
							<div class='col-md-2'>
							<label class='control-label label1'>&nbsp;</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Time Penalties</label>
							</div>
							
							
							<div class='col-md-2'>
							<label class='control-label label1'>Rank Details</label>
							</div>
							
							
							<div class='col-md-2'>
							<label class='control-label label1'>Membership Type</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Event Division</label>
							</div>
							
						</div>
					</div>
				

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
					
					<div class='form-group'>
							<div class='col-md-8'>
							
							<div class='col-md-2'>
							<label class='control-label'>Rider Record:</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(rTimePenalties)%></label>
							</div>
							
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(rFinalPoints)%></label>
							</div>
							
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(rMembershipTypeName)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(divisionName)%></label>
							</div>
							
						</div>
					</div>
				
					<%}}else{%>
					
					<div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider Record:</label>
						<div class='col-md-offset-4'>
                        		No Records Found
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
					
					
					<div class='form-group'>
							<div class='col-md-8'>
							
							<div class='col-md-2'>
							<label class='control-label'>Eligibility Criteria:</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(rTimePenalty)%></label>
							</div>
							
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(rMinRank)%>&nbsp;-&nbsp;<%=nullCheck(rMaxRank)%></label>
							</div>
							
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(rMembershipTypeName)%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label'><%=nullCheck(rDivName)%></label>
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
					
						<div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Eligibility Criteria:</label>
						<div class='col-md-offset-4'>
                        		No Records Found
                         </div>
                    </div>
					
					<%}%>
					
								<div class='form-group'>
								
                                    <div class='col-md-offset-3 col-md-3'>
										<button type="button" name="submit" class="btn-lg btn-primary" value="Select Another Horse" 
				onclick="location.href='validation.html?cmd=selAnotherHorse&eventId=<%=eventId%>&riderId=<%=riderId%>&horseMemberId=<%=horseMemeberId%>&evLevel=<%=evLevel%>&redir=horse&chStat=<%=chStatus%>'" >Select Another Horse</button>
                                    </div>
									
                                    <div class='col-md-3'>
                                      
										<button type="button" name="pay" class="btn-lg btn-primary" value="Proceed To Payment" 
				onclick="location.href='validation.html?cmd=selAnotherHorse&eventId=<%=eventId%>&riderId=<%=riderId%>&horseMemberId=<%=horseMemeberId%>&evLevel=<%=evLevel%>&redir=payment&chStat=<%=chStatus%>'" >Proceed To Payment</button>
				
                                    </div>
                                </div>
								
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

<script language="javascript">
	var cal2 = new calendar2(document.forms['myform'].elements['checkDate']);
	 cal2.year_scroll = true;
	 cal2.time_comp = false;
</script>


</html>

  
