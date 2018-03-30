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
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmAdvMag.js" type="text/javascript" ></script>
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
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Advertisement: Published Advertisement Manifest Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
	  
	
  				  <p>	You are viewing the updated and published details of all advertisements requested by you for all issues selected. </p>
  						
						
						<%
	      
					   			String advDetailId = "";
								String mediaId = "";
								String adsId = "";
								String mediaName = "";
								String issueName = "";
								String dispName = "";
								String dispSubName = "";
								String dimName = "";
								String placement = "";
								String amount = "";
								String manifestId ="";
					   			String pubAdvDetailId = "";
								String pubAdvId =  "";
								String pubDimId = "";
								String pubDimType = "";
								String pubDispSubType = "";
								String pubDispType = "";
								String pubIssueId = "";
								String pubIssueName = "";
								String pubMapId = "";
								String pubMediaId =  "";
								String pubMedianame = "";
								String pubPageNo = "";
								String pubIns = "";
								String pubPlacement = "";
	
	%>
	
					<p>Updated and Published Manifest Details:</p>
				 
	<%
	
	 ArrayList vAdsDetailList = (ArrayList)request.getAttribute("manifestDetailList");
					if(vAdsDetailList!=null && vAdsDetailList.size()!=0){
					Iterator eDispLst = vAdsDetailList.iterator();
							while(eDispLst.hasNext()){
									ArrayList al = (ArrayList)eDispLst.next();
									Iterator it = al.iterator();
										while(it.hasNext()){
												HLCAdsDetailedVO objAdsDetVO = (HLCAdsDetailedVO)it.next();
														  advDetailId = objAdsDetVO.getAdvDetailId();
														if(advDetailId!=null){
														  mediaId = objAdsDetVO.getMediaId();
														  adsId = objAdsDetVO.getAdsId();
														  mediaName = objAdsDetVO.getMediaName();
														  issueName = objAdsDetVO.getIssueName();
														  dispName = objAdsDetVO.getDispName();
														  dispSubName = objAdsDetVO.getDispSubName();
														  dimName = objAdsDetVO.getDimName();
														  placement = objAdsDetVO.getPlacement();
														  if(placement==null || placement.equals("")){
														   placement ="NA";
														  }
														  amount = objAdsDetVO.getAmount();
														}
														
														HLCManifestVO objmanifest = (HLCManifestVO)it.next();
														  manifestId = objmanifest.getAdvManifestId();
														 if(manifestId!=null){
														   pubAdvDetailId = objmanifest.getAdvDetailId();
														   pubAdvId =  objmanifest.getAdvertisementId();
														   pubDimId = objmanifest.getDimId();
														   pubDimType = objmanifest.getDimensionTypeName();
														   pubDispSubType = objmanifest.getDisplaySubTypeName();
														   pubDispType = objmanifest.getDisplayTypeName();
														   pubIssueId = objmanifest.getIssueId();
														   pubIssueName = objmanifest.getIssueName();
														   pubMapId = objmanifest.getMapId();
														   pubMediaId =  objmanifest.getMediaId();
														   pubMedianame = objmanifest.getMediaName();
														   pubPageNo = objmanifest.getPageNo();
														   pubIns = objmanifest.getSplInstructions();
														   pubPlacement = objmanifest.getPlacement();
												     }

		%>
						 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Published Issue: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=issueName%></label>
											</div>
										</div>
									</div>
										
								</tr>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Applied Issue:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=issueName%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Types:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=dispName%></label>
											</div>
										</div>
									</div>
								
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Types:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=dispSubName%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Applied Ad Dimension:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=dimName%></label>
											</div>
										</div>
									</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Published Ad Dimension:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=dimName%></label>
											</div>
										</div>
									</div>
								
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Applied Placement:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=placement%></label>
											</div>
										</div>
									</div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Published Placement:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=pubPlacement%></label>
											</div>
										</div>
									</div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Published Page Number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=pubPageNo%></label>
											</div>
										</div>
									</div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Special Instructions:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label"><%=pubIns%></label>
											</div>
										</div>
									</div>
								</div>
								
						   <%}}%>			
				<%}else{%>
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
				  
				  		 			<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-3'>
                                        <button class='btn-lg btn-primary' name="status" type="button" value="Back To Listing" onclick="javascript:history.back(-1);" >Back To Listing</button>
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
