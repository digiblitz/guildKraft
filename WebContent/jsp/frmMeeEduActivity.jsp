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
<%@ page import="java.sql.*"%>
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
                            <h2>HLC Meetings: Sponsored Educational Activity Application</h2>
                        </div>
						<%
String sessionInvoiceId = "1";
            session.setAttribute("sessionInvoiceId", sessionInvoiceId);
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
	
						
						
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							
                            <form class='form-horizontal' role='form' name="frmMeeEduActivity" action="eduActivity.html" method="post" onsubmit="return eduActivity();">
							
                                <input type="hidden" name="activityProcess" value="insertEduDet">
								<p>Required fields are marked with an asterisk<span id="span_astriesk">*</span></p>
								
								<p class="para col-md-offset-1">Activity Information:</p>
								

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" name="activityName" class="form-control" id="txtActName"/>
											  	<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" readonly="true" name="activityDate" id="txtActDate" >
					   <a onclick="javascript:NewCssCal('date')"><i id="calendar1" class="fa fa-calendar"></i></a></input>
											<!--  <a onclick="javascript:NewCssCal('fromDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
											  	-->
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>No of Days:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="noOfDays" id="daysSelect" class="form-control" onchange="calculateAmount();">
								        <option selected="selected" value="">Days</option>
								        <option value="1">01</option>
								        <option value="2">02</option>
								        <option value="3">03</option>
								        <option value="4">04</option>
								        <option value="5">05</option>
								        <option value="6">06</option>
								        <option value="7">07</option>
								        <option value="8">08</option>
								        <option value="9">09</option>
								        <option value="10">10</option>
								        <option value="11">11</option>
								        <option value="12">12</option>
								        <option value="13">13</option>
								        <option value="14">14</option>
								        <option value="15">15</option>
								        <option value="16">16</option>
								        <option value="17">17</option>
								        <option value="18">18</option>
								        <option value="19">19</option>
								        <option value="20">20</option>
								        <option value="21">21</option>
								        <option value="22">22</option>
								        <option value="23">23</option>
								        <option value="24">24</option>
								        <option value="25">25</option>
								        <option value="26">26</option>
								        <option value="27">27</option>
								        <option value="28">28</option>
								        <option value="29">29</option>
								        <option value="30">30</option>
								        <option value="31">31</option>
					                </select>
								<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>HLC Area: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="hlcAreaId" id="txtUseaArea" class="form-control">
                                  		   <option selected="selected" value="">Select One</option>
                                     <%
										ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
										if(areaDetails!=null && areaDetails.size()!=0){
										Iterator areaIt = areaDetails.iterator();
										while(areaIt.hasNext()){
										String[] areaDet =(String[])areaIt.next();
										String areaId = areaDet[0];
										String areaName = areaDet[2];
										String areaCode = areaDet[1];
									%>
										<option value="<%=areaId%>"><%=areaName%></option>
									<%
										  }
										}
									%>    
							   </select>
											  	<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" name="location" id="location" class="form-control" />
											  
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="txtLocation" id="txtLocation" class="form-control" onChange="FillState(document.frmMeeEduActivity.txtLocation, document.frmMeeEduActivity.txtState, '');">
							  		</select>  
											  	<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="state" id="txtState" class="form-control"></select> 
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
                                              <input type="text" name="actZipcode" id="actZipcode" class="form-control" />
											  	<span id="span_astriesk">*</span>
                                            </div>
                                        </div>
										</div>
									
										
										<div class='col-md-4 col-md-offset-3'>
										<input type="checkbox" name="additionalSites" id="chkAddSites" value="yes" onclick="browseCheck();"/>
									Check if Additional Sites are to be used.
									</div>
								</div>

                                   
									
									
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Additional Site Information:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <textarea name="comments" id="txtUpload" class="form-control" disabled="disabled" rows="5"></textarea>
                                            </div>
                                        </div>

                                    </div>
									
								<p class="para col-md-offset-1">Organizer Information:</p>
								
								
									
									
									<p>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Organizer must be an individual, adult, current HLC member. Multiple or company organizers are not allowed.

										The organizer must be declared on this application in order to be covered by insurance.</p>	
									
								
							
									<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> HLC Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="hlcNo" id="riderUseaNo_id" onblur="riderDetails();"  />
											  	
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Salutation:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" name="rprefix" id="rprefix" readonly="true" class="readOnly"  />
											  
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Organizer First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="readOnly" readonly="true"  name="riderFname_id" id="riderFname_id"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              	<input type="text" class="readOnly" readonly="true"  name="riderLname_id" id="riderLname_id"  />	
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text"  class="readOnly"  readonly="true" name="rStreet" id="rStreet"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="readOnly" readonly="true" name="countryId" id="countryId"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="readOnly" readonly="true" name="rState" id="rState" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="readOnly" readonly="true" name="rCity" id="rCity"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="readOnly" readonly="true" name="rZipcode" id="rZipcode" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="readOnly" readonly="true" name="riderPhone_id" id="riderPhone_id" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Mobile No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="readOnly" readonly="true" name="rCell" id="rCell" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email ID: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="readOnly" readonly="true" name="rEmail" id="rEmail"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="readOnly" readonly="true" name="rFax" id="rFax" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Type Of Activity :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <select name="selActivityId" id="selActivityId" class="form-control" onChange="getText();">
										<option selected="selected" value="">Select One</option>
										
										<%
										ArrayList activityDetails = (ArrayList)session.getAttribute("DisplayActivityTypeDetails");
										if(activityDetails!=null && activityDetails.size()!=0){
										Iterator it = activityDetails.iterator();
										while(it.hasNext()){
										String[] eduDet =(String[])it.next();
										String id = eduDet[0];
										String activityName1 = eduDet[1];
										 
										%>
										
										<option value="<%=id%>"><%=activityName1%></option>
										
									 <%
									 
							  }
							}
							  %>
									  </select>
									  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If other, Specify:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="otherActivityType" id="txtOthernot" disabled="true"/>
										   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fee To Be Charged(<strong>$</strong>):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="activityFees" id="txtFee" type="text" class="form-control"  />
										   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Instructor(s)/Coach(es):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="instructorsCoaches" id="txtCoach" />
										   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically For: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-7 indent-small'>
                                            <div class='form-group internal' style="margin-top:15px">
                                          <input type="checkbox" name="chkFac1" id="chkFacOne"  value="Cross-Country Schooling"/>Cross-Country Schooling
										<input type="checkbox" name="chkFac2" id="chkFacTwo"  value="Riding Clinic" />	Riding Clinic
										<input type="checkbox" name="chkFac3" id="chkFacThree" value="Stablity" />
										Stabling
										<input type="checkbox" name="chkFac4" id="chkFacFour"  value="Other" onClick="isOtherscheck();" />Other
										   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If Other Specify:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" name="otherFacilities" id="txtOther" disabled="disabled" />
                                            </div>
                                        </div>

                                    </div>
									<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Publicity And Mailing List:</label>
								</div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Do you want Mailing list and Publications?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal' style="margin-top:15px">
                                          <input name="pmlRad" id="pmlRad" type="radio" value="yes" onclick="switchDiv('pubMailist');"/>Yes
										<input name="pmlRad" id="pmlRad" type="radio" value="no" onclick="showHideRadio('pmlRad','pubMailist','no'); radioClear();" />No					
                                            </div>
                                        </div>

                                    </div>
									
							<div class='form-group'>
								<div class='col-md-12'>
									<div class='col-md-2'>
									</div>
									<div class='col-md-12'>
									
									<p>When publication deadlines allow, registered educational activities will be listed in Eventing USA 
											and the Omnibus. Activities will be listed by name, date, and location with organizer's name and phone number. <br /><br />
		
											The HLC will provide mailing lists electronically as a .csv electronic file that can be used in Word or Excel. 
											If you cannot work with an electronic file, a hard copy list, on regular paper will be sent, which can then be 
											copied onto 5160 label sheets. Mailing list requests must be made at least six weeks in advance. </p>
										</div>
									</div>
								</div>
											
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email HLC Logo to:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" name="emailLogo" id="txtLogo" value="Enter e-mail address" /> 
											(For Publicity Use Only)
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Complimentary Mailing List Format:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal' style="margin-top:15px">
                                          <input name="radioCompMail" type="radio" id="rdoButton" value="Electronic .csv file" />Electronic .csv file
											<input name="radioCompMail" type="radio" id="rdoButton" value="Hard Copy " />
											Hard Copy
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Send Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal' style="margin-top:6px">
                                         <input name="radioSendMail" type="radio" id="rdoButton1" value="Areas" onclick="switchDiv('enterAre'); showHideRadio('radioSendMail','enterSta','Areas');"/>Areas
											<input name="radioSendMail" type="radio" id="rdoButton1" value="States" onclick="switchDiv('enterSta'); showHideRadio('radioSendMail','enterAre','States');"/>States 
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Enter Areas:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input name="areaStatus" type="text" class="from-control" id="areaStatus"/>
											 <span id="span_astriesk">*</span>(E.g. 1,2,3,4)
											
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Enter States:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input name="areaState" type="text" class="form-control" id="areaState" size="15" />
											  <span id="span_astriesk">*</span>(E.g. VA,MD,PA)
										 			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sort Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal' style="margin-top:6px">
                                          <input name="radioSortMail" type="radio" id="rdoButton2" value="Zip" />Zip
											<input name="radioSortMail" type="radio" id="rdoButton2" value="Alpha by last name " />Alpha by last name 
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of copies of the HLC color brochure :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" name="noOfCopies" id="txtCopies" />	
                                            </div>
                                        </div>

                                    </div>
									
									
									
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Details :</label>
								</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal' >
                                         <input type="text" class="form-control" name="landOwnerName" id="txtLandOwner" />
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <input type="text" class="form-control" name="landOwnerBusinessName" id="txtBusiName" />
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" name="landOwnerAddress" id="txtLandAddress" />
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <select name="landOwnerCountry" id="landOwnerCountry" class="form-control" width="200" onChange="FillState(document.frmMeeEduActivity.landOwnerCountry, document.frmMeeEduActivity.landOwnerState, '');"> 
									  </select>
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <select name="landOwnerState" id="landOwnerState" class="form-control">
									  </select>
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <input type="text" class="form-control" name="landOwnerCity" id="txtLandCity" />
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip Code:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <input name="landOwnerZip" type="text" class="form-control" id="txtLandZip" size="8" />
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input name="landOwnerPhone" type="text" class="form-control" id="txtLandPhone">
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input name="landOwnerFax" type="text" class="form-control" id="txtLandFax" >
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Email ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <input name="landOwnerEmail" type="text" class="form-control" id="txtLandEmail">
										 <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
							</div>		
									
								<p class="para col-md-offset-1">ACCEPTANCE OF TERMS:</p>
								
								
						<div class='form-group'>
							<div class='col-md-12'>
									
							
								
								
								<p>I have read the <a href="" class="linkFive">Requirements for the HLC Educational Activity</a> written on the reverse of this
											  Application, and the HLC Release Form. <br />
											  <br />
											  I understand those Requirements and terms and the responsibility I accept as a
											  HLC educational activity organizer. I agree as a condition of HLC registration of this activity to adhere to those conditions
											  and to pay the appropriate fees.</p>	
								
							</div>
						</div>
									
								
											  
										
							<div class='form-group'>
								<div class='col-md-8'>
									
										
                                            
												<input type="checkbox" name="approvedBy" value="checkbox" id="chkAccept" /> I Accept the conditions
												<span id="span_astriesk">*</span>
											
									</div>
								</div>
								 
									<p class="para col-md-offset-1">Payment Information:</p>
							
								
							
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<strong>$</strong>
                                          <input type="text" name="amount" id="txtAmount" class="readOnly" size="10" readonly="true" />		
                                            </div>
                                        </div>

                                    </div>
								<div class='form-group'>
									 <div class='col-md-8'>
                                         
										<div class='col-md-4'>
										</div>
									<div class='col-md-6'>
										
									 		<input type="radio" size="10" name="r11" id="r11" value="check"  onclick="switchDiv('chkEncAcm'), showHideRadio('r11','chrgCrdAcm','check'), cardClear(),hideImgDiv('cvvImg');"/> Check enclosed.				 	</td>
									 	
									 		<input type="radio" size="10" name="r11" id="r11" value="card" checked="checked"
onclick="switchDiv('chrgCrdAcm'), showHideRadio('r11','chkEncAcm','card'), checkClear(),showImgDiv('cvvImg');"  /> Please charge my card.
						
									</div>
								</div>
							</div>
								
						<p class="para col-md-offset-1">Check Details:</p>
								
						<div class='form-group'>
							<div class='col-md-12'>
									
								
								<p>If paying by check (payable to "HLC"), please mail your payment to:  <br /> <br />
												   
												    HLC
												    <br />
												    Educational Activity Registration
												    <br />
												    525 Old Waterford Road NW
												    <br />
												    Leesburg, VA 20176	 <br />   <br />											
												   
											        Note:Your registration status will be pending until check is processed.	</p>
										
									</div>
								</div>	
						 <div class='form-group'>						
													
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											
											  <input type="text" name="checkNumber" id="checkNumber" class="form-control"  />
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											
											  <input type="text" name="checkDate" id="checkDate" class="form-control" readonly="yes"/> 
					   <a onclick="javascript:NewCssCal('date')"><i id="calendar1" class="fa fa-calendar"></i></a></input>
					  							<span id="span_astriesk">*</span>	
											  			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											
											  <input type="text" name="bankName" id="bankName" class="form-control" />
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Check:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											
											   <input type="text" name="nameCheck" id="nameCheck" class="form-control" />
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>

								</div>
							<p class="para col-md-offset-1">Card Details:</p>
							<div class='form-group'>	
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<select name="ccType" id="ccType" class="form-control">
														  <option selected="selected" value="">Select One</option>
														  <option value="Visa">Visa</option>
														  <option value="MasterCard">Master Card</option>
														  <option value="AmEx">AmEx</option>
														</select>
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <input type="text" name="ccNumber" id="ccNumber" class="form-control"  />
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input type="text" name="ccCvvid" id="ccCvvid" class="form-control" />
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="ccName" id="ccName" class="form-control" />
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <select name="ccExpMonth" id="ccExpMonth" class="form-control">
														  <option value="" selected="selected">Month</option>
														  <option value="01">January</option>
														  <option value="02">February</option>
														  <option value="03">March</option>
														  <option value="04">April</option>
														  <option value="05">May</option>
														  <option value="06">June</option>
														  <option value="07">July</option>
														  <option value="08">August</option>
														  <option value="09">September</option>
														  <option value="10">October</option>
														  <option value="11">November</option>
														  <option value="12">December</option>
														</select>
														<select name="ccExpYear" id="ccExpYear" class="form-control">
															  <option value="" selected="selected" >Year</option>
															  <option  value="2006">2006</option>
															  <option  value="2007">2007</option>
															  <option  value="2008">2008</option>
															  <option  value="2009">2009</option>
															  <option  value="2010">2010</option>
															  <option  value="2011">2011</option>
															  <option  value="2012">2012</option>
															  <option  value="2013">2013</option>
															  <option  value="2014">2014</option>
															  <option  value="2015">2015</option>
                                                               <option  value="2016">2016</option>
                                                               <option  value="2017">2017</option>
                                                                 <option  value="2018">2018</option>
                                                                <option  value="2019">2019</option>
                                                                <option  value="2020">2020</option>
														</select>
											   <span id="span_astriesk">*</span>			
                                            </div>
                                        </div>

                                    </div>
								</div>
                              

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
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
	FillCountry(document.frmMeeEduActivity.landOwnerCountry, document.frmMeeEduActivity.landOwnerState, '---Select---');
	FillState(document.frmMeeEduActivity.landOwnerCountry, document.frmMeeEduActivity.landOwnerState, '---Select---');
</script>
<script>
     FillCountry(document.frmMeeEduActivity.txtLocation, document.frmMeeEduActivity.txtState, 'USA');
	 FillState(document.frmMeeEduActivity.txtLocation, document.frmMeeEduActivity.txtState, '---Select---');
	 
</script>

<script>
	var cal1 = new calendar2(document.forms['frmMeeEduActivity'].elements['txtActDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar2(document.forms['frmMeeEduActivity'].elements['checkDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
</script>
</html>
