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
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>

</head>
<script language="javascript">
function onValidate(){

	if(document.frmMeeUserRegList.selStatus.value==""){
		alert("Select a Status");
		document.frmMeeUserRegList.selStatus.focus();
		return false;
	}
	
	return true;
}
</script>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

	<%String status1 = (String)request.getAttribute("status");%>

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
                            <h2>Meetings:New Event Registration List</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
		
			<form class='form-horizontal' role='form' name="frmMeeUserRegList" id="frmMeeUserRegList" method="post" action="./eventRegList.html" onsubmit="return onValidate();">
				<input name="cmd" type="hidden" value="userListDetails">						
				<div class='form-group'>
                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
					 	<div class='col-md-8'>
                          	<div class='col-md-3 indent-small'>
                               <div class='form-group internal'>
				
									<select name="selStatus" id="selStatus" class="form-control" >
									<option selected="selected" value="" >Select One</option>
									<%
									String[] status = new String[]{"Pending","Approved","Rejected"};
									for(int k =0; k<status.length; k++){
									if(status1!=null && status1.equalsIgnoreCase(status[k])){
									%>
									<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
									<%}else{%>
									<option value="<%=status[k]%>"><%=status[k]%></option>
									<%}}%>
									</select>
									 <span id="span_astriesk">*</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class='form-group'>
                        <div class='col-md-offset-4 col-md-1'>
                             <button class='btn-lg btn-primary' type='submit'  name="appButton">Submit</button>
                          </div>
					</div>
				
		
				</form>
				
							<div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-2 col-md-offset-1">
											<label class='control-label label1'>Event ID</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Event Title </label>
										</div>
											
							   
										<div class="col-md-3">
											<label class='control-label label1'>Date of Registration</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Organizer ID</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>View</label>
										</div>
										
										
									</div>
                                </div>
								
						
						  
						  
						    <%
						 
						  SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
						  ArrayList userEventList = (ArrayList) request.getAttribute("userRegList");
						  
						 // out.print("MemberId:" + (String) session.getAttribute("memberId") + eventList.size());
						  
						  if(userEventList!=null && userEventList.size()!=0){
							  Iterator itEvent = userEventList.iterator();
							  while(itEvent.hasNext()){
									HLCEventDetailsVO objEventDet = (HLCEventDetailsVO)itEvent.next();
									String eventId =  objEventDet.getEventId();																	
									String eventTitle =  objEventDet.getEventTitle();
									//activityDate = sdf.format(objEventDet.getActivityDate());
									String requestDate="N/G";									
									if(objEventDet.getAddDate()!=null){
									    requestDate =  sdf.format(objEventDet.getAddDate());
										System.out.println("requestDate in jsp"+requestDate);
									}
									String orgId =  objEventDet.getOrganizeId();
									System.out.println("orgId in jsp"+orgId);
									
						  %>
						  <form name="userEventList" id="userEventList" method="post" action="eventRegList.html" />
						  
						  	<div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-2 col-md-offset-1 gp">
											<label class='control-label'><%=eventId%></label>
										</div>
										
										<div class="col-md-2 gp">
											<label class='control-label'><%=eventTitle%></label>
										</div>
											
							   
										<div class="col-md-3 gp">
											<label class='control-label'><%=requestDate%></label>
										</div>
										
										<div class="col-md-2 gp">
											<label class='control-label'><%=orgId%></label>
										</div>
										
										<div class="col-md-2 gp">
											<button class='btn-sm btn-primary' type='button'  name="name="Submit3"" value="View" onclick="location.href='eventRegList.html?cmd=viewNewEventReg&eventId=<%=eventId%>'" >View</button>
											
										</div>
										
										
										
		
									</div>
                                </div>
						  
						     
					
						  </form>	
						  <%
						  }
						  }
						  else{
						  %>
								<div class='col-md-8'>
									<div class='col-md-6'>
									</div>
									<div class='col-md-6'>
										No Records Found!
									</div>
								</div>					  
						  <%
						  }
						  %>						 
						  
			
	  
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
