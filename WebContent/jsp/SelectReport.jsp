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
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmMeeEduActRecap.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>
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
                            <h2> Business Intelligence: Business Intelligence Reporting</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
					
						<form class='form-horizontal' role='form' name="frmRoleMgtRolePrev" id="frmRoleMgtRolePrev" action="" onsubmit="return myvalidate();">
							<input type="hidden" name="roleProcess" value="createRole"/>
							
						<p> Please Select Report From the Dropdown list Below : </p>
						
							 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Order to Cash:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="roleId" id="roleId" class="form-control" onchange="">
												<option selected="selected" value="">Select One</option>
												<option>Backorder Report</option>
												<option>Sales Revenue Volume Report Monthly/Yearly / report</option>
												<option>Duplicate Sales Orders in a given time period</option>
												<option>Item Ranking Report based on Sales Revenue</option>
												<option>Item Ranking Report based on Sales Volume</option>
												<option>Item Availability Report</option>
												<option>Backorder Report</option>
												<option>Orders by Item Report</option>
												<option>Daily Exceptions Report </option>
												<option>Daily Shipment Report</option>
												<option>Shipping Error Analysis Report </option>
												<option>Customer/Material Returns Analysis</option>
												<option>Open Invoices Report</option>
												
												
												<option></option>
												<option></option>
												<option></option>
												<option></option>
												<option></option>
												</select>
											
											<button class='btn-sm btn-primary'type="submit" value="Browse">Browse</button>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Procure to Pay:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
			
												<select name="roleId" id="roleId" class="form-control" onchange="postData('initSelectRoleEnt');">
												<option selected="selected" value="">Select One</option>
												<option>Purchase Requisition Report</option>
												<option>Cancelled Requisition Report</option>
												<option>Requisitions on Cancelled Sales  Order Report</option>
												<option>PO Purchases Report</option>
												<option>Cancelled PO Report</option>
												<option>Open PO Report</option>
												<option>PO Distribution Detail Report</option>
												<option>Advanced Shipment Notice </option>
												<option>Discrepant Receipts Report</option>
												<option>Receiving Transactions Register Report</option>
												<option>Receipt Adjustments Report</option>
												<option>Un invoiced receipts report</option>
												<option>Un ordered receipts report</option>
												<option>Suppliers Report (with Payment history)</option>
												</select>
												
												<button class='btn-sm btn-primary'type="submit" value="Browse">Browse</button>
												
										</div>
									</div>
								</div>
							</div>
							
							<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Plan to Produce:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="roleId" id="roleId" class="form-control" onchange="postData('initSelectRoleEnt');">
												<option selected="selected" value="">Select One</option>
												<option>Sales Order History Report </option>
												<option>Stock Requirement and Availability Report</option>
												<option>Material Requirement Planning Report</option>
												<option>Capacity Planning Report</option>
												<option>Master Schedule Status Report</option>
												<option>Late Order Report</option>
												<option>Material Usage Analysis Repor</option>
												<option>Bill of Material report</option>
												<option>Operation analysis report</option>
												<option>DC Capacity utilization report</option>
												<option>Distribution FTE report </option>
												<option>Quality against inspection lot report</option>
												<option>Vendor Analysis report </option>
												
												</select>
											
											<button class='btn-sm btn-primary'type="submit" value="Browse">Browse</button>
												
										</div>
									</div>
								</div>
							</div>
			
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' type='submit'>Select Report</button>
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
