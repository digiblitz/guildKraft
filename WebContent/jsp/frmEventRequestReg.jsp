<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


<script  src="js/ts_picker.js"></script>
<script src="js/datetimepicker_css.js"></script>
<script src="js/frmEventRequestReg.js" type="text/javascript"></script>
<script>
var arHttpRequest1;
function areaDetials(){
	
	if(document.frmEventRequestReg.zipCode.value!="" && document.frmEventRequestReg.zipCode.value.indexOf(" ")!=0)
	{
    var zip=document.frmEventRequestReg.zipCode.value;
	var areaId = document.frmEventRequestReg.selState.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
            
        var url = "annualAjax.html?method=areaZipValidation&stateId="+areaId+"&zip="+zip; 

        if (window.ActiveXObject) 
        { 
            arHttpRequest1 = new ActiveXObject("Microsoft.XMLHTTP"); 
           
        } 
        else if (window.XMLHttpRequest) 
        { 
            arHttpRequest1 = new XMLHttpRequest(); 
        } 
     
        arHttpRequest1.open("POST", url, true); 
        
        arHttpRequest1.onreadystatechange = function() {validStatus(); } ; 
        arHttpRequest1.send(null); 
   	} 

}
function HLCMemberDetails()
{
	
	if(document.frmEventRequestReg.orgnaizerId.value!="" && document.frmEventRequestReg.orgnaizerId.value.indexOf(" ")!=0)
	{
    var memberid=document.frmEventRequestReg.orgnaizerId.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
            
        var url = "./RiderInfoAjaxAction.html?memberid="+memberid; 

        if (window.ActiveXObject) 
        { 
            arHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
           
        } 
        else if (window.XMLHttpRequest) 
        { 
            arHttpRequest = new XMLHttpRequest(); 
        } 
     
        arHttpRequest.open("POST", url, true); 
        
        arHttpRequest.onreadystatechange = function() {membStatus(); } ; 
        arHttpRequest.send(null); 
   } 
	}
function Trim(sString) 
{
	while (sString.substring(0,1) == ' '){
	sString = sString.substring(1, sString.length);
	}
	while (sString.substring(sString.length-1, sString.length) == ' '){
	sString = sString.substring(0,sString.length-1);
	}
return sString;
}
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}

function myvalidate(){
	if(document.frmEventRequestReg.eventTitle.value==""){
	alert(" Event Title cannot be empty");
	document.frmEventRequestReg.eventTitle.focus();
	return false; 
	}
	if(document.frmEventRequestReg.eventTitle.value.indexOf(' ')==0){
	alert("Enter Event Title ");
	document.frmEventRequestReg.eventTitle.focus();
	return false;
	}	
	if(Dospace(document.frmEventRequestReg.eventTitle.value)){
	alert("Enter Valid Event Title ");
	document.frmEventRequestReg.eventTitle.focus();
	return false;
	}
	if(document.frmEventRequestReg.eventTitle.value.length>255){
	alert("Enter within 255 characters for Event Title" );
	document.frmEventRequestReg.eventTitle.focus();
	return false; 
	}
	if(document.frmEventRequestReg.selState.selectedIndex ==0){
	alert("Select any State");
	document.frmEventRequestReg.selState.focus();
	return false;
	}
	if(document.frmEventRequestReg.txtCity.value==""){
	alert("City can not be empty");
	document.frmEventRequestReg.txtCity.focus();
	return false;
	}
	if(document.frmEventRequestReg.txtCity.value.indexOf(' ')==0){
	alert("Enter City ");
	document.frmEventRequestReg.txtCity.focus();
	return false;
	}	
	if(Dospace(document.frmEventRequestReg.txtCity.value)){
	alert("Enter Valid City ");
	document.frmEventRequestReg.txtCity.focus();
	return false;
	}
	if(Trim(document.frmEventRequestReg.zipCode.value)==""){
	alert("Enter ZipCode");
	document.frmEventRequestReg.zipCode.focus();
	return false;
	}
	if(document.frmEventRequestReg.txtLocation.value==""){
	alert("Location can not be empty");
	document.frmEventRequestReg.txtLocation.focus();
	return false;
	}
	if(document.frmEventRequestReg.txtLocation.value.indexOf(' ')==0){
	alert("Enter Location");
	document.frmEventRequestReg.txtLocation.focus();
	return false;
	}	
	if(Dospace(document.frmEventRequestReg.txtLocation.value)){
	alert("Enter Valid Location");
	document.frmEventRequestReg.txtLocation.focus();
	return false;
	}
	
	if(document.frmEventRequestReg.beginDate.value==""){
	alert("Select Begin Date of the Event");
	document.frmEventRequestReg.beginDate.focus();
	return false;
	}
	var retStr = document.frmEventRequestReg.beginDate.value;
	var currTime = new Date();
	var startTime = new Date();
	retMonth = retStr.substring(0,2);
	retDay = retStr.substring(3,5);
	retYear = retStr.substring(6,retStr.length);
	startTime.setMonth(retMonth-1);
	startTime.setYear(retYear);
	startTime.setDate(retDay);
	if(Number(currTime.getTime()-startTime.getTime())>0){
	alert("Select a future Date for Event Begin Date");
	document.frmEventRequestReg.beginDate.focus();
	return false;
	}
	if(document.frmEventRequestReg.endDate.value==""){
	alert("Select End Date of the Event");
	document.frmEventRequestReg.endDate.focus();
	return false;
	}
	
	var endStr = document.frmEventRequestReg.endDate.value;
	var endTime = new Date();
	endMonth = endStr.substring(0,2);
	endDay = endStr.substring(3,5);
	endYear = endStr.substring(6,retStr.length);
	endTime.setMonth(endMonth-1);
	endTime.setYear(endYear);
	endTime.setDate(endDay);
	if(Number(endTime.getTime()-startTime.getTime())<0){
	alert("Select a future Date for Event End Date");
	document.frmEventRequestReg.beginDate.focus();
	return false;
	}
	
	if(endStr.substring(6,10)!=retYear){
	alert("Enter valid End Date");
	document.frmEventRequestReg.endDate.focus();
	return false;
}
	if(Trim(document.frmEventRequestReg.orgnaizerId.value)==""){
	alert("Enter an Organizer ID");
	document.frmEventRequestReg.orgnaizerId.focus();
	return false;
	}	
	
	/*if(document.frmEventRequestReg.eventType.selectedIndex ==0){
	alert("Select any of the Event Type for the Event");
	document.frmEventRequestReg.eventType.focus();
	return false;
	var retTime = new Date();
	retMonth = retStr.substring(
	retTime.setMonth(retMonth-1);
	retTime.setYear(retYear);
	retTime.setDate(retDay);
	var depDiffTime = depTime.getTime();
	var retDiffTime = retTime.getTime();
	var nowDiffTime = new Date().getTime();
	var diff = Number(retDiffTime - depDiffTime);
	var pastDiff = Number(depDiffTime - nowDiffTime);

	}*/
	var levelCount = document.frmEventRequestReg.levelCount.value;
	var checkSelected = true;
	for (i = 1;  i <= Number(levelCount);i++){
	
	  if (document.getElementById('eventLevels'+i).checked == true){
		checkSelected = false;
	  }
	}
	if (checkSelected){
	  alert("Please select any of the Event Levels");
	  return (false);
	}	
	
return true;
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
                            <h2>Meetings:Request for Event Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmEventRequestReg" id="frmEventRequestReg" action="./OrganizerHLCEventReg.html" method="post" onsubmit="return myvalidate();">
							
                               <input type="hidden" name="process" value="reqInsert">

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="eventTitle" type="text" id="eventTitle" class="form-control" />
												<span id="span_astriesk">*</span>
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
                                              <label class='control-label'>USA</label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="selState" id="setState" class="form-control" onchange="areaDetials();">
													<option selected="selected" value="">Select One</option>										
													<%
													ArrayList stateDetails = (ArrayList)request.getAttribute("stateDetails");
													if(stateDetails!=null && stateDetails.size()!=0){
													Iterator itr = stateDetails.iterator();
							
													while(itr.hasNext()){
													String[] stateDet = (String[])itr.next();
													String stateId = stateDet[0];
													String stateName = stateDet[1];
													String stateCode = stateDet[2];
													
													%>
													
													<option value="<%=stateId%>"><%=stateName%></option>
												 <%
										  }
										}
										  %>
										</select>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="txtCity" id="txtCity" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>ZipCode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="zipCode" type="text" id="zipCode" class="form-control"  onblur="areaDetials();"/>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="areaTxt" id="areaTxt" readonly="true" class="form-control" />
					 							<input type="hidden" name="areaId" id="areaId" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="txtLocation" id="txtLocation" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Begin Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="dat" type="text" readonly="true" class="form-control" id="dat" />
												<a onclick="javascript:NewCssCal('dat')" href="javascript:show_calendar('document.frmEventRequestReg.beginDate', document.frmEventRequestReg.beginDate.value);">
												<i id="calendar1" class="fa fa-calendar"></i></a>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>End date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="date" type="text" readonly="true" class="form-control" id="date" />
												<a onclick="javascript:NewCssCal('date')" href="javascript:show_calendar('document.frmEventRequestReg.endDate', document.frmEventRequestReg.endDate.value);">
												<i id="calendar1" class="fa fa-calendar"></i></a>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="orgnaizerId" type="text" id="orgnaizerId" class="form-control"  onblur="HLCMemberDetails();"/>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="name" type="text" id="name" class="form-control" readonly="true"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="phone" type="text" id="phone" class="form-control" readonly="true"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="address" type="text" id="address" class="form-control"  readonly="true"/>
                                            </div>
                                        </div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="city" type="text" id="city" class="form-control" readonly="true"/>
                                            </div>
                                        </div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="fax" type="text" id="fax" class="form-control"  readonly="true"/>
                                            </div>
                                        </div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="email" type="text" id="email" class="form-control" readonly="true"/>
                                            </div>
                                        </div>
									</div>
					
                                </div>
								
								<div class='form-group'>
									
									<label class='control-label label1 col-md-2 col-md-offset-2' for='id_title'>Event Types &amp; Event Levels :<span id="span_astriesk">*</span></label>
                                   
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
										String eventTypeName = eventDet[1];
									%>
									
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'><%=eventTypeName%> :</label>
                                   </div>
								   
								   <%
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
										%>
										
							<div class='form-group '>
								<div class="col-md-2 col-md-offset-4">
								<input type="checkbox" name="<%=cbxName%>" value="<%=eventTypeId+","+levelId%>" id="<%=cbxName%>" />&nbsp;&nbsp;<%=levelCode%>
							</div>
							</div>
							
								<%}}}  %>
									 
				 	 <input type="hidden" name="levelCount" id="levelCount" value="<%=levelCount%>" />
					
									
									

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Register">Register</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style=''  type="button" value="Cancel" onclick="history.go(-1);">Cancel</button>
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

<script language="javascript">
	var cal1 = new calendar2(document.forms['frmEventRequestReg'].elements['beginDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar2(document.forms['frmEventRequestReg'].elements['endDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
</script>
