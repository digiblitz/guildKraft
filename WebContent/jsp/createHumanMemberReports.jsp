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
<script src="js/calendar2.js" type="text/javascript"></script>
        <!--<link href="css/core-ie.css" type="text/css" rel="stylesheet" />-->
        <script language="javascript">
                      function UpdateSelect()
{
select_value = document.generateHumanMemberReport.view.value;
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
                if(document.generateHumanMemberReport.fromDate.value==""){
                    alert("Select From Date");
                    document.generateHumanMemberReport.fromDate.focus();
                    flag=false;
                    return flag;
                    }
                    
                    if(document.generateHumanMemberReport.toDate.value==""){
                            alert("Select To Date");
                            document.generateHumanMemberReport.toDate.focus();
                            flag=false;
                            return flag;
                    }
	
                    if(flag)
                        {
                          popUp_report(type);  
                        }
	        }  
                
           
            function popUp_report(type){
                var val =null; var status=null;var membership=null;var area=null;var donation=null;
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


                if(type=='humanStatusWise')
                    {
           val=  window.open("HumanMemberReports.html?process=humanMembersStatusWise&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
             ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                      }
                      
                      if(type=='humanMembersAreaWise')
                          {
                            val=  window.open("HumanMemberReports.html?process=humanMembersAreaWise&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
             ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')    
                          }
                   if(type=='humanMembershipStatusWise')
                       {
                          status=document.getElementById("status").value;   
                          val=  window.open("HumanMemberReports.html?process=humanMembersMembershipAndStatusWise&fromDate="+fromDate+"&toDate="+toDate+"&status="+status+"&view="+view+"&graph="+numArr.join()
             ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                        }
                     if(type=='humanSpecificMembershipStatusWise')
                       {
                          status=document.getElementById("status").value;
                          membership=document.getElementById("membership").value;   
                          val=  window.open("HumanMemberReports.html?process=humanSpecificMembershipStatusWise&fromDate="+fromDate+"&toDate="+toDate+"&status="+status+"&membership="+membership+"&view="+view+"&graph="+numArr.join()
             ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                        }   
                        if(type=='humanMembersAllAreaStatusWise')
                            {
                                status=document.getElementById("status").value;   
                          val=  window.open("HumanMemberReports.html?process=humanMembersAllAreaStatusWise&fromDate="+fromDate+"&toDate="+toDate+"&status="+status+"&view="+view+"&graph="+numArr.join()
             ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                            }
                             if(type=='humanMembersAllMemberhipTypesByArea')
                            {
                                area=document.getElementById("area").value;   
                          val=  window.open("HumanMemberReports.html?process=humanMembersAllMemberhipTypesByArea&fromDate="+fromDate+"&toDate="+toDate+"&area="+area+"&view="+view+"&graph="+numArr.join()
             ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                            }
                            if(type=='humanMembersAllMemberhipTypesByAreaAndStatus')
                                {
                                status=document.getElementById("status").value; 
                                area=document.getElementById("area").value;
                                 val=  window.open("HumanMemberReports.html?process=humanMembersAllMemberhipTypesByAreaAndStatus&fromDate="+fromDate+"&toDate="+toDate+"&status="+status+"&area="+area
                                ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                                }
                                if(type=='humanMembersSpecificAreaAndMembershipType')
                                    {
                                 membership=document.getElementById("membership").value; 
                                area=document.getElementById("area").value;
                                 val=  window.open("HumanMemberReports.html?process=humanMembersSpecificAreaAndMembershipType&fromDate="+fromDate+"&toDate="+toDate+"&membership="+membership+"&area="+area
                                ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                                     }
                                  if(type=='humanMembersSpecificAreaAndMembershipTypeAndStatus')
                                    {
                                 membership=document.getElementById("membership").value; 
                                area=document.getElementById("area").value;
                                status=document.getElementById("status").value;
                                //Starts Here
                                 val=  window.open("HumanMemberReports.html?process=humanMembersSpecificAreaAndMembershipTypeAndStatus&fromDate="+fromDate+"&toDate="+toDate+"&membership="+membership+"&area="+area+"&status="+status+"&view="+view+"&graph="+numArr.join()
                                //Ends Here
                                ,'HumanMemberReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                                    }
                                     if(type=='totalDonationAmount')
                                         {
                                             val=  window.open("DonationReport.html?process=totalDonationAmount&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
             ,'DonationReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes') 
                                          }
                                      if(type=='totalDonationAmountForAllDonationItems')
                                         {
                                            val=  window.open("DonationReport.html?process=totalDonationAmountForAllDonationItems&fromDate="+fromDate+"&toDate="+toDate+"&view="+view+"&graph="+numArr.join()
             ,'DonationReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')   
                                         }  
                                        if(type=='totalDonationAmountSpecificDonationItem') 
                                            {
                                             donation=document.getElementById("donation").value;
                                             val=window.open("DonationReport.html?process=totalDonationAmountSpecificDonationItem&fromDate="+fromDate+"&toDate="+toDate+"&donation="+donation+"&view="+view+"&graph="+numArr.join()
             ,'DonationReports',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')   
                                            }    
              if(val == null) {
                alert("Please Enable Site Popup Allowed");
               }
               
                
    }
            
            
        </script>
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
                            <h2><%  if (request.getParameter("type").equalsIgnoreCase("humanStatusWise")) { %>
                                             <b>Human Members - Status Wise </b> 
                                             <%  } else if (request.getParameter("type").equalsIgnoreCase("humanMembershipStatusWise")) { %>
                                             <b>Human Members - Membership Type Wise</b>
                                             <%  } else if(request.getParameter("type").equalsIgnoreCase("humanSpecificMembershipStatusWise")) { %>
                                             <b> Human Members - Membership Type and Status Wise</b>
                                             <%  } else if(request.getParameter("type").equalsIgnoreCase("humanMembersAreaWise")) { %>
                                             <b>Human Members - Area Wise </b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("humanMembersAllAreaStatusWise")) { %>
                                             <b>Human Members - All Areas and Status Wise</b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("humanMembersAllMemberhipTypesByArea")) { %>
                                             <b>Human Members - Membership Type and Area Wise</b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("humanMembersAllMemberhipTypesByAreaAndStatus") ) { %>
                                             <b>Human Members - Area and Status Wise</b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("humanMembersSpecificAreaAndMembershipType")) { %>
                                             <b>Human Members - Area and Membership Type Wise</b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("humanMembersSpecificAreaAndMembershipTypeAndStatus")) { %>
                                             <b>Human Members - Area, Membership Type and Status Wise</b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("totalDonationAmount")) { %>
                                             <b>Total Donation Report</b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("totalDonationAmountForAllDonationItems")) { %>
                                             <b>Summarized Donation Items Report</b>
                                             <% } else if(request.getParameter("type").equalsIgnoreCase("totalDonationAmountSpecificDonationItem")) { %>
                                             <b>Item Wise Donation Report</b>
                                             <% } %>
                                      </h2>
                                        
                                    </div>
                        <!--==============================Form Title=================================-->

                        <div class="panel-body">

      
	   <form   name="generateHumanMemberReport" method="post" onsubmit="return validate('<%=(String)request.getParameter("type") %>');">
            <div class='form-group'>
              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>From Date:</label>
			  
			  <div class='col-md-8'>
                <div class='col-md-3 indent-small'>
                   <div class='form-group internal'>
				   	<input type="text" name="fromDate" id="fromDate" class="form-control" size="25" readonly="true"/>
					<a onclick="javascript:NewCssCal('fromDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
					<span class="asterisk" id="span_astriesk">*</span>
					</div>
				</div>
			</div>
			
			
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>To date:</label>
		
		<div class='col-md-8'>
                <div class='col-md-3 indent-small'>
                   <div class='form-group internal'>
				   	<input type="text" name="toDate" id="toDate" class="form-control" size="25" readonly="true"/>
					<a onclick="javascript:NewCssCal('toDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
					<span class="asterisk" id="span_astriesk">*</span>
					</div>
				</div>
			</div>
			
			
          		
		 <% if (request.getParameter("type").equalsIgnoreCase("humanMembershipStatusWise") || request.getParameter("type").equalsIgnoreCase("humanSpecificMembershipStatusWise") || request.getParameter("type").equalsIgnoreCase("humanMembersAllAreaStatusWise") || request.getParameter("type").equalsIgnoreCase("humanMembersAllMemberhipTypesByAreaAndStatus") || request.getParameter("type").equalsIgnoreCase("humanMembersSpecificAreaAndMembershipTypeAndStatus")) { %>
                         
        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
		
            <div class='col-md-8'>
                <div class='col-md-3 indent-small'>
                   <div class='form-group internal'>
				   		<select  name="status" id="status" class="form-control">
							<option value="44615b7f-2911-4bfc-85ef-02dea8305963">Duplicate</option>
							<option value="572456ea-04b0-4a4c-a169-35ec0ccce826">Merged</option>
							<option value="cf7e60e9-3a9a-4645-819f-369cbc7b851a">Expired</option>
							<option value="118756d9-fb79-4304-8647-36f0d7579b45">Active</option>
							<option value="b9f3f76a-1aa7-4e19-b457-43104413828e">Pending</option>
							<option value="59a33c45-bacf-4b3a-ae42-62282d61029c">Inactive</option>
							<option value="bef5db6b-2b64-4382-a91e-666ab253db2e">Suspended</option>
							<option value="60b2e6f6-bc60-4827-b0d6-69957ebfd911">Deceased</option>
							<option value="b7f9ed03-2aca-455f-a17d-883c35ac52b8">TBD</option>
							<option value="a368676e-26e6-4c81-9582-adbd97a991f7">Retired</option>
						</select>
                      <span class="asterisk" id="span_astriesk">*</span>
					  </div>
					 </div>
					</div>
                         <%  } %>
                                                                <!-- <tr>
                                                   <th height="25" class="tblMainHead"><span class="fonts">Chart Type :</span></th>
                                                                  <td height="25" class="listCellBg">
																	<select  name="chartType">
																	<option value="Pie">Pie</option>
																	<option value="Bar">Bar</option>
                                                                                                                                        <option value="Line">Line</option>
                                                                                                                                        <option value="Pyramid">Pyramid</option>
																	<option value="Area">Area</option>
																	
                                                                                                                                        
																	</select>
																	<span class="asterisk">*</span>
																</td>
                                                               </tr> -->
	   <% if(request.getParameter("type").equalsIgnoreCase("humanSpecificMembershipStatusWise") || request.getParameter("type").equalsIgnoreCase("humanMembersSpecificAreaAndMembershipType") || request.getParameter("type").equalsIgnoreCase("humanMembersSpecificAreaAndMembershipTypeAndStatus")) { %>
	   
     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership: </label>
	 
	  <div class='col-md-8'>
                <div class='col-md-3 indent-small'>
                   <div class='form-group internal'>
	 				 <select  name="membership" id="membership" class="form-control">
						<option value="60BC8025-B043-4771-AD1E-09C9BC160AEE">Junior Member</option>
						<option value="A95FAB3A-4C2F-47F5-9161-0AE519290131">Life Member</option>
						<option value="E750ED08-5C4B-4FCA-BFD7-52EBB22BDB2B">Full Member</option>
						<option value="74F758E9-6E03-40DB-A402-9F6B4BD36606">Subscribing Member</option>
						<option value="C57DD232-C425-417F-BC27-CE2C9B7EBC83">Family Member</option>
						<option value="19EB90A6-5B73-46BD-9CD5-DFFB6DC96E12">Non-Competing Member</option>
						</select>
						</div>
					</div>
				</div>
				
				
			 <% } %>
		   <% if(request.getParameter("type").equalsIgnoreCase("humanMembersAllMemberhipTypesByArea") || request.getParameter("type").equalsIgnoreCase("humanMembersAllMemberhipTypesByAreaAndStatus")|| request.getParameter("type").equalsIgnoreCase("humanMembersSpecificAreaAndMembershipType") || request.getParameter("type").equalsIgnoreCase("humanMembersSpecificAreaAndMembershipTypeAndStatus")) { %>
		   
		   
         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select Area:</label>
		 
		 <div class='col-md-8'>
                <div class='col-md-3 indent-small'>
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
                                                                                                                             
				<% } %>
				<% if( request.getParameter("type").equalsIgnoreCase("totalDonationAmountSpecificDonationItem"))  { %>
                 
				 
				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select Donation Items:</label>
				   <div class='col-md-8'>
                		<div class='col-md-3 indent-small'>
                   			<div class='form-group internal'>
								<select  name="donation" id="donation"  class="form-control">
									<option value="45EC7062-331D-4A66-B238-0FA089EB96F2">American Eventing Championships</option>
									<option value="6B90B723-BF7F-477E-AEFE-221FC854CB15">Website Development</option>
									<option value="FF86DD9F-EBFB-464A-A274-33C0C170018D">USEA, Inc.</option>
									<option value="FBFDE420-7821-451E-A543-61FDFD0423C8">Young Event Horse Series</option>
									<option value="0D13941A-AED5-48C2-A4E4-62F9AB0931EE">Equine Welfare</option>
									<option value="15CE0E55-F08D-4015-A0A1-72DC3D1AF24A">Course Advisors</option>
									<option value="37C76742-61C5-4B2C-A9BE-79F55B9701A5">USEA Endowment Trust</option>
									<option value="4420D3F7-681E-4F34-B160-83511BA0A7F3">Equine Cardiovascular Research Study</option>
									<option value="F05229DE-4B74-4A79-90F4-9DF678333791">Instructor's Certification Program</option>
									<option value="41377139-E437-47C5-8B4A-A7A135646057">Future Event Horse Series</option>
									<option value="64D9034E-D51E-4D3F-BBD1-D2362B0F3890">GPS Speed Study</option>
									<option value="B5C2EE43-CD53-427E-838B-D698064DCA96">Course Design Ed. (x-c and show jumping)</option>
									<option value="3DCF09CD-983E-4960-82CC-D7E5AC6182C6">Eventing Hall of Fame</option>
									<option value="E01A26E2-F14E-4F06-B676-EAC4B870A2A5">Officials Training and Continuing Ed.</option>
									 <option value="C6D20647-FA23-4A2B-9D01-EC13D8A8A50C">Gold Cup Series</option>
							</select>
							</div>
						</div>
					</div>
                                                                                 
						  <% } %>
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report type :</label>
				<div class='col-md-8'>
                	<div class='col-md-3 indent-small'>
                   		<div class='form-group internal'>
						<select name="view" id="view" onChange="UpdateSelect();" class="form-control">
                            <option value='1'>Graphical</option>
                            <option value='2'>Tabular</option>
						</select>
					</div>
				</div>
			</div>
                            
              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Graph types :</label>
			  	<div class='col-md-8'>
                   <div class='col-md-4 indent-small'>
                      <div class='form-group internal'>
					 <% if(request.getParameter("type").equalsIgnoreCase("totalDonationAmount") || request.getParameter("type").equalsIgnoreCase("totalDonationAmountSpecificDonationItem"))  { %>
			<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                <input type="checkbox" name="graph"  value="cone" checked>Cone
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph" value="plotformat">PlotFormat
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				 <input type="checkbox" name="graph" value="chart">Bar
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph" value="tube">Tube
			</div>
			
				<% } else if(request.getParameter("type").equalsIgnoreCase("totalDonationAmountForAllDonationItems")) { %>
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				 <input type="checkbox" name="graph"  value="cone" checked>Cone
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph" value="plotformat">PlotFormat
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph"  value="pie" >Pie
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph" value="barMarker">BarMarker
			</div>
			
			
				<% } else if(request.getParameter("type").equalsIgnoreCase("humanStatusWise") ||request.getParameter("type").equalsIgnoreCase("humanMembersMembershipAndStatusWise")){ %>
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph"  value="Linechart" checked>Line
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				 <input type="checkbox" name="graph" value="PyramidChart">Pyramid
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph"  value="pie" >Pie
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				 <input type="checkbox" name="graph" value="chart">Bar
			</div>
			
			<% } else if(request.getParameter("type").equalsIgnoreCase("humanMembershipStatusWise")) { %>
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                <input type="checkbox" name="graph"  value="pie" checked>Pie
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>								  
               <input type="checkbox" name="graph"  value="PyramidChart" >Pyramid
			 </div>
			 
			  <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				 <input type="checkbox" name="graph" value="Linechart">Line
			 </div>
			 
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>	
				<input type="checkbox" name="graph" value="chart">Bar
			</div>
		<% } else if(request.getParameter("type").equalsIgnoreCase("humanSpecificMembershipStatusWise")) { %>
		
		 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
            <input type="checkbox" name="graph"  value="cone" checked>Cone
		</div>
		
		 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>								  
           <input type="checkbox" name="graph"  value="plotformat" >PlotFormat
		 </div>
		 
		  <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
			<input type="checkbox" name="graph" value="tube">Tube
			</div>
			
			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" name="graph" value="chart">Bar
			</div>
				<% } else if(request.getParameter("type").equalsIgnoreCase("humanMembersAllAreaStatusWise")|| request.getParameter("type").equalsIgnoreCase("humanMembersAllMemberhipTypesByArea")) { %>
				
				 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                     <input type="checkbox" name="graph"  value="tube" checked>Tube
				</div>
				
				 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>								  					<input type="checkbox" name="graph"  value="plotformat" >PlotFormat
				</div>
				
				 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
					<input type="checkbox" name="graph" value="barMarker">BarMarker
				</div>
				
				 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
					<input type="checkbox" name="graph" value="pie">Pie
				</div>
				
  				<% } else if(request.getParameter("type").equalsIgnoreCase("humanMembersAreaWise")) { %>
				
				 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                    <input type="checkbox" name="graph"  value="cone" checked>Cone
				</div>
				
				 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>								  					<input type="checkbox" name="graph"  value="plotformat" >PlotFormat
				 </div>
				 
				  <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
					<input type="checkbox" name="graph" value="chart">Bar
				  </div>
				  
				   <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
					<input type="checkbox" name="graph" value="pie">Pie
					</div>

						<% } else { %>
					 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
						<!-- Debugs Starts -->
						<input type="checkbox" name="graph" value="plotformat" checked>PlotFormat
					</div>
					
					 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
						<input type="checkbox" name="graph" value="chart">Bar
					</div>
					
					 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
						<input type="checkbox" name="graph" value="tube">Tube
					</div>
					
					 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
						<input type="checkbox" name="graph" value="cone">Cone
					</div>
				</div>
			</div>
		</div>
	</div>
<!--<input type="checkbox" name="graph" value="Pie" checked>Pie<br>
 
<input type="checkbox" name="graph" value="Line">Line<br> 
<input type="checkbox" name="graph" value="Pyramid">Pyramid<br>-->
<!-- Debugs Ends -->
<% } %>
    
        
		  <div class='form-group'>
					<div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-primary' type="submit" name="Submit" value="Submit">Submit</button>
					</div>
			</div>
				 <input type="hidden" name="message" value="xlsToGraph" />
                                                
                       </form>                     
                                       
                                
                        </div>

                        <!--==============================Form Body=================================-->

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
	var cal1 = new calendar2(document.forms['generateHumanMemberReport'].elements['fromDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar2(document.forms['generateHumanMemberReport'].elements['toDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
</script>
