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
<%@ page import="java.math.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeEduActivity.js" type="text/javascript" ></script>
<script src="js/frmActivity.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
<script src="js/calendar2.js" type="text/javascript"></script>

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
			
			<%
				String OwnerCountry = "";
				String OwnerState = "";
				
				String memberId = (String)session.getAttribute("memberId");
				if(memberId==null)
				memberId = "Memebr Id Not Exist";
				ArrayList listContact = (ArrayList) session.getAttribute("DisplaymemberDetails");
					
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


            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Meetings: Sponsored Educational Activity Application</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
							<form  class='form-horizontal' role='form' name="frmMeeEduActivity" id="frmMeeEduActivity" action="eduActivity.html" method="post" enctype="multipart/form-data" onsubmit="return eduActivity();">
								
								<input type="hidden" name="activityProcess" value="updateDet">
                            	
								<p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
								
								<%
									String publicationEmail = "";
									String mailingFormat =  "";
									String mailingBy = "";
									String mailingSortBy = "";
									String  noOfCopies = "";
								
									SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
									ArrayList dispDet = (ArrayList)request.getAttribute("OrgDetailsDisplay");
										HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
										Vector publication = new Vector();
										String actMeetId ="";
												Iterator it1 = dispDet.iterator();
											if(it1.hasNext()){
											objActDet = (HLCActivityOrganizerVO)it1.next();
																				
											if(objActDet.getLandOwnerCountry()!=null)
											OwnerCountry = objActDet.getLandOwnerCountry();
											
											if(objActDet.getLandOwnerState()!=null)
											OwnerState = objActDet.getLandOwnerState();
											
											publication = (Vector)it1.next();
												actMeetId = objActDet.getActivityMeetingId();											
												Enumeration enumPub = publication.elements();
												if(enumPub.hasMoreElements()){
													publicationEmail = (String)enumPub.nextElement();
													mailingFormat =   (String)enumPub.nextElement(); 
													mailingBy =(String) enumPub.nextElement();
													mailingSortBy =(String) enumPub.nextElement();
													noOfCopies =(String)enumPub.nextElement(); 
												}
								%>
							
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Information:</label>
								</div>
							
                                
                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" name="activityName" id="txtActName" class="form-control" value="<%=objActDet.getActivityName()%>" />
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" readonly="true" name="activityDate" id="txtActDate"  value="<%=sdf.format(objActDet.getActivityDate())%>"/>
											 <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
											<span id="span_astriesk">*</span>
									
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>No of Days.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <select name="noOfDays" class="form-control" id="daysSelect" >
												<option selected="selected" value="">Days</option>
												<%
													for(int i=1; i<=31; i++){
														int j = 0;
														if(objActDet.getNoOfDays()!=null){
															j = Integer.parseInt(objActDet.getNoOfDays());
														}
														
														if(i==j){
												%>
												<option value="<%=i%>" selected="selected"><%=i%></option>
											   <%
											   }
											   else{
											   %>
											   <option value="<%=i%>" ><%=i%></option>
											   <%
											   }
											   }
											   %>
											</select>
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <select name="hlcAreaId" class="form-control" id="txtUseaArea" >
												  <option selected="selected" value="">Select One</option>
												  
												 <% String areagetId = objActDet.getUseaAreaId();
													ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
													if(areaDetails!=null && areaDetails.size()!=0){
													Iterator areaIt = areaDetails.iterator();
													while(areaIt.hasNext()){
													String[] areaDet =(String[])areaIt.next();
													String areaId = areaDet[0];
													String areaName = areaDet[2];
													String areaCode = areaDet[1];
													if(areaId.equals(areagetId)){
													%>
													
													<option value="<%=areaId%>" selected="selected"><%=areaName%></option>
												 <%}else{
												 %>
												  <option value="<%=areaId%>"> <%=areaName%></option>
												 <%
												 }
												 
										  }
										}
										  %>   
											 </select>
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="location" id="txtLocation"  value="<%=objActDet.getLocation()%>"/>
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="state" id="txtState" value="<%=objActDet.getState()%>"/>
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" name="actCity" id="actCity" class="form-control" />
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" name="actZipcode" id="actZipcode" class="form-control"  />
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
								
							<div class='form-group'>
								<div class='col-md-offset-2'>
								<input type="checkbox" name="additionalSites" id="chkAddSites" value="yes" onclick="browseCheck();"/>
									Check if Additional Sites are to be used.
								</div>
							</div>	
								
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Additional Site Information:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <textarea name="comments" id="txtUpload" class="textAreaOne" disabled="disabled" rows="5"></textarea>
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Information:</label>
								</div>
									
							<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Memberl ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="hlcNo" type="text" class="form-control" size="25" readonly="true" value="<%=memberId%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="textbox62" type="text" class="form-control" size="25" readonly="true" value="<%=first_name%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="textbox62" type="text" class="form-control" size="25" readonly="true" value="<%=middle_name%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="textbox62" type="text" class="form-control" size="25" readonly="true" value="<%=last_name%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox63" type="text" class="form-control" readonly="true" size="25"value="<%=address1%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="textbox63" type="text" class="form-control" readonly="true" size="25" value="<%=address2%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="textbox32" type="text" class="form-control" readonly="true" size="25"  value="<%=city%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="textbox6321" type="text" class="form-control" readonly="true" size="25" value="<%=state%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="textbox632" type="text" class="form-control" readonly="true" size="25" value="<%=city%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox633" type="text" class="form-control"  readonly="true" size="25" value="<%=zip%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox634" type="text" class="form-control" readonly="true" size="25" value="<%=phone_no%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="textbox635" type="text" class="form-control" readonly="true" size="25" value="<%=fax_no%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email ID::</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="textbox635" type="text" class="form-control" readonly="true" size="25" value="<%=email_id%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Type Of Activity :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <select name="selActivityId" id="selActivityId" class="selectboxOne" onChange="getText();">
 									
												<%
												String activityEdit = objActDet.getActivityTypeId();
												out.print("activityEdit" + activityEdit);
												ArrayList activityDetails = (ArrayList)session.getAttribute("DisplayActivityTypeDetails");
												if(activityDetails!=null && activityDetails.size()!=0){
												Iterator it = activityDetails.iterator();
												while(it.hasNext()){
												String[] eduDet =(String[])it.next();
												String id = eduDet[0];
												String activityName1 = eduDet[1];
												if(id.equals(activityEdit)){
												%>
															  <option value="<%=id%>" selected="selected"><%=activityName1%></option>
															  <%}else{
																								
																								 %>
															  <option value="<%=id%>"> <%=activityName1%></option>
															  <%}
																						}
																						}
																						  %>
									</select>
									
									 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								<%
								 String otherActivity = objActDet.getOtherActivityType();
							 	if(otherActivity==null)
								{ otherActivity=""; }%>
								
							<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If other, Specify:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                        <input type="text" class="form-control" name="otherActivityType" id="txtOthernot" value="<%=otherActivity%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Fee To Be Charged:</label>
									
									<%
									String Amount=objActDet.getActivityFees();
									float pAmt = Float.parseFloat(Amount);
									java.math.BigDecimal bdAmount = new BigDecimal(pAmt);
									bdAmount = bdAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
									%>		
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
								 			$<input name="activityFees" id="txtFee" type="text" class="form-control"  value="<%=bdAmount%>" />      
											</div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Instructor(s)/Coach(es):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                      		<input type="text" class="form-control" name="instructorsCoaches" id="txtCoach" value="<%=objActDet.getInstructorsCoaches()%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                        <%
											String facilites = objActDet.getFacilities();
											int lenVal = 0;
											String[] value=null;
											if(facilites!=null){
												value=facilites.split(",");
												//out.println("facility :"+facilites.length());
												//out.println("facility siz:"+value.length);
											lenVal = value.length;
											if(lenVal>=1){
												if(value[0]!=null || value[0].trim().length()!=0) {
												 %>
												<input type="checkbox" name="chkFac1" id="chkFacOne" checked="checked" value="Cross-Country Schooling"/>
												<%
												}
											}	
											else{
											%>
											<input type="checkbox" name="chkFac1" id="chkFacOne"  value="Cross-Country Schooling"/> 
											<%
											}
											%>
											Cross-Country Schooling
												<%
												if(lenVal>=2){
													if(value[1]!=null || value[1].trim().length()!=0) {
														 %>
														<input type="checkbox" name="chkFac2" id="chkFacTwo" checked="checked"  value="Riding Clinic" />
														<%
													}
												}
													else{
														%>
														<input type="checkbox" name="chkFac2" id="chkFacTwo" value="Riding Clinic" />
														<%
													}
												%>
											Riding Clinic
												<%if(lenVal>=3){
													if(value[2]!=null || value[2].trim().length()!=0) {
													%>
													<input type="checkbox" name="chkFac3" id="chkFacThree" checked="checked" value="Stablity" />
													<%
													}
												 }
												else{
													%>
													<input type="checkbox" name="chkFac3" id="chkFacThree" value="Stablity" />
													<%
												}
												%>
											Stablity
											<%
												if(lenVal>=4){
													if(value[3]!=null || value[3].trim().length()!=0) {
													%>
														<input type="checkbox" name="chkFac4" id="chkFacFour" checked="checked" value="Other" onClick="isOtherscheck(); " />	
													<%
													}
												}
												
												else{
													%>
													 <input type="checkbox" name="chkFac4" id="chkFacFour" value="Other" onClick="isOtherscheck();"/>
													<%
												}
											}
											%>
											Other 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If Other Specify:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<%if(objActDet.getOtherFacilities()!=null){
													 
												%>
												<input type="text" class="textboxOne" name="otherFacilities" id="txtOther"  value="<%=objActDet.getOtherFacilities()%>" /> 
												<%}else{%>
												<input type="text" class="textboxOne" name="otherFacilities" id="txtOther" disabled="disabled"/>
												<%}%>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Do you want Mailing list and Publications?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="pmlRad" id="pmlRad" type="radio" value="yes" onclick="switchDiv('pubMailist');"/>Yes
												<input name="pmlRad" id="pmlRad" type="radio" value="no" onclick="showHideRadio('pmlRad','pubMailist','no');" />No
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group' id="pubMailist">
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Publicity And Mailing List:</label>
								</div>
								
								<div class="form-group ">
									<div class="col-md-offset-2">
								<p>User, please take your time and register with the avail the privileges that accompanies with it. </p>
										   
								<p>Note:This registration process does not make you a member. You may become an Member by filling up the Membership Application form towards the end of this registration process.</p>
								</div>
							</div>
							
							
							<div class="form-group ">
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email logo (JPEG):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="emailLogo" id="txtLogo" value="<%=publicationEmail%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Complimentary Mailing List Format:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-5 indent-small'>
                                            <div class='form-group internal'>
												<%
														if(mailingFormat.equals("Electronic .csv file")){
													%>
													<input name="radioCompMail" type="radio" id="rdoButton" value="Electronic .csv file"  checked="checked"/>Electronic .csv file
													<%
													}
													else{
													%>
													<input name="radioCompMail" type="radio" id="rdoButton" value="Electronic .csv file" />Electronic .csv file
													<%
													}
													if(mailingFormat.trim().equals("Hard Copy")){
													%>	
													<input name="radioCompMail" type="radio" id="rdoButton" checked="checked" value="Hard Copy " />Hard Copy 
													<%
													}
													else{
													%>
													<input name="radioCompMail" type="radio" id="rdoButton" value="Hard Copy " />Hard Copy 
													<%
													}
													%>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Send Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<%
														if(mailingBy.equals("Areas")){
													%>
													<input name="radioSendMail" type="radio" id="rdoButton1" checked="checked" value="Areas" onclick="switchDiv('enterAre'); showHideRadio('radioSendMail','enterSta','Areas');"/>Areas
													<%
													}
													else{
													%>
													<input name="radioSendMail" type="radio" id="rdoButton1" value="Areas" onclick="switchDiv('enterAre'); showHideRadio('radioSendMail','enterSta','Areas');"/>Areas
													<%
													}
													if(mailingBy.equals("States")){
													%>
													<input name="radioSendMail" type="radio" id="rdoButton1" checked="checked" value="States" onclick="switchDiv('enterSta'); showHideRadio('radioSendMail','enterAre','States');"/>States
													
													<%
													}
													else{
													%>
													<input name="radioSendMail" type="radio" id="rdoButton1" value="States" onclick="switchDiv('enterSta'); showHideRadio('radioSendMail','enterAre','States');"/>States
													<%
													}
													%>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Enter Areas:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="areaStatus" type="text" class="form-control" id="areaStatus" />
												<span id="span_astriesk">*</span>(E.g. 1,2,3,4) 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Enter States:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="areaState" type="text" class="form-control" id="areaState"  />
												<span id="span_astriesk">*</span>(E.g. VA,MD,PA) 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sort Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<%
												if(mailingSortBy.equals("Zip")){
												%>	
												<input name="radioSortMail" type="radio" id="rdoButton2" checked="checked" value="Zip" />Zip
												<%
												}
												else{
												%>
												<input name="radioSortMail" type="radio" id="rdoButton2" value="Zip" />Zip
												<%
												}
												if(mailingSortBy.trim().equals("Alpha by last name")){
												%>
												<input name="radioSortMail" type="radio" id="rdoButton2" checked="checked" value="Alpha by last name " />Alpha by last name 
												<%
												}
												else{
												%>
												<input name="radioSortMail" type="radio" id="rdoButton2" value="Alpha by last name" />Alpha by last name 
												<%
												}
												%>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of copies of the colour brochure :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="noOfCopies" id="txtCopies" value="<%=noOfCopies%>" />
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group' id="pubMailist">
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Details :</label>
								</div>
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="landOwnerName" id="txtLandOwner" value="<%=objActDet.getLandOwnerName()%>" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name : </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="landOwnerBusinessName" value="<%=objActDet.getLandOwnerBusinessName()%>" id="txtBusiName" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="landOwnerAddress" id="txtLandAddress" value="<%=objActDet.getLandOwnerAddress()%>" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<%
									 if (OwnerCountry == "") {
										OwnerCountry = "USA";
									}
									 if (OwnerState == "") {
										OwnerState = "Washington D.C";
									}
									%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="landOwnerCountry" id="landOwnerCountry" class="form-control" onChange="FillState(document.frmMeeEduActivity.landOwnerCountry, document.frmMeeEduActivity.landOwnerState, '');"> 
												 <option value="<%=OwnerCountry%>" selected="selected"><%=OwnerCountry%></option>	
												</select>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="landOwnerState" id="landOwnerState" class="form-control">
												 <option value="<%=OwnerState%>" selected="selected"><%=OwnerState%></option>	
												  </select>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="landOwnerCity" id="txtLandCity" value="<%=objActDet.getLandOwnerCity()%>" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip Code:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="landOwnerZip" id="txtLandZip" value="<%=objActDet.getLandOwnerZip()%>" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" class="form-control" name="landOwnerPhone" id="txtLandPhone" value="<%=objActDet.getLandOwnerPhone()%>">
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
							
							
							<div class='form-group'>
								<div class="col-md-offset-2">	
							<%
							boolean addSites = objActDet.isAdditionalSites();
							//out.println(addSites);
							 if(addSites){%>
							 <input type="checkbox" name="additionalSites" id="chkAddSites" checked="checked" value="yes" onclick="browseCheck();" />
							<% }else{
							 %>
							<input type="checkbox" name="additionalSites" id="chkAddSites" value="yes" onclick="browseCheck();" />
							
							<%}%>
							Check if Additional Sites are to be used.
							</div>
						</div>
						
							<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Additional Site Information:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<%
												 String addPath = objActDet.getAdditionalSitesPath();
												 if(addPath!=null){%>
												<textarea name="textarea" id="textarea" class="textAreaOne" rows="5"><%=addPath%></textarea>
												<%}
												 else{
												 %>
												<textarea name="textarea2" id="textarea2" class="textAreaOne" disabled="disabled" rows="5"></textarea>
												<% }%></td>
											  </tr>
												<input type="hidden" name="actMeetId" value="<%=actMeetId%>">
											  <%
											  }
											  %>
                                            </div>
                                        </div>

                                    </div>
								</div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Submit">Submit</button>
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

<script>
	FillCountry(document.frmMeeEduActivity.landOwnerCountry, document.frmMeeEduActivity.landOwnerState, '<%=OwnerCountry%>');
	FillState(document.frmMeeEduActivity.landOwnerCountry, document.frmMeeEduActivity.landOwnerState, '<%=OwnerState%>');
</script>
		
<script>
	var cal1 = new calendar2(document.forms['frmMeeEduActivity'].elements['txtActDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;

</script>

</html>

 
