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
                            <h2>Meetings: Organizer Educational Activity Registration Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
<%
//String memberId = (String)request.getAttribute("memberId");
//if(memberId==null)
//memberId = "Memebr Id Not Exist";
ArrayList listContact = (ArrayList)request.getAttribute("DisplaymemberDetails");
	
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
				prefix1 = "NA";
				first_name  = (String)it.next();
				if(first_name==null)
				first_name = "NA";
				middle_name  = (String)it.next();
				if(middle_name==null || middle_name.equals("")) 
				middle_name = "NA";
				last_name = (String)it.next();
				if(last_name==null)
				last_name = "NA";
				sufix =  (String)it.next();
				if(sufix==null)
				sufix = "NA";
				email_id  = (String)it.next();
				if(email_id==null)
				email_id = "NA";
				suite =  (String)it.next();
				if(suite==null)
				suite = "NA";
				address1 =  (String)it.next();
				if(address1==null)
				address1 = "NA";
				address2 = (String)it.next();
				if(address2==null || address2.equals("")) 
				address2 = "NA";
				city = (String)it.next();
				if(city==null)
				city = "NA";
				state =  (String)it.next();
				if(state==null)
				state = "NA";
				country = (String)it.next();
				if(country==null)
				country = "NA";
				zip = (String)it.next();
				if(zip==null)
				zip = "NA";
				phone_no = (String)it.next();
				if(phone_no==null)
				phone_no = "NA";
				mobile_no = (String)it.next();
				if(mobile_no==null)
				mobile_no = "NA";
				fax_no = (String)it.next();
				if(fax_no==null || fax_no.equals("")) 
				fax_no = "NA";
			}
		}
%>
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeICPAssessment" action="">
							
                                 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Educational Activity Details:</label>
								</div>
								
									<%
									SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
									ArrayList dispDet = (ArrayList)request.getAttribute("OrgDetailsDisplay");
										HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
										Vector publication = new Vector();
										String actMeetId ="";
										String status="";
										String comments ="";
											Iterator it = dispDet.iterator();
											if(it.hasNext()){
											objActDet = (HLCActivityOrganizerVO)it.next();
											publication = (Vector)it.next();
												actMeetId = objActDet.getActivityMeetingId();											
												Enumeration enumPub = publication.elements();
												if(enumPub.hasMoreElements()){
													String publicationEmail = (String)enumPub.nextElement();
													String mailingFormat =   (String)enumPub.nextElement(); 
													String mailingBy =(String) enumPub.nextElement();
													String mailingSortBy =(String) enumPub.nextElement();
													String noOfCopies =(String)enumPub.nextElement(); 
													String Status =(String)enumPub.nextElement(); 
												}
												%>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Activity :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getActivityName()%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								 <%
								  String activityDate="";
								  if(objActDet.getActivityDate()!=null){
								  activityDate =sdf.format(objActDet.getActivityDate());
								  }
								%>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=activityDate%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>No. of Days:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getNoOfDays()%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								 <%
						 				String finalArea ="";
										String areaName="";
										String getUseaAreaId = objActDet.getUseaAreaId();
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
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getLocation()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getCountry()%></label>
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
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getCity()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>ZipCode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getZip()%></label>
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Information:</label>
								</div>
									
									
									<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getActivityOrganizerId()%></label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=address1%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address2:</label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>E-Mail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=email_id%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%
									String facilites=objActDet.getFacilities();
									String tmpFacilities ="";
									if(facilites!=null){
									  tmpFacilities=objActDet.getFacilities();
									}
									String otherfacilites = objActDet.getOtherFacilities();
									if(otherfacilites==null || otherfacilites.equals("")){
										otherfacilites ="NA";
									}
																		 
	
									%>	 
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=tmpFacilities%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other Facilities:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=otherfacilites%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Type Of Activity ::</label>
									<%
										String activityTypeId = objActDet.getActivityTypeId();
										String activityName1 ="";
										String finalActivity="";
										String id ="";
										ArrayList activityDetails = (ArrayList)request.getAttribute("DisplayActivityTypeDetails");
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
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=finalActivity%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%
							 String otherAct ="";	  
							  if(objActDet.getOtherActivityType()!=null){
								  otherAct = objActDet.getOtherActivityType();
							  }
							  else{
									otherAct ="NA";
							  }
							  %>
							  
							  
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other Specific Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=otherAct%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fee To Be Charged(<strong>$</strong>):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getActivityFees()%></label>
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
                                </div>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Details :</label>
								</div> 
								
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=objActDet.getLandOwnerName()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name ::</label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
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
                                </div> 
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approval Status:</label>
								</div>   
								
								 <%
									status = objActDet.getRequestStatus();
									if(status==null){
										status = "";
									}
								  %>
								  
								  <div class='form-group'>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=status%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div> 
								
								 <%
								comments = objActDet.getComments();
								 if(comments==null){
										comments = "Not Given";
									}
								  %>
								
								<div class='form-group'>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=comments%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div> 
								
								 <%}%>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                       
										<button type="button" value="Back" class="btn-lg btn-primary" onclick="javascript:history.back(-1);">Back</button>
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
