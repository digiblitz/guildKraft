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
<script src="js/frmAdvManifest.js" type="text/javascript" ></script>
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
                            <h2>Advertisment: Update Advertisement Manifest</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		<p>To update the selected 'Applied Issue' advertisement, fill-in the following details and click on the Update button  </p>
  
	
		<form name="frmAdvManifestUpdate" class='form-horizontal' role='form' method="post" action="advertiseAdmin.html" onsubmit="return manifestUpdate();" >
		<input name="advProcess" type="hidden" value="updateManifest" />

					
			
					<%
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
					HLCManifestVO objmanifest = (HLCManifestVO)session.getAttribute("manifestDetailList");
							
							 
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
							
				  <p>Required fields are marked with an asterisk<span style="color:#FF0000">*</span>
				   
				   		<div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<label class='control-label'><%=pubDispType%></label>
											</div>
										</div>
									</div>
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<label class='control-label'><%=pubDispSubType%></label>
											</div>
										</div>
									</div>
						 
						 
						  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Issue Type:</label>
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="selIssue" id="chkIssueId" class="form-control">
													  <option value="">Select One</option>
													 <%
													Vector issueDet = (Vector)session.getAttribute("DisplayIssueDetails");
													if(issueDet!=null && issueDet.size()!=0){
															Enumeration eIssueLst1 =issueDet.elements();
															while(eIssueLst1.hasMoreElements()){
																String[] sIss = (String [])eIssueLst1.nextElement();
																String issue_id=sIss[0];
																String issue_name1=sIss[1];
																String media_id1=sIss[2];
																
													   if(issue_id.equals(pubIssueId)){
														%>
														<option value="<%=issue_id%>" selected="selected"><%=issue_name1%></option>
														<%
														}
														else{
														%>
													<option value="<%=issue_id%>"><%=issue_name1%></option>
														<%		
														}
														}
														}%>
												 </select>
												 <span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Dimension:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<select name="selDimension" id="selWinDimchkIssue" class="form-control" >
															 <option value="">Select One</option>
																<%
																	Vector dimDetails = (Vector)session.getAttribute("DisplayDimensionDetails");
																	if(dimDetails!=null && dimDetails.size()!=0){
																		Enumeration eDimLst = dimDetails.elements();
																		String dimListId = "";
																		String dimListName = "";
																			while(eDimLst.hasMoreElements()){
																			String[] s = (String [])eDimLst.nextElement();
																			dimListId = s[0];
																			dimListName = s[1];
																			if(dimListId.equals(pubDimId)){
																				%>
																				<option value="<%=dimListId%>" selected="selected"><%=dimListName%></option>
																				<%}
																				else{
																				%>
																			<option value="<%=dimListId%>"><%=dimListName%></option>
																<%		
																}
																}
																}%>
														 </select>
														  <span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Published Page No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<input type="text"  name="pageno" id="txtPage" class="form-control"  value="<%=pubPageNo%>" />
														<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Special Placements:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<input type="text"  name="placement" id="txtSpecial"  class="form-control"   value="<%=pubPlacement%>"/>
														<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Special Instructions:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<textarea name="SpecialInstructions" id="txtSpInstructions" class='form-control' rows="5" cols="27" ><%=pubIns%></textarea>
													<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
								</div>
					
				
				   <input type="hidden" name="pubAdvId" value="<%=pubAdvId%>"/>
				   <input type="hidden" name="pubMapId" value="<%=pubMapId%>" />
				   <input type="hidden" name="manifestId" value="<%=manifestId%>" />
				   
				  			<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="Submit" type="submit"  value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                       <button class='btn-lg btn-danger' name="button" type="button" value="Cancel" onclick="javascript:history.back(-1);" style=''>Cancel</button>
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
