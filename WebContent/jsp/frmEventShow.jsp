<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 <script type="text/javascript" src="scripts/menuExpandable.js"></script>
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
                            <h2>Upcoming Events</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>

							<%
								ArrayList ValueList = (ArrayList)request.getAttribute("eveList");
							
								if((ValueList!=null && ValueList.size()!=0)){
									Iterator itr = 	ValueList.iterator();
										while(itr.hasNext()) {	
											String[] HLCEventDetails = (String [] ) itr.next();
										//State Masters
											String eveid  = HLCEventDetails[0];
											String tittle  = HLCEventDetails[1];
											String begin  = HLCEventDetails[2];
											String days = HLCEventDetails[3];
											String end  = HLCEventDetails[4];
											String location  = HLCEventDetails[5];
										
							%>
							<form class='form-horizontal' role='form' id="form" name="insert" action="eventRegList.html?cmd=initregister" method="post" >
							
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'><%=tittle%></label>
								</div>
							
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>when</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=begin%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=location%></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>	
							 
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration</label>
							</div>
							
							 <div class='form-group'>
							 	<div class='col-md-offset-2'>
								<input type="radio" size="10" name="ticket" id="ticket" value="member_ticket"  />Member ticket â€“ $80.00 (USD)
								</div>
								<div class='col-md-offset-2'>	
								<input type="radio" size="10" name="ticket" id="ticket" value="reguler_ticket"  />Regular ticket â€“ $100.00 (USD)
								</div>
							</div>
							
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Register">Register</button>
                                    </div>
                                </div>
										
								
								</form>
								<%
											}
								} 
								else{
							   %>
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-3'>
                                       No Event Found!
                                    </div>
                                </div
								
							<% } %>				

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
