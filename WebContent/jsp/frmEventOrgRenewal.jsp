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
<%@ page import="com.hlcmro.util.*"%>
<%@ page import ="com.hlcmro.util.HLCEventRequestVO"%>
<%@ page import="com.hlccommon.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmEvntOrgRenewal.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script language="JavaScript" src="js/calendar2.js" type="text/javascript"></script>

<script language="JavaScript">
var arHttpRequest;

function HLCMemberDetails(){

if(document.frmEvntOrgRenewal.managerUseaMemberId.value!="" && document.frmEvntOrgRenewal.managerUseaMemberId.value.indexOf(" ")!=0)
	{
	    var memberid=document.frmEvntOrgRenewal.managerUseaMemberId.value;
        var url = "./RiderInfoAjaxAction.html?memberid="+memberid; 
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
   }

    function membStatus(){ 
   
        if (arHttpRequest.readyState == 4){ 
            if(arHttpRequest.status == 200) { 
                //get the XML send by the servlet 
                 var arnameXML = arHttpRequest.responseXML.getElementsByTagName("memberstatus")[0]; 
                 var arnameText = arnameXML.childNodes[0].nodeValue; 
		         if(arnameText=="false"){    
                alert("Member Id Doesn't Exists!"); 
				document.frmEvntOrgRenewal.managerUseaMemberId.value="";
				document.frmEvntOrgRenewal.managerUseaMemberId.focus();
                return false;
                }    
            } 
            else { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 

</script>
<%! String dateCheck(java.util.Date fieldName){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String detValue = "";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
    }
    %>
<%
ArrayList listContact = (ArrayList) session.getAttribute("dynamicOrgDetails");
String memberId =(String)session.getAttribute("memberId");
if(memberId==null){
memberId="Not exists";
}
	
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
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="amtFocus()">

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
                            <h2>Meetings:Event Registration USEF Endorsed Competition</h2>
                        </div>
                      
					<!--==============================Form Title=================================-->
					  <div class='panel-body'>
				<!-- CONTENTS START HERE -->
		<%
		ArrayList priceDets = (ArrayList) request.getAttribute("priceDetails");
		System.out.println("priceDets in jsp"+priceDets.size());
		String omnitempDuePri="";			
			String omitempAftDuePri="";
			String tempDuePri ="";
			String tempAftDuePri ="";
			String DueDt ="";
			String GrcDt ="";
			String priTypeName="";
		if(priceDets!=null && priceDets.size()!=0){
		 Iterator itr = priceDets.iterator();
			//int i=0;
		%>
	
  		<p>All Competitions must complete Section One (page 1).
		Endorsed Competitions/Levels that are Recognized/USEF Endorsed
		events offering Training, Novice, Beginner Novice and Tests) must
		complete sections Two and Three (pages 2 & 3).</p>

		<%
		while(itr.hasNext()){
			String[] priList = (String[])itr.next();
			String priIssId = priList[0];
			String priIssName = priList[1];
			 DueDt = priList[2];
			 GrcDt = priList[3];
			String priId = priList[4];
			String priDueDtPrice = priList[5];
			String priAftDueDtPrice = priList[6];
			 priTypeName = priList[7];					
			%>						
			<%			
			if(priTypeName.equalsIgnoreCase("Event Registration Fees")){
			System.out.println("priTypeName in jsp 111111" + priTypeName);			
			tempDuePri = priDueDtPrice;
			System.out.println("tempDuePri in jsp" + tempDuePri); 
			tempAftDuePri = priAftDueDtPrice;			 
			System.out.println("tempAftDuePri in jsp" + tempAftDuePri);
					
			%>
			<p>By the following date - note fee structure below:</p>
		<%=DueDt%> (grace period to avoid the late fee is thru <%=GrcDt%>)
		<p><%=priIssName%> Events. </p>		
			<p>Event Registration Fee:($<%=tempDuePri%>) per event - postmark/fax/email prior or on <%=DueDt%>	</p>
			<%
			}else if(priTypeName.equalsIgnoreCase("Omnibus Listing Fees")){
			System.out.println("priTypeName in jsp 222222" + priTypeName);
			omnitempDuePri = priDueDtPrice;
			System.out.println("omnitempDuePri in jsp" + omnitempDuePri); 
			omitempAftDuePri = priAftDueDtPrice;
			System.out.println("omitempAftDuePri in jsp" + omitempAftDuePri); 						
			%>
			<br />	
            Omnibus Listing Fee:($<%=omnitempDuePri%>) per event - postmark/fax/email prior or on <%=DueDt%>.	
			<%		
			}				
			%>
					
			<%
			//i++;
			}
			float omniDue=0;float omniAftDue=0;
			float eveRegDue=Float.parseFloat(tempDuePri);
			if(omnitempDuePri.equals(""))
				 omniDue=0;
			else 
			  omniDue =Float.parseFloat(omnitempDuePri);
			float totalFees= eveRegDue+omniDue;
			System.out.println("totalFees &&& in jsp" + totalFees);	
			float eveRegAftDue=Float.parseFloat(tempAftDuePri);
			if(omitempAftDuePri.equals(""))
			    omniAftDue=0;
			else
               omniAftDue=Float.parseFloat(omitempAftDuePri);
			float lateFees= eveRegAftDue+omniAftDue;	
			System.out.println("lateFees &&& in jsp" + lateFees);				
			float dddd= totalFees +lateFees;
			System.out.println("dddd &&& in jsp" + dddd);		
			%>			
			<div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fees:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <i class="fa fa-dollar"></i><label class="control-label"><%=totalFees%></label>
											 </div>
										</div>
								 </div>
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Late Fees:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <i class="fa fa-dollar"></i><label class="control-label"><%=lateFees%> per event - postmark/fax/email after <%=GrcDt%></label>
											 </div>
										</div>
								 </div>
							</div>	 

			
												<%								
												}		
												%>
			
									<%
									String sessionInvoiceId = "1";
										session.setAttribute("sessionInvoiceId", sessionInvoiceId);	
										String eventId = (String) request.getAttribute("eventId");
										
										//eventId
										if(eventId==null){
											response.sendRedirect("index.jsp");
										}
										
									%>
	
<form  class='form-horizontal' role='form' name="frmEvntOrgRenewal"  method="post"  action="EventOrgRenewal.html" onSubmit="return onEvnRenCheck();" >
<input type="hidden" name="eventProcess" value="insert">
<input type="hidden" name="eventId" value="<%=eventId%>" />
<p>Fields mark with asterisk(<span style="color:#FF0000">*</span>) are required.</p>	
<p>Section One:	</p>
              <div class="form-group">
              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Competition:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <input type="text" name="competitionName" id="competitionName"  class="form-control" value="<%=event_title%>" readonly="readonly"/>
											  
											 </div>
										</div>
									</div>	
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location of Competition:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <label class="control-label"><%=competition_location%></label>
											 </div>
										</div>
								 </div>			
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <label class="control-label">USA</label>
											 </div>
										</div>
								 </div>			
				 
			
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
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
										<%}}}%>
										     </div>
										</div>
								 </div>	
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <label class="control-label"><%=competition_city%></label>
											 </div>
										</div>
								 </div>		
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <label class="control-label"><%=competition_zip%></label>
											 </div>
										</div>
								 </div>	 	 		
				             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Competition:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <input type="text" name="competitionDate" id="competitionDate" readonly="true" class="form-control"  value="<%=dateCheck(eventBeginDate)%>"/>
											 </div>
										</div>
								 </div>	 	
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Championship:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <label class="control-label"><%=areaStr%></label>
											 </div>
										</div>
								 </div>	 	 	
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organiser Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											  <input type="text"  readonly="true"  name="rName" value="<%=first_name%>" size="20" />
											 </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>No.:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											  <input type="text" class="form-control" name="hlcNo"   value="<%=(String)session.getAttribute("memberId")%>" readonly="true" />
											 </div>
										</div>
								 </div>	 	 
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Street:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											 <input type="text"  class="form-control" value="<%=address1%>"  readonly="true" name=rStreet  />
											 </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											<input type="text" class="form-control" value="<%=city%>" readonly="true" name=rCity  />
											 </div>
										</div>
								 </div>	 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											<input type="text" class="form-control" value="<%=state%>" readonly="true" name=rState  />
											 </div>
										</div>
								 </div>		
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input type="text" class="form-control" value="<%=country%>" readonly="true" name=rState  />											                                              </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input type="text" class="form-control" readonly="true" value="<%=zip%>" name=rZipcode  />											                                              </div>
										</div>
								 </div>	 		
				   				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input type="text" class="form-control" value="<%=phone_no%>" readonly="true" name=rPhone />											                                              </div>
										</div>
								 </div>	 	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Cell:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input type="text" class="form-control" value="<%=mobile_no%>" readonly="true" name=rCell  />											                                              </div>
										</div>
								 </div>	 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input type="text" class="form-control"value="<%=email_id%>" readonly="true" name=rEmail  />											                                              </div>
										</div>
								 </div>	 		
				   				
				   	  <p>Section Two:	</p>
				<p>USEF defines Competition Management as follows: Shall be the party who enters
				 into the agreement with USEF and is therefore financially and otherwise responsible
				 (i.e., compliance with all USEF rules, policies and procedures) to USEF for the
				 licensed competition.	</p>
				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Competition Management:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input type="text" name="comManagementName" id="comManagementName" class="form-control"  />
											     <span id="span_astriesk">*</span>										                                            
												   </div>
										</div>
								 </div>	 
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address of principal place of business:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                              <input type="text" name="comManagementAddress" id="comManagementAddress" class="form-control"  />
											     <span id="span_astriesk">*</span>										                                            
												   </div>
										</div>
								 </div>	 
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
																					
										<select name="comManagementCountry" id="comManagementCountry" class="form-control" style="width:200px" width="200"  
										onChange="FillState(document.frmEvntOrgRenewal.comManagementCountry, document.frmEvntOrgRenewal.comManagementState, '')">
																				</select>
											 
											     <span id="span_astriesk">*</span>	
												 </div>
										</div>
								 </div>	 	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 								                                            
							
													<select name="comManagementState" id="comManagementState" class="form-control" style="width:200px" width="200">
													</select>
										            <span id="span_astriesk">*</span>	
												 </div>
										</div>
								 </div>	 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                              <input type="text" name="comManagementCity" id="comManagementCity" class="form-control"  />
											     <span id="span_astriesk">*</span>										                                            
												   </div>
										</div>
								 </div>	 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                              <input type="text" name="comManagementZip"  id="comManagementZip"  class="form-control"  />
											     <span id="span_astriesk">*</span>										                                            
												   </div>
										</div>
								 </div>
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone Number:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                              <input type="text" name="comManagementPhone" id="comManagementPhone" class="form-control"  />
											     <span id="span_astriesk">*</span>										                                            
												   </div>
										</div>
								 </div>	 	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax Number:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                             <input type="text" name="comManagementFax" id="comManagementFax" class="form-control"  />
											    									                                            
												   </div>
										</div>
								 </div>	 	
								 <p>Competition Manager/Organizer Information</p>
			                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Competition Manager/Organizer Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                            <input type="text" name="managerName" id="managerName" class="form-control"  />
											    	 <span id="span_astriesk">*</span>										                                            
												   </div>
										</div>
								 </div>	 	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check box if USEF member:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                              <input type="checkbox" name="USEFMgrCheckValue" id="USEFMgrCheckValue" size="15" class="threepxfix" onclick="enabDisab('USEFMgrCheckValue','managerUsefMemberId');"/>
											   </div>
										</div>
								 </div>	 	
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>USEF Membership No.:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                              <input type="text" name="managerUsefMemberId" id="managerUsefMemberId"  class="form-control" disabled="disabled"  />
											   </div>
										</div>
								 </div>	 	 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership No.:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                             <input type="text" name="managerUseaMemberId"  id="managerUseaMemberId"  class="form-control"   onblur="MemberDetails();"/>
											 <span id="span_astriesk">*</span>	
											   </div>
										</div>
								 </div>	 	 
			<p>Member Secretary Information **</p>
			<p>** A Secretary's information is only required if neither the Manager/Organizer nor Secretary is a USEF Senior Member.</p>
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Secretary Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                             <input type="text" name="secretaryName"  id="secretaryName"  class="form-control"  />
											 <span id="span_astriesk">*</span>	
											   </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check box if USEF member:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
											<div class='form-group internal'> 
													 <input type="checkbox" id="USEFSecretaryCheckValue" name="USEFSecretaryCheckValue" size="15" class="threepxfix" onclick="enabDisab('USEFSecretaryCheckValue','secretaryUsefMemberId');"/>
													  </div>
										</div>
								 </div>	
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>USEF Membership No.:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
											<div class='form-group internal'> 
													<input type="text" name="secretaryUsefMemberId" id="secretaryUsefMemberId" class="form-control" disabled="disabled"  />
													  </div>
										</div>
								 </div>	
		<p>Payments/General Information	</p>
	<%
	    int feeAmount = 400;
		Date first = new Date("05/10/2006");
		Date second = new Date();
        long msPerDay = 1000 * 60 * 60 * 24;
        long diff =
            (first.getTime() / msPerDay) - (second.getTime() / msPerDay);
        Long convertLong = new Long(diff);
        //return convertLong.intValue();
      
	  int datDiff = convertLong.intValue();
	   //out.println(datDiff);
	  if(datDiff <= 1){
	  	feeAmount = 525;
	  }
	 String amt=(String)request.getAttribute("price"); 
	 
	%> 
	                            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i> <input  type="text" name="amount" id="amount" class="form-control" readonly="true" value="<%=amt%>" />
											 <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>
								
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
							
											  <input type="radio" size="10" name="r11"  value="check" onclick="checkClear(),switchDiv('checkEncl'), showHideRadio('r11','chargeCard','check');" > Check enclosed.											
											    <input type="radio" size="10" name="r11" value="card" checked="checked" onclick="cardClear(),switchDiv('chargeCard'), showHideRadio('r11','checkEncl','card');" > Please charge my card.			 
												</div>
											</div>
										</div>		
<p>Check Details:</p>						

							<p>If paying by check, please mail your payment to:  </p>
							
							<p>Event Organizer Registration</p>
							<p>525 Old Waterford Road, NW</p>
						     <p>Leesburg, VA 20176</p>																		
						<p>Note: Your registration status will be pending until check is processed. </p>
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="checkNumber"  id="checkNumber" class="form-control"  />
											 <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>
								
							
							                                        <%
																		    String chkDat2="";
																		
																			java.util.Calendar c6 = java.util.Calendar.getInstance();
																			int dyChk = c6.get(Calendar.DATE);
																			int mnth = c6.get(Calendar.MONTH);
																			
																			int mnthChk = mnth+1;
																			int yrChk = c6.get(Calendar.YEAR);
																			
																			if(mnthChk<10)
																			{
																				chkDat2 = "0"+mnthChk+"/"+dyChk+"/"+yrChk;
																			}
																			else
																			{
																				
																				chkDat2 = mnthChk+"/"+dyChk+"/"+yrChk;
																			}
							                                        %>
										 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="checkDate"  id="checkDate" value="<%=chkDat2%>" readonly="true" class="form-control"  />
											   <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
											 <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div		
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="bankName" id="bankName" class="form-control"  />
											 <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div		
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Check:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input name="nameOnchk" id="nameOnchk" type="text" class="form-control"   maxlength="25" />
											 <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>
					<p> Card Details:</p>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>					
											<select name="ccType" id="ccType" class="form-control">
											  <option value="" selected="selected" >Select One</option>
											  <option value="Visa">Visa</option>
											  <option value="MasterCard">Master Card</option>
											  <option value="AmEx">AmEx</option>
											</select>
								            <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
											<input type="text" name="ccNumber" id="ccNumber" class="form-control"  />
								              <span id="span_astriesk">*</span>	
											</div>
										</div>
									</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV No:</label>
	                                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
											<input type="text" name="ccCvvid" id="ccCvvid" class="form-control"/>
								             	
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
						<button class='btn-lg btn-primary'  type="submit" name="submit" value="Register Now">Register Now</button>
					</div>
				</div>			
									
		
			
	<!--
	<div class="row">
		<span class="label">Comments:</span>
		<span class="formX"><textarea cols="25" rows="8">Go ahead - write something...</textarea></span>
	</div>
	-->
	
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
<script language="javascript">
	var cal2 = new calendar2(document.forms['frmEvntOrgRenewal'].elements['checkDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
	
</script>
<script>
	FillCountry(document.frmEvntOrgRenewal.competitionCountry, document.frmEvntOrgRenewal.competitionState, '---Select---');
	FillState(document.frmEvntOrgRenewal.competitionCountry, document.frmEvntOrgRenewal.competitionState, '');
</script>
<script>
	FillCountry(document.frmEvntOrgRenewal.comManagementCountry, document.frmEvntOrgRenewal.comManagementState, '---Select---');
	FillState(document.frmEvntOrgRenewal.comManagementCountry, document.frmEvntOrgRenewal.comManagementState, '');
</script>
</html>
