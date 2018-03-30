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
function onValidate(){
	if(document.areaChairList.year.value==""){
		alert("Select a Year");
		document.areaChairList.year.focus();
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

			
			  <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
 							<h2> Click on Event Id to view/approve Price Details for that Event.</h2>
  						</div>
						
						
					<div class='panel-body'>
<%
	java.util.Date orgDate = new java.util.Date();
	int currentYear = 1900+orgDate.getYear();
	String selYear = (String)request.getAttribute("selYear");
	String acStatus = (String)request.getAttribute("acStatus");
	String approveStatus = (String)request.getAttribute("approveStatus");
	String dispAppStatus = "";
	if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveSuccess")){
		dispAppStatus = "Approval Status Changed Successfully";
	} else if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveFailed")){
		dispAppStatus = "Approval Status Cannot be Changed";
	}
	int selectedYear = 0;
	if(selYear!=null && selYear.trim().length()!=0){
		selectedYear = Integer.parseInt(selYear);
	}
%>	
		
		<form name="areaChairList" action="OECalendar.html" method="post" onsubmit="return onValidate();">
		<div class='form-group'>
		
		<input type="hidden" name="cmd" value="viewACList" />
		<%if(approveStatus!=null && approveStatus.trim().length()!=0){%>
		<div class='col-md-2'>
			<label class='control-label'><%=dispAppStatus%></label>
		</div>
		
		<%}%>
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Year:</label>
		
		<div class='col-md-8'>
            <div class='col-md-3 indent-small'>
                <div class='form-group internal'>
						<select name="year" id="year" class="form-control" >
								<option selected="selected" value="" >Select One</option>
								<%
									for(int i=2000; i<(currentYear+2); i++){
										if(selectedYear!=0 && selectedYear==i){
								%>
								<option value="<%=i%>" selected="selected"><%=i%></option>
								<%}else{%>
								<option value="<%=i%>"><%=i%></option>
								<%
									}
								}
								%>
						</select><span class="asterisk" id="span_astriesk">*</span>
							</div>
                        </div>
                      </div>
						
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Status:</label>
					<div class='col-md-8'>
          			  <div class='col-md-3 indent-small'>
                			<div class='form-group internal'>
									<select name="acStatus" id="acStatus" class="form-control" >
											<option selected="selected" value="" >Select One</option>
												<%
													String[] status = new String[]{"Approved","Pending","Rejected"};
													for(int k =0; k<status.length; k++){
														if(acStatus!=null && acStatus.equalsIgnoreCase(status[k])){
												%>
											<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
												<%}else{%>
											<option value="<%=status[k]%>"><%=status[k]%></option>
												<%}}%>
									</select>
									</div>
								</div>
							</div>
							
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
									</div>		
							</div>
						</div>	
			</form>
		  <div class="margin marginn">
				<div class="form-group">
					<div class="col-md-12">
					
						<div class="col-md-2">
							<label class='control-label label1'>Event Date</label>
						</div>
						
						<div class="col-md-2">
							<label class='control-label label1'>Event Id</label>
						</div>
						
						<div class="col-md-2">
							<label class='control-label label1'>Organizer Id </label>
						</div>
						
						<div class="col-md-2">
							<label class='control-label label1'>Location</label>
						</div>
						
						<div class="col-md-2">
							<label class='control-label label1'>Edit</label>
						</div>
						
						<div class="col-md-2">
							<label class='control-label label1'>Approve</label>
						</div>
						
						<div class="col-md-2">
							<label class='control-label label1'>Renewal Status</label>
						</div>
		  			

			<%
				String appStatus = "";
				HLCCalendarVO calVO = new HLCCalendarVO();
				ArrayList areaChairList = (ArrayList)request.getAttribute("areaChairList");
				if(areaChairList!=null && areaChairList.size()!=0){
					Iterator itr = areaChairList.iterator();
					while(itr.hasNext()){
						calVO = (HLCCalendarVO)itr.next();
						String provisionId = calVO.getCalenderId();
						String startDate = dateFormat(calVO.getBeginDate());
						String endDate = dateFormat(calVO.getEndDate());
						String eventTitle = calVO.getEventTitle();
						String areaName = calVO.getAreaName();
						String stateName = calVO.getStateName();
						String orgStatus = calVO.getOrgApprovalStatus();
						String renewalStatus = calVO.getRenewStat().toString();
						String eventId = calVO.getEventId();
						String areaStatus = calVO.getArearChairApproStatus();
						String rStat = "";
						String organizerId = calVO.getOrganizerId();
						if(renewalStatus.equalsIgnoreCase("true")) rStat = "No";
						else rStat = "Yes";
						if(orgStatus!=null && orgStatus.equalsIgnoreCase("Approved")) appStatus = "";
						else appStatus = "disabled";
												
			%>
		  <div class="margin marginn">
				<div class='form-group'>
						<div class="col-md-12">
							 <div class="container"> 
								   <div class="row"> 
								   
									  <div class='col-md-2'>
											<label class='control-label'><%=startDate%></label>
										</div>
										
										<div class='col-md-2'>
											<label class='control-label'><a href="OECalendar.html?cmd=areaChairView&provisionalId=<%=provisionId%>"><%=eventTitle%></a></label>
										</div>
										
										<div class='col-md-2'>
											<label class='control-label'><a href="OEEAddPrice.html?cmd=initViewPrice&eventId=<%=eventId%>"><%=eventId%></a></label>
										</div>
										
										<div class='col-md-2'>
											<label class='control-label'><%=organizerId%></label>
										</div>
										
										<div class='col-md-2'>
											<label class='control-label'><%=stateName%></label>
										</div>
										
										<div class='col-md-2'>
											<button class='btn-lg btn-primary' type='submit' onclick="location.href='calender.html?method=initAreaChairUpdate&provisionalId=<%=provisionId%>'" >Edit</button>
										</div>
										
										<div class='col-md-2'>
											<button class='btn-lg btn-primary' type='submit' onclick="location.href='OECalendar.html?cmd=areaChairApprove&provisionalId=<%=provisionId%>'"><%=appStatus%></button>
										</div>
											
											
										<div class='col-md-2'>
											<label class='control-label'>><%=rStat%></label>
										</div>
										
										</div>
										
									</div>
									
								</div>
									
                             </div>
								
						</div>
		   
			<%
				}
			}else{
			%>
	  		<div class='form-group'>
				<div class="container"> 
					<div class="row"> 
							<div class='col-md-4'>
								</div>
								<div class='col-md-4'>
									No Records Found
								</div>
							</div>
						</div>
					</div>
								
								
		   <%}%>
	  	
	  
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
			
</body>

</html>
