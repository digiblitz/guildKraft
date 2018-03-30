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
<%@ page import="com.hlcutil.HLCCalendarVO"%>
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
<script language="javascript" type="text/javascript">
function myValidate(){
	if(document.approveUStaffList.uStaffStatus.value==""){
		alert("Select any Approval Status");
		document.approveUStaffList.uStaffStatus.focus();
		return false;
	}
	if(document.approveUStaffList.uStaffComments.value.length>1024){
		alert("Comments cannot exceed 1024 characters");
		document.approveUStaffList.uStaffComments.focus();
		return false;
	}
	return true;
}
</script>

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
                            <h2> Online Entries Provisional Calendar: Event Approval Details</h2>
					</div>
					
  		<div class='panel-body'>
  <%
		HLCCalendarVO calVO = new HLCCalendarVO();
		
		calVO = (HLCCalendarVO)request.getAttribute("singleEventDetails");
		
		String provisionId = calVO.getCalenderId();
		String startDate = dateFormat(calVO.getBeginDate());
		String endDate = dateFormat(calVO.getEndDate());
		String eventTitle = calVO.getEventTitle();
		String areaName = calVO.getAreaName();
		String stateName = calVO.getStateName();
		String renewalStatus = calVO.getRenewStat().toString();
		String eventId = calVO.getEventId();
		String eventDesc = calVO.getEventDesc();
		String eventLevels = calVO.getEventLevel();
		String acStatus = calVO.getArearChairApproStatus();
        String acComments = calVO.getAreaChairCommt();
        String orgStatus = calVO.getOrgApprovalStatus();
        String orgComments = calVO.getOrgComments();
		String ustaffComments = calVO.getStaffComments();
		String ustaffStatus = calVO.getApprovalStatus();
		
		
		if(ustaffComments!=null && ustaffComments.trim().length()!=0){
			ustaffComments = ustaffComments;
		}else{
			ustaffComments = "";
		}
		long stTime = calVO.getBeginDate().getTime();
		long eTime = calVO.getEndDate().getTime();
		long diffTime = eTime - stTime;
		int noDays = (int)(diffTime/(1000*60*60*24));
		int tempNo=noDays+1;
  %>
			
				  
		<div class='form-group'>
			<p>Approve  Event Details:</p>
			
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
					<div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(eventTitle)%>
							</div>
						</div>
					</div>
				
				  
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event ID:</label>
				   <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(eventId)%>
							</div>
						</div>
					</div>
					 
					 
		     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Start Date:</label>
					 <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=startDate%>
							</div>
						</div>
					</div>
				  
				  
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>End Date:</label>
					<div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=endDate%>
							</div>
						</div>
					</div>
				  	  
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number Of Days: </label>
				    <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=tempNo%>
							</div>
						</div>
					</div>
		     
			 
			  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Name:</label>
				     <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(areaName)%>
							</div>
						</div>
					</div>
		      
			  
			  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
				    <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(stateName)%>
							</div>
						</div>
					</div>
		      
			  
			  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Description:</label>
			  		<div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(eventDesc)%>
							</div>
						</div>
					</div>
		    
			  
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Levels: </label>
				    <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(eventLevels)%>
							</div>
						</div>
					</div>
		   
			  
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Chair Approval Status:</label>
				   <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(acStatus)%>
							</div>
						</div>
					</div>
		     
			  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Chair Approval Comments:</label>
				     <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(acComments)%>
							</div>
						</div>
					</div>
		      
			  
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organizer  Approval Status: </label>
				    <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(orgStatus)%>
							</div>
						</div>
					</div>
			  
			  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organizer Approval Comments: </label>
				    <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
								<%=nullCheck(orgComments)%>
							</div>
						</div>
					</div>
				</div>
			  
			  <form name="approveUStaffList" id="approveUStaffList" action="entrylist.html" method="post" onsubmit="return myValidate()">
			  <input type="hidden" name="process" value="eventApprove" />
			  <input type="hidden" name="provisionId" value="<%=provisionId%>" />
			 <div class='form-group'>
			 
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Approval Status: </label>
				      <div class='col-md-8'>
						<div class='col-md-3 indent-small'>
							<div class='form-group internal'>
					 			<select name="uStaffStatus" id="uStaffStatus" class="form-control" >
									<option selected="selected" value="" >Select One</option>
								<%	String[] status = new String[]{"Approved","Pending","Rejected"};
									for(int k =0; k<status.length; k++){
										if(ustaffStatus!=null && ustaffStatus.equalsIgnoreCase(status[k])){
								%>
									<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
								<%}else{%>
									<option value="<%=status[k]%>"><%=status[k]%></option>
								<%}}%>
								</select><span class="asterisk" id="span_astriesk">*</span>					
							</div>
						</div>
					</div>
						
			  
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approval Comments: </label>
				 <div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
							<textarea name="uStaffComments" id="uStaffComments"><%=ustaffComments%></textarea><span class="asterisk" id="spn_astriesk">*</span>	
						</div>
					</div>
				</div>
			  
				  <div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-primary' type="submit" name="appButton" id="appButton" value="Submit">Submit</button>
				</div>
				
				<div class='col-md-1'>
						<button class='btn-lg btn-primary' type="button" onclick="javascript:history.back(-1);" value="Back">Back</button>
				</div>
			</div>
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

