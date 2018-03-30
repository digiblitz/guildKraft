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
                            <h2>Meetings: Organizer Annual Convention Registration Listing </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>The Annual Convention Meeting registrations posted by you is listed below. 
				  Click on the 'View' 
				  button to view the details of the registration along with it's approval status.</p>
							
						<!--==============================Form Description=================================-->
  						
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Color Legends:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'>View</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
							
							
							
							<div class='form-group'>
								<div class="col-md-8">
								
									<div class="col-md-2">
									<label class='control-label label1'>Annual Meeting Id </label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Name of Badge</label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label label1'>Date of Registration </label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Status</label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>View</label> 
									</div>
									
								</div>
							</div>

						<%
		   		
						Vector annConRegList=(Vector)request.getAttribute("annConRegList");
						System.out.println("Inside the JSP vector :"+ annConRegList);
						if(annConRegList!=null && annConRegList.size()!=0){ 
						Enumeration enm1=annConRegList.elements();
					  
					  while(enm1.hasMoreElements()){
							String[] s = (String[])enm1.nextElement();
							for (int i=0;i<s.length; i++) {
								System.out.println("Content : "+s[i]);
							}
							
							String annualMeetingId = s[0];
							String badgeInfo = s[1];
							String requestStatus = s[5];
							String dateOfReg1 = s[6];
							String dateOfReg[] = dateOfReg1.split(" ");
														
							System.out.print(" injsp badgeInfo:  "+badgeInfo);
							System.out.print(" requestStatus:  "+ requestStatus);
							System.out.print(" dateOfReg:  "+dateOfReg[0]);

		   %>
		   
		   
		   		<!--==============================Form Body=================================-->

					<form  class='form-horizontal' role='form' name="frmDisplay" method="post" action="./AnnualConRegList.html">		
						<input name="memProcess" type="hidden" value="dispDetail"> 
						<input name="annualMeetingId" type="hidden" value="<%=annualMeetingId%>">
						
						
						<div class='form-group'>
								<div class="col-md-8">
								
									<div class="col-md-2">
									<label class='control-label'><%=annualMeetingId  %></label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label'><%=badgeInfo  %></label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label'><%=dateOfReg[0]%></label> 
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
					  <%		}
						}else {
					%>
					 <div class='form-group'>
                         <div class='col-md-offset-4 '>
                              No  Records are available.
                         </div>
                                    
                     </div>
					 
					<%}%>
					
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

                      
                   
