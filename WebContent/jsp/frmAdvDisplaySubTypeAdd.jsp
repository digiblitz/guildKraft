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
<!DOCTYPE html>
<html class="no-js">

<head>
    <title>sample</title>
   <script src="js/frmCreateAdvSubType.js" type="text/javascript" ></script>

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script language="javascript">
function postData(mid){
if(mid!=""){
		//alert('advDispTypeShow');
		document.frmCreateAdvSubType.advProcess.value = "advDispTypeShow";
		document.frmCreateAdvSubType.method="post";
		document.frmCreateAdvSubType.action="advertisement.html?mid="+mid;
		document.frmCreateAdvSubType.submit();
	}
	else{
		//alert('advDispSubTypeAdd');
		document.frmCreateAdvSubType.advProcess.value = "advDispSubTypeAdd";
		document.frmCreateAdvSubType.method="post";
		document.frmCreateAdvSubType.action="advertisement.html";
		document.frmCreateAdvSubType.submit();
	}
}



</script>
	
</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%
String  mId = (String)request.getAttribute("mid");
if(mId==null || mId.equals("")){
mId="";
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
                            <h2>Advertisement:Create Advertisement Sub-Type</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p> Please create the required Advertisement Sub-Type for all the advertisements that are to be placed for all the event.
	
		Select a Media Type given below and fill-in the relevant Advertisement Sub-Type details.</p>
							
						<!--==============================Form Description=================================-->
							
                          
				<% String statuscheck = (String)request.getAttribute("err");
				
				if(statuscheck!=null && statuscheck.equals("st")){
				%>

                            <p id="p_error">Advertisement Sub Type  Name Already Exists. Try it Again</p>
                            <%
                            }
                            %>
							<p>Required fields are marked with an asterisk<span style="color:#FF0000">*</span></p>
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' id="myform"  name="frmCreateAdvSubType" method="post" action="./advertisement.html" onSubmit="return advValidate();">
							
                               <input type="hidden" name="advProcess" value="advDispSubTypeInsert"/>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select A Media Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="mediaId" id="mediaId" class="form-control" onChange="postData(this.value);">
												<option selected="selected" value="">Select One</option>
												<%
													Vector vMedia = (Vector)session.getAttribute("objSesAdvMediaType");
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
				 	 							<span id="span_astriesk">*</span>	
												
                                            </div>
											
											
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select An Advertisement Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="DispId" id="DispId" class="form-control">
												<option selected="selected" value="">Select One</option>
						<%
							Vector vType = (Vector)session.getAttribute("objSesAdvDispType");
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
							%>
							<option value="<%=displayTypeId%>"><%=displayTypeName%></option>
							<%}
							}
							%>
						</select>
				 	 							<span id="span_astriesk">*</span>	
												
                                            </div>
											
                                        </div>

                                    </div>
									
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Type Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="txtDisplaySubType" />
				 	 							<span id="span_astriesk">*</span>	
												
                                            </div>
											
											
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <textarea name="txtareaDesc" cols="25" rows="5" class="form-control"></textarea>
				 	 							<span id="span_astriesk">*</span>	
												
                                            </div>
											
											
                                        </div>

                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Create</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' type="reset">Reset</button>
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
