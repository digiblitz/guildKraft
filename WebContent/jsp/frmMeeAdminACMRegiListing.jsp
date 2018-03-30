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
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import ="com.hlcmeeting.util.*" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script language="javascript">

function postData(){
	frmMeeDispLst.memProcess.value = "adminViewList";
    frmMeeDispLst.method="post";
    frmMeeDispLst.action="AnnualRegList.html";
    frmMeeDispLst.submit();
}
</script>

<%
String  status = (String)request.getAttribute("status");
if(status==null || status.equals("")){
	status="";
}
%>


</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


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
                            <h2> Annual Meeting &amp; Convention List Page</h2>
						</div>
				 
						 
					 <div class='panel-body'>	 	
		   	
				<div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>  Status </label>
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
							if(status.equals("Registered")){
						%>
						<option value="Registered" selected="selected" >Registered</option>
						
						<%
						}
						else{
						%>
							<option value="Registered" >Registered</option>
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
		  
					<div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-2">
									<label class='control-label label1'>Name</label>
									</div>
							<div class="col-md-2">
									<label class='control-label label1'>Request Date </label>
									</div>
							<div class="col-md-2">
									<label class='control-label label1'>Registered By</label>
									</div>
							<div class="col-md-2">
									<label class='control-label label1'>Request Status </label>
									</div>
							<div class="col-md-2">
									<label class='control-label label1'>Status Change </label>
									</div>
							<div class="col-md-2">
									<label class='control-label label1'>View</label>
									</div>
								</div>
							</div>
						</div>
					     
						  
						 
							<%
							
							SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
							ArrayList userList = (ArrayList)request.getAttribute("AnnualList");
							if(userList!=null && userList.size()!=0){
								Iterator itUser = userList.iterator();
								while(itUser.hasNext()){
									String dispDate = "";
									HLCAnnualRegistrationDetailVO objAnnualRegDet = (HLCAnnualRegistrationDetailVO) itUser.next();
									String ardId = objAnnualRegDet.getArdId();
									String fName = objAnnualRegDet.getFirstName();
									String lName = objAnnualRegDet.getLastName();
									Date today = objAnnualRegDet.getAddDate();
									if(today!=null){
										dispDate = sdf.format(today);
									}
									String requestStatus = objAnnualRegDet.getRequestStatus();
									String registrarName = objAnnualRegDet.getRegistrarName();
									String annualMeetingId = objAnnualRegDet.getAnnualMeetingId();
									
							
							%>
							<form name="frmStatusChange" action="AnnualRegList.html">
							  <input type="hidden" name="memProcess" value="statusChange" />
							  <input type="hidden" name="ardId" value="<%=ardId%>" />
							  <input type="hidden" name="annualMeetingId" value="<%=annualMeetingId%>" />
                      <div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
									   <div class='col-md-2'>
									   		<label class='control-label'><%=fName%> &nbsp; <%=lName%></label>
										</div>
										
                                 <div class='col-md-2'>
									   		<label class='control-label'><%=dispDate%></label>
									</div>
                                <div class='col-md-2'>
									   		<label class='control-label'>
											<a href="AnnualRegList.html?annualMeetingId=<%=annualMeetingId%>&amp;memProcess=statusShow" class="linkFive" ><%=registrarName%></a>
											</label>
											</div>
                                 <div class='col-md-2'>
									   		<label class='control-label'><%=requestStatus%></label>
									</div>
                               <div class='col-md-2'>
										
								<button class='btn-lg btn-primary' type='submit'>Approve</button>
							</div>	
                         </div>
					</div>
				 </div>        
                                
								<a href="AnnualRegList.html?ardId=<%=ardId%>&memProcess=detailedUserDetails"  class="linkFive" >View</a>								</td>
                             
							  </form>
							  <%
										}
										
									}
									else{
									%>
									<div class='form-group'>
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
												No Records are available.
											</div>
										</div>
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
