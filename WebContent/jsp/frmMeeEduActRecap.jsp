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
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcmro.util.*"%>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmRecapValid.js" type="text/javascript" ></script>

<script language="javascript">


function postData(){
if(document.frmMeeEduActRecap.activityName.value!=""){
 
	frmMeeEduActRecap.recapProcess.value = "initRecapOrgSelect";
	//alert(frmRewalList.eventProcess.value);
    frmMeeEduActRecap.method="post";
    frmMeeEduActRecap.action="recap.html";
    frmMeeEduActRecap.submit();
 
}
}
</script>


</head>

<%
//session.setAttribute("MemberId","100001");

String memberId = (String) session.getAttribute("memberId");


if(memberId==null){
memberId = "Memebr Id Not Exist";
response.sendRedirect("index.jsp");
}


String meetingId = (String)request.getAttribute("meetingId");
if(meetingId==null)
meetingId = "";

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
                            <h2>Meetings: Educational Activity Recap Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>User, please take your time and register to avail the privileges that accompanies with it.<br />
					 
				  			Note: Upon registration of any Educational Activity please return this Activity Recap Form, together with all original signed
							Release Forms (one for each rider and instructor), any membership applications and fees. DO NOT SEND CASH!
							Forms are to be forwarded as soon as possible after each Activity, but no later than thirty (30) days after the Activity is
							completed or canceled if the Activity is not held. If you have questions, please contact at 703-779-0440 Ext: 3003.
							Mail ALL forms and fees to:Education, 525 Old Waterford Road N.W., Leesburg, Virginia 20176
							Activity Recaps are used to inform and aid the Education and Insurance Committees and Board in making decisions
							about sponsorship of activities. Accuracy and timeliness of the information is important! Please verify that all names and
							dates for the activity are consistent among the forms you have submitted. The Activity Recaps should have the same name and
							dates as your Application. Also, we seek your input so please give us your comments on the back of this form.</p>
							
						<!--==============================Form Description=================================-->
							
                           
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmMeeEduActRecap" action="recap.html" onsubmit="return myvalidate();">
							
                                <p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Basic Information:</label>
								</div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="activityName" id="selActivityId" class="form-control" onchange="postData();" >
							<option selected="selected" value="">Select One</option>
							<%
									SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
									String meetingIdVal ="";
									String meetingName ="";
									ArrayList vPendingAds = (ArrayList)session.getAttribute("displayApprovedDetails");
									if(vPendingAds!=null && vPendingAds.size()!=0){
												Iterator e = vPendingAds.iterator();
												ArrayList finalList = new ArrayList();
												while(e.hasNext()){
												 ArrayList exaVal = (ArrayList)e.next();
												 Iterator enumPub1 = exaVal.iterator();
												 while(enumPub1.hasNext()){
														HLCActivityOrganizerVO objActDet = (HLCActivityOrganizerVO)enumPub1.next();
															Vector publication = (Vector)enumPub1.next();
															 meetingName =objActDet.getActivityName();							
															 meetingIdVal =	objActDet.getActivityMeetingId();
															 if(meetingId.equals(meetingIdVal)){
			
							%>
											<option value="<%=meetingIdVal%>" selected="selected"><%=meetingName%></option>
												 <%
												 }
												 else{
												 %>
											<option value="<%=meetingIdVal%>" ><%=meetingName%></option>
												 <%
												 }
												 }
											  }
											}
											%>
										</select>
										<%
										String actDate = "";
											//Date actDate = null;
											String location = "";
											String getUseaAreaId = "";
											String finalArea ="";
											String areaName="";
											String areaId ="";
											HLCActivityOrganizerVO objActDetSelect = (HLCActivityOrganizerVO)request.getAttribute("ActivityOrganizerVODet");
												//out.println("Value:" + objActDetSelect);
												if(objActDetSelect!=null) {
															location = objActDetSelect.getLocation();
															getUseaAreaId = objActDetSelect.getUseaAreaId();
															//out.print("getUseaAreaId" + getUseaAreaId);
																if(objActDetSelect.getActivityDate()!=null){
																actDate = sdf.format(objActDetSelect.getActivityDate());
																}
														 
																
																ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
																if(areaDetails!=null && areaDetails.size()!=0){
																		Iterator areaIt = areaDetails.iterator();
																		while(areaIt.hasNext()){
																				String[] areaDet =(String[])areaIt.next();
																				areaId = areaDet[0];
																				areaName = areaDet[2];
																				//out.print("areaName" + areaId);
																					if(areaId.equals(getUseaAreaId)){
																						finalArea = areaName;
																					}
																		}
																}
											}
															  
										%>
										<span id="span_astriesk">*</span>	
						
                                            </div>
                                        </div>

                                    </div>
                                </div>
								

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date(s)held(MM/DD/YYYY):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="textbox7" type="text" class="form-control"  readonly value="<%=actDate%>" />
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Was This a Data Change :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             	<input name="activityDateChangeStatus" id="radio1" type="radio" checked="checked" value="yes" />Yes
												<input name="activityDateChangeStatus" id="radio1" type="radio" value="no" />No 
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location Of Activity :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox8" type="text" class="form-control" size="25" readonly value="<%=location%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="textbox8" type="text" class="form-control" size="25" readonly value="<%=finalArea%>" />
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
                                            <input name="textbox6" type="text" class="form-control"  readonly value="<%=memberId%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox62" type="text" class="form-control"  readonly value="<%=first_name%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="textbox62" type="text" class="form-control" readonly value="<%=middle_name%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Organizer Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox62" type="text" class="form-control"  readonly value="<%=last_name%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox63" type="text" class="form-control" readonly value="<%=address1%>" /></td>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="textbox63" type="text" class="form-control" readonly  value="<%=address2%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="textbox32" type="text" class="form-control" readonly   value="<%=country%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="textbox6321" type="text" class="form-control" readonly  value="<%=state%>" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input name="textbox632" type="text" class="form-control" readonly  value="<%=city%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="textbox633" type="text" class="form-control"  readonly  value="<%=zip%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input name="textbox634" type="text" class="form-control" readonly  value="<%=phone_no%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <input name="textbox635" type="text" class="form-control" readonly  value="<%=fax_no%>"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                        <input name="textbox635" type="text" class="form-control" readonly  value="<%=email_id%>"/>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Information:</label>
								</div>
									
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number Of Riders Participating:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="noOfRiders" id="ridernum" type="text" class="form-control"  />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of Instructors:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="noOfInstructors" id="instnum"  type="text" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of Current members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="noOfCurrentMembers" id="uesanum"  type="text" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of New members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="noOfNewMembers" id="newhlcnum" type="text" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of Renewing members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="noOfRenewingMembers" id="renewhlcnum"  type="text" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>New User Member Information:</label>
								</div>
									
								<div class='form-group'>
								
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Individual Full members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="noOfFullMembers" id="hlcfullnum" type="text" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Junior members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="noOfJuniorMembers" id="hlcjunum" type="text" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non-competing members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input name="noOfNonCompetingMembers" id="noncomnum" type="text" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount($):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="totalAmount" id="totamt" type="text" class="form-control"  />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments And Suggestions:</label>
								</div>
									
								<div class='form-group'>
								
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments about your Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <textarea  name="comments" id="comments" class="textAreaOne" rows="5"></textarea>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>May we publish all or part of your comments in Eventing USA?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          	<input name="publishComments" id="radio2"  type="radio" value="yes" />Yes	  
											<input name="publishComments" id="radio2"  type="radio" value="no" /> No
											
											<input type="hidden" name="recapProcess" value="createRecapOrg"/>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suggestions for Educational Activities and/or forms, procedures improvement :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          	 <textarea name="suggestions"  id="suggestions" class="textAreaOne" rows="5"></textarea>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Submit">Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="button" value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
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
