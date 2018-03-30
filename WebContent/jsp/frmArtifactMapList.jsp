<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%=(String)session.getAttribute("title")%></title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <script>
        function loadSec() {

            document.getElementById('showLobs').style.display = "none";
            document.getElementById('showViews').style.display = "none";
            document.getElementById('showGrps').style.display = "none";
            document.getElementById('showProDom').style.display = "none";

        }

    </script>
    <script src="js/frmArtifactMapList.js" type="text/javascript"></script>

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
						
                            <h2>Manage Artifact Mapping</h2>
							
                        </div>

                        <!--==============================Form Title=================================-->

                        <div class='panel-body'>

                            <!--==============================Form Description=================================-->
                            <%
                            String errorMsg="";
                            if(request.getAttribute("errorMsg")!=null){

                            errorMsg="Error while Mapping";
                            %>

                            <p><%=errorMsg%></p>

                            <%}%>
                            <form class='form-horizontal' role='form'  name="frmArtifactMap" id="frmArtifactMap" action="artifactMapping.html?artiMapProcess=mapArtiDets" method="post" onsubmit="return myValidate();" enctype="multipart/form-data" commandname="uploadForm">
                                <input type="hidden" name="artiMapProcess" value="mapArtiDets" />

                                <div class='form-group'>
								
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> View Points:</label>
									
                                 	   <div class='col-md-8'>
									   
                                        	<div class='col-md-3 indent-small'>
											
                                            	<div class='form-group internal'>
												
                                                <select name="viewPntId" class='form-control' id='viewPntId' onchange="retrieveURL('lobsList',this);">
                                                    <option selected="selected" value="">Select One</option>
                                                    <%
                                                    ArrayList viewPntList = (ArrayList) request.getAttribute("viewPntList");
                                                    if(viewPntList!=null && viewPntList.size()!=0){
                                                    Iterator itvPnt = viewPntList.iterator();
                                                    while(itvPnt.hasNext()){
                                                    String[] sVPnt = (String[])itvPnt.next();
                                                    String viewPntId = sVPnt[0];
                                                    String viewPntName = sVPnt[1];

                                                    %>
                                                    <option value="<%=viewPntId%>"><%=viewPntName%></option>
                                                    <%
                                                    }
                                                    }
                                                    %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
								</div>
								
								 <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>LOBs:</label>
                                     <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="lobId" class='form-control' id='lobId' onchange="retrieveURLs('viewGrpList',this);">
                                                    <option selected="selected" value="">Select One</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
								</div>
								
								  <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Views:</label>
                                   		 <div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                           		 <div class='form-group internal'>
                                               		 <select name="viewId" class='form-control' id='viewId'>
                                                   	 <option selected="selected" value="">Select One</option>
                                               		 </select>
												</div>
                                       		 </div>
										</div>
									</div>
									
								  <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Groups:</label>
                                   		 <div class='col-md-8'>
                                       		 <div class='col-md-3 indent-small'>
                                           		 <div class='form-group internal'>
                                               		 <select name="grpId" class='form-control' id='grpId' onchange="retrieveURL('processDomainList',this);">
                                                   		 <option selected="selected" value="">Select One</option>
                                                	</select>
												</div>
                                            </div>
                                        </div>
                                    </div>
								
								  <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Domains/Processes:</label>
                                   		 <div class='col-md-8'>
                                      		  <div class='col-md-3 indent-small'>
                                           		 <div class='form-group internal'>
														<select name="domProcId" class='form-control' id='domProcId'>
															<option selected="selected" value="">Select One</option>
														</select>
												</div>
                                            </div>
                                        </div>
                                    </div>
                               
                                <div class='form-group'>
								
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Artifacts:</label>
                                  
								   		 <div class='col-md-8'>
	
											<div class='col-md-3 indent-small'>

                                           		 <div class='form-group internal'>


                                                <%
                                                ArrayList cntList = (ArrayList) request.getAttribute("cntList");
                                                if(cntList!=null && cntList.size()!=0){
                                                int j=0;
                                                Iterator itcnt = cntList.iterator();
                                                while(itcnt.hasNext()){
                                                String[] scnt = (String[])itcnt.next();
                                                String layerCntId = scnt[0];
                                                String layerCntName = scnt[1];
                                                String masterCntId = scnt[2];
                                                String masterCntName = scnt[3];

                                                %>
												
										
						
											<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
													
													 <input type="checkbox" name="artiFact<%=j%>" id="artiFact<%=j%>" value="<%=layerCntId%>" onclick="retrieveURLD('MappingDetExists',this);"><%=layerCntName%>
													 
											</div>
					
                                                <input name="uploads[<%=j%>]" type="file" id="uploads<%=j%>" multiple="muliple" required=required />

                                                <%
                                                j++;}
                                                }
                                                %>
											
                                                <input type="hidden" name="artiCnt" id="artiCnt" value="<%=cntList.size()%>" />
												
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-3'>
                                        <button class='btn-lg btn-primary' type='submit'>Map Artifact</button>
                                    </div>
                                </div>

                            </form>


                            <<!--==============================Form Body=================================-->

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
