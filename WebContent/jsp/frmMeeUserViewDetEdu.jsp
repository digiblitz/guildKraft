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
</head>

<%
String memberId = (String) session.getAttribute("memberId");
if(memberId==null)
memberId = "NA";

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
				address2 = "NA";
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
				fax_no = "NA";
			}
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
                            <h2>Meetings: Approve Sponsored Educational Activity Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeUserEduAct"  action="meeting.html">
							
                          <div class='panel-heading col-md-offset-2'>
                            <h2>Activity Information:</h2>
                        	</div>
							
							<%
									SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
									ArrayList dispDet = (ArrayList)request.getAttribute("displayFULLMeeDetails");
									
										if(dispDet==null && dispDet.size()==0){
										out.print("No records are available");
										}
									HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
									Vector publication = new Vector();
									String tmp ="";
									String actMeetId ="";
									String otherSpecific ="";
									String otherFacilities ="";
											Iterator it = dispDet.iterator();
											while(it.hasNext()){
											objActDet = (HLCActivityOrganizerVO)it.next();
											publication = (Vector)it.next();
												actMeetId = objActDet.getActivityMeetingId();
 												if(objActDet.getActivityDate()!=null){
													tmp = sdf.format(objActDet.getActivityDate());
												}
												otherSpecific = objActDet.getOtherActivityType();
												if(otherSpecific==null || otherSpecific.equals("")){
												otherSpecific = "NA";
												}

												otherFacilities= objActDet.getOtherFacilities();
												if(otherFacilities==null || otherFacilities.equals("")){
												otherFacilities = "NA";
												}

		 
 												Enumeration enumPub = publication.elements();
												while(enumPub.hasMoreElements()){
												
												String publicationEmail = (String)enumPub.nextElement();
												String mailingFormat =   (String)enumPub.nextElement(); 
												String mailingBy =(String) enumPub.nextElement();
												String mailingSortBy =(String) enumPub.nextElement();
												String  noOfCopies =(String)enumPub.nextElement(); 
												String mailStatus = (String)enumPub.nextElement();
												%>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objActDet.getActivityName()%></label>
                                                
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=tmp%></label>
                                                
                                            </div>
                                        </div>

                                    </div>
									
									 <%
						 				String finalArea ="";
										String areaName="";
										String getUseaAreaId = objActDet.getUseaAreaId();
										//out.print( "getUseaAreaId" + getUseaAreaId);
										ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
										if(areaDetails!=null && areaDetails.size()!=0){
										Iterator areaIt = areaDetails.iterator();
										while(areaIt.hasNext()){
										String[] areaDet =(String[])areaIt.next();
										String areaId = areaDet[0];
										//out.print("areaId" +areaId);
										 areaName = areaDet[2];
										 //out.print("areaName" +areaName);
										if(areaId.equals(getUseaAreaId)){
										finalArea = areaName;
										//out.print("finalArea" + finalArea);
									}
							  }
							}
							  %>  
							  
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=finalArea%></label>
                                                
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objActDet.getLocation()%></label>
                                                
                                            </div>
                                        </div>

                                    </div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objActDet.getState()%></label>
                                                
                                            </div>
                                        </div>

                                    </div>            
                                </div>
								
							
								<div class='panel-heading col-md-offset-2'>
									<h2>Organizer Information</h2>
								</div>
								
									
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Memberl ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=memberId%></label>
                                                
                                            </div>
                                        </div>

                                    </div> 
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=first_name%></label>
                                                
                                            </div>
                                        </div>

                                    </div>  
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Organizer Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=middle_name%></label>
                                                
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=last_name%></label>
                                                
                                            </div>
                                        </div>

                                    </div>  
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=address1%></label>
                                                
                                            </div>
                                        </div>

                                    </div>  
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=state%></label>
                                                
                                            </div>
                                        </div>

                                    </div>        
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=city%></label>
                                                
                                            </div>
                                        </div>

                                    </div>        
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=fax_no%></label>
                                                
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Email ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=email_id%></label>
                                                
                                            </div>
                                        </div>
									</div>  
									                               
                                </div>
								
								<%
										String activityTypeId = objActDet.getActivityTypeId();
										String activityName1 ="";
										String finalActivity="";
										String id ="";
										ArrayList activityDetails = (ArrayList)session.getAttribute("DisplayActivityTypeDetails");
										if(activityDetails!=null && activityDetails.size()!=0){
										Iterator it1 = activityDetails.iterator();
										while(it1.hasNext()){
										String[] eduDet =(String[])it1.next();
										id = eduDet[0];
										activityName1 = eduDet[1];
										if(id.equals(activityTypeId)){
										  finalActivity = activityName1;
										}
										
																
							  }
							}
							  %>
							  
							  <div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Type Of Activity : </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=finalActivity%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other Specific Id </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=otherSpecific%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fee To Be Charged:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'>$<%=objActDet.getActivityFees()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Instructor(s)/Coach(es):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getInstructorsCoaches()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getFacilities()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other Facilities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=otherFacilities%></label>
											</div>
										</div>
									</div>
									
								</div>
								
								<div class='panel-heading col-md-offset-2'>
									<h2>Publicity And Mailing List:</h2>
								</div>
								
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Email logo (JPEG):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=publicationEmail%></label>
											</div>
										</div>
									</div>
								
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Complimentary Mailing List Format:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=mailingFormat%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Send Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=mailingBy%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sort Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=mailingSortBy%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of copies of the colour brochure :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=noOfCopies%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mailing Status By Area or States:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=mailStatus%></label>
											</div>
										</div>
									</div>
								</div>
								
								
								
								<div class='panel-heading col-md-offset-2'>
									<h2>Land Owner Details :</h2>
								</div>
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerName()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerBusinessName()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerAddress()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerCountry()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerState()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerCity()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerZip()%></label>
											</div>
										</div>
									</div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Tel:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.getLandOwnerPhone()%></label>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Upload Additional Site Information:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objActDet.isAdditionalSites()%></label>
											</div>
										</div>
									</div>
									
								</div>
								
								<input type="hidden" name="orgMeetingId" value="<%=actMeetId%>">
						  <%}%>
						  
						  	<input type="hidden" name="meeProcess" value="showOrgMee">	
									
					   
								

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'  name="butName" value="apply">apply</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="button" type="button" value="cancel" onclick="javascript:history.back(-1);" >Cancel</button>
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
