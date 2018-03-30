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
	frmMeeOrgUserICPRegiListing.method="post";
	frmMeeOrgUserICPRegiListing.action="IcpOrgRegList.html?process=list&status="+dispId;
	frmMeeOrgUserICPRegiListing.submit();
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
                            <h2>Meetings: Organizer Insurance  Release  ICP Registration Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                   			<p>Insurance Release ICP Registerations placed by the users are listed below. To view the details,click on the 'View' button beside each record.</p>
							
						<!--==============================Form Description=================================-->
							
							<form class='form-horizontal' role='form' name="frmMeeOrgUserICPRegiListing" method="post" action="IcpOrgRegList.html">
                             <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
								   <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												
												<select name="status" class="selectboxOne" onchange="postData(this.value);">
													<option selected="selected" value="">Select One</option>
													<%
														if(status.equals("Pending")){
													%>
													<option value="Pending" selected="selected" >Pending</option>
													<%
														}
														else{
													%>
														<option value="Pending" >Pending</option>
													<%
														}
														if(status.equals("Approved")){
													%>
													<option value="Approved" selected="selected" >Approved</option>
													
													<%
													}
													else{
													%>
														<option value="Approved" >Approved</option>
													<%
													}
													if(status.equals("Rejected")){
													%>
													
													<option value="Rejected" selected="selected" >Rejected</option>
													<%
													}
													else{
													%>
													<option value="Rejected" >Rejected</option>
													<%
													}
													%>
											</select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
							
								
								<div class='form-group'>
									<div class="col-md-8">
									
									<div class="col-md-2">
									 <label class='control-label label1'>First Name</label>
									</div>
									
									<div class="col-md-2">
									 <label class='control-label label1'>Last Name</label>
									</div>
									
									<div class="col-md-3">
									 <label class='control-label label1'>Date of Registration</label>
									</div>
									
									<div class="col-md-2">
									 <label class='control-label label1'>View</label>
									</div>
									
								</div>
							</div>
							
							<% Vector orgList=new Vector(); 
                           orgList=(Vector)request.getAttribute("orgList");
							if(orgList!=null && orgList.size()!=0){
								System.out.println("size in jsp :"+orgList.size());
								Enumeration en=orgList.elements();    
								while(en.hasMoreElements())
									{
											String[] icpVal = (String[])en.nextElement();
											String dat1=icpVal[6];
											String[] dat=dat1.split(" ");	%>
									<input type="hidden" name="process" value="view">	
									<input name="relId" type="hidden" value="<%=icpVal[9]%>" />
									
								<div class='form-group'>
									<div class="col-md-8">
									
									<div class="col-md-2">
									 <label class='control-label'><%=icpVal[2]%></label>
									</div>
									
									<div class="col-md-2">
									 <label class='control-label'><%=icpVal[3]%></label>
									</div>
									
									<div class="col-md-3">
									 <label class='control-label'><%=dat[0]%></label>
									</div>
									
									<div class="col-md-2">
									<button name="process" type="button" class="btn-sm btn-primary" value="view" onclick="javascript:location.href('IcpOrgRegList.html?process=view&relId=<%=icpVal[9]%>');">view</button>
									</div>
									
								</div>
							</div>
							
							<%}}else{%>

                                <div class='form-group'>
                                    <div class='col-md-offset-4'>
                                       No Records Found !
                                    </div>
                                    
                                </div>
								
								 <% }%>
								
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
