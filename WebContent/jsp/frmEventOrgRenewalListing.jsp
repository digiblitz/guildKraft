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
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
</head>
<script language="javascript">

/*function postData(){
	frmRewalList.eventProcess.value = "show";
	//alert(frmRewalList.eventProcess.value);
    frmRewalList.method="post";
    frmRewalList.action="EventOrgRenewal.html";
    frmRewalList.submit();
}*/
function postData(status){
location.href="EventOrgRenewal.html?eventProcess=show&status="+status;

}	
</script>
<%
String  status = (String)request.getAttribute("status");
if(status==null || status.equals("")){
	status="";
}
%>

<%@ page import="java.util.*" %> 

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
						<h2>Meetings:List of Endorsed Form</h2>
						</div>
				  
						<div class='panel-body'>
						 
						   <form name="frmRewalList" id="frmRewalList">
						   <input type="hidden" name="eventProcess" value="" />
						  <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Status</label>
							
							<div class='col-md-8'>
                          		<div class='col-md-3 indent-small'>
                               		<div class='form-group internal'>
						 				 <select name="status" class="form-control" onchange="postData(this.value);">
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
				  
				 
						 <div class="margin marginn">
									<div class="form-group">
									<div class="col-md-12">
												
												<div class="col-md-2">
													<label class='control-label label1'>Event  ID </label>
												</div>
												
								
												<div class="col-md-2">
													<label class='control-label label1'>Competition Name </label>
												</div>
												
												<div class="col-md-3">
													<label class='control-label label1'>Competition to be Held </label>
												</div>
												
												<div class="col-md-2">
													<label class='control-label label1'>View</label>
												</div>
													
												<div class="col-md-2">
													<label class='control-label label1'>Approve</label>
												</div>
									</div>	
                                 </div>
							</div>	 
								 
						 
							<%
					SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
					String renewalId ="";
					String eventId ="";
					String compName ="";
					String compLoc ="";
					String comDate ="";
					ArrayList renewalList = (ArrayList)session.getAttribute("DisplayRenewalDetails");
					if(renewalList!=null && renewalList.size()!=0){
						Iterator e = renewalList.iterator();
						 while(e.hasNext()){
								HLCRenewalOrganizerDetails objRenewalDet = (HLCRenewalOrganizerDetails)e.next();
								    renewalId = objRenewalDet.getRenewalId();
									if(objRenewalDet.getRenewalId()!=null){
									  	  renewalId = objRenewalDet.getRenewalId();
										}
									  if(objRenewalDet.getEventId()!=0){
									  		eventId = String.valueOf(objRenewalDet.getEventId());
									  }
									   if(objRenewalDet.getCompetitionDate()!=null){
									     comDate = sdf.format(objRenewalDet.getCompetitionDate());
									   }
									   compName =objRenewalDet.getCompetitionName();
									   //compLoc =objRenewalDet.getCompetitionLocation();
						%>
					   
					   <form name="frmRewalListDet" id="myform" method="post" class="formcss" action="EventOrgRenewal.html">
						   <input type="hidden" name="eventProcess" value="display" />
						    <input type="hidden" name="eventId" value="<%=eventId%>" />
						 <input type="hidden" name="renewalId" value="<%=renewalId%>" />
						 
						 
						  <div class="margin marginn">
							
							<div class='form-group'>
								<div class="col-md-12">
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2'>
											<label class='control-label'><%=eventId%></label>
										</div>
										
										
										<div class='col-md-2'>
											<label class='control-label'><%=compName%></label>
										</div>
							<!--<td class="listCellBg"><%//=compLoc%></td>-->
										<div class='col-md-3'>
											<label class='control-label'><%=comDate%></label>
										</div>
										
										<div class='col-md-2'>
										
											<button class='btn-lg btn-primary' type='submit'>View</button>
										</div>		
										
										<div class='col-md-2'>
										
											<button class='btn-lg btn-primary' type='submit' onclick="location.href='EventOrgRenewal.html?eventProcess=initApprove&eventId=<%=eventId%>&renewalId=<%=renewalId%>'">Approve</button>			
						
							
						 
										</div>
										
									</div>
									
								</div>
									
                             </div>
								
						</div>
						</div>
                       </form>	
  
                                           
							<%
							}
							}
							else {%>
					
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4 col-md-offset-4'>
												No records are available. 
											</div>
										</div>
									</div>
								
					<%}%> 
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
		
 
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
