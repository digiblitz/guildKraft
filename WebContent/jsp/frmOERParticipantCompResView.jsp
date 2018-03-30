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
                            <h2> Online Entries: View Competition Results </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
	  
	  
	 
						   <%
								HLCCompResultVO compResVO = new HLCCompResultVO();
								
								compResVO = (HLCCompResultVO)request.getAttribute("objRegVO");
								System.out.println("compVO in jsp"+compResVO);
											String compResultId = compResVO.getCompResultId();
											System.out.println("compResultId in jsp"+compResultId);
											String eveId = compResVO.getEventId();
											System.out.println("eveId in jsp"+eveId);
											String eveTitle = compResVO.getEventTitle();
											String eveType = compResVO.getEventTypeName();
											String riderMemId = compResVO.getRiderMemberId();
											String rFName = compResVO.getRiderFirstName();
											String rLName = compResVO.getRiderLastName();
											String horseId = compResVO.getHorseMemberId();
											String hName = compResVO.getHorseName();
											String divName = compResVO.getDivisionName();
											String eveLevel = compResVO.getEventLevel();
											String subDiv = compResVO.getEventSubDivision();
											String pinneyNum = compResVO.getPinneyNumber();
											String dressPenal = compResVO.getDressagePenal();
											String dressPlace = compResVO.getDressagePlace();
											String xc_Ph_jmp = compResVO.getXc_phase_jmpPenal();
											String xc_Ph_elapTime = compResVO.getXc_phase_elapsTime();
											String xc_Ph_time = compResVO.getXc_phase_timePenal();
											String shw_Jmp_Time = compResVO.getShow_jmp_timePenal();
											String shw_Jmp_Jmp = compResVO.getShow_jmp_jmpPenal();
											String dtPt = compResVO.getToDatePts();
											String dtPlace = compResVO.getToDatePlace();
											String dangerRidPenal = compResVO.getDangerRidPenal();
											String finPoint = compResVO.getFinalPoints();
											String finPlace = compResVO.getFinalPlace();
											String firstInspec = compResVO.getFirstInspec();
											String lastInspec = compResVO.getLastInspec();
											String phDInspec = compResVO.getPhase_DInspec();
											String roadTrackA = compResVO.getRdTrackA();
											String roadTrackC = compResVO.getRdTrackC();
											String steepleJmpPenal = compResVO.getSteepleCh_jmpPenal();
											String steepleTmPenal = compResVO.getSteepleCh_timePenal();
											String hlcPoints = compResVO.getUseaPoints();
											boolean excepStatus = compResVO.isExpectationStatus();
											
											
										
										
						  %>
			
									<p>View Competition Result Details: </p>
				  
				  			<div class='form-group'>
                            	 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eveId)%></label>
											</div>
										</div>
									</div>
				  
			 			  	 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eveType)%></label>
											</div>
										</div>
									</div>
				  			
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eveTitle)%></label>
											</div>
										</div>
									</div>
				  			
							 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(eveLevel)%></label>
											</div>
										</div>
									</div>
				  
				  			 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Division:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(divName)%></label>
											</div>
										</div>
									</div>
				
			  					<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Event Sub Division:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(subDiv)%></label>
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
												<label class="control-label"><%=nullCheck(hName)%></label>
											</div>
										</div>
									</div>
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Rider ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(riderMemId)%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Rider Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(rFName+" "+rLName)%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Pinney Number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(pinneyNum)%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Dressage Penalites:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(dressPenal)%></label>
											</div>
										</div>
									</div>
				  
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Dressage Place:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(dressPlace)%></label>
											</div>
										</div>
									</div>
				  				
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>XC Phase Jump Penalities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(xc_Ph_jmp)%></label>
											</div>
										</div>
									</div>
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>XC Phase Elapsed Time:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(xc_Ph_elapTime)%></label>
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>XC Phase Time Penalities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(xc_Ph_time)%></label>
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Show Jump Time Penalities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(shw_Jmp_Time)%></label>
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Show Jump Jump Penalities: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(shw_Jmp_Jmp)%></label>
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>To Date Points:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(dtPt)%></label>
											</div>
										</div>
									</div>
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>To Date Place:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(dtPlace)%></label>
											</div>
										</div>
									</div>
				  
			  					 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Dangerous Riding Penalities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(dangerRidPenal)%></label>
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>To Date Points: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(pinneyNum)%></label>
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Final Points:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(finPoint)%></label>
											</div>
										</div>
									</div>
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Final Place:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(finPlace)%></label>
											</div>
										</div>
									</div>
				  				
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>First Inspection:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(firstInspec)%></label>
											</div>
										</div>
									</div>
								
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Last Inspection:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(lastInspec)%></label>
											</div>
										</div>
									</div>
				  				
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>PhaseD Inspection:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(phDInspec)%></label>
											</div>
										</div>
									</div>
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Road and Track A:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(roadTrackA)%></label>
											</div>
										</div>
									</div>
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Road and Track C:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(roadTrackC)%></label>
											</div>
										</div>
									</div>
				  
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>SteepleChase Jump Penalities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(steepleJmpPenal)%></label>
											</div>
										</div>
									</div>
				  				
								 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>SteepleChase Time Penalities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(steepleTmPenal)%></label>
											</div>
										</div>
									</div>
				  
				  				 <label class='control-label col-md-3 col-md-offset-2' for='id_title'>Points:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=nullCheck(hlcPoints)%></label>
											</div>
										</div>
									</div>
								</div>
				  
				  				<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'type="button" onclick="javascript:history.back(-1);" value="Back">Back</button>
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
