<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcmro.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
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
<script language="javascript" type="text/javascript">
function myValidate(){
		if((document.frmOECSearchEvents.txtEventId.value=="") && (document.frmOECSearchEvents.txtEventTitle.value=="") && (document.frmOECSearchEvents.selArea.selectedIndex==0) && (document.frmOECSearchEvents.year.selectedIndex==0)){
		alert("Please Provide Any One Of The Information");
		document.frmOECSearchEvents.txtEventId.focus();
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
            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
						
						<h2>Online Event Entries:</h2>
						
						</div>
				<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						

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
				
			
					<%
					java.util.Date orgDate = new java.util.Date();
					int currentYear = 1900+orgDate.getYear();
					String eveId = (String)request.getAttribute("eventId");
					String eveTitle = (String)request.getAttribute("eventTitle");
					String selArea = (String)request.getAttribute("areaId");
					String fstName=(String)session.getAttribute("firstName");
					String lastName=(String)session.getAttribute("lastName");
					String compYear=(String)request.getAttribute("compYear");
					System.out.println("compYear"+compYear);
					int selectedYear = 0;
				if(compYear!=null && compYear.trim().length()!=0){
					selectedYear = Integer.parseInt(compYear);
				}
					
					%>	  
		
		
					<form class='form-horizontal' role='form' name="frmOECSearchEvents" id="frmOECSearchEvents" action="calender.html" onsubmit="return myValidate()" >
						   <input type="hidden" name="method" value="search" />
						
							<%if(eveId!=null){%>
						 
						 
						 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												<input  type="text" name="txtEventId" id="txtEventId"  class="form-control" value="<%=eveId%>" />  
											</div>
										</div>
									</div>
								</div>      
						
								<%}else{%>
						 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												<input  type="text" name="txtEventId" id="txtEventId"  class="form-control" value="" />          
											</div>
										</div>
									</div>
								</div>
						<%}%>
						<%if(eveTitle!=null){%>
						
						 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												<input  type="text" name="txtEventTitle" id="txtEventTitle"  class="form-control"  value="<%=eveTitle%>"  />
											</div>
										</div>
									</div>
								</div>
								
						<%}else{%>
						
						<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
													<input  type="text" name="txtEventTitle" id="txtEventTitle"  class="form-control"  value="" size="10" />  
											</div>
										</div>
									</div>
								</div>
					  <%}%>
					
						<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												  <select name="selArea" id="selArea" class="form-control">
													<option selected="selected" value="">Select One</option>
													<%
													ArrayList allAreaList = (ArrayList)request.getAttribute("selectAreaDetails");
													if(allAreaList!=null&& allAreaList.size()!=0){
													Iterator areaLst = allAreaList.iterator();
													while(areaLst.hasNext()){
													String AreaLstArr[] = (String [])areaLst.next();
													String area_id = AreaLstArr[0];
													String area_code = AreaLstArr[1];
													String area_name = AreaLstArr[2];
													out.print("area_id "+area_id);
													if(area_id.trim().equalsIgnoreCase(selArea)){
													%>
													<option  value="<%=area_id%>" selected="selected"><%=area_name%></option>
													<%
													}else{
													%>
													<option  value="<%=area_id%>"><%=area_name%></option>
													<%}}}%>
												  </select>
												 </div>
											</div>
										</div>
									</div>
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
											</div>
										</div>
									</div>
								</div>
			
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="Search" value="Search" type='submit'>Search</button>
                                    </div>
							</div>
					   </form>
					  
					  <div class='margin marginn'>
					 		 <div class="form-group">
									<div class="col-md-12 gp ">
									  	 <div class="row"> 
												<div class=' col-md-2'>
													<label class='control-label label1'>Event Date </label>
												</div>
												<div class=' col-md-2'>
						  							<label class='control-label label1'>Event Title</label>
												</div>
												<div class=' col-md-2'>
						  							<label class='control-label label1'>Organizer Name</label>
												</div>
												<div class=' col-md-2'>
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
								</div>
							</div>							
							
						  
									  <%
									  HLCCalendarVO calVO = new HLCCalendarVO();
									  ArrayList objProCalList = (ArrayList)request.getAttribute("selectEventDetails");
											if(objProCalList!=null && objProCalList.size()!=0){
											   Iterator itr =objProCalList.iterator();
					
										while(itr.hasNext()){
											calVO =(HLCCalendarVO)itr.next();
											String eventId = calVO.getEventId();
											String beginDate=dateFormat(calVO.getBeginDate());
											String endDate=dateFormat(calVO.getEndDate());
											String eventTitle=calVO.getEventTitle();
											String orgId=calVO.getOrganizerId();
											String areaId=calVO.getAreaId();
											String areaName=calVO.getAreaName();
											String stateName=calVO.getStateName();
											String areaChApprovStat=calVO.getOrgApprovalStatus();
											String status=calVO.getStatus();
											String orgFirstName = calVO.getOrgFName();  
											String orgLastName = calVO.getOrgLName();
									  %>
									 
						<div class="margin marginn">	 
					 		 <div class="form-group">
									<div class="col-md-12 gp ">
									  	 <div class="row"> 
												<div class=' col-md-2'>
													<label class='control-label label1'><%=beginDate%></label>
												</div>
												<div class=' col-md-2'>
						  							<label class='control-label'><a href="calender.html?method=searchEventView&eventId=<%=eventId%>&orgId=<%=orgId%>"><%=eventTitle%></a></label>
												</div>
												<div class='col-md-2'>
						  							<label class='control-label'>><%=orgFirstName+" "+orgLastName%></label>
												</div>
												<div class=' col-md-2'>
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
									</div>
								</div>
						
							
						
						  <%
						  }
						  }
						  else{
						  %>
						 <div class="form-group">
						 	<div class='col-md-4'>
							</div>
							<div class='col-md-4'>
							
						  		 No records are available. 
						
					</div>
					</div>
						
						  
						  <%
						  }
						  %>
						 
					
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
