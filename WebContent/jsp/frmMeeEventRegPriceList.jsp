<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="javascripts/frmMeeICPAssessment.js" type="text/javascript" ></script>
<script language="javascript">

	function validatePriceList(){
		if(document.frmMeePriceMaster.selPriceType.value==""){
			alert("Please select any one Price Type.");
			document.frmMeePriceMaster.selPriceType.focus();
			return false;
		}
		
		return true;
	}

</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<%
	String priceTypeId1 = (String) request.getAttribute("priceTypeId");
	
	

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
<!--==============================================content start here============================================-->
 <div class="col-md-10">
			
                  <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					   <!--==============================Form Title=================================-->
                         <div class='panel-heading'>
					  
					        <h2>Meetings: Price Details List</h2>
						</div>
						
				 <!--==============================Form Title=================================-->
						
						 <div class='panel-body'>

			  
				 <!--==============================Form Description=================================-->
				 <form name="frmMeePriceMaster" id="frmMeePriceMaster" action="eventRegPriceCRUD.html" method="post"  onsubmit="return validatePriceList(this);">
					<input type="hidden" name="cmd" value="listDetails">
						
						<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Price Type:</label>
								<div class='col-md-8'>
           							<div class='col-md-3 indent-small'>
               							<div class='form-group internal'>
								      
							          		<select name="selPriceType" id="selPriceType" class="form-control">
												<option selected="selected" value="">Select One</option>
										<%
										ArrayList priceDetails = (ArrayList)request.getAttribute("priceList");
										if(priceDetails!=null && priceDetails.size()!=0){
										Iterator itr= priceDetails.iterator();
										while(itr.hasNext()){
										String[] s = (String[]) itr.next();
										String priceId = s[0];
										String priceName = s[1];
										if(priceId!=null && priceId.equalsIgnoreCase(priceTypeId1)){
										%>
											<option value="<%=priceId%>" selected="selected" ><%=priceName%></option>
										<%}else{%>
											<option value="<%=priceId%>" ><%=priceName%></option>
										<%}}}%>
										</select> <span class="asterisk" id="span_astriesk">*</span>
										
										</div>
									</div>
								</div>
									
								<div class="container">
									<div class="row">
										<div class='col-md-offset-4 col-md-1'>
											<button class='btn-lg btn-primary' type='submit' value="Submit">Submit</button>
									</div>
								</div>
							</div>
						</div>
							 
										
						 </form>
								
						<div class='form-group'>
							<div class="col-md-12 gp">
							
									 <div class='col-md-offset-1 col-md-2 '>
										<label class='control-label label1 text-center'>Season </label>
									</div>
									
									<div class='col-md-2 '>
										<label class='control-label label1 text-center'>Due Date Price</label>
									</div>
									
									<div class='col-md-3  '>
										<label class='control-label label1 text-center'>After Due Date Price</label>
									</div>
									
									<div class='col-md-2 '>
										<label class='control-label label1 text-center'>View</label>
									</div>
									
									<div class='col-md-1 '>
										<label class='control-label label1 text-center'>Edit</label>
									</div>
								</div>
							</div>
								
					<%
		   		
					 ArrayList priceListView=(ArrayList)request.getAttribute("allPriceList");
					 if(priceListView!=null && priceListView.size()!=0){ 
					 Iterator itPrice = priceListView.iterator();
					  while(itPrice.hasNext()){
						    String [] priceDetail  = (String[]) itPrice.next();
							String priceId = priceDetail[0];
							String priceTypeId = priceDetail[1];
							String seasonName = priceDetail[2];
							String dueDatePrice = priceDetail[3];
							String afterDueDatePrice = priceDetail[4];
				
		             %>
							<form name="frmDisplayAdminList" method="post" action="eventRegPriceCRUD.html">		
							<input name="cmd" type="hidden" value="viewEditPriceList">
							<input name="priceId" type="hidden" value="<%=priceId%>">
						  
							  <div class='form-group'>
								
								<div class="col-md-12 gp ">
									
										<div class='col-md-offset-1 col-md-2 '>
                                   			<label class='control-label text-center'><%=seasonName%></label>
										</div>
										
										<div class='col-md-2  '>
                                   			<label class='control-label text-center'><%=dueDatePrice%></label>
										</div>
										
										<div class='col-md-3 '>
                                   			<label class='control-label text-center'> <%=afterDueDatePrice%> </label>
										</div>
										
										<div class='col-md-2 '>
                                       		 <button class='btn-sm btn-primary' type='submit' name="btnSubmit" value="View">View</button>
										</div>
										
										<div class='col-md-1  '>
                                       		 <button class='btn-sm btn-primary' type='submit' name="btnSubmit" value="Edit">Edit</button>
										</div>
									
								</div>
							</div>
						
								
					</form>
		   
					      <%	}
									}else {
								%>
								   <div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
									   		<div class='col-md-4'>
											
											</div>
									   
											<div class='col-md-4'>
										
					 							<p>No records are available. </p>
												
											</div>
											
										</div>
									</div>
                             </div>
						
								<%}%>

					 <!--==============================================import content code end here============================================-->
	  			 				
							
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
