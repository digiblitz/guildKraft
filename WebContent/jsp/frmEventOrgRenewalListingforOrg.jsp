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
                            <h2>Meetings: List of EDU Meetings</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
					ICP Meetings placed by Organizers are listed below. To view the details,
					click on the 'View' button beside each record and to apply for the meeting click on the 'Apply' button.				
				 
						 <div class="form-group">
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-2 ">
										<label class="control-label label1">Event  ID</label>
									</div>
									<div class="col-md-2">
										<label class="control-label label1">Compition Name</label>
									</div>
									<div class="col-md-3">
										<label class="control-label label1">Compition Location</label>
									</div>
									<div class="col-md-3">
										<label class="control-label label1">Compition to be Held </label>
									</div>
									<div class="col-md-2">
										<label class="control-label label1">View</label>
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
									  if(objRenewalDet.getRenewalId()!=null){
									  	  renewalId = objRenewalDet.getRenewalId();
										}
									  if(objRenewalDet.getEventId()!=0){
									  		eventId =String.valueOf(objRenewalDet.getEventId());
									  }
									   if(objRenewalDet.getCompetitionDate()!=null){
									     comDate =sdf.format(objRenewalDet.getCompetitionDate());
									   }
									   compName =objRenewalDet.getCompetitionName();
									   compLoc =objRenewalDet.getCompetitionLocation();

						%>
					   
					   <form class='form-horizontal' role='form' name="frmRewalListDet" id="myform" method="post" action="EventOrgRenewal.html">
						   <input type="hidden" name="eventProcess" value="display" />
						    <input type="hidden" name="eventId" value="<%=eventId%>" />
						 <input type="hidden" name="renewalId" value="<%=renewalId%>" />
						 
						  <div class="form-group">
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-2 ">
										<label class="control-label "><%=eventId%></label>
									</div>
									<div class="col-md-2">
										<label class="control-label "><%=compName%></label>
									</div>
									<div class="col-md-3">
										<label class="control-label "><%=compLoc%></label>
									</div>
									<div class="col-md-3">
										<label class="control-label "><%=comDate%> </label>
									</div>
									<div class="col-md-2">
										 <button class='btn-sm btn-primary' name="butName" type="submit" value="view">view</button>
									</div>
								</div>
							</div>
						</div>	
							
							
                       </form>	
  
                                           
							<%
							}
							}
							else {
					%>
					<div class="form-group">
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-4">
									</div>
									<div class="col-md-4">
										No records are available
									</div>
								</div>
							</div>
						</div>
					<%}%> 
						  <!--<tr>
							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
						   </tr>-->
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
