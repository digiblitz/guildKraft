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
<%@ page import="java.util.*" %> 
<script language="javascript">
function postData(dispId){
 
	frmMeeRefundRuleListing.method="post";
	frmMeeRefundRuleListing.action="./actionRefundRuleOne.html?process=list&status="+dispId;
	frmMeeRefundRuleListing.submit();
}	
</script>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

		<%
		String  status = (String)request.getAttribute("status");
		if(status==null || status.equals("")){
			status="";
		}
	%>

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
                            <h2>Meetings: Refund Rule Detail</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>To edit a Refund Rule Type Name click on 'Edit' button.</p>
							
						<!--==============================Form Description=================================-->
							
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeRefundRuleListing" method="post" action="./actionRefundRuleOne.html" />
							
                                

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<select name="status" class="selectboxOne" onchange="postData(this.value);">
												<%
													if(status.equals("")){
												%>
												<option value="" selected="selected" >Select One</option>
												<%
													}
													else{
												%>
													<option value="" >Select One</option>
												<%
													}%>
												<%
													if(status.equals("activate")){
												%>
												<option value="activate" selected="selected" >Activated</option>
												<%
													}
													else{
												%>
													<option value="activate" >Activated</option>
												<%
													}
													if(status.equals("deactivate")){
												%>
												<option value="deactivate" selected="selected" >Deactivated</option>
												
												<%
												}
												else{
												%>
													<option value="deactivate" >Deactivated</option>
												<%
												}
												%>
										</select>		
                                            </div>
                                        </div>

                                    </div>
                                </div>
							</form>
							
							<div class='form-group'>
								<div class='col-md-8'>
								
									<div class='col-md-3'>
									 <label class='control-label label1'>Refund Rule Type Name</label>
									</div>
									
									<div class='col-md-2'>
									 <label class='control-label label1'>Status</label>
									</div>
									
									<div class='col-md-2'>
									 <label class='control-label label1'>Edit</label>
									</div>
									
								</div>
							</div>	
							
							
							<%
		   		
							 Vector refundListView=(Vector)request.getAttribute("RefundAllList");
							 if(refundListView!=null && refundListView.size()!=0){ 
							 Enumeration itRefund = refundListView.elements();
							  while(itRefund.hasMoreElements()){
									String [] refundRuleDetail  = (String[]) itRefund.nextElement();
									String refundId = refundRuleDetail[0];
									String refundName = refundRuleDetail[1];
									String refundStatus= refundRuleDetail[2];
									String refundDate = refundRuleDetail[3];
									String val = "";
						%>
							<form class='form-horizontal' role='form' name="frmMeeRefundRuleListed" method="post" action="./actionRefundRuleOne.html" /> 
							<input name="process" type="hidden" value="view">	
							<input name="refundId" type="hidden" value="<%=refundId%>">
							<input name="refundName" type="hidden" value="<%=refundName%>" >
								
								<div class='form-group'>
								<div class='col-md-8'>
								
									<div class='col-md-3'>
									 <label class='control-label'><%=refundName%></label>
									</div>
									
									<% if(refundStatus.equalsIgnoreCase("0")){ %>
									
									<div class='col-md-2'>
									 <button name="btnSubmit" type="submit"  class="'btn-lg btn-primary" value="Activate">Activate</button>
									</div>
									
									<%} else if(refundStatus.equalsIgnoreCase("1")){	%>
									
									<div class='col-md-2'>
									 <button name="btnSubmit" type="submit"  class="btn-lg btn-danger" value="Deactivate">Deactivate</button>
									</div>
									
									  <%}%>
									  <div class='col-md-2'>
										<button name="btnSubmit" type="submit"  class="btn-lg btn-primary" value="Edit">Edit</button>
									</div>
									  
								</div>
							</div>	

                         
								
                        </form>
						
						
						 <%	}}else {%>
						 
								<div class='form-group'>
                                    <div class='col-md-offset-4'>
                                       No Records are available. 
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
