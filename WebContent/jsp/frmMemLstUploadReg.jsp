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
<%@ page import = "java.text.*" %>
<%@ page import="com.hlcmeeting.util.HLCUploadHorseRegVO" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 <script src="js/validate.js" type="text/javascript" ></script>

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
			
			 <%!	SimpleDateFormat sdfsql = new SimpleDateFormat("MM/dd/yyyy");
           		String sqldateFormat(java.sql.Date sqlDate){     	
            
                String detValue = "NG";
                if(sqlDate!=null){
					java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                    detValue = sdfsql.format(utilDate);
                }
                return detValue;
                }
			%>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership:Uploaded Registration Files Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p> All Uploaded Registration Files are listed as follows. <br />
                                            <br />
                                            To map a competition Registration Details,
                                            click on the 'Proceed
                                            Mapping' button beside it.</p>
							
						<!--==============================Form Description=================================-->
							
							<div class='form-group'>
									<div class='col-md-12'>
										<div class='col-md-2'>
										<label class='control-label label1'>Event ID</label>
										</div>
										
										<div class='col-md-5'>
										<label class='control-label label1'>File Name</label>
										</div>
										
										<div class='col-md-1'>
										<label class='control-label label1'>Upload Date</label>
										</div>
										
										<div class='col-md-1'>
										<label class='control-label label1'>&emsp;Map</label>
										</div>
										
										<div class='col-md-1'>
										<label class='control-label label1'>Validate</label>
										</div>
										
										<div class='col-md-2'>
										<label class='control-label label1'>&emsp;Delete</label>
										</div>
									</div>
										
							</div>	
							
							
									<%
                                                try
                                                {
                                               	HLCUploadHorseRegVO uploadDetailsVO = new HLCUploadHorseRegVO();
                                                ArrayList uploadDetails = new ArrayList();
                                             	uploadDetails = (ArrayList)request.getAttribute("compFileDet");
                                                
                                                if(uploadDetails.size()!=0){
                                                Iterator it = uploadDetails.iterator();
												while(it.hasNext()){
												uploadDetailsVO = new HLCUploadHorseRegVO();
												uploadDetailsVO = (HLCUploadHorseRegVO)it.next();
                                                String event_id = uploadDetailsVO.getEvent_id();
												String uploadId = uploadDetailsVO.getReg_upload_id();
												//System.out.print("uploadId" + uploadId); 
                                                String event_name = uploadDetailsVO.getEvent_name();
                                                String result_file_path = "N/A";
                                                java.sql.Date upload_date = uploadDetailsVO.getUpload_date();
                                                String url_file_path = "";
                                                
	if(uploadDetailsVO.getRegistration_file_path()!=null && uploadDetailsVO.getRegistration_file_path().trim().length()!=0){
	result_file_path = uploadDetailsVO.getRegistration_file_path();//tmp[val];
	url_file_path = result_file_path;
	StringTokenizer strTkns = new StringTokenizer(uploadDetailsVO.getRegistration_file_path().toString(),"\\");
			while(strTkns.hasMoreTokens()){
				try{
					String phNo = (String)strTkns.nextToken();
					
						if(phNo!=null && phNo.trim().length()!=0){
						//System.out.print("ph no Added from Stokenizer:" + phNo);
						result_file_path = phNo;
						}
					}
					catch(Exception e){
					System.out.print("ph no tokanizing exception:" + e);
					}
			}
	}
                                               
                                                String enableStat="";
                                                //System.out.print(" uploadDetailsVO.isActive_status() :"+uploadDetailsVO.isActive_status());
                                                boolean mapStatus = uploadDetailsVO.isActive_status();
												System.out.print("mapStatus:::" + mapStatus);
                                                if(uploadDetailsVO.isActive_status()){
                                                enableStat = "disabled";
                                                }
                                                
                                  %>
							
											
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' action="horseRegExcelData.html" method="post">
							
                                		<input type="hidden" name="process" value="dispDataMapping" />
                                        <input type="hidden" name="fileName" value="<%=url_file_path%>" />
                                        <input type="hidden" name="uploadId" value="<%=uploadId%>" />
										<input type="hidden" name="eventId" value="<%=event_id%>" />
                                                    <%
														String enableStaus = "";
														if(uploadDetailsVO.isValidation_status() || mapStatus ==false){
															enableStaus = "disabled";
														}
														String enaStaus = "";
														if(uploadDetailsVO.isValidation_status()){
															enaStaus = "disabled";
														}
														%>
														
														
								<div class='form-group'>
									<div class='col-md-12'>
										<div class='col-md-2'>
										<label class='control-label'>&emsp;<%=event_id%></label>
										</div>
										
										<div class='col-md-5'>
										<label class='control-label'><%=result_file_path%></label>
										</div>
										
										<div class='col-md-1'>
										<label class='control-label'><%=sqldateFormat(upload_date)%></label>
										</div>
										
										<div class='col-md-1'>
										
										 <button class='btn-sm btn-primary' <%=enableStat%> type='submit' value="Map" name="butValue">&emsp;Map</button>
										</div>
										
										<div class='col-md-1'>
										
										<button class='btn-sm btn-primary' type='button' <%=enableStaus%> name="btnValidate" value="Validate" onclick="location.href='competitionReg.html?process=exceptionReg&eventId=<%=event_id%>&upId=<%=uploadId%>'">Validate</button>
										</div>
										
										<div class='col-md-2'>
										 
										  <button class='btn-sm btn-danger' type='submit' name="butValue">Delete</button>
										</div>
									</div>
										
							</div>	

                       
                            </form>
							
								<%}}else {%>
								
								<div class='form-group'>
										<div class='col-md-8'>
											<div class='col-md-6'>
											</div>
											<div class='col-md-4'>
											There are no records available. 
											</div>
										</div>
									</div>
									
									
									<%}}
                                                catch(Exception e)
                                                {
                                                System.out.println(" error in jsp :"+e);
                                                } 
                                                %>
                                                
							
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
