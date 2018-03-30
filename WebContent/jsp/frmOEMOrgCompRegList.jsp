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
	if(document.myform.selYear.value==""){
		alert("Select a Year");
		document.myform.selYear.focus();
		return false;
	}
	if(document.myform.selTitle.value==""){
		alert("Select Event Title");
		document.myform.selTitle.focus();
		return false;
	}
	return true;
}
function postData(year){
location.href="OEMOrgCompReg.html?cmd=initEventTitleList&year="+year;
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
                            <h2>Online Entries: Organizer List</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				
					  <%
						java.util.Date orgDate = new java.util.Date();
						int currentYear = 1900+orgDate.getYear();
						String selYear = (String)request.getAttribute("tempYear");
						String acStatus = (String)request.getAttribute("status");
						String eventID=(String)request.getAttribute("eventID");
						System.out.println("selYear : "+selYear);
						System.out.println("acStatus : "+acStatus);
						System.out.println("eventID : "+eventID);
						int selectedYear = 0;
						if(selYear!=null && selYear.trim().length()!=0){
							selectedYear = Integer.parseInt(selYear);
						}
						String approveStatus = (String)request.getAttribute("approveStatus");
						String dispAppStatus = "";	
						if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveSuccess")){
							dispAppStatus = "Approval Status Changed Successfully";
						} else if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveFailed")){
							dispAppStatus = "Approval Status Cannot be Changed";
						}
						
					%>	

		<form class='form-horizontal' role='form' name="myform" id="myform" action="OEMOrgCompReg.html" method="post" onsubmit="return onValidate();">
		<input type="hidden" name="cmd" value="ListDetails" />
		
				<%if(approveStatus!=null && approveStatus.trim().length()!=0){%>
						<p id='p_error'><%=dispAppStatus%></p>
				
				<%}%>
		
						 <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Year:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="selYear" id="selYear" class="form-control" onchange="postData(this.value);" >
												<option selected="selected" value="" >Select One</option>
												<%
													for(int i=2000; i<(currentYear+2); i++){
														if(selectedYear!=0 && selectedYear==i){
												%>
												<option value="<%=i%>" selected="selected"><%=i%></option>
												<%}else{%>
												<option value="<%=i%>"><%=i%></option>
												<%}}%>
												</select>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <select name="selTitle" id="selTitle" class="form-control">
												<option selected="selected" value="">Select One</option>
												<%
												ArrayList eventTitles = (ArrayList)request.getAttribute("eventTitles");
												if(eventTitles!=null&& eventTitles.size()!=0){
												Iterator list = eventTitles.iterator();
												while(list.hasNext()){
														String str[] = (String [])list.next();
														String eventId = str[0];
														String eventTitle = str[1];
														if(eventId.trim().equalsIgnoreCase(eventID)){
												%>
													<option  value="<%=eventId%>" selected="selected"><%=eventTitle%></option>
													<%}else{%>
													<option  value="<%=eventId%>"><%=eventTitle%></option>
													<%}}}%>
													</select>
												</div>
										</div>
									</div>
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
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
							</div>
							
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" name="submit">Submit</button>
                                    </div>
								</div>
						</form>

									<div class="form-group">
										<div class="col-md-12 gp">
											<div class="row">
												<div class="col-md-2">
													<label class="control-label label1">RiderId</label>
												</div>
												<div class="col-md-2">
													<label class="control-label label1">HorseId</label>
												</div>
												<div class="col-md-2">
													<label class="control-label label1">Event Type</label>
												</div>
												<div class="col-md-2">
													<label class="control-label label1">Event Level</label>
												</div>
												<div class="col-md-2">
													<label class="control-label label1">Division</label>
												</div>
												<div class="col-md-1">
													<label class="control-label label1">View</label>
												</div>
												<div class="col-md-1">
													<label class="control-label label1">Approve</label>
												</div>
											</div>
										</div>
									</div>
		 
								<%
									HLCCompRegistrationVO compVO = new HLCCompRegistrationVO();
									ArrayList compRegList = (ArrayList)request.getAttribute("compRegDetails");
									if(compRegList!=null && compRegList.size()!=0){
										Iterator itr = compRegList.iterator();
										while(itr.hasNext()){
											compVO = (HLCCompRegistrationVO)itr.next();
											String registrationId = compVO.getRegistrationId();
											String horseMemberId = compVO.getHorseMemberId();
											String riderId = compVO.getRiderMemberId();
											String eventType = compVO.getEventType();
											String eventLevel = compVO.getEventLevel();
											String division = compVO.getEventDivision();
													
								%>
								
								<div class="form-group">
										<div class="col-md-12 gp">
											<div class="row">
												<div class="col-md-2">
													<label class="control-label "><%=riderId%></label>
												</div>
												<div class="col-md-2">
													<label class="control-label "><%=horseMemberId%></label>
												</div>
												<div class="col-md-2">
													<label class="control-label "><%=eventType%></label>
												</div>
												<div class="col-md-2">
													<label class="control-label "><%=eventLevel%></label>
												</div>
												<div class="col-md-2">
													<label class="control-label "><%=division%></label>
												</div>
												<div class="col-md-1">
													<button class='btn-sm btn-primary' type="button" name="process" value="View" onclick="location.href='OEMOrgCompReg.html?cmd=compRegView&registrationId=<%=registrationId%>'">View</button>
												</div>
												<div class="col-md-1">
													<button class='btn-sm btn-primary' type="button" name="process"  value="Approve" onclick="location.href='OEMOrgCompReg.html?cmd=initEventApprove&registrationId=<%=registrationId%>'">Approve</button>
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
												No records are available 
											</div>
											
										</div>
										
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
