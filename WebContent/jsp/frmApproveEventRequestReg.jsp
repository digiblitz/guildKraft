<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import ="com.hlcmro.util.HLCEventRequestVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/calendar2.js" type="text/javascript"></script>

<script>
var arHttpRequest;

function HLCMemberDetails()
{
	
	if(document.frmAppEventRequestReg.orgnaizerId.value!="" && document.frmAppEventRequestReg.orgnaizerId.value.indexOf(" ")!=0)
	{
    var memberid=document.frmAppEventRequestReg.orgnaizerId.value;

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
				
                if(arnameText=="false")
                {    
					alert("Member Id Doesn't Exists!"); 
					document.frmAppEventRequestReg.orgnaizerId.value="";
					document.frmAppEventRequestReg.orgnaizerId.focus();
					
					document.frmAppEventRequestReg.name.value="";
					document.frmAppEventRequestReg.address.value="";
					document.frmAppEventRequestReg.city.value="";
					document.frmAppEventRequestReg.phone.value="";
					document.frmAppEventRequestReg.fax.value="";
					document.frmAppEventRequestReg.email.value="";
										
					return false;
                }
				else
				{					
					document.frmAppEventRequestReg.name.value="";
					document.frmAppEventRequestReg.address.value="";
					document.frmAppEventRequestReg.city.value="";
					document.frmAppEventRequestReg.phone.value="";
					document.frmAppEventRequestReg.fax.value="";
					document.frmAppEventRequestReg.email.value="";
										
					details();
				}

            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
	
//----------------------------------------------

var httpRequestDet;

function details()
{

if(document.frmAppEventRequestReg.orgnaizerId.value!="" && document.frmAppEventRequestReg.orgnaizerId.value.indexOf(' ')!=0)
	{

   rid=document.frmAppEventRequestReg.orgnaizerId.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "RiderInfoAjaxAction.html?rid="+rid; 

        if (window.ActiveXObject) 
        { 
            httpRequestDet = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequestDet = new XMLHttpRequest(); 
        } 
     
        httpRequestDet.open("GET", url, true); 
        
        httpRequestDet.onreadystatechange =processRequest; 
        httpRequestDet.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processRequest() 
    { 
   
        if (httpRequestDet.readyState == 4) 
        { 
            if(httpRequestDet.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequestDet.responseXML.getElementsByTagName("salutation")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateDet(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequestDet.status +":"+ httpRequestDet.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateDet(salutationXML) 
    { 

        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 
        var rdetails=new Array();
        rdetails=null;
        rdetails=salutationText.split("#");
      
	  // alert("rdetails[6] :"+rdetails[6]);
	  		
	    if(rdetails[1]==NaN || rdetails[1]==undefined || rdetails[1]==null || rdetails[1]=="null")
        {
        document.frmAppEventRequestReg.name.value="NA";
        }else
        document.frmAppEventRequestReg.name.value=rdetails[1];

        if(rdetails[5]==NaN || rdetails[5]==undefined || rdetails[5]==null || rdetails[5].length==0 || rdetails[5]=="null")
        {
        document.frmAppEventRequestReg.address.value="NA";
        }else
        document.frmAppEventRequestReg.address.value=rdetails[5];

        if(rdetails[7]==NaN || rdetails[7]==undefined || rdetails[7]==null || rdetails[7]=="null")
        {
        document.frmAppEventRequestReg.city .value="NA";
        }else
        document.frmAppEventRequestReg.city .value=rdetails[7]; 

        if(rdetails[10]==NaN || rdetails[10]==undefined || rdetails[10]==null || rdetails[10]=="null")
        {
        document.frmAppEventRequestReg.phone.value="NA";
        }else
        document.frmAppEventRequestReg.phone.value=rdetails[10];

        if(rdetails[12]==NaN || rdetails[12]==undefined || rdetails[12]==null || rdetails[12]=="null")
        {
        document.frmAppEventRequestReg.email.value="NA";
        }else
        document.frmAppEventRequestReg.email.value=rdetails[12];
		
		if(rdetails[13]==NaN || rdetails[13]==undefined || rdetails[13]==null || rdetails[13]=="null" || rdetails[13]=="")
        {
        document.frmAppEventRequestReg.fax.value="NA";
        }else
        document.frmAppEventRequestReg.fax.value=rdetails[13];

    } 

function myvalidate(){
	
	if(document.frmAppEventRequestReg.selStatus.selectedIndex ==0){
	alert("Select any of the Status");
	document.frmAppEventRequestReg.selStatus.focus();
	return false;
	}
		
return true;
}
</script>
<title><%=(String)session.getAttribute("title")%></title>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="HLCMemberDetails();">
								
								<%! 
								String nullCheck(String fieldName){
									String retValue = "N/A";
										if(fieldName!=null && fieldName.trim().length()!=0){
										retValue = fieldName;
										}
									return retValue;
								}
								
								%>
								<%! 				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
													SimpleDateFormat sd1 = new SimpleDateFormat("MM/dd/yyyy");
													
													String dateFormat(String fieldName){					
														java.util.Date clDate = null;
														Calendar cal = Calendar.getInstance();
														GregorianCalendar gc = new GregorianCalendar();
														try{
															clDate = sd.parse(fieldName);
														}catch(Exception e){
															System.out.println("Error While Parsing Date: "+e);
														}
														
														gc.setTime(clDate);
														cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
														String dispDate = "N/A";
														if(clDate!=null ){
														dispDate = sd1.format(cal.getTime());
														}
														return dispDate;
													}
													%>
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
                            <h2> Meetings: Request for Event Registration</h2>
                        </div>
						<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
			
				           <p>Approve An Event:</p>
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
									String issNm = "";
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
								  issNm = objEventReqVO.getIssueName();
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
				<form class='form-horizontal' role='form' name="frmAppEventRequestReg" id="frmAppEventRequestReg" action="./eventRegList.html" method="post" onsubmit="return myvalidate();"  >
	                     <input type="hidden" name="cmd" value="approveEventRequestReg">
                       <input type="hidden" name="eventId" id="eventId" value="<%=event_id%>" />	
					    <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=event_title%></label>
										    </div>
								       </div>
							       </div>	
								   <p>Event Location:</p>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label">USA</label>
										    </div>
								       </div>
							       </div>	
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
															<%boolean stateStatus = true;
															ArrayList stateDetails = (ArrayList)request.getAttribute("stateDetails");
															if(stateDetails!=null && stateDetails.size()!=0){
															Iterator itr = stateDetails.iterator();
									
					
															while(itr.hasNext()){
															String[] stateDet = (String[])itr.next();
															String stateId = stateDet[0];
															String stateName = stateDet[1];
															String stateCode = stateDet[2];
															if(competition_state!=null && competition_state.equalsIgnoreCase(stateId)){
															stateStatus = false;
															%>										
															<%=stateName%>
															<%}								
												  }
												} if(stateStatus){
												  %><%="N/A"%>
												  <%}%>		
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
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>ZipCode:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=competition_zip%></label>
										    </div>
								       </div>
							       </div>
								     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=areaStr%></label>
										    </div>
								       </div>
							       </div>					
				    				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=nullCheck(competition_location)%></label>
										    </div>
								       </div>
							       </div>	
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Begin Date:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=dateFormat(eventBeginDate.toString())%></label>
										    </div>
								       </div>
							       </div>					
				    						
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>End date:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=dateFormat(eventEndDate.toString())%></label>
										    </div>
								       </div>
							       </div>	
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer ID:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <input name="orgnaizerId" type="text" id="orgnaizerId"  value="<%=organizer_id%>" class="form-control"  maxlength="20" readonly="true" />	
										    </div>
								       </div>
							       </div>					
				    									
				                      <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <input name="name" type="text" id="name"  class="form-control"  readonly="true"/>
										    </div>
								       </div>
							       </div>		
								     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <input name="phone" type="text" id="phone"  class="form-control"  readonly="true"/>
										    </div>
								       </div>
							       </div>					
				    				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <input name="address" type="text" id="address"  class="form-control"  readonly="true"/>
										    </div>
								       </div>
							       </div>		
								     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <input name="city" type="text" id="city"  class="form-control"  readonly="true"/>
										    </div>
								       </div>
							       </div>				
				    				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												  <input name="fax" type="text" id="fax"  class="form-control"  readonly="true"/>
										    </div>
								       </div>
							       </div>
								    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												   <input name="email" type="text" id="email" class="form-control"  readonly="true"/>
										    </div>
								       </div>
							       </div>				
			                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Season:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												   <label class="control-label"><%=issNm%></label>
										    </div>
								       </div>
							       </div>	
								 </div> 
                    <p>Event Types & Event Levels:</p>
					<div class="form-group">
				                    <%
										Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");
										HashMap eventTypeMap = (HashMap)request.getAttribute("eventTypeMap");
										int levelCount =0;
										if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
										Enumeration it = eventTypeDetails.elements();
										while(it.hasMoreElements()){
										String[] eventDet =(String[])it.nextElement();
										String eventTypeId = eventDet[0];
										String eventTypeName= eventDet[1];
									%>
				
									<%  String tmpVal="";
										ArrayList subLevelMap = (ArrayList)eventTypeMap.get(eventTypeId);
                                                                                if(subLevelMap!=null && subLevelMap.size()!=0)
											{
					                    Iterator itrSub = subLevelMap.iterator();
                    					while(itrSub.hasNext()){
				                        String[] subEntry = (String[])itrSub.next();
                				        String mapId = subEntry[0];
				                        String levelId = subEntry[1];
                				        String levelCode = subEntry[2];
				                        String levelName = subEntry[3]; 
										levelCount = levelCount + 1;
										String cbxName = "eventLevels"+levelCount;
										boolean chkStatus = false;
										if(eventSubTypes.contains(mapId)){
										if(tmpVal==""){
										tmpVal = levelCode;	
										}else{	
										tmpVal = tmpVal + ","+ levelCode;	
										}														
										%>
				
											<%}
										 } }%>
							    <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=eventTypeName%></label>
										    </div>
								       </div>
							       </div>	
								   <%if(tmpVal!=""){%> 
								   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label"><%=tmpVal%></label>
										    </div>
								       </div>
							       </div>
								   <%}else{%>
								    <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<label class="control-label">N/A</label>
										    </div>
								       </div>
							       </div>	 
												 <%}%> 
												<%}
											}  %>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approval Status:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<select name="selStatus" id="selStatus" class="form-control" > 
										           <option value="" selected="selected">Select One</option>
													<%	String [] statStr = {"Approved","Pending","Rejected"};
															for(int i = 0 ; i< 3 ;i++){
															if(status_id!= null && status_id.equalsIgnoreCase(statStr[i])){%>
																		<option  value="<%=statStr[i]%>" selected="selected"><%=statStr[i]%></option>
																	<%
																	}
																	else{
																	%>
																		<option  value="<%=statStr[i]%>"><%=statStr[i]%></option>
																	<%	}
													                    }								
													 %>
                                                  </select>
											 <span id="span_astriesk">*</span>			
											 </div>
										</div>
								 </div>
							</div>
				<div class='form-group'>
					    <div class='col-md-offset-4 col-md-2'>
						   <button class='btn-lg btn-primary' type="submit" value="Approve">Approve</button>
					    </div>
						<div class='col-md-offset-4 col-md-2'>
						   <button class='btn-lg btn-danger' type="button" value="Cancel" onclick="location.href='eventRegList.html?cmd=eventReg'">Cancel</button>
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
