<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/frmSponsReg.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<%

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
%>
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
                            <h2>Advertisement: Admin-Manifest Detail Update Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
	
			<p>You are viewing the list of Advertisements posted by this advertiser for all the issues listed below. 
		
		To update a Manifest click on the Update button which should open an interface for updating the details.</p> 
	
						<!--
						<td valign="middle" class="alignLeft">
							<span class="legendTwo">&nbsp;</span> &nbsp;View	
						</td>
						-->
				 

<!--		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
		      <a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			 </td>
		   </tr>
-->

						<div class="form-group"> 
							
								<div class="col-md-12 gp">
									   
										<div class='col-md-2 col-md-offset-1'>
										
											<label class='control-label label1'>Issue Type</label>
											
										</div>
										
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Advertisement Type</label>
										   
										</div>  
										
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Advertisement Sub-Type</label>
										   
										</div> 
										   
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Dimension</label>
										   
										</div> 
										 
										<div class='col-md-2'>
											
										   <label class='control-label label1'>Update Manifest</label>
										   
										</div>  
									</div>
							</div>
		 
							   <%
								ArrayList vAdsDetailList = (ArrayList)request.getAttribute("adsDetailList");
								if(vAdsDetailList!=null && vAdsDetailList.size()!=0){
											Iterator eDispLst = vAdsDetailList.iterator();
											while(eDispLst.hasNext()){
												HLCAdsDetailedVO objAdsDetVO = (HLCAdsDetailedVO)eDispLst.next();
												String advDetailId = objAdsDetVO.getAdvDetailId();
												String mediaId = objAdsDetVO.getMediaId();
												String adsId = objAdsDetVO.getAdsId();
												String mediaName = objAdsDetVO.getMediaName();
												String issueName = objAdsDetVO.getIssueName();
												String dispName = objAdsDetVO.getDispName();
												String dispSubName = objAdsDetVO.getDispSubName();
												String dimName = objAdsDetVO.getDimName();
												String placement = objAdsDetVO.getPlacement();
												String amount = objAdsDetVO.getAmount();
												boolean status = objAdsDetVO.isShowStatus();
											//Debug.print("===============================");
										%>
						
						<form class='form-horizontal' role='form' name="frmAdvReqView" action="advertiseAdmin.html" method="post" />
						<input name="advProcess" type="hidden" value="initUpdateAdsDetail">
						<input name="advDetailId" value="<%=advDetailId%>" type="hidden"/>
						<input name="mediaId" value="<%=mediaId%>" type="hidden"/>
						
						
						<div class="form-group"> 
							
								<div class="col-md-12 gp">
									   
										<div class='col-md-2 col-md-offset-1'>
										
											<label class='control-label'><%=issueName%></label>
											
										</div>
										
										<div class='col-md-2'>
											
										   <label class='control-label '><%=dispName%></label>
										   
										</div>  
										
										<div class='col-md-2'>
											
										   <label class='control-label '><%=dispSubName%></label>
										   
										</div> 
										   
										<div class='col-md-2'>
											
										   <label class='control-label '><%=dimName%></label>
										   
										</div> 
										 
										 		<%
												if(status==true){
												
												%>
										
										<div class='col-md-2'>
										
											<button class='btn-sm btn-primary' type="submit" name="updateManifest" value="Update" >Update</button>
										
										</div>
										
												<%
												}
												else{
												%>
												
										<div class='col-md-2'>
										
										  <button class='btn-sm btn-primary' type="submit" name="updateManifest" value="Update"  disabled="disabled">Update </button>
										</div> 
										
												<%
												}
												%>
										
									</div>
								</div>
						</form>
		   			<%}	
					 }
					else {
					%>
					<div class='form-group'>
								
                                 <div class="container"> 
								   
									   <div class="row"> 
									   
											<div class='col-md-4'>
											</div>
											
											<div class='col-md-4'>
												No records are available 
											</div>
											
										</div>
										
									 </div>
								
								</div>
					<%}%>
<!--		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;

			<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
		   </tr>
-->

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
