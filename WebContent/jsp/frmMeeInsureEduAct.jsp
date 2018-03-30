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

<script src="js/frmMeeInsureValid.js" type="text/javascript" ></script>
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
var arHttpRequest;

function HLCMemberDetails(){
    var memberid=document.frmMeeInsureEduAct.memberShipNo.value;
        var url = "./RiderInfoAjaxAction.html?memberid="+ memberid; 
        if (window.ActiveXObject){ 
            arHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest){ 
            arHttpRequest = new XMLHttpRequest(); 
        } 
        arHttpRequest.open("POST", url, true); 
        arHttpRequest.onreadystatechange = function() {membStatus(); } ; 
        arHttpRequest.send(null); 
   } 
   
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function membStatus() 
    { 
   
        if (arHttpRequest.readyState == 4) 
        { 
            if(arHttpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var arnameXML = arHttpRequest.responseXML.getElementsByTagName("memberstatus")[0]; 
                 var arnameText = arnameXML.childNodes[0].nodeValue; 
				
				//alert
				
                if(arnameText=="false"){    
                alert("Member Id Doesn't Exists!"); 
				document.frmMeeInsureEduAct.memberShipNo.value="";
            	document.frmMeeInsureEduAct.memberShipNo.focus();
                return;
                }    
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
</script>
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
                            <h2>Meetings: Insurance Release - Educational Activities</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
<%
String memberId = (String) session.getAttribute("memberId");
//out.print("memberId" + memberId);
if(memberId==null)
memberId = "NA";

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
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

							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeInsureEduAct" method="post" action="insEduAct.html" onsubmit="return myvalidate();">
							
                               <%
								String orgMeetingId= (String)request.getAttribute("orgMeetingId");
							%>
								<input type="hidden" name="orgMeetingId" value="<%=orgMeetingId%>">	
								
								<p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Activity Details:</label>
								</div>
								

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" name="activityName" readonly="true" value="<%=objActivityDet.getActivityName()%>">
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<%
						 				String finalArea="";
										String areaName="";
										String getUseaAreaId = objActivityDet.getUseaAreaId();
										//out.print( "getUseaAreaId" + getUseaAreaId);
										ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
										if(areaDetails!=null && areaDetails.size()!=0){
										Iterator areaIt = areaDetails.iterator();
										while(areaIt.hasNext()){
										String[] areaDet =(String[])areaIt.next();
										String areaId = areaDet[0];
										//out.print("areaId" +areaId);
										 areaName = areaDet[2];
										// out.print("areaName" +areaName);
										if(areaId.equals(getUseaAreaId)){
										finalArea = areaName;
										//out.print("finalArea" + finalArea);
									}
							  }
							}
							  %> 
							  
							  
							   <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="hlcArea" value=<%=finalArea%> readonly="true" />
                                            </div>
                                        </div>

                                    </div>
                                </div>  
								
								
								 <%
								  String activityDate ="";
								  if(activityDate!=null){
								  activityDate = sdf.format(objActivityDet.getActivityDate());
								  }
								 %> 
								 
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date(s)to be held:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" name="dateHeld" value=<%=activityDate%> readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="form-control" value="<%=objActivityDet.getLocation()%>" name="location" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="from-control" name="state" value="<%=objActivityDet.getState()%>" readonly="true"/>
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group col-md-offset-2'>
								<a href="javascript:MM_openBrWindow('terms-conditions.html','terms','width=520,height=565')" class="linkFour">View Terms &amp; Conditions</a>
								</div>
								
								<div class='form-group col-md-offset-2'>
									<input type="checkbox" name="checkbox3" value="checkbox" id="chkAccept"/>  
									I Agree to the terms and conditions. <span id="span_astriesk">*</span>
								</div>
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Participant&#8217;s Details:</label>
								</div>
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="memberId"  value="<%=email_id%>" id="txtemail" readonly="true"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" name="participantName" value="<%=first_name%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" class="form-control" name="middleName" value="<%=middle_name%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="lastName" value="<%=last_name%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="address" value="<%=address1%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" name="address2" value="<%=address2%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         		<input type="text" class="form-control" name="country" value="<%=country%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="form-control" name="participantState" value="<%=state%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="form-control" name="city" value="<%=city%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip Code:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="zipcode" value="<%=zip%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="form-control" name="phone" value="<%=phone_no%>" readonly="true" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="fax" value="<%=fax_no%>" readonly="true" />	
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Other Information:</label>
								</div>
								
								
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Are You a member?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="radio" name="isUseaMember" value="yes" id="radioyes" onclick="isRadio();"/>  Yes 
							
							  					<input type="radio" name="isUseaMember" value="no" id="radioyes" checked="checked" onclick="isRadio();" /> No
							 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If yes, Your Membership Number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="memberShipNo" id="memberShipNo" disabled="disabled" onblur="HLCMemberDetails();"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of horses i will be riding during activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input type="text" class="form-control"  name="horseNo" id="horseNo" maxlength="8" />
												<span id="span_astriesk">*</span>	
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Level now riding:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          	<select name="ridingLevel" id="level_sel" class="selectboxOne">
													<option selected="selected" value="">Select Levels</option>
												<%
												Vector levels = (Vector)request.getAttribute("AllLevels");
												if(levels.size()!=0 && levels !=null){
													Enumeration enum = levels.elements();
													while(enum.hasMoreElements()){
														String[] levelNames = (String[])enum.nextElement();
														String levelid = (String)levelNames[0];
														String levelType = (String)levelNames[1];
														String levelCode = (String)levelNames[2];
														
												%>
															
											   <option value="<%=levelid%>"><%=levelType%> - <%=levelCode%></option>
												<%
												  }
												}
												  %>
												  </select>
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
                                        <button class='btn-lg btn-danger' value="Cancel" type="button" onclick="javascript:history.back(-1);">Cancel</button>
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
