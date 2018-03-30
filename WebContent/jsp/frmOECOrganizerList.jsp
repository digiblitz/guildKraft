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

<script language="javascript" type="text/javascript">
function onValidate(){
	if(document.organizerList.year.value==""){
		alert("Select a Year");
		document.organizerList.year.focus();
		return false;
	}
	return true;
}
</script>

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
					
										<!-- CONTENTS START HERE -->
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
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Online Entries Provisional Calendar: Organizer List</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Click on Event Id to set/view Price Details for that Event.</p>
							
						<!--==============================Form Description=================================-->

						  
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
								 
								<form class='form-horizontal' role='form' name="organizerList" action="OECalendar.html" method="post" onsubmit="return onValidate();">
								<input type="hidden" name="cmd" value="viewList" />
								<%if(approveStatus!=null && approveStatus.trim().length()!=0){%>
								
								<div class='col-md-2'>
								<label class='control-label '><%=dispAppStatus%></label>
								</div>
								
							<%}%>
							
							<div class='form-group'>
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
											</select>
											<span id="span_astriesk">*</span>
											</div>
                                        </div>

                                    </div>
									
                                </div>
		
		
							<!--&nbsp;&nbsp;<strong>Area Chair Status:</strong> &nbsp;
							<select name="acStatus" id="acStatus" class="selectboxOne" >
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
							</select>&nbsp;&nbsp;-->
							
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" name="submit" value="Submit">Submit</button>
                                    </div>
                                </div>
		
						</form>
						
						<div class='form-group'>
								<div class="col-md-12">
								
									<div class="col-md-2">
									<label class='control-label label1'>Event Date</label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Event Title</label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Event Id </label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Area Name</label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Location</label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Edit</label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Approve</label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Renewal Status</label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Status</label> 
									</div>
									
								</div>
							</div>

			<%
				HLCCalendarVO calVO = new HLCCalendarVO();
				ArrayList organizerList = (ArrayList)request.getAttribute("organizerList");
				if(organizerList!=null && organizerList.size()!=0){
					Iterator itr = organizerList.iterator();
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
						System.out.println("renewalStatus"+renewalStatus);
						String eventId = calVO.getEventId();
						String areaStatus = calVO.getArearChairApproStatus();
						String rStat = "";
						if(renewalStatus.equalsIgnoreCase("true")){
						 rStat = "No";
						 }
						else {
						rStat = "Yes";}
						
			%>
			
							<div class='form-group'>
								<div class="col-md-12">
								
									<div class="col-md-2">
									<label class='control-label'><%=startDate%></label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label'><a href="OECalendar.html?cmd=singleEventView&provisionalId=<%=provisionId%>"><%=eventTitle%></a></label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label'><a href="OEEAddPrice.html?cmd=initOrgView&eventId=<%=eventId%>"><%=eventId%></a></label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label'><%=areaName%></label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label'><%=stateName%></label> 
									</div>
									
									<div class="col-md-1">
									<button type="button" name="process" value="Edit" class="btn-sm btn-primary" onclick="location.href='calender.html?method=initUpdate&provisionalId=<%=provisionId%>'">Edit</button>
									</div>
									
									<div class="col-md-1">
									<button type="button" name="process" value="Approve" class="btn-sm btn-primary" onclick="location.href='OECalendar.html?cmd=singleEventApprove&provisionalId=<%=provisionId%>'" >Approve</button>
									</div>
									
									<div class="col-md-2">
									<label class='control-label'>&emsp;&emsp;<%=rStat%></label> 
									</div>
									
									<div class="col-md-1">
									<label class='control-label'><%=areaStatus%></label> 
									</div>
									
								</div>
							</div>
					<%}}else{%>
					
					 			<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-3'>
                                       No Records Found
                                    </div>
								</div>
		   				<%}%>
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
