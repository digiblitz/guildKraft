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
<%@ page import="java.sql.*"%>
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
                            <h2>Meetings: Insurance Release  ICP Registration Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Insurance Release ICP Registerations placed by you are listed below. To view the details,
					click on the 'View' button beside each record.</p>
							
						<!--==============================Form Description=================================-->
							<div class="from-group">
								<div class="col-md-8">
								
									<div class="col-md-2">
									 <label class='control-label label1'>Meeting ID</label>
									</div>
									
									<div class="col-md-3">
									 <label class='control-label label1'>Date of Registration</label>
									</div>
									
									<div class="col-md-2">
									 <label class='control-label label1'>Approval Status</label>
									</div>
									
									<div class="col-md-2">
									 <label class='control-label label1'>View</label>
									</div>
									
								</div>
							</div>
							
									<%
										Vector icpList=new Vector(); 
																	icpList=(Vector)request.getAttribute("usrDetail");
																	System.out.println("size :"+icpList.size());
																	
										if(icpList!=null && icpList.size()!=0)
										{
																	  Enumeration en=icpList.elements();    
																		
										while(en.hasMoreElements())
										{
																			  String[] icpVal = (String[])en.nextElement();
																			  String dat1=icpVal[4];
											  String[] dat=dat1.split(" ");
                                     %>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeUserICPRegiList" method="post" action="IcpUsrList.html?process=view">
							
                               <input type="hidden" value="<%=icpVal[7]%>" name="releaseId" />

                                <div class="from-group">
								<div class="col-md-8">
								
									<div class="col-md-2">
									 <label class='control-label'><%=icpVal[0]%></label>
									</div>
									
									<div class="col-md-3">
									 <label class='control-label'><%=dat[0]%></label>
									</div>
									
									<div class="col-md-2">
									 <label class='control-label'><%=icpVal[6]%></label>
									</div>
									
									<div class="col-md-2">
									
									<button class='btn-lg btn-primary' type='submit' name="Submit" value="View">View</button>
									</div>
									
								</div>
							</div>
							
                            </form>
							
							<%}}else{%>
							
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                      No Records Found !
                                    </div>
                                    
                                </div>
								
							 <% }%>
							
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
