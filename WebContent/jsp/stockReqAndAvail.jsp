<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
	<%@ page import="java.util.*" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Business Service Center</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/datetimepicker_css.js"></script>

<link href="css/style.css" rel="stylesheet" type="text/css" />
			<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-base.css" />
			<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-topbar.css" />
			<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-sidebar.css" />
			
			
			<link rel="stylesheet" type="text/css" href="css/EAframe.css" />
			<link rel="stylesheet" type="text/css" href="css/Usermenu.css" />
			<link rel="stylesheet" type="text/css" href="css/table.css" />
			<title>Integrated Enterprise Dashboard</title>
			<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-base.css" />
			<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-topbar.css" />
			<link rel="stylesheet" type="text/css" href="css/ddlevelsmenu-sidebar.css" />
			
			
<script>
                             function UpdateSelect()
{
select_value = document.salesPage.view.value;
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
			 function goSubmit(type)
			 {
			     if(type=='stockReqAndAvail')
			         {
			             document.salesPage.action='purchaseRequisitionReport.html?process=stockReqAndAvail';
			           } 
			       if(type=='purchaseRequisitionParticularStatus')
			           {
			           document.salesPage.action='purchaseRequisitionReport.html?process=purchaseRequisitionParticularStatus';    
			           }
			        if(type=='defectiveItemSuppliedByVendor')
			           {
			           document.salesPage.action='purchaseRequisitionReport.html?process=defectiveItemSuppliedByVendor';    
			           } 
                                  if(type=='stocksSuppliedByVendor')
			           {
			           document.salesPage.action='purchaseRequisitionReport.html?process=stocksSuppliedByVendor';    
			           } 
			           
			     }
				 </script>
			<script type="text/javascript" src="js/ddlevelsmenu.js">
			
			/***********************************************
			* All Levels Navigational Menu- (c) Dynamic Drive DHTML code library (http://www.dynamicdrive.com)
			* This notice MUST stay intact for legal use
			* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
			***********************************************/
			
			
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
                            <h2>Sales Stock Report</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
						 <%   String type=(String)request.getAttribute("type");
                                          
								  if (type.equalsIgnoreCase("stockReqAndAvail")) { %>
			                                            <p>Stock Requirement And Availability Report   </p>
			                                             <%  } else if(type.equalsIgnoreCase("purchaseRequisitionParticularStatus")) { %>
			                                             <p>Purchase Requisition For a Particular Status </p>
			                                             <% } else if (type.equalsIgnoreCase("defectiveItemSuppliedByVendor")) { %>
			                                             <p> Defective Stocks Supplied By Each Vendor  </p> <% } else if (type.equalsIgnoreCase("stocksSuppliedByVendor")) { %>
			                                             <p> Stocks Supplied By Each Vendor  </p>
			                                       <% } %>
			
			                  <form  class='form-horizontal' role='form' name="salesPage" method="post" onsubmit="goSubmit('<%=type%>')" >
			                  
			                       <% if(type.equalsIgnoreCase("defectiveItemSuppliedByVendor") || type.equalsIgnoreCase("stocksSuppliedByVendor") ) { %>
			                          
									  
									  
							 <div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Year:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>  
												<input type="text" name="year" id="year" class="form-control"  />
													<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									             
			                        <% } else { %>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												<input type="text" name="fromDate" id="fromDate" class="form-control"  readonly="true"/>
												<a onclick="javascript:NewCssCal('fromDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
			                                          <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
                                  
			                          <% } %>
                                                                                        
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="view" id="view"  class='form-control' onChange="UpdateSelect();">
													<option value='1'>Graphical</option>
													<option value='2'>Tabular</option>
												</select>
											</div>
										</div>
									</div>
								</div>
                            
                            
                       <div class='form-group id="hide_this_row '>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Graph types:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                               					  <input type="radio" name="graph" value="Cone" checked>Cone<br>
													<input type="radio" name="graph" value="Pie">Pie<br>
													<input type="radio" name="graph" value="PlotFormat">PlotFormat<br> 
													<input type="radio" name="graph" value="Line">Line<br> 
													<input type="radio" name="graph" value="Pyramid">Pyramid<br>
														<input type="radio" name="graph" value="Tube">Tube<br>
															<input type="radio" name="graph" value="Bar">Bar<br>
											</div>
										</div>
									</div>
								</div>
                             
							 
							 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="Submit" type='submit'>Submit</button>
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

<% if((type.equalsIgnoreCase("stockReqAndAvail")) || (type.equalsIgnoreCase("purchaseRequisitionParticularStatus")) ) { %>
			<script language="javascript">
			    var cal1 = new calendar2(document.forms['salesPage'].elements['fromDate']);
			    cal1.year_scroll = true;
			    cal1.time_comp = false;
			     </script> 
                        <% } %>
       
