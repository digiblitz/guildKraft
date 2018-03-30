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
                            <h2>Online Entries Provisional Calendar: Event Details</h2>
						</div>

  <%
		HLCCalendarVO calVO = new HLCCalendarVO();
		
		calVO = (HLCCalendarVO)request.getAttribute("singleEventDetails");
		
		String provisionId = calVO.getCalenderId();
		String startDate = dateFormat(calVO.getBeginDate());
		String endDate = dateFormat(calVO.getEndDate());
		String eventTitle = calVO.getEventTitle();
		String areaName = calVO.getAreaName();
		String stateName = calVO.getStateName();
		String orgStatus = calVO.getOrgApprovalStatus();
		String renewalStatus = calVO.getRenewStat().toString();
		String eventId = calVO.getEventId();
		String eventDesc = calVO.getEventDesc();
		String eventLevels = calVO.getEventLevel();
		String orgComments = calVO.getOrgComments();
		String acStatus = calVO.getArearChairApproStatus();
        String acComments = calVO.getAreaChairCommt();
        String usStatus = calVO.getApprovalStatus();
        String usComments = calVO.getStaffComments();
		String rStat = "";
		if(renewalStatus.equalsIgnoreCase("true"))	rStat = "No";
		else rStat = "Yes";
		
		long stTime = calVO.getBeginDate().getTime();
		long eTime = calVO.getEndDate().getTime();
		long diffTime = eTime - stTime;
		int noDays = (int)(diffTime/(1000*60*60*24));
		int tempNo=noDays+1;
  %>
			<div class='panel-body'>	
				
				 <p>View Event Details:</p>
				 
				 
				 <div class="margin marginn">
					<div class="form-group">
						<div class="col-md-12 gp ">
							<div class="container"> 
								 <div class="row"> 
										<div class="col-md-1">
										</div>
								
										<div class="col-md-2">
											<label class='control-label'>Event Title:</label>
										</div>
												
												
						<div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=eventTitle%></div>
								</div>
							</div>	
							
							
				 <div class="col-md-2">
						<label class='control-label'>Event ID: </label>
					</div>
					
					<div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=eventId%></div>
								</div>
							</div>	
		    
				  
				  <div class="col-md-2">
						<label class='control-label'>Start Date:</label>
					</div>
					
				<div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=startDate%></div>
								</div>
							</div>
				 
				  <div class="col-md-2">
						<label class='control-label'>End Date:</label>
					</div>
					
					
					<div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=endDate%></div>
								</div>
							</div>
				 			  
				   <div class="col-md-2">
						<label class='control-label'>Number Of Days:</label>
					</div>
					
					
				     <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=tempNo%></div>
								</div>
							</div>	
			  
			 	 <div class="col-md-2">
					<label class='control-label'>Area Name:</label>
				</div>
				
				
				     <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=areaName%></div>
								</div>
							</div>
		     
			  <div class="col-md-2">
					<label class='control-label'>Location:</label>
				</div>
				
				
				    <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=stateName%></div>
								</div>
							</div>
		    
			  <div class="col-md-2">
					<label class='control-label'>Event Description: </label>
				</div>
				
				   <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=nullCheck(eventDesc)%></div>
							</div>
						</div>
			  
			  
			 <div class="col-md-2">
					<label class='control-label'>Event Levels: </label>
				</div>
				
				<div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=eventLevels%></div>
							</div>
					</div>			  
			  
			 <div class="col-md-2">
					<label class='control-label'>Organizer Approval Status:</label>
				</div>
				
				
				    <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=orgStatus%></div>
							</div>
						</div>
		       <div class="col-md-2">
					<label class='control-label'>Organizer Approval Comments: </label>
				</div>
			  
			  
				  <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=nullCheck(orgComments)%></div>
							</div>
						</div>
		
			  
			  
			  <div class="col-md-2">
					<label class='control-label'>Staff Approval Status:</label>
				</div>
				
				     <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=usStatus%></div>
								</div>
							</div>
			  
			  
			 <div class="col-md-2">
					<label class='control-label'>Staff Approval Comments: </label>
			</div>
			
				      <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=nullCheck(usComments)%></div>
								</div>
							</div>
			  
			  
			 <div class="col-md-2">
					<label class='control-label'>Renewal Status:</label>
			</div>
			
			 <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'><%=rStat%></div>
								</div>
							</div>
		      
			  
			   <div class='form-group'>
                    <div class='col-md-offset-4 col-md-1'>
                        <button class='btn-lg btn-primary' type='submit' onclick="javascript:history.back(-1);">Back</button>
					</div>
				</div>
								</div>
										
							</div>
									
						</div>
									
                     </div>
				</div>
			   
    </div>
					</div>
                   </div>
               
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

     			</div>
            </div>
		</div> 
		
 
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			


<!--==============================================footer end here============================================-->
	</body>
	</html>		
