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
                            <h2>Meetings: Insurance Release Details - Educational Activity </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<%
							String memberSesId = (String) session.getAttribute("memberId");
							if(memberSesId==null)
							memberSesId = "Memebr Id Not Exist";
							
								SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
							HLCActivityOrganizerVO objActivityDet = (HLCActivityOrganizerVO) session.getAttribute("ActivityOrganizerVODet");
							
							
								ArrayList listContact = (ArrayList) session.getAttribute("dynamicOrgDetails");
								
									String prefix1 = "";
									String first_name = "";
									String middle_name = "";
									String last_name = "";
									String sufix = "";
									String email_id = "";
									String suite = "";
									String address1 = "";
									String address2 = "";
									String city = "";
									String state = "";
									String country = "";
									String zip = "";
									String phone_no = "";
									String mobile_no = "";
									String fax_no = "";
									
									if(listContact !=null && listContact.size()!=0){
										Iterator it = listContact.iterator();
										while(it.hasNext()){
											prefix1 = (String)it.next();
											if(prefix1==null)
											prefix1 = "";
											first_name  = (String)it.next();
											if(first_name==null)
											first_name = "";
											middle_name  = (String)it.next();
											if(middle_name==null)
											middle_name = "";
											last_name = (String)it.next();
											if(last_name==null)
											last_name = "";
											sufix =  (String)it.next();
											if(sufix==null)
											sufix = "";
											email_id  = (String)it.next();
											if(email_id==null)
											email_id = "";
											suite =  (String)it.next();
											if(suite==null)
											suite = "";
											address1 =  (String)it.next();
											if(address1==null)
											address1 = "";
											address2 = (String)it.next();
											if(address2==null)
											address2 = "";
											city = (String)it.next();
											if(city==null)
											city = "";
											state =  (String)it.next();
											if(state==null)
											state = "";
											country = (String)it.next();
											if(country==null)
											country = "";
											zip = (String)it.next();
											if(zip==null)
											zip = "";
											phone_no = (String)it.next();
											if(phone_no==null)
											phone_no = "";
											mobile_no = (String)it.next();
											if(mobile_no==null)
											mobile_no = "";
											fax_no = (String)it.next();
											if(fax_no==null)
											fax_no = "";
										}
									}
							%>	
							
							<div class='panel-heading'>
                            	<h2>Activity Details:</h2>
                        	</div>
							
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=objActivityDet.getActivityName()%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<%
						 				String finalArea ="";
										String areaName="";
										String getUseaAreaId = objActivityDet.getUseaAreaId();
										ArrayList areaDetails = (ArrayList)request.getAttribute("DispAreaDetails");
										if(areaDetails!=null && areaDetails.size()!=0){
										Iterator areaIt = areaDetails.iterator();
										while(areaIt.hasNext()){
										String[] areaDet =(String[])areaIt.next();
										String areaId = areaDet[0];
										 areaName = areaDet[2];
										if(areaId.equals(getUseaAreaId)){
										finalArea = areaName;
										
									}
							  }
							}
							  %>
							  
							  <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=finalArea%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<%
								  String actDate ="";
								  if(objActivityDet.getActivityDate()!=null){
								  actDate = sdf.format(objActivityDet.getActivityDate());
								  }
								  
								  %>
								  
								   <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date(s)to be held:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=actDate%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div> 
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=objActivityDet.getLocation()%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>  
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=objActivityDet.getState()%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='panel-heading'>
                            		<h2>Participant&#8217;s Details:</h2>
                        		</div> 
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=email_id%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=first_name%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=middle_name%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=last_name%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=address1%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=address2%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=country%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=state%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>  City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=city%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=state%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Zip Code:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=zip%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=phone_no%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <label class='control-label'><%=fax_no%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='panel-heading'>
                            		<h2>Other Information: </h2>
                        		</div>
								
								
									<%  
						
  								String releaseId =  "";
								String activityMeetingId = "";
								String userIdVal =  "";
								String eventLevelId =  "";
								String memberId = "";
								String noOfHorses =  "";
								String reqStatus =  "";
								String reqDate =  "";
								HLCActivityUserVO objActUser = (HLCActivityUserVO)session.getAttribute("DispParticularUserDetail");
							   
								  releaseId =  objActUser.getReleaseId();
								  activityMeetingId = objActUser.getActivityMeetingId();
								  userIdVal =  objActUser.getUserId();
								  eventLevelId =  objActUser.getEventLevelId();
								  memberId =  objActUser.getMemberId();
								  noOfHorses =  objActUser.getNoOfHorses();
								  reqStatus =  objActUser.getRequestStatus();
								  if(objActUser.getAddDate()!=null){
								  	reqDate =  sdf.format(objActUser.getAddDate());
								  }
								  boolean memStatus = objActUser.isMembershipStatus();
									if(memberId==null){
									 memberId="Not a Member";
									}
									if(reqStatus==null){
										reqStatus="";
									}
						  
						  %>                                                                                  
													
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmMeeInsureICPDetails" id="myform" action="meeting.html">
							
                                <input type="hidden" name="meeProcess" value="userUpdateStatus" />
								<input type="hidden" name="releaseId" value="<%=releaseId%>" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of horses riding during activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=noOfHorses%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<%
									String levelid="";
									String levelType="";
									String levelCode="";
									String finalLevel ="";
									Vector levels = (Vector)request.getAttribute("AllLevels");
									if(levels.size()!=0 && levels !=null){
										Enumeration enum = levels.elements();
										while(enum.hasMoreElements()){
											String[] levelNames = (String[])enum.nextElement();
											levelid = (String)levelNames[0];
											levelType = (String)levelNames[1];
											levelCode = (String)levelNames[2];
											if(levelid.equals(eventLevelId)){
											finalLevel= levelType +"-" +levelCode;
									}
									  }
									}
							  	%>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Level now riding:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=finalLevel%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<%
								  String statusMem ="";
								  if(memStatus){
									  statusMem ="Yes";
									  }
									  else{
									  statusMem ="No";
									  }
								%>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=statusMem%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>membership number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=memberId%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='panel-heading'>
                            		<h2>Approval Status:</h2>
                        		</div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=reqStatus%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								  <div class='form-group'>
								  <%
									if(reqStatus.equals("Approved")){
									%>
									
									<button class='btn-lg btn-primary' type='submit' value="Rejected" name="userChangeStatus">Rejected</button>
									<%
									}
									else{
									%>
									<button type="submit" class="btn-lg btn-primary" value="Approve" name="userChangeStatus" >Approve</button>
									<%
									}
									%>
									<button type="button" class="btn-lg btn-primary" value="Back" onclick="javascript:history.back(-1);" >Back</button>	
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
