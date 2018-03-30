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
<%@ page import ="com.hlccommon.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script language="javascript">
function postData(mid){
if(mid!=""){
		document.frmCreateContactTypeList.advPrice.value = "mediaPriceLst";
		document.frmCreateContactTypeList.method="post";
		document.frmCreateContactTypeList.action="AdvertisePrice.html?mid="+mid;
		document.frmCreateContactTypeList.submit();
	}
else{
	document.frmCreateContactTypeList.advPrice.value = "userView";
	document.frmCreateContactTypeList.method="post";
	document.frmCreateContactTypeList.action="AdvertisePrice.html"
	document.frmCreateContactTypeList.submit();
	
}
	}
function showData(dispId){
//alert(dispId);
if(dispId!=""){
	var mid = document.frmCreateContactTypeList.selMediaType.value;
	
	document.frmCreateContactTypeList.advPrice.value = "searchFreq";
	document.frmCreateContactTypeList.method="post";
	document.frmCreateContactTypeList.action="AdvertisePrice.html?dispId="+dispId + "&mid="+mid;
	document.frmCreateContactTypeList.submit();
	}
}	

 
</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%
String  mId = (String)request.getAttribute("mid");
String displayId =(String)request.getAttribute("dispId");
if(mId==null || mId.equals("")){
mId="";
}
if(displayId==null || displayId.equals("")){
displayId="";
}
%>
<!--==============================================header start here============================================-->
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
                            <h2>Advertisement: Advertisement Price Matrix</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
	
				<p>The Advertisement Price Matrices are listed as follows.</p>
		
		<p>Select a Media Type and it's corresponding Advertisement Type to list out all 
		price matrices for various frequencies related to each Avertisement Sub-Type.
	
		<form class='form-horizontal' role='form'  name="frmCreateContactTypeList" id="frmCreateContactTypeList">
		<input type="hidden" name="advPrice" id="advPrice" value="advPrice">
		  					
							 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
				  
												<select name="selMediaType" id="selMediaType"  class="form-control" onchange="postData(this.value);">
												<option selected="selected" value="">Select One</option>
												<%
												
												
													Vector vMedia = (Vector)session.getAttribute("DisplayMediaDetails");
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
															System.out.println("mediaId in jsp-->" + mediaId + "mediaName in jsp-->" + mediaName +"mediaDesc in jsp-->" +mediaDesc);
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
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Adv Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <select name="selDisplayType" id="selDisplayType" class="form-control" onchange="showData(this.value);">
													<option selected="selected" value="">Select One</option>						
												<%
														Vector vType = (Vector)session.getAttribute("DisplayTypeDetails");
														if(vType!=null && vType.size()!=0){
															Enumeration eDisp = vType.elements();
															String displayTypeId =  "";
															String displayTypeName =  "";
															String mediaIdVal = "";
															while(eDisp.hasMoreElements()){
																String[] s = (String [])eDisp.nextElement();
																displayTypeId = s[0];
																displayTypeName = s[1];
																mediaIdVal  = s[2];
																if(displayTypeId.equals(displayId)){
														%>
														<option value="<%=displayTypeId%>" selected="selected"><%=displayTypeName%></option>
														<%}
														else{
														%>
														 <option value="<%=displayTypeId%>"><%=displayTypeName%></option>
														<%		
														}
														}
														}%>
												  </select>	
												 </div>
												</div>
											</div>
										</div>
		   <!--
		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
		      <a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			 </td>
		   </tr>
		   -->
		   
		      <div class='form-group'>
			   		  
		   <%
		  ArrayList result =(ArrayList)session.getAttribute("FrequencyPriceDetails");
            if(result!=null && result.size()!=0){
				String freq = "";
				String price = "";	
				String dispSubTypeId = "";
				String dispSubType = "";
                for (Iterator it = result.iterator(); it.hasNext();) {
                     String[] subType = (String []) it.next();
					 dispSubTypeId = subType[0];
                     dispSubType = subType[1];
                    //out.print("===============================");
                  
		   %>
		   
		 
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Subtype Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<a href="AdvertisePrice.html?advPrice=freqDet&mediaId=<%=mId%>&subTypeId=<%=dispSubTypeId%>" class="linkFour"><%=dispSubType%></a> 
											</div>
										</div>
									</div>
								</div>
						  
						  <div class="margin">
						  	<div class='form-group'>
								<div class="row">
									<div class="col-md-12 gp">
										<div class="col-md-3">
											<label class='control-label label1'>Frequency Rate</label>
										</div>
										<div class="col-md-3">
											<label class='control-label label1'>Frequency Price</label>
										</div>
									</div>
								</div>
							</div>
						</div>
										
							
						   
						   <%
						     ArrayList  priceList = (ArrayList) it.next();
								for (Iterator itP = priceList.iterator(); itP.hasNext();) {
									 String fqArray[] = (String []) itP.next();
									
										 freq = fqArray[0];
										 price = fqArray[1];
							 
						   %>
						   
						   <div class="margin">
						  	<div class='form-group'>
								<div class="row">
									<div class="col-md-12 gp">
										<div class="col-md-3">
											<label class='control-label label1'><%=freq%></label>
										</div>
										<div class="col-md-3">
											<label class='control-label label1'><%=price%></label>
										</div>
									</div>
								</div>
							</div>
						</div>
						 
						
					
					    <%  
                     }
                }
				}
				else{
				%>
				         <div class='form-group'>
								<div class="row">
									<div class="col-md-12 gp">
										<div class="col-md-4">
										</div>
										<div class="col-md-4">
											No Records were found
										</div>
									</div>
								</div>
							</div>
							
						
<%                
            }    %>  
			  
		   
		   <!--
		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
			<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
		   </tr>
		   -->
	
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
