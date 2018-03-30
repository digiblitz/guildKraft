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
<%@ page import="com.common.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>


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
                            <h2>USEA Meetings: Organizer's Educational Activity Recap Registration Listings</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							<div class='form-group'>
								<div class="col-md-12">
								
									<div class="col-md-2">
									<label class='control-label label1'>Event id </label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Activity Name</label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label label1'>Date of Registration </label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label label1'>Registration Status</label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>View</label> 
									</div>
									
								</div>
							</div>
							
				  
						  
						  	<%SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
								String addDate = "";
								ArrayList recapList = (ArrayList) session.getAttribute("DispAllOrgRecapDetails");
								if(recapList!=null && recapList.size()!=0){
									Iterator eRecap = recapList.iterator();
									while(eRecap.hasNext()){
										ArrayList listRecap = (ArrayList) eRecap.next();
											Iterator e = listRecap.iterator();
												while(e.hasNext()){
													String recapId = (String)e.next();
													String mettingId = (String)e.next();
													String activityName = (String)e.next();
													Date reqDate = (Date)e.next();
													if(reqDate!=null){
												//out.print("reqDate" + reqDate);
												addDate =  sdf.format(reqDate);
												}
													String requestStatus = (String)e.next();
								%>
								<form class='form-horizontal' role='form' name="frmRecap" method="post" action="recap.html" />
								<input type="hidden" name="recapProcess" value="showMyRecapAct"/>
								<input type="hidden" name="orgRecapId" value="<%=recapId%>"/>							
							  
							  	<div class='form-group'>
								<div class="col-md-12">
								
									<div class="col-md-2">
									<label class='control-label'><%=mettingId%></label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label'><%=activityName%></label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label'><%=addDate%></label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label'><%=requestStatus%></label> 
									</div>
									
									<div class="col-md-2">
									<button name="Submit2" type="submit" class="btn-sm btn-primary" value="View" >View</button>
									</div>
									
								</div>
							</div>
							  
							  
								</form>
								  <%
								  }
							  }
							}
							else{
							%>
							
							  <div class='form-group'>
									  <div class='col-md-4 '>
									  </div>
                                    <div class='col-md-4 '>
                                       No  Records are available
                                    </div>
                                    
                                </div>
							
							<%
							}
						  %>
						
								
                        
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
