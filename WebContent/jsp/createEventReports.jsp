<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script  src="js/ts_picker.js"></script>
<script src="js/datetimepicker_css.js"></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script language="javascript">
                function UpdateSelect()
{
select_value = document.generateEventsReport.view.value;
var id = 'hide_this_row';
var obj = '';
obj = (document.getElementById) ? document.getElementById(id) : ((document.all) ? document.all[id] : ((document.layers) ? document.layers[id] : false));

if(select_value =2)
{
obj.style.display = ( obj.style.display != "none" ) ? "none" : "";//Hide Fields
}
else
{
obj.visibility = "show";//Show Fields
}
}
             function validate(type){
                var flag=true;
                if(document.generateEventsReport.fromDate.value==""){
                    alert("Select From Date");
                    document.generateEventsReport.fromDate.focus();
                    flag=false;
                    return flag;
                    }
                    
                    if(document.generateEventsReport.toDate.value==""){
                            alert("Select To Date");
                            document.generateEventsReport.toDate.focus();
                            flag=false;
                            return flag;
                    }
	
                    if(flag)
                        {
                          popUp_report(type);  
                        }
	        }  
            function popUp_report(type){
			
                var val =null; var status=null;var membership=null;var area=null;var donation=null,event_type_id=null;
                var fromDate =document.getElementById("fromDate").value;
                var toDate =document.getElementById("toDate").value;
                var view=document.getElementById("view").value;
				
				 var numArr = new Array ();
				j=0;
				var graph=document.getElementsByName("graph");
				
				for (i = 0; i < graph.length; i++)
				{
	                        if(graph[i].checked)
					{
								
								numArr[j]=graph[i].value;
								j++;
								
					}
					          
					               
                          }

                if(type=='eventsYearWise')
                    {
                       val=  window.open("eventReportsGeneration.html?process=eventsYearWise&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                     }
                    if(type=='eventsAreaWise')
                        {
                           val=  window.open("eventReportsGeneration.html?process=eventsAreaWise&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                      
                        }  
                        if(type=='eventsTypeWise')
                        {
                           val=  window.open("eventReportsGeneration.html?process=eventsTypeWise&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                      
                        } 
                        if(type=='eventsAreaWiseForEventType')
                        {
                           event_type_id=document.getElementById("eventType").value;
                           val=  window.open("eventReportsGeneration.html?process=eventsAreaWiseForEventType&fromDate="+fromDate+"&toDate="+toDate+"&eventType="+event_type_id+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                      
                        } 
                        if(type=='humanMembersParticipatedInEvents')
                            {
                           val=  window.open("eventReportsGeneration.html?process=humanMembersParticipatedInEvents&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                      
                            }
                         if(type=='humanMembersParticipatedForAllHumanMemberships')
                             {
                               val=  window.open("eventReportsGeneration.html?process=humanMembersParticipatedForAllHumanMemberships&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                             
                            }
                           if(type=='getHumanMembersParticipatedEventTypeWise')
                               {
                                val=  window.open("eventReportsGeneration.html?process=getHumanMembersParticipatedEventTypeWise&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                           
                              } 
                            if(type=='getHumanMembersParticipatedAreaWise')
                               {
                                val=  window.open("eventReportsGeneration.html?process=getHumanMembersParticipatedAreaWise&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                              } 
                              
                               if(type=='getHumanMembersParticipatedBasedOnMembTypeAreaWise')
                               {
                                   area=document.getElementById("area").value; 
                                val=  window.open("eventReportsGeneration.html?process=getHumanMembersParticipatedBasedOnMembTypeAreaWise&fromDate="+fromDate+"&toDate="+toDate+"&area="+area+"&view="+view+"&graph="+numArr.join()
                         ,'EventReports',
			 'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                           
                              } 
                      
                  
              if(val == null) {
                alert("Please Enable Site Popup Allowed");
               }
               
                
    }
            
            
        </script>
</head>




<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

<% String type=(String)request.getAttribute("type");
System.out.println("type----------->" + type);%>

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

  
	  <!--==============================================import content code start here============================================-->
	  
	   <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
	  
                                          <h2>  <%  if (type.equalsIgnoreCase("eventsYearWise")) { %>
                                            Number of Events Conducted Year Wise
                                             <%  } else if(type.equalsIgnoreCase("eventsAreaWise")) { %>
                                             Number of Events Conducted Area Wise 
                                             <% } else if(type.equalsIgnoreCase("eventsTypeWise")) { %>
                                             Number of Events Conducted Event Type Wise 
                                             <% } else if(type.equalsIgnoreCase("eventsAreaWiseForEventType")) { %>
                                             Number of Events Conducted Area Wise and  Specific Event Type Wise 
                                              <% } else if(type.equalsIgnoreCase("humanMembersParticipatedInEvents")) { %>
                                              Number of Human Members Participated in Event Competitions
                                              <% } else if (type.equalsIgnoreCase("humanMembersParticipatedForAllHumanMemberships")) { %>
                                              Number of Human Members Participated in Event Competitions based on All Human Memberships
                                              <% } else if(type.equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise")) { %>
                                              Number of Human Members Participated in Event Competitions based on Event Types
                                              <%}else if(type.equalsIgnoreCase("getHumanMembersParticipatedAreaWise")){%>
                                              Event Participation Humans( Area Type )
											 <%} else if(type.equalsIgnoreCase("getHumanMembersParticipatedBasedOnMembTypeAreaWise")){ %>
                                                                                          Event Participation Humans (Membership Type and Area Type) 
                                               <% }else if(type.equalsIgnoreCase("getMembersParticipatedEventTypeAreaWise")){ %>
                                               Number of Human Members Participated in Event Competitions Based On All Event Types and Area Wise
                                            
                                           <%}%>
										   </h2>
										   </div>
                                     
                                       
                                        
                    <div class='panel-body'>               
                                    

       <form  class='form-horizontal' role='form' id="myform" name="generateEventsReport" method="post" onsubmit="return validate('<%=type %>')">
	   
					 <div class='form-group'>
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>From Date: </label>
							<div class='col-md-8'>
								<div class='col-md-4 indent-small'>
									 <div class='form-group internal'>
									<input type="text" name="fromDate" id="fromDate" class="form-control" readonly="true"/>
									<a onclick="javascript:NewCssCal('fromDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
									
									</div>
								</div>
							</div>
					</div>
					
				
             		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>To date: </label>
					
						 <div class='col-md-8'>
								<div class='col-md-4 indent-small'>
									  <div class='form-group internal'>
					   <input type="text" name="toDate" id="toDate" class="form-control" readonly="true"/>
					  
					   <a onclick="javascript:NewCssCal('toDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
					   <span id="span_astriesk">*</span>
					   
									
							
									 
									 </div>
								</div>
						</div>
                        <% if(type.equalsIgnoreCase("eventsAreaWiseForEventType")) { %>
          
           			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Types: </label>
		   
					   <div class='col-md-8'>
								<div class='col-md-4 indent-small'>
									  <div class='form-group internal'>
												<select  name="eventType" id="eventType" class="form-control">
																						<option value="b2b77c0b-ffe0-484b-9d77-1e4ebe3d7517">YEH</option>
																						<option value="2833a332-3af3-4d98-b8fc-46263448385d">TEST</option>
																						<option value="90afd446-d139-44c5-8f37-4eec8358eb1e">HT</option>
																						<option value="445c7c02-49fe-402f-a1cf-ac1fb3e51d77">3D</option>
																						<option value="6845ba45-ab6c-48c3-964c-b3c7a6571513">CT</option>
																						<option value="1eb79456-e38e-4e04-b67d-b7296c5ce64b">FEH</option>
																						<option value="ac6e6d2a-c80a-4fce-8fa0-d02d087fb118">2D</option>
																						</select>
																					
						
									
																		
																		</div>
						</div>
						</div>   
						 <% } %>                      
                              <% if(type.equalsIgnoreCase("getHumanMembersParticipatedBasedOnMembTypeAreaWise")) { %>                                 
      			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area: </label>
				  <div class='col-md-8'>
						<div class='col-md-4 indent-small'>
							  <div class='form-group internal'>
							  <select  name="area" id="area" class="form-control">
																				
																				<option value="09133F6D-48B0-4F07-846D-B44599A7D570">Area I</option>
																				<option value="440AC928-187D-4F6E-ADB7-4B2435B22104">Area II</option>
																				<option value="FD39E89E-7806-4332-A7D1-09736886E194">Area III</option>
																				<option value="A41186F2-717A-4042-89BA-90AE4160A1F7">Area IV</option>
																				<option value="F627A4EA-FD66-4419-AC4E-AF9CAEF2F587">Area V</option>
																				<option value="FCEFCF4F-DB92-42F8-B005-B4C7F2650EC6">Area VI</option>
																				<option value="D12543D7-CB00-43BA-87F5-594CD6E32BD5">Area VII</option>
																				<option value="C830B545-6ADB-4260-9AD1-DD36F663ED4B">Area VIII</option>
																				<option value="C9DB9ED2-C5D6-4671-8B44-87D34C72251C">Area IX</option>
																				<option value="33E1594B-E12A-4652-9279-B85A741D4D05">Area X</option>
																				</select>
																			
										
																	   
																 
																   
										</div>
									</div>
								</div>		
								  <%} %>				   
                                                                                                  
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report type : </label>
								  <div class='col-md-8'>
										<div class='col-md-4 indent-small'>
											<div class='form-group internal'>
											<select name="view" id="view" onChange="UpdateSelect();" class="form-control">
												<option value='1'>Graphical</option>
								<!-- option value='2'>Tabular</option --></select>
											</div>
										</div>
									</div>
                            
                            
                        
                            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Graph types :</label>
							  <div class='col-md-8'>
                    				<div class='col-md-3 indent-small'>
                          				<div class='form-group internal'>
                                 <% if(type.equalsIgnoreCase("eventsYearWise")||type.equalsIgnoreCase("eventsAreaWise"))  { %>
								 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                 <input type="checkbox" name="graph"  value="pie" checked>Pie
								 </div>
								 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								 <input type="checkbox" name="graph" value="plotformat">PlotFormat
								 </div>
								 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								 <input type="checkbox" name="graph" value="barMarker">BarMarker
								 </div>
								 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								 <input type="checkbox" name="graph" value="tube">Tube
								 </div>
								

<% } else if(type.equalsIgnoreCase("eventsTypeWise") || type.equalsIgnoreCase("eventsAreaWiseForEventType")|| type.equalsIgnoreCase("humanMembersParticipatedForAllHumanMemberships")||type.equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise") ||type.equalsIgnoreCase("getHumanMembersParticipatedAreaWise") ||type.equalsIgnoreCase("getHumanMembersParticipatedBasedOnMembTypeAreaWise")){ %>

								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								  <input type="checkbox" name="graph"  value="pie" checked>Pie
								  </div>
								  <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								 <input type="checkbox" name="graph" value="plotformat">PlotFormat
								 </div>
								 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								 <input type="checkbox" name="graph" value="Linechart">Line
								 </div>
								 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								 <input type="checkbox" name="graph" value="tube">Tube
								 </div>
								 
<% } else if(type.equalsIgnoreCase("humanMembersParticipatedInEvents") )  { %>

								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								<input type="checkbox" name="graph"  value="tube" checked>Tube
								</div>
								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								<input type="checkbox" name="graph" value="PyramidChart">Pyramid
								</div>
								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								<input type="checkbox" name="graph" value="Linechart">Line
								</div>
								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								<input type="checkbox" name="graph" value="cone">Cone
				 				</div>
								
<% } else { %>

								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								<input type="checkbox" name="graph" value="pie">Pie
								</div>
								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								<input type="checkbox" name="graph" value="line">Line 
								</div>
								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
								<input type="checkbox" name="graph" value="PyramidChart">Pyramid
								</div>
								
				
        <% } %>
		
                            </div>
							</div>
							</div>
							
							<div class='form-group'>
                                   <div class='col-md-offset-4 col-md-1'>
                                          <button class='btn-lg btn-primary' type='submit'>Submit</button>
									</div>
							</div>
                            
                               
                                                                            
                                                <input type="hidden" name="message" value="xlsToGraph" />
                                                
                                          </form>
                                            
                                      </div>
									  </div>
									  </div>
									</div>
									
	  						
	  
	  
	  <!--==============================================import content code end here============================================-->
	  
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
	var cal1 = new calendar2(document.forms['generateEventsReport'].elements['fromDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar2(document.forms['generateEventsReport'].elements['toDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
</script>
</html>
