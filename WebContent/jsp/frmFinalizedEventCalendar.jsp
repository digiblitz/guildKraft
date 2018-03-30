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
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.HLCCalendarVO"%>
<%@ page import="com.hlcutil.HLCMemberVO"%>
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


function focus_login()
{
	document.frmFinalEveCal.year.focus();
}	
</script>

<style type="text/css">

.styleNew {font-family: Arial, Helvetica, sans-serif;
         font-size:18px;}
.style2 {
	font-size: 16px;
	font-weight: bold;
}
.style3 {font-size: 12px}
.style9 {font-size: 24px}
.style12 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; }
.style14 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: bold; }

</style>
<style type="text/css">
 a:hover {
  cursor:pointer;
 }
</style>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>



<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" onload="focus_login();" theme-bg="bg1">

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
                            <h2>Event Calendar: Select an Event </h2>
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
							//gc.setTime(fieldName);
							//cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
											
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
					
					String selArea = (String)request.getAttribute("area");
					String memberStatus = (String)request.getAttribute("isMember");
					HLCMemberVO memVO = new HLCMemberVO();
					java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
					boolean amaSt1=false;
						boolean amaSt2=false;
						String amStatus1="";
						String amStatus2="";
						memVO = (HLCMemberVO)request.getAttribute("memDetails");
						
						String memberId = memVO.getMemberId();
						String memberName = memVO.getMemberName();
						String age = dateFormat(memVO.getAge());
						String address = memVO.getAddress();
						String city = memVO.getCity();
						String state = memVO.getState();
						String zipcode = memVO.getZipcode();
						amaSt1 = memVO.isDecAmaStatus1();
						amaSt2 = memVO.isDecAmaStatus2();
						String membTypeName=memVO.getMembTypName();
						
						if(amaSt1==true) amStatus1="Yes";
						else amStatus1="No";
						
						if(amaSt2==true) amStatus2="Yes";
						else amStatus2="No";
						
						Calendar cal = Calendar.getInstance();
						
						//long stTime = memVO.getAge().getTime();
						//long eTime = tempDate.getTime();
						//long diffTime = eTime - stTime;
						//int noDays = (int)(diffTime/(1000*60*60*24));		
					
				
				%>	 

				<!--<div align="center"><img src="images/usea_xntry_final.jpg" width="200" /></div>-->


				<form class='form-horizontal' role='form' name="frmFinalEveCal" id="frmFinalEveCal" action="entrylist.html" onsubmit="return myValidate()">
				<input type="hidden" name="process" value="finalEveCal" />		
					
					 <div class='form-group'>
                            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													  <select name="selArea" id="selArea" class="form-control">
														<option selected="selected" value="">Select One</option>
														<option value="">All</option>
														<%						
														ArrayList allAreaList = (ArrayList)request.getAttribute("allAreaList");
														if(allAreaList!=null&& allAreaList.size()!=0){
														Iterator areaLst = allAreaList.iterator();
														while(areaLst.hasNext()){
																String AreaLstArr[] = (String [])areaLst.next();
																String area_id = AreaLstArr[0];
																String area_code = AreaLstArr[1];
																String area_name = AreaLstArr[2];
																out.print("area_id in jsp"+area_id);
																if(area_id.trim().equalsIgnoreCase(selArea)){
														%>
															<option  value="<%=area_id%>" selected="selected"><%=area_name%></option>
								
															<%
																			}
																			else{
																	%>
															<option  value="<%=area_id%>"><%=area_name%></option>
															<%
								
															}
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
                                      			<button class='btn-lg btn-primary' name="submit" value="Submit" type='submit'>Submit</button>
											</div>
											<div class=' col-md-3' style="margin-top:12px">
                                      			<a name="viewcalendar" value="View Calendar" id="viewcalendar" style="cursor:pointer;" onclick="document.location.href='eventcal.html?cmd=viewcalendar'" class='btn-lg btn-primary'>View Calendar</a>
											</div>
										</div>
									
					  </form> 		
		
			

					<img name="" src="" width="1" height="1" alt=""   style="background-color: #F0F0F0" />
  
							<%
							 ArrayList objProCalList = (ArrayList)request.getAttribute("objAppEvent");
															if(objProCalList!=null && objProCalList.size()!=0){
															   Iterator itr =objProCalList.iterator();
							%>
	 					
						
						<p>Select an Event</p>
      				<p>Events highlighted in Blue are open for registration. </p>

    
				<img name="" src="" width="1" height="1" alt=""  style="background-color: #F0F0F0" />

 
								 <%
						  
												  HLCCalendarVO calVO = new HLCCalendarVO();
												 
								
													while(itr.hasNext()){
														String entryStartDate="";
														String entryCloseDate="";
														calVO =(HLCCalendarVO)itr.next();
														String provisionId = calVO.getCalenderId();
														System.out.println("provisionId in jsp"+provisionId);
														String beginDate=dateFormat(calVO.getBeginDate());
														String endDate=dateFormat(calVO.getEndDate());
														String eventTitle=calVO.getEventTitle();
														String eventId = calVO.getEventId();
														String orgId=calVO.getOrganizerId();
														String firstName=calVO.getOrgFName();
														String lastName=calVO.getOrgLName();
														String areaCode=calVO.getAreaCode();
														String areaName=calVO.getAreaName();
														String stateName=calVO.getStateName();
														String areaChApprovStat=calVO.getOrgApprovalStatus();
														
										String tmpVal="";
								String eveTyp2="";
								ArrayList objEveLevels = calVO.getEveLevels();
								//System.out.println(	"objEveLevels: "+objEveLevels.size());
								
								if(objEveLevels!=null && objEveLevels.size()!=0){
								Iterator itrSub = objEveLevels.iterator();
								while(itrSub.hasNext()){
								String[] subEntry = (String[])itrSub.next();
								String eveCode = subEntry[0]; 
								String eveDiv = subEntry[2]; 
								//System.out.println("tmpVal"+eveCode);
								if(tmpVal==""){
								tmpVal = eveCode+"("+eveDiv+")";	
								}else{	
								tmpVal = tmpVal + ","+ eveCode+"("+eveDiv+")";		
								}														
								}								
								}				    
						  %>
						
						<div class="form-group">
									
								
										
									  		 <div class="row"> 
											 
													<div class='col-md-offset-1 col-md-2'>
  
							 <%if(calVO.getEntryStrtDate()!=null && calVO.getEntryEndDate()!=null){
															Date today=new Date();                 	 
															Date entryStartDate1=calVO.getEntryStrtDate();
															Date entryEndDate1=calVO.getEntryEndDate();
															
												if(today.compareTo(entryStartDate1)<0){						
							%>
    						
							
															
															<label class="control-label">Not Open for Entry</label>
													

							<%}else if(today.compareTo(entryEndDate1)>0){%>
									
									
	
	 									<label class="control-label">  Closed Event</label>
										  
									

				<%}else{%>
					
					
							 <!--a 
						href="<!%=request.getContextPath()%>/OEEDemo.html?process=initDemoList&eventTypeId=<!%=eventId%>&compYear=<!%=beginDate.substring(
						6,10)%>" style="text-decoration:none;"> Select Event</a-->
							 
					
						
				<%}}else{%>
				
					
	
						<label class="control-label">Select Event</label>
						
					
	
				<%}%>
							</div>
						</div>
					</div>
	
							<div class="form-group">
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event:</label>
									<div class="col-md-8">
							           <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
													<label class="control-label"><%=eventTitle%> (<%=areaName%>)  <%=stateName%></label>
											
											</div>
											
										</div>
									</div>
									
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Date:</label>
									<div class="col-md-8">
							           <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												<label class="control-label"><%=beginDate%> to <%=endDate%></label>
											</div>
										</div>
									</div>
									
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Open Date:</label> 
								<div class="col-md-8">
							           <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
								
												<% if(calVO.getEntryStrtDate()!=null)
															{
															entryStartDate=sd1.format(calVO.getEntryStrtDate());
															//entryStartDate=dateFormat(calVO.getEntryStrtDate());
															%>
								 
													<label class="control-label"><%=entryStartDate%></label>
												<%}else{%>
													
													<label class="control-label"><%=calVO.getEntryStrtDate()%></label>
													<%}%>| 
											</div>
										</div>
									</div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Close Date:</label> 
								<div class="col-md-8">
							           <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												
												<%if(calVO.getEntryEndDate()!=null)
															{
															entryCloseDate=sd1.format(calVO.getEntryEndDate());
															%>					
													<label class="control-label"> <%=entryCloseDate%> </label>
												<%}else{%>
												   
													<label class="control-label"><%=calVO.getEntryEndDate()%> </label>
												
												<%}%> 
											</div>
										</div>
									</div>
												
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Levels Offered:</label> 
								<div class="col-md-8">
							           <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=tmpVal%></label>
											</div>
										</div>
									</div>
									
								</div>
							<div class='form-group'>
								<div class='col-md-4'>
								</div>
								<div class="col-md-4">
									<button class='btn-sm btn-primary' type="button" name="register" value="register" onclick="location.href='eventcal.html?cmd=eventreg&event_id=<%=eventId%>&title=<%=eventTitle%>&sdate=<%=beginDate%>&edate=<%=endDate%>'">Register</button>
								</div>

							</div>
	
	<%}}else{%>
	
	
				<div class='form-group'>
					<div class='col-md-4'>
						</div>
					<div class='col-md-4'>
							No records are available
													
					</div>
			</div>	
	<%}%>
	
	
						
		
			
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
