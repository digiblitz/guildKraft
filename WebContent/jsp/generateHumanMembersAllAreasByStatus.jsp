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
                            <h2>Human Members - All Areas and <%=(String)request.getAttribute("status") %> Status</h2>
							</div>
							
							 <div class='panel-body'>
							 
							 <div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>From Date:<%=(String)request.getAttribute("StartDate")%>&nbsp;&nbsp;&nbsp;&nbsp;To Date:<%=(String)request.getAttribute("EndDate")%></label>
                           
                                <!-- CONTENTS START HERE -->
								<% String graphNew=(String)request.getAttribute("graphsCount");
								           String graph[]=graphNew.split(",");
										   int arrayLen=graph.length;
										   if(arrayLen==4) {
								 %>
                               
                             <div class='col-md-8'>
             					<div class='col-md-3 indent-small'>
                					<div class='form-group internal'>
										<img src="images/barMarker.png" width="500" height="400" border="2"  ></img>

										</div>
									</div>
								</div>
								
								
								
						<div class='col-md-8'>
             				<div class='col-md-3 indent-small'>
               					 <div class='form-group internal'>
									<img src="images/plotformat.png" width="500" height="400"  border="2" ></img>

									</div>
								</div>
							</div>
									
								
							<div class='col-md-8'>
             					<div class='col-md-3 indent-small'>
                					<div class='form-group internal'>	
										<img src="images/tube.png" width="500" height="400" border="2"  ></img>
									</div>
								</div>
							</div>
									
							
							<div class='col-md-8'>
             					<div class='col-md-3 indent-small'>
                					<div class='form-group internal'>
										<img src="images/pie.png" width="500" height="400" border="2"   ></img>
									</div>
								</div>
							</div>
						</div>
								<% } else if(arrayLen==2) { %>
							<div class='form-group'>
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
								<% for(int i=0;i<arrayLen;i++) { %>
                             <div class='col-md-8'>
             					<div class='col-md-3 indent-small'>
                					<div class='form-group internal'>
										<img src="images/<%=graph[i]%>.png" width="500" height="400" border="2"  ></img>
        
										</div>
									</div>
								</div>
									<% } %> 
									
							  
									<% } else if(arrayLen==3) { %>
									
                                    <!-- <tr>
                                         <td colspan="2" class="tblMainHead"><strong>Create</strong> Project: <span class="styleBoldTwo">Compose a Message </span></td>
                                   </tr> -->
								   <% for(int i=0;i<arrayLen;i++) { 
									   if(i<=1) { %>
                             <div class='col-md-8'>
             					<div class='col-md-3 indent-small'>
                					<div class='form-group internal'>
										<img src="images/<%=graph[i]%>.png" width="500" height="400" border="2"  ></img>
        							</div>
								</div>
							</div>
									<% }  else { %>
							<div class='col-md-8'>
             					<div class='col-md-3 indent-small'>
                					<div class='form-group internal'>
										<img src="images/<%=graph[i]%>.png" width="500" height="400" border="2"  ></img>
        
										</div>
									</div>
								</div>
									<% } } %>
				  
									<% } else if(arrayLen==1) { %>
							
							<div class='col-md-8'>
             					<div class='col-md-3 indent-small'>
                					<div class='form-group internal'>
									<img src="images/<%=graph[0]%>.png" width="500" height="400" border="2"  ></img>
 									</div>
								</div>
							</div>
									<% } %>
			 <div class='col-md-offset-3 col-md-2'>
                   <button class='btn-lg btn-primary' type='submit' value="close" name="close" onclick="window.close('HorseMemberReports');return false;">Close</button>
				 </div>
				</div>
                   
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
