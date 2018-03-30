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
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->



<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->

</head>

<script>
function goSearch(){
   document.forms[0].submit();
}
</script>

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
 							<h2>Meetings: Approve ICP Registration Listing</h2>		
						</div>
						
			<div class='panel-body'>
				  
					<p>ICP Registerations placed by you are listed below. To view and approve the details,
					click on the 'Approve' button beside each record.</p>					
					
					
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
								 <html:form action="/listAdminOrg.html">
										<html:hidden property="method" value="searchAdmin"/>
											<div class='col-md-8'>
           										 <div class='col-md-3 indent-small'>
               										 <div class='form-group internal'>
														<html:select property="status" styleId="statusId" styleClass="selectboxOne" onchange="goSearch();" >
															<html:option value="">Select One</html:option>
															<html:option value="Pending">Pending</html:option>
															<html:option value="Approved">Approved</html:option>
															<html:option value="Rejected">Rejected</html:option>
									  					  </html:select>
														  </div>
														 </div>
														</div>  
													</html:form>
												</div>
									
				<div class="margin marginn">
					<div class="form-group">
						<div class="col-md-12">
					
							<div class="col-md-1">
								<label class='control-label label1'>Organiser ID </label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>Land Owner Name</label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>Assessment Level</label>
							</div>
							
							<div class="col-md-3">
								<label class='control-label label1'>Date Of Registration</label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>Date Of Event</label>
							</div>
							
							<div class="col-md-2">
								<label class='control-label label1'>Status Change</label>
							</div>
							
						 
					
				<logic:present name="FormAdminOrgListing" property="results">
					 <bean:size id="size" name="FormAdminOrgListing" property="results"/>
						 <logic:equal name="size" value="0">
							<div class='form-group'>
								<div class="container"> 
									<div class="row"> 
										<div class='col-md-3'></div>
											<div class='col-md-2'>
												No Records Found
											</div>
										</div>
									</div>
								</div>
						 </logic:equal>  
						                
						 <logic:greaterThan name="size" value="0">
							<logic:iterate id="searchList" name="FormAdminOrgListing" property="results">
							   <html:form action="/listAdminOrg.html">
								  <html:hidden property="method" value="viewAdmin"/>
									  <input type="hidden" name="icpMeetingId" value='<bean:write name="searchList" property="icpMeetingId"/>'/>
									  
					   <div class="margin marginn">
						<div class='form-group'>
							<div class="col-md-12">
								 <div class="container"> 
									 <div class="row"> 
										<div class='col-md-2'>
											<bean:write name="searchList" property="hostMemberId"/>
										</div>
										
										<div class='col-md-2'>
											<bean:write name="searchList" property="landOwnerName"/> 
										</div>
										
										<div class='col-md-2'>
											<bean:write name="searchList" property="assesmentLevel"/>
										</div>
										
										<div class='col-md-2'>
											<bean:write name="searchList" property="addDate"/>
										</div>
										
										<div class='col-md-2'>
											<bean:write name="searchList" property="assesmentDate"/>
										</div>
										
									
                                    		<div class='col-md-offset-4 col-md-2 gp'>
                                       			 <button class='btn-lg btn-primary' type='submit' name="viewButton" value="Status">Status</button>
										</div>			
										</div>
									</div>
								</div>
							</div>
						</div>
							  </html:form>
						   </logic:iterate>                    
					    </logic:greaterThan>     
						</logic:present>			
					              
								  </div>
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
		
 
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
