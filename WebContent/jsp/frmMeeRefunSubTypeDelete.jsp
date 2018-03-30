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

<script src="js/frmMeeEventTypeEdit.js" type="text/javascript" ></script>


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
                            <h2>Meetings: Update Refund SubType</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                           <div class='col-md-offset-2'>
						   <h2>Delete Refund SubType :</h2>
						   </div>
							
						<!--==============================Form Description=================================-->
							
                            <%
								Vector sEditDim = (Vector)request.getAttribute("deleteEventType");
								if(sEditDim!=null && sEditDim.size()!=0){
								
								
								Enumeration e = sEditDim.elements();
									String eventId = "";
									String eventName = "";
									 
									while(e.hasMoreElements()){
									String[] s = (String [])e.nextElement();
										eventId = s[0];
										eventName = s[1];
							%>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeEventTypeEdit" id="frmMeeEventTypeEdit" action="./refundsubtype.html">
							
                                <input type="hidden" name="process" value="confirmDelete"/>
								<input type="hidden" name="eventId" value="<%=eventId%>">

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Refund Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                 <label class='control-label'><%=eventName%></label>
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<%}	}%>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                       <button name="opType" type="submit" class="btn-lg btn-primary" value="ConfirmDelete" onclick="return advDimEditCheck();" >ConfirmDelete</button>
                                    </div>
                                    <div class='col-md-2'>
                                      
										 <button name="opType"   type="button" class="btn-lg btn-danger" value="Cancel" onclick="javascript:history.back(-1);" >Cancel</button>
                                    </div>
                                </div>
								
                            </form>
							
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
