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
<script language="javascript">

function postData(){
mid = document.frmAdvDispLst.media.value;
if(mid==""){
document.frmAdvDispLst.displayStatus.selectedIndex = 0;
alert("Please select media type");
document.frmAdvDispLst.media.focus();
return false;
}

else if(mid!=null){  
	document.frmAdvDispLst.advProcess.value = "viewAdsReqest";
    document.frmAdvDispLst.method="post";
    document.frmAdvDispLst.action="./advertiseAdmin.html?mid="+mid;
    document.frmAdvDispLst.submit();
}

return true;
}

</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<%
String  mId = (String)request.getAttribute("mid");
if(mId==null || mId.equals("")){
	mId="";
}
String  status = (String)request.getAttribute("status");
if(status==null || status.equals("")){
	status="";
}
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
						<h2>Advertisement: Advertisement Request Listing</h2>
						</div> 
					<!--==============================Form Title=================================-->

 						 <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						

		 	<p>The Advertisement requests are listed as follows. 
		
		Select a media type and view the Advertisement Request Details.</p>
		
	
			<form class='form-horizontal' role='form' name="frmAdvDispLst" >
			<input name="advProcess" type="hidden" value="viewAdsReqest">
				
				 <div class='form-group'>
                            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type: </label>
								<div class='col-md-8'>
                                       <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
					 					 <select name="media" class="form-control"  >
											<option selected="selected" value="">Select One</option>
								<%
									Vector vMedia = (Vector)session.getAttribute("displayMediaTypeSesssion");
									if(vMedia!=null && vMedia.size()!=0){
										Enumeration emedia = vMedia.elements();
										String mediaId = "";
										String mediaName = "";
										String mediaDesc  = "";
										String mediaStatus = "";
										while(emedia.hasMoreElements()){
											String[] s = (String [])emedia.nextElement();
											mediaId = s[0];
											mediaName = s[1];
											mediaDesc  = s[2];
											mediaStatus = s[3];
											if(mediaId.equals(mId)){
									%>
									<option value="<%=mediaId%>" selected="selected"><%=mediaName%></option>
									<%}
									else{
									%>
									 <option value="<%=mediaId%>"><%=mediaName%></option>
									<%		
									}
									}
									}%>
							 </select>
							 
								 </div>
							</div>
						</div>
						
					  <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Status </label>
					  		<div class='col-md-8'>
                                      <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
					 
											  <select name="status" id="displayStatus" class="form-control" onchange="return postData();">
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
							if(status.equals("Active")){
						%>
						<option value="Active" selected="selected" >Active</option>
						
						<%
						}
						else{
						%>
							<option value="Active" >Active</option>
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
			  </form>
					<div class="margin marginn">
							
							<div class="form-group"> 
							
								 	<div class="col-md-8 gp">
								
										<div class="container">
										
													<div class='col-md-1'>
													</div>
										  
													<div class='col-md-2'>
														<label class='control-label label1'>Advertiser</label>
													</div>
													<div class='col-md-3'>
														<label class='control-label label1'>Advertising Agency</label>
													</div>
													<div class='col-md-3'>
														<label class='control-label label1'>Date Of Request </label>
													</div>
													
													<div class='col-md-3'>
														<label class='control-label label1'>View</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								



		   <%
			ArrayList vPendingAds = (ArrayList)session.getAttribute("displayPendingAds");
			if(vPendingAds!=null && vPendingAds.size()!=0){
						Iterator eDispLst = vPendingAds.iterator();
						while(eDispLst.hasNext()){
						 	HLCAdvertiserVO objAdv = (HLCAdvertiserVO)eDispLst.next();
							String advertisementId = objAdv.getAdvertisementId();
							String userId1 = objAdv.getUserId();
							String advertiser = objAdv.getAdvertiser();
							String adAgency = objAdv.getAdAgency();
							String advReqDate = "";
							if(objAdv.getAddDate()!=null){
								advReqDate = sdf.format(objAdv.getAddDate());
							}
							
						
					%>
						<form class='form-horizontal' role='form' name="frmAdvReqView" action="advertiseAdmin.html" method="post" />
						<input name="advProcess" type="hidden" value="viewAds">
						<input name="advId" value="<%=advertisementId%>" type="hidden" />
						 
					<div class="margin marginn">
							
							<div class="form-group"> 
							
								 	<div class="col-md-8 gp">
								
										<div class="container">
										
													<div class='col-md-1'>
													</div>
											
													<div class='col-md-2'>
														<label class='control-label'><%=advertiser%></label>
													</div>
													<div class='col-md-3'>
														<label class='control-label'><%=adAgency%></label>
													</div>
													<div class='col-md-3'>
														<label class='control-label'><%=advReqDate%></label>
													</div>
													<div class='col-md-3'>
														 <button class='btn-lg btn-primary' name="Submit5" value="View"  type='submit'>View</button>
													</div>
												</div>
											</div>
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
									   
										<div class='col-md-10'>
											<div class='col-md-5'>
											</div>
											<div class='col-md-5'>
												</p>No records are available </p>
											</div>
										</div>
									 </div>
								</div>
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

