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
                            <h2> Members  Report</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                                         
                                        <p>Use the section below to select Members Report Type</p>
                                            
                                     
                                                                <!--
                                                                                   <tr class="tblMainHead">
                                                                                         <td height="25" colspan="2" class="textCommon">&nbsp;
                                                                                                 <a href="#" class="linkFour">Insert Address</a> |
                                                                                                 <a href="#" class="linkFour">Add Cc</a> | 
                                                                                                 <a href="#" class="linkFour">Add BCc</a>
                                                                                                 
                                                                                         </td>
                                                                                   </tr>
                                                                -->
																
								<div><a href="membersJoinedReport.html?type=membersJoinedYearWise">Total Number Of Members Joined</a></div>
								
								<div><a href="humanMemberReport.html?type=humanMembersAllAreaStatusWise">Human Members - All Areas and Status Wise </a></div>
								
								<div><a href="humanMemberReport.html?type=humanStatusWise"> Human Members - Status Wise</a></div>
								
								<div><a href="humanMemberReport.html?type=humanMembersAllMemberhipTypesByArea">Human Members - Membership Type and Area Wise</a></div>
								
								<div><a href="humanMemberReport.html?type=humanMembershipStatusWise"> Human Members - Membership Type Wise</a></div>
								
								<div><a href="humanMemberReport.html?type=humanSpecificMembershipStatusWise">Human Members - Membership Type and Status Wise</a></div>
								
								<div><a href="humanMemberReport.html?type=humanMembersAreaWise"> Human Members - Area Wise</a></div>
                                                                    
                                                                <!-- <tr>
                                                                    <td height="25" class="tblMainHead"><a href="humanMemberReport.html?type=humanMembersAllMemberhipTypesByAreaAndStatus">Human Members - Area and Status Wise</a>
                                                                    </td>
                                                                </tr>-->
                                                                <!-- <tr>
                                                                    <td height="25" class="tblMainHead"><a href="humanMemberReport.html?type=humanMembersSpecificAreaAndMembershipType">Human Members - Area and Membership Type Wise</a>
                                                                    
                                                                </tr> -->
                           <div> <a href="humanMemberReport.html?type=humanMembersSpecificAreaAndMembershipTypeAndStatus">Human Members - Area, Membership Type and Status Wise</a></div>
						   
						   <div><a href="horseMemberReport.html?type=horseStatusWise"> Non-Human Members - Status Wise </a></div>
						   
						   <div><a href="horseMemberReport.html?type=horseMembershipStatusWise">Non-Human Members - Membership Type Wise</a></div>
						   
						   <div><a href="horseMemberReport.html?type=horseSpecificMembershipAndStatusWise">Non-Human Members - Membership Type and Status wise</a></div>
                                                                  
                                                                <!-- <tr>
                                                                    <td height="25" class="tblMainHead"><a href="horseMemberReport.html?type=newlyRegHorseMembersMeberShipWise">Total Number of Newly Registered Non-Human Members</a>
                                                                    </td>
                                                                </tr>-->
                                                                 
                                                               
                                                                 <!-- <tr>
                                                                   
                                                                    <td height="25" class="tblMainHead"><a href="createGraphByXLS.html">Generate Chart Report Based on SpreadSheet</a>
                                                                    </td>
                                                                </tr>  -->
                              <!--==============================Content end here=================================-->
							
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
