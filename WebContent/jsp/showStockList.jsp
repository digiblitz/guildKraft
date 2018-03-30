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
		<script>
		function popUp_report(){
val=window.open("MakeChart.html?process=areaDet&Submit=Submit&message=xlsToGraph" ,'AreaSalesGraph',
			  'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
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
                            <h2>Sales  Stock Report</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
                                         
                                         <p>Use the section below to select Sales Report Type</p>
                                    
                                                                
                                                                <!--
                                                                                   <tr class="tblMainHead">
                                                                                         <td height="25" colspan="2" class="textCommon">&nbsp;
                                                                                                 <a href="#" class="linkFour">Insert Address</a> |
                                                                                                 <a href="#" class="linkFour">Add Cc</a> | 
                                                                                                 <a href="#" class="linkFour">Add BCc</a>
                                                                                                 
                                                                                         </td>
                                                                                   </tr>
                                                                -->
									<div> <a href="stockRequirement.html?cmd=stockAvailRpt&type=stockReqAndAvail">Stock Requirement And Availability Report</a></div>
									
									 <div id="statusId"></div>
									 
									 <div><a href="stockRequirement.html?cmd=stockAvailRpt1&type=purchaseRequisitionParticularStatus">Purchase Requisition For a Particular Status </a></div>																	
                                                            
                                                                <!--  tr>
                                                                <td height="25" class="tblMainHead"><a href="stockRequirement.html?cmd=stockAvailRpt2&type=defectiveItemSuppliedByVendor">Defective Stocks Supplied By Each Vendor</a>

                                                                  </td>
                                                                   
                                                                </tr>
                                                                
                                                                <!-- <tr>
                                                                   
                                                                    <td height="25" class="tblMainHead"><a href="javascript: onclick=popUp_report();"> Yearly Sales Report for all Membership Types  </a>
                                                                    </td>
                                                                </tr> --
                                                                 <tr>
                                                                   
                                                                    <td height="25" class="tblMainHead"><a href="stockRequirement.html?cmd=stockAvailRpt3&type=stocksSuppliedByVendor"> Stocks Supplied By Each Vendor</a>
                                                                    </td>
                                                                </tr>--> 
                                                                
                                                                 <!-- <tr>
                                                                   
                                                                    <td height="25" class="tblMainHead"><a href="createGraphByXLS.html">Generate Chart Report Based on SpreadSheet</a>
                                                                    </td>
                                                                </tr>  -->
                                                               
                                                        
	  
	  <!--==============================================import content code end here============================================-->
	  
	  
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
