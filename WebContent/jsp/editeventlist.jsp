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
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Event Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
					
					
						<div class='panel-heading'>
                            <h2>Edit Event Details</h2>
                        </div>
                        
						<div class='panel-body'>
				
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  id="form" width="800px" name="insert" align="center" action="eventcal.html?cmd=updateevedet" method="post" onSubmit="return onValidate();">
							
							
                              
                                <div class='form-group'>
                                   
									<%
									
									ArrayList geteventditdet = (ArrayList)request.getAttribute("geteventditdet");
									if(geteventditdet!=null && geteventditdet.size()!=0){
										Iterator itr = geteventditdet.iterator();
										while(itr.hasNext()){
											String userlist[] = (String[])itr.next();
											
											String eventpay_id=userlist[0];
											String event_id = userlist[1];	
											String event_name = userlist[2];
											
											
								%>
								<input type="hidden" name="coupon_id" value="<%=eventpay_id %>"/>
								<input type="hidden" name="coupon_code" value="<%=event_id %>"/>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="event_id" id="coupon" class="form-control" value="<%=event_id%>" onChange="ValidateEmail('email');" readonly> 
                                            </div>
                                        </div>

                                    </div>
                                    
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="event_name" id="coupon" class="form-control" value="<%=event_name%>" readonly> 
                                            </div>
                                        </div>

                                    </div>
                                    
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="event_amount" id="event_amount" class="form-control"> 
                                            </div>
                                        </div>

                                    </div>
								<%
								}
								}
				
								%>	
									
							 <div class='form-group'>
                            <div class='col-md-offset-4 col-md-1'>
                              <button class='btn-lg btn-primary' type='submit'  value="update" name="submit">Update</button>
                           </div>
                           </div>    
                                </div>
								
                            </form>
							
								<!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				
            </div>
			
			

        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
