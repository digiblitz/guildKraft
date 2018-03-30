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
                            <h2> Online Entries Provisional Calendar: Event Details</h2>
					</div>
		<div class='panel-body'>
  <%
		HLCCalendarVO calVO = new HLCCalendarVO();
		
		calVO = (HLCCalendarVO)request.getAttribute("objCalVO");
		
		String provisionId = calVO.getCalenderId();
		String startDate = dateFormat(calVO.getBeginDate());
		String endDate = dateFormat(calVO.getEndDate());
		String eventTitle = calVO.getEventTitle();
		String areaName = calVO.getAreaName();
		String stateName = calVO.getStateName();
		String eventId = calVO.getEventId();
		String eventDesc = calVO.getEventDesc();
		String eventLevels = calVO.getEventLevel();
		String acStatus = calVO.getArearChairApproStatus();
        String acComments = calVO.getAreaChairCommt();
        String orgStatus = calVO.getOrgApprovalStatus();
        String orgComments = calVO.getOrgComments();
		
		
		long stTime = calVO.getBeginDate().getTime();
		long eTime = calVO.getEndDate().getTime();
		long diffTime = eTime - stTime;
		int noDays = (int)(diffTime/(1000*60*60*24));
		int tempNo=noDays+1;
  %>
			
	<div class='form-group'>
								
				<p>View Event Details: </p>
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'><%=eventTitle%>
				</div>
			</div>
		</div>
		
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event ID:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=eventId%></label>
					</div>
				</div>
			</div>
			
			
		  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Start Date:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=startDate%></label>
					</div>
				</div>
			</div>
				  
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>End Date:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=endDate%></label>
					</div>
				</div>
			</div>
			
			
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number Of Days:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=tempNo%></label>
					</div>
				</div>
			</div>
		      
			  
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Name: </label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=areaName%></label>
					</div>
				</div>
			</div>
			  
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=stateName%></label>
					</div>
				</div>
			</div>
	
	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Description:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=nullCheck(eventDesc)%></label>
					</div>
				</div>
			</div>
			
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Levels:</label>
			 <div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=eventLevels%></label>
					</div>
				</div>
			</div>
	
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Chair Approval Status:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=acStatus%></label>
					</div>
				</div>
			</div>
			
		<div style="display:inline-block;width:100%">
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Chair Approval Comments: </label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=nullCheck(acComments)%></label>
					</div>
				</div>
			</div>
	   </div>	
	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organizer  Approval Status:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=orgStatus%></label>
					</div>
				</div>
			</div>
		
	<div style="display:inline-block;width:100%">
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organizer Approval Comments:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=nullCheck(orgComments)%></label>
					</div>
				</div>
			</div>
	</div>
</div>		


         <div class="form-group">
			<div class='col-md-offset-4 col-md-1'>
				<button class='btn-lg btn-primary' type="button" onclick="javascript:history.back(-1);" value="Back">Back</button>
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
