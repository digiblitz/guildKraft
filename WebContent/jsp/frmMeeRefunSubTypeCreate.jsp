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

<script src="js/frmAdvertise.js" type="text/javascript" ></script>
<script src="js/frmRefundSubType.js" type="text/javascript" ></script>

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
                            <h2>Meetings: Create Refund SubType  Level.</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Please create the required Refund SubType level Names.</p>
							
						<!--==============================Form Description=================================-->
							
                          
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmAdvDimensionAdd" id="frmAdvDimensionAdd" action="./refundsubtype.html" onsubmit="return myvalidate();">
							
                               <input type="hidden" name="process" value="newSubType">
							   <p>Required fields are marked with an asterisk<span style="color:#FF0000;">*</span></p>
							   
							   <% String statuscheck = (String)request.getAttribute("err");
										
								if(statuscheck!=null && statuscheck.equals("st")){
								%>
								
								<p id='p_error'>Refund SubType Level  Name Already Exists. Try it Again</p>
								
								<%}%>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Refund Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="txtRefundSubName" id="refundName" class="form-control"  />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Text Box Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="radio" name="rdstatus" readonly="true" value="true"  />  Yes 
										
										  		<input type="radio" name="rdstatus" value="false" checked="checked"  /> No
										 
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'type="submit"  value="Create">Create</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="reset"  value="Reset">Reset</button>
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
