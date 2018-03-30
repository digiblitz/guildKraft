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
<%@ page import="java.text.*"%>
<%@ page import="java.math.*"%>
<%@ page import="com.hlccommon.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/calendar2.js" type="text/javascript"></script>

<script type="text/javascript">
function dateValidate(){

if(document.frmMeeEduActRecap.reportDate.value==""){
alert("Please select reportDate");
return false;
}
if(!(document.frmMeeEduActRecap.reportDate.value=="")){
	
	var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	
	if(nowDate<10){
		nowDate="0"+nowDate;
	}

	if(nowMonth<10){
		nowMonth="0"+nowMonth;
	}

	if(!(document.frmMeeEduActRecap.reportDate.value=="")){
		strdate=document.frmMeeEduActRecap.reportDate.value;
		
		mm = Number(strdate.substring(0,2));
		dd = Number(strdate.substring(3,5));
		yyyy=(strdate.substring(6,document.frmMeeEduActRecap.reportDate.value.length));
		yyyy1=(Number(yyyy.length));

			if(yyyy<nowYear){
				alert("Enter Valid report Date.");
				document.frmMeeEduActRecap.reportDate.focus();
				return false;
			}

			if((yyyy==nowYear)&&(mm<nowMonth)){
				alert("Enter Valid report Date.");
				document.frmMeeEduActRecap.reportDate.focus();
				return false;
			}

			if (mm>12){
				alert("Enter Valid report Date.");
				document.frmMeeEduActRecap.reportDate.focus();
				return false;
			}

			if((dd<nowDate)&&(mm==nowMonth)){
				alert("Enter Valid report Date.");
				document.frmMeeEduActRecap.reportDate.focus();
				return false;
			}

			else if(dd>31){
				alert("Enter Valid report Date.");
				document.frmMeeEduActRecap.reportDate.focus();
				return false;
			}
		}
	}

	if(document.frmMeeEduActRecap.closeDate.value==""){
		alert("Please Select Close Date.");
		document.frmMeeEduActRecap.closeDate.focus();
		return false;
	}

	if(!(document.frmMeeEduActRecap.closeDate.value=="")){
		strdate1=document.frmMeeEduActRecap.closeDate.value;
		mm1 = Number(strdate1.substring(0,2));
		dd1 = Number(strdate1.substring(3,5));
		yyy=(strdate1.substring(6,document.frmMeeEduActRecap.closeDate.value.length));
		yyy1=(Number(yyy.length));

			if(yyy<nowYear){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}

			if((yyy1==nowYear)&&(mm1<nowMonth)){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}

			if (mm1>12){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}

			if((dd1<nowDate)&&(yyy<nowYear)&&(mm1==nowMonth)){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}

			else if(dd1>31){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}
		}


	if(!(document.frmMeeEduActRecap.closeDate.value=="")){
		
		strdate2=document.frmMeeEduActRecap.closeDate.value;
		mm2 = Number(strdate2.substring(0,2));
		dd2 = Number(strdate2.substring(3,5));
		yy = Number(strdate2.substring(6,document.frmMeeEduActRecap.closeDate.value.length));
	
		strdate3=document.frmMeeEduActRecap.reportDate.value;
		mm3 = Number(strdate3.substring(0,2));
		dd3 = Number(strdate3.substring(3,5));
		y = Number(strdate3.substring(6,document.frmMeeEduActRecap.reportDate.value.length));
		
			if(yy<y){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}
			
			if((yy==y)&&(mm2<mm3)){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}

			if((mm2==mm3)&&(yy<y)&&(dd2<dd3)){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}
			if((mm2==mm3)&&(yy==y)&&(dd2<dd3)){
				alert("Enter Valid Close Date.");
				document.frmMeeEduActRecap.closeDate.focus();
				return false;
			}
		}


return true;

}
</script>

</head>
<%
HLCOraganizerRecapVO objOrgRecap = (HLCOraganizerRecapVO)session.getAttribute("DispOrgRecapDetails");
String memeberId = (String)session.getAttribute("memberId");
if(memeberId==null)
memeberId = "NA";

HLCActivityOrganizerVO objActivityDet = (HLCActivityOrganizerVO)session.getAttribute("ActivityOrganizerVODet");
String recapId = objOrgRecap.getRecapId();
ArrayList listContact = (ArrayList)session.getAttribute("dynamicOrgDetails");
	
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
                            <h2>Meetings: Educational Activity Recap Approval</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>The details you are viewing is of the Educational Activity Recap placed by the Organizer whose details are seen below.
				
					Please fill-in the required dates and submit it to Approve the application.</p>
							
						<!--==============================Form Description=================================-->

  
					
						<form  class='form-horizontal' role='form' name="frmMeeEduActRecap" onsubmit="return dateValidate();" action="recap.html">
						<input type="hidden" name="recapProcess" value="approval"/>
						 
						<input type="hidden" name="orgRecapId" value="<%=recapId%>" />
							
						<div class='form-group'>
                                    <label class='control-label'> Basic Information:</label>
								</div>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name Of Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objActivityDet.getActivityName()%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
						
						  <%
						  SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
						  SimpleDateFormat sdf1 = new SimpleDateFormat("MM-dd-yyyy");
						  String matDate = "";
						  if(objActivityDet.getActivityDate()!=null){
							matDate = sdf1.format(objActivityDet.getActivityDate());
						  }
						  %>
						 
						  <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date(s)held::</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=matDate%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location Of Activity :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objActivityDet.getLocation()%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>

						 
						   <%
						 				String finalArea ="";
										String areaName="";
										String getUseaAreaId = objActivityDet.getUseaAreaId();
										ArrayList areaDetails = (ArrayList)session.getAttribute("DispAreaDetails");
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
								
								<div class='form-group'>
                                    <label class='control-label'> Organizer Information:</label>
								</div>
									
									<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Memberl ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objActivityDet.getActivityOrganizerId()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=first_name%>&nbsp;<%=middle_name%> &nbsp; <%=last_name%></label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=city%></label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=country%></label>
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=email_id%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>                                                                                
								
								
								<div class='form-group'>
                                    <label class='control-label'>Activity Information:</label>
								</div>
						  	
							
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number Of Riders Participating:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfRiders()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of Instructors:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfInstructors()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of Current members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfCurrentMembers()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of New members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfNewMembers()%></label>
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Number of Renewing members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfRenewingMembers()%></label>
                                            </div>
                                        </div>

                                    </div>
								</div>
							
						  		<div class='form-group'>
                                    <label class='control-label'> New User Member Information:</label>
								</div>
							
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Individual Full members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfFullMembers()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Junior members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfJuniorMembers()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non-competing members:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getNoOfNonCompetingMembers()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'>$<%=objOrgRecap.getTotalAmount()%></label>
                                            </div>
                                        </div>

                                    </div>
									
								</div>
							
							
							<div class='form-group'>
                                    <label class='control-label'>Comments And Suggestions:</label>
								</div>
						   
						  	
							<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments about your Activity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getComments()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>May we publish all or part of your comments in Eventing USA?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=String.valueOf(objOrgRecap.isPublishComments())%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suggestions for Educational Activities and/or forms, procedures improvement :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=objOrgRecap.getSuggestions()%></label>
                                            </div>
                                        </div>

                                    </div>
									
								</div>
						  
						 
						 
						 		<div class='form-group'>
                                    <label class='control-label'>Approval Status </label>
								</div>
						  
								<%
								  String requestStatus = "";
								  if(objOrgRecap.getRequestStatus()!=null){
										requestStatus = objOrgRecap.getRequestStatus();
								  }
										java.util.Date reportDate = objOrgRecap.getActivityReportDate();
										java.util.Date closeDate = objOrgRecap.getCloseDate();
										
										 
								  %>
						  
						  <div class='form-group'>
						  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=requestStatus%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <%
												if(reportDate==null){
												%>
												<input type="text" class="form-control" readonly="true" name="reportDate" id="reportDate" />
												<%									
												}
												else{
												%>
												<input type="text" class="form-control" readonly="true" name="reportDate" id="reportDate" value="<%=sdf.format(reportDate)%>" />
												<%
												}
											%>
											<a href="javascript:cal1.popup();">
											<i id="calendar1" class="fa fa-calendar"></i>
											<span id="span_astriesk">*</span>
											
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Close Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <%if(closeDate==null){%>
													<input type="text" class="form-control" readonly="true" name="closeDate" id="closeDate"  />
													
													<%}else{%>
													
													<input type="text" class="form-control" readonly="true" name="closeDate" id="closeDate" value="<%=sdf.format(closeDate)%>" />	
													
													<%}%>
													
													<a href="javascript:cal2.popup();">
													<i id="calendar1" class="fa fa-calendar"></i>
													<span id="span_astriesk">*</span>
					 
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								
								
						  
						  
							<div class='form-group'>
								<div class='col-md-8 col-md-offset-4'>
								
								<%if(requestStatus.equalsIgnoreCase("Approved")){%>
								
										<button type="submit" value="Update" class="btn-lg btn-primary" >Update</button>
                                   
								<%}else{%>
						    		
									<button type="submit" value="Approve" class="btn-lg btn-primary" >Approve</button>
								
								<%}%>
						  			
									<button name="button" type="button" class="btn-lg btn-danger" onclick="javascript:history.back(-1);" value="Cancel" >Cancel</button>
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
			
			
<script>
	var cal1 = new calendar2(document.forms['frmMeeEduActRecap'].elements['reportDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar2(document.forms['frmMeeEduActRecap'].elements['closeDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
</script>


			
</body>

</html>
                                                                             
						
						 
						  
						 
						  
						 
						  
						  
						  
						
						  
						  
						  
						 
						   
						 
						 
							
						  
						    
						
						  
						
	  
	  
	  
	  
	 

