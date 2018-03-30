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
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
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
<%! 

String  nullCheck(String fieldName){
	String retValue = "<b>N/A</b>";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
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
                            <h2> Online Entries: Organizer View </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->

					   <%
							HLCCompRegistrationVO regVO = new HLCCompRegistrationVO();
							
							regVO = (HLCCompRegistrationVO)request.getAttribute("singleCompRegDetails");
							
							String registrationId = regVO.getRegistrationId();
							String qualifyStatus = regVO.getQualifystatus();
							String eventTitle = regVO.getEventTitle();
							String eventId = regVO.getEventId();
							String eventTyp = regVO.getEventType();
							String orgId = regVO.getOrganizerId();
							int compYear = regVO.getCompetitionYear();
							String eventLevel = regVO.getEventLevel();
							String evtDivName = regVO.getEventDivision();
							String evtSubDivName = regVO.getEventSubDivision();
							String horseId = regVO.getHorseMemberId();
							String horseName = regVO.getHorseName();
							String riderId = regVO.getRiderMemberId();
							String riderFstName = regVO.getRiderFirstName();
							String riderLastName = regVO.getRiderLastName();				
							String ownerId = regVO.getOwnerHLCId();
							System.out.println("ownerId"+ownerId);
							String ownerFstName = regVO.getOwnerFirstName();
							String ownerLastName = regVO.getOwnerLastName();
							String qualifyPath = regVO.getQualFilePath();
							
							int lastIndex = qualifyPath.lastIndexOf("\\") ;
									String tempPath ="";
									if(lastIndex!=-1){
									tempPath = qualifyPath.substring(lastIndex+1,qualifyPath.length());
										}		
							System.out.println("qualifyPath"+qualifyPath);
							System.out.println("tempPath"+tempPath);
									
									
					  %>
					<p>View Competition Registration Details:</p>
					
					<div class='form-group'>
                             <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Qualify Status</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(qualifyStatus)%></label>
											</div>
										</div>
									</div>
				 
				 			 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventTitle)%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventId)%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventTyp)%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Competition Year:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=compYear%></label>
											</div>
										</div>
									</div>
				   
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eventLevel)%></label>
											</div>
										</div>
									</div>
											
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Division:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(evtDivName)%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Sub Division: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(evtSubDivName)%></label>
											</div>
										</div>
									</div>
			 
					 		 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Horse ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(horseId)%></label>
											</div>
										</div>
									</div>
							
				  			<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Horse Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(horseName)%></label>
											</div>
										</div>
									</div>
							
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Rider ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(riderId)%></label>
											</div>
										</div>
									</div>
							
							<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Rider Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(riderFstName+" "+riderLastName)%></label>
											</div>
										</div>
									</div>
							
							<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Owner Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(ownerFstName+" "+ownerLastName)%></label>
											</div>
										</div>
									</div>
												
									 
									<%
									if(qualifyPath!=null && qualifyPath.trim().length()!=0){
									%>  
			   				
								<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Qualification Proof:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<a href="OEMOrgCompReg.html?cmd=uplView&fPath=<%=qualifyPath%>">DownLoad Here</a>
											</div>
										</div>
									</div>
		      
			 				 <%}%>
							
						</div>
						
							 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="button" onclick="javascript:history.back(-1);" value="Back">Back</button>
                                    </div>
							</div>
									<!--==============================content end here=================================-->
							
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
