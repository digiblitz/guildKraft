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

function postData(){
   
	frmMeeDispLst.meeProcess.value = "showStatus";
    frmMeeDispLst.method="post";
    frmMeeDispLst.action="./meeting.html";
    frmMeeDispLst.submit();
}
</script>

<%
String  status = (String)request.getAttribute("status");
if(status==null || status.equals("")){
	status="";
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
                            <h2>Meetings: Educational Activity  Registration Listing</h2>
						</div>  
						
					<div class='panel-body'>	
						
					<p>Educational Activity Registrations placed by organizers are listed below. To view the details, click on the 'View button beside each record.</p>
					
								<%
							String memberId = (String)session.getAttribute("memberId");
							if(memberId==null)
							memberId = "Memebr Id Not Exist";
							ArrayList listContact = (ArrayList) session.getAttribute("DisplaymemberDetails");
							
							String email_id = "";
							if(listContact !=null && listContact.size()!=0){
									Iterator it = listContact.iterator();
									while(it.hasNext()){
							email_id  = (String)it.next();
							if(email_id==null)
							email_id = "";
							}
							}
							%>			 
				
		
			<form class='form-horizontal' role='form' name="frmMeeDispLst" >
			<input name="meeProcess" type="hidden" value="">
				<div class='form-group'>
                        
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Status </label>
						
						<div class='col-md-8'>
                          	<div class='col-md-3 indent-small'>
                               	<div class='form-group internal'>
									<select name="status" class="form-control" onchange="postData();">
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
			  </form>
				  
						  
						 
								<div class="form-group">
									<div class="col-md-12">
									
											<div class="col-md-2 col-md-offset-1">
													<label class='control-label label1'>Member ID </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>Activity Name </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>Date of Activity </label>
											</div>
											
											
											<div class="col-md-3">
													<label class='control-label label1'>Date Of Registration</label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>View</label>
											</div>
											
											
										</div>
									</div>
					
 <%
		           
          	SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
         	String meetingId ="";
		    String activityDate ="";
			String requestDate ="";
			String meetingName ="";
			String activityName = "";
			ArrayList vPendingAds = (ArrayList)request.getAttribute("displayStatusDetails");
			if(vPendingAds!=null && vPendingAds.size()!=0){
						Iterator e = vPendingAds.iterator();
						ArrayList finalList = new ArrayList();
						while(e.hasNext()){
						 ArrayList exaVal = (ArrayList)e.next();
						 Iterator enumPub1 = exaVal.iterator();
						 while(enumPub1.hasNext()){
								HLCActivityOrganizerVO objActDet = (HLCActivityOrganizerVO)enumPub1.next();
									Vector publication = (Vector)enumPub1.next();
									 meetingName = objActDet.getActivityName();							
									 
									 if(objActDet.getActivityMeetingId()!=null){
									 	meetingId =	objActDet.getActivityMeetingId();
									 }
									 if(objActDet.getActivityDate()!=null){
									 	activityDate = sdf.format(objActDet.getActivityDate());
									 }
									 if(objActDet.getAddDate()!=null){
									 	requestDate =  sdf.format(objActDet.getAddDate());
									 }
									 activityName = objActDet.getActivityName();	
					
					%>
				
						  
					<form class='form-horizontal' role='form' name="frmMeeReqView" action="meeting.html" method="post" />
					<input name="meeProcess" type="hidden" value="showDet">
					<input name="meetingId" value="<%=meetingId%>" type="hidden" />
						 
						 
							
							<div class='form-group'>
								<div class="col-md-12">
								
										<div class='col-md-2 col-md-offset-1'>
										
											<label class='control-label'><%=meetingId%></label>
										</div>
										
										
										<div class='col-md-2'>
										
											<label class='control-label'><%=activityName%></label>
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label'><%=activityDate%></label>
										</div>
										
										<div class='col-md-3'>
										
											<label class='control-label'><%=requestDate%></label>
										</div>
										
										<div class='col-md-2'>
											<button class='btn-lg btn-primary' type='submit'>View</button>
										</div>
							
									
								</div>
									
                             </div>
								
						
						  </form>
						   <%}}}else {%>
						   
							<div class='form-group'>
								<div class='col-md-4 col-md-offset-5'>
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

						  
