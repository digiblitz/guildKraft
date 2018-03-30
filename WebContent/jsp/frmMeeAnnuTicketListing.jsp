<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlcmro.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

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
                            <h2>Meetings: Annual Ticket Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Color Legends:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'>Edit</label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
								<div class="col-md-8">
								
									<div class="col-md-2">
									<label class='control-label label1'>Activity Name</label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label label1'>Total Available Tickets</label> 
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Edit </label> 
									</div>
									
								</div>
							</div>
						
						  
				 
							 <% 
								ArrayList tkt_list = new ArrayList();
								tkt_list=(ArrayList)request.getAttribute("details");
							 
								if(tkt_list!=null && tkt_list.size()!=0)
									{
									   System.out.println("size in jsp :"+tkt_list.size());
									   Iterator itr = tkt_list.iterator();
									   while(itr.hasNext())
									   {
											String[] tktVal = (String[])itr.next();
											String annualTId = tktVal[0];
			//								out.print(annualTId);
											String availTicket = tktVal[1];
											String meeId  = tktVal[2];
											String meeName = tktVal[3];
							  %>
				 			
							
							<div class='form-group'>
								<div class="col-md-8">
								
									<div class="col-md-2">
									<label class='control-label'><%=meeName%></label> 
									</div>
									
									<div class="col-md-3">
									<label class='control-label'><%=availTicket%></label> 
									</div>
									
									<div class="col-md-2">
									<button name="submit" type="button" class="btn-sm btn-primary" onclick="javascript:location.href('./AnnualTcktDetails.html?process=edit&act_typ=<%=annualTId%>');" value="Edit">Edit</button>
									</div>
									
									
								</div>
							</div>
		 
					 
							<%}}else{%>
	  	 
								  <div class='form-group'>
                                    <div class='col-md-offset-4 '>
                                       No  Records are available.
                                    </div>
                                    
                                </div>
								
								  <%}  %>
						  
					
							
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
