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
var form = document.getElementById('frmAdvDispLst'); 
mid = form.media.value;
if(mid==""){
document.form.displayStatus.selectedIndex = 0;
alert("Please select media type");
document.form.media.focus();
return false;
}
else if(mid!=null){  
	var form = document.getElementById('frmAdvDispLst'); 
	form.advProcess.value = "viewAdsManifest";
    form.method="post";
    form.action="./advertiseAdmin.html?mid="+mid;
    form.submit();
}

return true;
}

function postDataView(processVal){
	var form = document.getElementById('frmAdvDispLst');
	form.advProcess.value = processVal;
    form.method="post";
    form.action="advertiseAdmin.html";
    form.submit();
}

</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<%
String  mId = (String)request.getAttribute("mid");
if(mId==null || mId.equals("")){
	mId="";
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

<!--==============================================content start here============================================-->
   		 <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
						
								<h2>HLC Advertisement: Admin - Advertisement Request List &amp; Manifest Update and View</h2>
								
						</div>
					<!--==============================Form Title=================================-->

 				 	
							 <div class='panel-body'>
						
					<!--==============================Form Description=================================-->
	
						<p>The Advertisement requests are listed below.
	
	Select a media type to list out all the Approved advertisement requests. To view a manifest click on the View button. To manage a manifest click on the Manage button.  </p> 
	
			<form class='form-horizontal' role='form' name="frmAdvDispLst"  id="frmAdvDispLst">
			<input name="advProcess" type="hidden" value="viewAdsReqest">
				
						<div class='form-group'>
                           	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
											  <select name="media" class="form-control"  onchange="return postData();">
														<option selected="selected" value="">Select One</option>
														<%
															Vector vMedia = (Vector)session.getAttribute("mediaList");
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
									</div>				 
											  </form>			
<!--		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
		      <a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			 </td>
		   </tr>
-->
					
					
				
							<div class="form-group"> 
							
								<div class="col-md-12 gp">
									   
										<div class='col-md-2 col-md-offset-1'>
										
											<label class='control-label label1'>Advertiser</label>
											
										</div>
										
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Advertising Agency</label>
										   
										</div>  
										
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Date Of Request</label>
										   
										</div> 
										   
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>View Manifest</label>
										   
										</div> 
										 
										<div class='col-md-2'>
											
										   <label class='control-label label1'>Manage Manifest</label>
										   
										</div>  
									</div>
							</div>
					
		 
		   <%
			ArrayList vManifestList = (ArrayList)session.getAttribute("activeAdsList");
			if(vManifestList!=null && vManifestList.size()!=0){
						Iterator eDispLst = vManifestList.iterator();
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
						//Debug.print("===============================");
					%>
					
					
						<form class='form-horizontal' role='form' name="frmAdvReqView" action="advertiseAdmin.html" method="post" />
						<input name="advProcess" type="hidden" value="manageManifest">
						<input name="advId" value="<%=advertisementId%>" type="hidden" />
						
						<div class="form-group"> 
							
								<div class="col-md-12 gp">
									   
										<div class='col-md-2 col-md-offset-1'>
										
											<a href="advertiseAdmin.html?advProcess=viewAdsDetail&advId=<%=advertisementId%>" class="linkFive"><%=advertiser%></a>
											
										</div>
										
										<div class='col-md-2'>
											
										   <label class='control-label  '><%=adAgency%></label>
										   
										</div>  
										
										<div class='col-md-2'>
											
										   <label class='control-label  '><%=advReqDate%></label>
										   
										</div> 
										   
										<div class='col-md-2'>
											
										   <button class='btn-sm btn-primary' type="submit" name="manifest" value="Manifest">Manifest</button>
										   
										</div> 
										 
										<div class='col-md-2'>
											
										    <button class='btn-sm btn-primary' type="submit" name="manifest" value="Manage">Manage</button>
										   
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
