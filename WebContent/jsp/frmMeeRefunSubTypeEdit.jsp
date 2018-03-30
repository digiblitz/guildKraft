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
                            <h2> Meetings: Update Refund SubType Level</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Required fields are marked with an asteriskk<span style="color:#FF0000;">*</span></p>
							
						<!--==============================Form Description=================================-->
							
                            <% String statuscheck = (String)request.getAttribute("err");
				
							if(statuscheck!=null && statuscheck.equals("st")){
							%>
							
							<p id='p_error'>Refund SubType Level Already Exists. Try it Again</p>
							
							<%}%>
							
							<%
								String[] sEditDim = (String[])request.getAttribute("editRefundSublevel");
								String refundEditId = "";
								String refundEditName = "";
								String activityStatus = "";
								
								String refundtxtStatus = "";
								 if(sEditDim!=null){
									 refundEditId = sEditDim[0];
									 refundEditName= sEditDim[1];
									 activityStatus = sEditDim[2];
									 refundtxtStatus = sEditDim[4];
									 System.out.println("refundEditId in Edit jsp:"+refundEditId);
									 System.out.println("refundEditName in Edit jsp:"+refundEditName);
									 System.out.println("activityStatus in Edit jsp:"+activityStatus);
									 System.out.println("refundtxtStatus in Edit jsp:"+refundtxtStatus);
									 
							   }
							  
						%>
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmAdvDimensionAdd" id="frmAdvDimensionAdd" action="./refundsubtype.html" onsubmit="return myvalidate();">
							
                                <input type="hidden" name="process" value="Update"/>
								<input type="hidden" name="refundListId" value="<%=refundEditId%>">

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Refund Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" id="refundName" name="refundListName" class="form-control" value="<%=refundEditName%>"  />
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
                                               <%
													if(refundtxtStatus.equalsIgnoreCase("1")){
													%>
													<input type="radio" name="rdstatus" readonly="true" value="true" checked="checked" /> Yes 
													<%}else{%>
													 <input type="radio" name="rdstatus"  value="true" /> Yes
													 <%}%>
													<%
													if(refundtxtStatus.equalsIgnoreCase("0")){
													%>
													  <input type="radio" name="rdstatus" value="fasle" checked="checked"  />No
													 <%}else{%>
													 <input type="radio" name="rdstatus"  value="fasle" /> No
												<%}%> 
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="advDimButton"  value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="advDimButton" type="button" value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
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
