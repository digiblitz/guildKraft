<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.hlcmeeting.util.*" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script><script type="text/javascript" >

 
            function chk(){
	
//==================================== For Radio Button ==============================	
			
		 
				if(document.frmMeeAnnualConvRegister.comments.value==""){
				alert("Enter a comments");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				if(document.frmMeeAnnualConvRegister.comments.value.indexOf(' ')==0){
				alert("Please avoid  unwanted white space");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				if(document.frmMeeAnnualConvRegister.comments.value.length>1024){
				alert("Comments is out of range");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
				}
				if(document.frmMeeAnnualConvRegister.comments.value.indexOf('  ')!==-1){
				alert("Please avoid  unwanted white space");
				document.frmMeeAnnualConvRegister.comments.focus();
				return false;
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
                            <h2>Meetings: Annual Meeting &amp; Convention  Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							<div class='col-md-offset-2'>
							<h2>User Information</h2>
							</div>
							
							
							 <% 
							HLCAnnualRegistrationDetailVO  objAnnualRegDet = (HLCAnnualRegistrationDetailVO) request.getAttribute("viewMemberDetails");
							if(objAnnualRegDet!=null){
								 String ardID  = objAnnualRegDet.getArdId();
								 String meetingId  =  objAnnualRegDet.getAnnualMeetingId();
								 String userId  = objAnnualRegDet.getUserId();
								 String badgeName  = objAnnualRegDet.getBadgeName();
								 String fName  = objAnnualRegDet.getFirstName();
								 String memberName  = objAnnualRegDet.getMemTypeName();
								 String daysApplied  = objAnnualRegDet.getDaysApplied();
								 String amount  = objAnnualRegDet.getRegAmount();
								// boolean ponyStatus  = objAnnualRegDet.getPonyMemberStatus();
								 String poId  = objAnnualRegDet.getPonyMemId();
								 String poClubeName  = objAnnualRegDet.getPonyClubName();
								 boolean facStatus  = objAnnualRegDet.getAccomFaciStatus();
								 String AccomDet  = objAnnualRegDet.getAccomDetails();
								 String reqStatus = objAnnualRegDet.getRequestStatus();
								  String comments = objAnnualRegDet.getRemarks();
								  String checkDateValue = "";
								  if(daysApplied==null || daysApplied.trim().length()==0)  daysApplied = "N/A";
								 
								 if(poId==null || poId.trim().length()==0)  poId = "N/A";
								 if(poClubeName==null || poClubeName.trim().length()==0)  poClubeName = "N/A";
								 if(AccomDet==null || AccomDet.trim().length()==0)  AccomDet = "N/A";
								// String ardID  = objAnnualRegDet.getRequestStatus();
								 //String ardID  = objAnnualRegDet.getRemarks();
								// String ardID  = objAnnualRegDet.getAddDate();
						
						%>
						
						
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=fName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=memberName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Badge:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=badgeName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Pony Club Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=poId%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Pony Club Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=poClubeName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Accommodation Details:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=AccomDet%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Days Applied:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=daysApplied%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=amount%></label>
                                            </div>
                                        </div>

                                    </div>
                                
								
								
								<%if(reqStatus!=null && reqStatus.equals("Pending")){%>
						         
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Status:</label>
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=reqStatus%></label>
                                            </div>
                                        </div>

                                    </div>
						  			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment done By:</label>
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'>Check</label>
                                            </div>
                                        </div>

                                    </div>
								
								<%}else{%>
								
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Status:</label> 
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=reqStatus%></label>
                                            </div>
                                        </div>

                                    </div>
									
						  		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment done By:</label>
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'>Credit Card</label>
                                            </div>
                                        </div>

                                    </div>
								
								
							<%
							}
							%>
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments:</label>
								<div class='col-md-8'>
                                 	<div class='col-md-3 indent-small'>
                                       <div class='form-group internal'>
                                          <label class='control-label'><%=comments%></label>
                                      	</div>
                                 	</div>

                               </div>
							   
						</div>
						
						
							<%
							}
							
							ArrayList priceDetails = (ArrayList)request.getAttribute("priceDetails");
							if(priceDetails!=null && priceDetails.size()!=0){
								Iterator it = priceDetails.iterator();
								%>
								<div class='col-md-offset-2'>
									<h2> Registerted Activities</h2>
								</div>
							
								<%
								while(it.hasNext()){
									HLCAnnualPriceDetailVO objPriceDet = (HLCAnnualPriceDetailVO) it.next();
									String activityName = objPriceDet.getSpecificationName();
									if(activityName==null) activityName = "";
							%>
							
							
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'><%=activityName%></label>
							 
							 
							 <%
							}
							}
							%>
							
							
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
