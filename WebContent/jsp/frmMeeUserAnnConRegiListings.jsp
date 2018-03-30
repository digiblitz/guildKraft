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
<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>
<script>
	
	function getStatusName(selStatusId){
	//alert(selMemTypeId);
		frmMemberList.memProcess.value = "getStatusType";
		frmMemberList.method="post";
		frmMemberList.action="./AnnualRegList.html?memTypName="+selStatusId;
		frmMemberList.submit();
	}
<%
String statusName = (String) request.getAttribute("statusName");
if(statusName==null) statusName="";

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
                            <h2>Annual Meeting &amp; Convention List Page.</h2>
						</div>
				  
				 <div class='panel-body'>
				  		<div class="margin marginn">
							<div class="form-group">
								<div class="col-md-12">
									<div class="col-md-2">
										<label class='control-label label1'>First Name </label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label label1'>Last Name </label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label label1'>Email Id </label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label label1'>Request Date </label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label label1'>Request Status </label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label label1'>View</label>
									</div>
					</div>
					</div>
					</div>
					
					

					<%
					
						SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
					 ArrayList memberDetail=(ArrayList)request.getAttribute("MyAnnualList");
					 if(memberDetail!=null && memberDetail.size()!=0){ 
						Iterator  enm1 = memberDetail.iterator();
						while(enm1.hasNext()){
							HLCAnnualRegisterVO objRegDet = (HLCAnnualRegisterVO) enm1.next();
							String annualMeetingId = objRegDet.getAnnualMeetingId();
							String firstName = objRegDet.getFirstName();
							String lastName = objRegDet.getLastName();
							String emailId = objRegDet.getEmail();
							String reqStatus = objRegDet.getRequestStatus();
							Date today = objRegDet.getAddDate();
		   %>
		   <!-- {annualMeetingId,badgeInfo,firstName,lastName,areaName,requestStatus,addDate,email};  -->

							<form name="frmDisplayAdminList" method="post" action="AnnualRegList.html">		
							<input name="memProcess" type="hidden" value="dispViewDetail">
							<input name="annualMeetingId" type="hidden" value="<%=annualMeetingId%>">
					
					<div class="margin marginn">
							
							<div class='form-group'>
								<div class="col-md-12">
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2'>
										<label class='control-label'><%=firstName%></label>
										</div>
									
									<div class='col-md-2'>
										<label class='control-label'><%=lastName%></label>
									</div>
									<div class='col-md-2'>
										<label class='control-label'><%=emailId%></label>
									</div>
									<div class='col-md-2'>
										<label class='control-label'><%=sdf.format(today)%></label>
									</div>
									<div class='col-md-2'>
										<label class='control-label'><%=reqStatus%></label>
									</div>
									
									<div class='col-md-2'>
										
										<button class='btn-lg btn-primary' type='submit'>View</button>
									</div>	
							</div>
						</div>
						</div>
					</div>
				</div>
						  

						</form>
		   
					      <%	}
									}else {
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
