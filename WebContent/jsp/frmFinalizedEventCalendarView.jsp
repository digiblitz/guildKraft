<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<%! 

String  nullCheck(String fieldName){
	String retValue = "<b>N/A</b>";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
  <%!				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
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
                            <h2> Online Entries Finalized Event Calendar Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		 
							  <%
							  
									HLCCalendarVO calVO = new HLCCalendarVO();
									
									calVO = (HLCCalendarVO)request.getAttribute("objCalVO");
									
									String provisionId = calVO.getCalenderId();
									String startDate = dateFormat(calVO.getBeginDate());
									String endDate = dateFormat(calVO.getEndDate());
									String eventTitle = calVO.getEventTitle();
									String eventTyp = calVO.getEventTypeId();
									String areaName = calVO.getAreaName();
									String stateName = calVO.getStateName();
									String eventId = calVO.getEventId();
									String eventDesc = calVO.getEventDesc();
									String eventLevels = calVO.getEventLevel();
									String chmpLevels = calVO.getChmpLevel();
									String acStatus = calVO.getArearChairApproStatus();
									String acComments = calVO.getAreaChairCommt();
									String orgStatus = calVO.getOrgApprovalStatus();
									String orgComments = calVO.getOrgComments();
									String usStatus = calVO.getApprovalStatus();
									String usComments = calVO.getStaffComments();
									String orgId = calVO.getOrganizerId();
									String orgFName = calVO.getOrgFName();
									String orgLName = calVO.getOrgLName();
									
									
									long stTime = calVO.getBeginDate().getTime();
									long eTime = calVO.getEndDate().getTime();
									long diffTime = eTime - stTime;
									int noDays = (int)(diffTime/(1000*60*60*24));
									int tempNo=noDays+1;
							  %>
			
				 					
									<p>View Event Details: </p>
				  			
							
							 <div class='form-group'>
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventTitle)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventId)%></label>
											</div>
										</div>
									</div>

                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventTyp)%></label>
											</div>
										</div>
									</div>

                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Start Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(startDate)%></label>
											</div>
										</div>
									</div>

                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>End Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(endDate)%></label>
											</div>
										</div>
									</div>

                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Number Of Days:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=tempNo%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Area Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(areaName)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(stateName)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventDesc)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Levels:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventLevels)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Championship Event Levels:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(chmpLevels)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Area Chair Approval Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(acStatus)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Organizer ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(orgId)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Organizer Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(orgFName+" "+orgLName)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Organizer Approval Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(orgStatus)%></label>
											</div>
										</div>
									</div>
									
                                 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Staff Approval Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(usStatus)%></label>
											</div>
										</div>
									</div>
							</div>
							
							
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-danger' type="button" onclick="javascript:history.back(-1);" value="Back">Back</button>
                                    </div>
                                    <div class='col-md-3'>
                                        <button class='btn-lg btn-primary' type="button" name="process" value="Enter into this Event"  onclick="location.href='OEEDemo.html?process=initDemoList&eventTypeId=<%=eventId%>&compYear=<%=startDate.substring(6,10)%>'" style=''>Enter into this Event</button>
                                    </div>
                                </div>
							
					<!--==============================Content end here=================================-->
							
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
