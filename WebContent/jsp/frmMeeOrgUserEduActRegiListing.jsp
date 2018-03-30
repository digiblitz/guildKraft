<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.common.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

</head>
<script language="javascript">


function chkSelect(){

	if(document.frmMeeDispLst.meetingId.value=="" ){
		alert("Please select any one Meeting");
		document.frmMeeDispLst.meetingId.focus();
		return false;
	}
	if(document.frmMeeDispLst.selUserStatus.value=="" ){
		alert("Please select any one Status");
		document.frmMeeDispLst.selUserStatus.focus();
		return false;
	}
	return true;

}

 
</script>
<%
String  status = (String)request.getAttribute("selUserStatus");
String  meetingId = (String)request.getAttribute("meetingId");
if(status==null || status.equals("")){
	status="";
}
if(meetingId==null || meetingId.equals("")){
	meetingId="";
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
                            <h2>USEA Meetings: Organizer Insurance  Release  Educational Activity Registration Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Insurance Release Educational Activity Registerations placed by the users are listed below. To view the details,
					click on the 'View' button beside each record.	</p>
							
						<!--==============================Form Description=================================-->
  
			<form class='form-horizontal' role='form' name="frmMeeDispLst" method="post" action="meeting.html" onsubmit="return chkSelect();">
			<input name="meeProcess" type="hidden" value="userShowStatus">
			
					 			<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Name</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="meetingId" class="selectboxOne">
													<option selected="selected" value="">Select One</option>
												  <%
												  ArrayList orgDet = (ArrayList)session.getAttribute("dispOwnOrgDetails");
													if(orgDet!=null && orgDet.size()!=0){
														Iterator e = orgDet.iterator();
														ArrayList finalList = new ArrayList();
														while(e.hasNext()){
															 ArrayList exaVal = (ArrayList)e.next();
															 Iterator enumPub1 = exaVal.iterator();
															 while(enumPub1.hasNext()){
																	HLCActivityOrganizerVO objActDet = (HLCActivityOrganizerVO)enumPub1.next();
																	Vector publication = (Vector)enumPub1.next();
																	String  meetingName =objActDet.getActivityName();							
																	 String meetingIdVal =	objActDet.getActivityMeetingId();
																	 if(meetingId.equals(meetingIdVal)){
																	 %>
																	 <option value="<%=meetingIdVal%>" selected="selected"><%=meetingName%></option>
																	 <%
																	 }
																	 else{
																	 %>
																	 <option value="<%=meetingIdVal%>"><%=meetingName%></option>
																	 <%
																	 }
															}
														}
													}
													
													
													 
												  %>
												  </select>					 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                             
												 <select name="selUserStatus" class="selectboxOne">
													<option selected="selected" value="">Select One</option>
													<%
														if(status.equals("Pending")){
													%>
													<option value="Pending" selected="selected" >Pending</option>
													<%
														}
														else{
													%>
														<option value="Pending" >Pending</option>
													<%
														}
														if(status.equals("Approved")){
													%>
													<option value="Approved" selected="selected" >Approved</option>
													
													<%
													}
													else{
													%>
														<option value="Approved" >Approved</option>
													<%
													}
													if(status.equals("Rejected")){
													%>
													
													<option value="Rejected" selected="selected" >Rejected</option>
													<%
													}
													else{
													%>
													<option value="Rejected" >Rejected</option>
													<%
													}
													%>
												  </select>
												</div>
											</div>
										</div>
									</div>
									
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="Submit22" value="Search">Search</button>
                                    </div>
								</div>
					
				 </form>						
				 
				 	<div class='form-group'>
						<div class='col-md-8'>
						
						<div class='col-md-2'>
						<label class='control-label label1'>First Name</label>
						</div>
						
						<div class='col-md-2'>
						<label class='control-label label1'>No of Horses</label>
						</div>
						
						<div class='col-md-3'>
						<label class='control-label label1'>Date of Registration</label>
						</div>
						
						<div class='col-md-2'>
						<label class='control-label label1'>View</label>
						</div>
					</div>
				</div>
						  
						  <%
						  SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
						   ArrayList al = (ArrayList)session.getAttribute("DispUserDetails");
						   String regDate ="";
						   if(al!=null && al.size()!=0){
                          	 Iterator it = al.iterator();
							while(it.hasNext()){
							   	ArrayList tempList = (ArrayList)it.next();
    	                      	Iterator itTemp = tempList.iterator();
								while(itTemp.hasNext()){
									String releaseId = (String)itTemp.next();
									String meetingIdVal = (String)itTemp.next();
									String uId = (String)itTemp.next();
									String uName = (String)itTemp.next();
									Date rDate =(Date)itTemp.next();
									if(rDate!=null){
									regDate = sdf.format(rDate);
									}
									String noHorse = (String)itTemp.next();
						  %>
					<form class='form-horizontal' role='form' name="frmMee" method="post" action="meeting.html">
						 <input type="hidden" name="meeProcess" value="userDetailOrg"/>
						<input type="hidden" name="releaseId" value="<%=releaseId%>" />
						<input type="hidden" name="uId" value="<%=uId%>" />
						<input type="hidden" name="activityMeetingId" value="<%=meetingIdVal%>" />
						
						<div class='form-group'>
						<div class='col-md-8'>
						
						<div class='col-md-2'>
						<label class='control-label label1'><%=uName%></label>
						</div>
						
						<div class='col-md-2'>
						<label class='control-label label1'><%=noHorse%></label>
						</div>
						
						<div class='col-md-3'>
						<label class='control-label label1'><%=regDate%></label>
						</div>
						
						<div class='col-md-2'>
						 <button class='btn-sm btn-primary' type='submit' name="Submit22" value="view">view</button>
						</div>
					</div>
				</div>
						 
						  </form>
						  <%}
						  }
						  }
						  else{%>
						 		<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                       No records are available
                                    </div>
								</div>
						  
						   <%}%>
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
