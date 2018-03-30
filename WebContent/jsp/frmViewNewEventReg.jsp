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
<%@ page import="java.text.*"%>
<%@ page import ="com.hlcmro.util.HLCEventRequestVO"%>
<%@ pageimport="java.sql.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/frmEditEventRequestReg.js" type="text/javascript"></script>


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
<%! 				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM/dd/yyyy");
					
					String dateFormat(String fieldName){					
						java.util.Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}
						
						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
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
                            <h2>Meetings: View Event Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmEditEventRequestReg" id="frmEditEventRequestReg" action="./eventRegList.html" method="post">
							
                                <div class='panel-heading'>
									<h2>View Event Details:</h2>
								</div>
								
								
								<% 
	
									HLCEventRequestVO objEventReqVO = new HLCEventRequestVO();
									objEventReqVO = (HLCEventRequestVO)request.getAttribute("EVENT_REQUEST_VO");		
										String event_id = "";
										String organizer_id = "";
										String event_title = "";			
										String competition_location = "";
										String competition_city = "";
										String competition_state = "";
										String competition_country = "";
										String competition_zip = "";
										String championship_area = "";
										String status_id = "";
										String issNm = "";
									 ArrayList mappingTypeIds = new ArrayList();
									 
									 String eventSubTypes = "";
									 java.util.Date eventBeginDate=null;
									 java.util.Date eventEndDate=null;
									 
									 if(objEventReqVO!= null ){
									  event_id = objEventReqVO.getEvent_id();
									  organizer_id = objEventReqVO.getOrganizer_id();
									  event_title = objEventReqVO.getEvent_title();
									  eventBeginDate = objEventReqVO.getEveBegDate();		 
									
									  eventEndDate = objEventReqVO.getEveEndDate();	
									  competition_location = objEventReqVO.getCompetition_location();
									  competition_city = objEventReqVO.getCompetition_city();
									  competition_state = objEventReqVO.getCompetition_state();
									  competition_country = objEventReqVO.getCompetition_country();
									  competition_zip = objEventReqVO.getCompetition_zip();
									  championship_area = objEventReqVO.getChampionship_area();
									  status_id = objEventReqVO.getStatus_id();
									  issNm = objEventReqVO.getIssueName();
									  mappingTypeIds = objEventReqVO.getMaping_type_id();
										if(mappingTypeIds!= null && mappingTypeIds.size()!=0){	  
											Iterator itrMapTypeIds = mappingTypeIds.iterator();
										
											while(itrMapTypeIds.hasNext()){
											String mappingTypeId = (String)itrMapTypeIds.next();
											eventSubTypes = mappingTypeId+"#"+eventSubTypes;
											}
										}
									}
									String areaId = "";
									String areaStr = "";
									String[] areaDetails = (String []) request.getAttribute("AREA_DETAILS");
									if(areaDetails != null){
									 areaId = areaDetails[0];
									 areaStr = areaDetails[1];
									 }
						%>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'> <%=nullCheck(event_title)%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
								</div>
									
									
									<div class='form-group'>
									<label class='control-label label1 col-md-2 col-md-offset-2' for='id_title'>Event Location:</label>
									</div>
                                    
								 <div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'>USA</label>
                                               
                                            </div>
                                        </div>

                                    </div>
								
								
								 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'>
											<%
										ArrayList stateDetails = (ArrayList)request.getAttribute("stateDetails");
										if(stateDetails!=null && stateDetails.size()!=0){
										Iterator itr = stateDetails.iterator();
                
                						while(itr.hasNext()){
                						String[] stateDet = (String[])itr.next();
										String stateId = stateDet[0];
										String stateName = stateDet[1];
										String stateCode = stateDet[2];
										if(competition_state!=null && competition_state.equalsIgnoreCase(stateId)){
										%>
										<%=stateName%>
										<%}}}%></label>
									 
                                               
                                            </div>
                                        </div>

                                    </div>
								
								
								 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'><%=nullCheck(competition_city)%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
								
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'><%=nullCheck(competition_location)%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>ZipCode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'><%=nullCheck(competition_zip)%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'><%=nullCheck(areaStr)%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Begin Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'><%=dateFormat(eventBeginDate.toString())%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>End date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label col-md-2 col-md-offset-2'><%=dateFormat(eventEndDate.toString())%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input name="orgnaizerId" type="text" id="orgnaizerId" value="<%=organizer_id%>" class="form-control" size="20" maxlength="20" style="background-color:#F4F4F4; font-weight:bold; border:0px;" onblur="HLCMemberDetails();"/>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input name="name" type="text" id="name" class="form-control" size="20" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="true"/>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input name="phone" type="text" id="phone" class="form-control" size="20" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="true"/>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input name="address" type="text" id="address" class="form-control" size="30" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="true"/>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <input name="city" type="text" id="city" class="form-control" size="20" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="true"/>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <input name="fax" type="text" id="fax" class="form-control" size="20" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="true"/>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <input name="email" type="text" id="email" class="form-control" size="20" style="background-color:#F4F4F4; font-weight:bold; border:0px;" readonly="true"/>
                                               
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Season:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label col-md-2 col-md-offset-2'><%=issNm%></label>
                                               
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group'>	
									<label class='control-label label1 col-md-2 col-md-offset-2' for='id_title'>Event Types and Levels:</label>
                                  </div>
									
									
									<%
										Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");
										HashMap eventTypeMap = (HashMap)request.getAttribute("eventTypeMap");
										int levelCount =0;
										if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
										Enumeration it = eventTypeDetails.elements();
										while(it.hasMoreElements()){
										String[] eventDet =(String[])it.nextElement();
										String eventTypeId = eventDet[0];
										String eventTypeName= eventDet[1];
									%>
				
									<%  String tmpVal="";
										ArrayList subLevelMap = (ArrayList)eventTypeMap.get(eventTypeId);
					                    Iterator itrSub = subLevelMap.iterator();
                    					while(itrSub.hasNext()){
				                        String[] subEntry = (String[])itrSub.next();
                				        String mapId = subEntry[0];
				                        String levelId = subEntry[1];
                				        String levelCode = subEntry[2];
				                        String levelName = subEntry[3]; 
										levelCount = levelCount + 1;
										String cbxName = "eventLevels"+levelCount;
										boolean chkStatus = false;
										if(eventSubTypes.contains(mapId)){
										if(tmpVal==""){
										tmpVal = levelCode;	
										}else{	
										tmpVal = tmpVal + ","+ levelCode;	
										}														
										%>
				
					 			<%}
							  }%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'><%=eventTypeName%></label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<%if(tmpVal!=""){%> 
												<label class='control-label col-md-2'><%=tmpVal%></label>
												<%}else{%>
												<label class='control-label col-md-2'>N/A</label>
											</div>
										</div>
									</div>
							
				            <%}%> 
							<%}
						}  %>
									 
				 	 <input type="hidden" name="levelCount" id="levelCount" value="<%=levelCount%>" />
					<input type="hidden" name="eventId" id="eventId" value="<%=event_id%>" />					
				 
                                           
								
                               

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='button' onclick="javascript:history.back(-1);" value="Back">Back</button>
										
                                    </div>
                                    
                                </div>
								
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
