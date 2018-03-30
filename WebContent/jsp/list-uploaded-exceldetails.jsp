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
<%@ page import = "com.hlcmeeting.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>

<script type="text/javascript">

function confirmation(uploadId,fileName) {
	var answer = confirm("All Corresponding Event Related Datas Will Be Deleted !! \r\n\n                         Are You Sure ?");
	//alert("horseCompDataMap.html?process=Delete&uploadId="+uploadId+"&fileName="+fileName);
	
	if (answer){
		window.location = "horseCompDataMap.html?process=Delete&uploadId="+uploadId+"&fileName="+fileName;
	}	
}

</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
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
                            <h2>Membership: Uploaded Competition Files Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
							
							<%!SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
									SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
									
									String dateFormat(String fieldName){					
										Date clDate = null;
										Calendar cal = Calendar.getInstance();
										GregorianCalendar gc = new GregorianCalendar();
										try{
											clDate = sd.parse(fieldName);
										}catch(Exception e){
											System.out.println("Error While Parsing Date: "+e);
										}
										
										gc.setTime(clDate);
										cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
										String dispDate = "N/A";
										if(clDate!=null ){
										dispDate = sd1.format(cal.getTime());
										}
										return dispDate;
									}
							%>
			
							  <%
										try
								{
								  java.util.Calendar c7 = java.util.Calendar.getInstance();
								  int calYear = c7.get(Calendar.YEAR);
								  System.out.print("calYear in JSP :"+calYear);
																		
								  String loadYear = (String)request.getAttribute("year");
											  System.out.println("loadYear in JSP :"+loadYear);
											  
											  int selYr = 0;
											  
											  if(loadYear!=null)
											  {
												 selYr = Integer.parseInt(loadYear);
											  }
											  else
											  {
												selYr = calYear;
											  }
							  %>
		  <form class='form-horizontal' role='form' action="horseCompDataMap.html" method="post">  
		  <input type="hidden" name="process" value="listUploadDetails" />
		                                        
		    <br />	
			To View All Details Select a Year and Click Show all files :	  
		    <select name="year" id="year" class="form-control"/>
		      <%
			  	for(int i=1980;i<=calYear;i++)
				{
					if(i==selYr)
					{
				%>
					<option value="<%=i%>" selected="selected"><%=i%></option>
				<%
					}
					else
					{
					%>
					<option value="<%=i%>"><%=i%></option>
					<%}}
			  %>
		    </select>
			<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="dispStat" value="Show all files" type="submit">Show all files</button>
                                    </div>
            </div> 
			</form>
			
			<p>All Uploaded Competition Result Files are listed as follows.
		      </p>
 	
							<div class='form-group'>
									<div class="row">
									<div class="col-md-12 gp">
									<div class="col-md-2">
									<label class='control-label label1'>Event ID</label>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Event Type</label>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>File Name</label>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Upload Date</label>
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Mapping</label>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Validate</label>
									</div>
									
									<div class="col-md-1">
									<label class='control-label label1'>Delete</label>
									</div>
								</div>
							</div>
						</div>	
 
			
			<%
				HLCCompUploadFileDetails uploadDetailsVO = new HLCCompUploadFileDetails();
				ArrayList uploadDetails = new ArrayList();
				
				uploadDetails = (ArrayList)request.getAttribute("compFileDet");
                                

                                
				if(uploadDetails.size()!=0)
				{
				for(int i=0;i<uploadDetails.size();i++)
				{
			   		uploadDetailsVO = new HLCCompUploadFileDetails();
					uploadDetailsVO = (HLCCompUploadFileDetails)uploadDetails.get(i);
					
					//System.out.print("uploadDetailsVO.toString() :"+uploadDetailsVO.toString());
					
					String event_id = "N/A";
                	String event_name = "N/A";
                	String result_file_path = "N/A";
                	String upload_date = "N/A";
					
					if(uploadDetailsVO.getEvent_id()!=null && uploadDetailsVO.getEvent_id().trim().length()!=0)
					{
						event_id = uploadDetailsVO.getEvent_id();
					}
					
					if(uploadDetailsVO.getEvent_name()!=null && uploadDetailsVO.getEvent_name().trim().length()!=0)
					{
						event_name = uploadDetailsVO.getEvent_name();
					}
					
					String url_file_path = "";
					
					if(uploadDetailsVO.getResult_file_path()!=null && uploadDetailsVO.getResult_file_path().trim().length()!=0)
					{						
						//String[] tmp = uploadDetailsVO.getResult_file_path().split("\\");
						//int val = tmp.length-1;
						result_file_path = uploadDetailsVO.getResult_file_path();//tmp[val];
						url_file_path = result_file_path;
						 StringTokenizer strTkns = new StringTokenizer(uploadDetailsVO.getResult_file_path().toString(),"\\");
                                               
                        while(strTkns.hasMoreTokens()){
                            try{
                                String phNo = (String)strTkns.nextToken();
                                
                                if(phNo!=null && phNo.trim().length()!=0){
                                    System.out.print("ph no Added from Stokenizer:" + phNo);
                                    result_file_path = phNo;
                                }
                            }
                                 catch(Exception e){
                                    System.out.print("ph no tokanizing exception:" + e);
                                }
                            }
						
					}
					
					if(uploadDetailsVO.getUpload_date()!=null)
					{
						//System.out.print("uploadDetailsVO.getUpload_date().toString() :"+uploadDetailsVO.getUpload_date().toString());
						//java.sql.Date temp_date= uploadDetailsVO.getUpload_date().toString();
						//String pat = "\\";
						//String[] temp_dt = uploadDetailsVO.getUpload_date().toString().split(pat);
						//System.out.print("temp_dt[0] :"+temp_dt[0]);
										
						upload_date = uploadDetailsVO.getUpload_date().toString();//temp_dt[0];
					}
					
					String enableStat="";
					String uploadId= uploadDetailsVO.getUpload_id();
					System.out.print(" uploadDetailsVO.isActive_status() :"+uploadDetailsVO.isActive_status());
									boolean mapStatus = uploadDetailsVO.isActive_status();
				/*out.print("mapStatus "+mapStatus );
				out.print("Validation Status "+uploadDetailsVO.isValidation_status());*/
					if(uploadDetailsVO.isActive_status())
					{
						enableStat = "disabled";
					}
                                        String enableStaus = "";
                                        if(uploadDetailsVO.isValidation_status() || mapStatus ==false){
                                                enableStaus = "disabled";
                                        }
					%>    
                                            <form class='form-horizontal' role='form' action="horseCompDataMap.html" method="post" />                                        
		                                    <input type="hidden" name="fileName" value="<%=url_file_path%>" />
                                            <input type="hidden" name="uploadId" value="<%=uploadDetailsVO.getUpload_id()%>" />
							
							
						<div class='form-group'>
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-2">
										<label class='control-label '><%=event_id%></label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label '><%=event_name%></label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label '><%=result_file_path%></label>
									</div>
									
									<div class="col-md-2">
										<label class='control-label '><%=dateFormat(upload_date)%></label>
									</div>
									
									<div class="col-md-1">
										 <button class='btn-sm btn-primary' type="submit" <%=enableStat%> name="process" value="Map">Map</button>
									</div>
									
									<div class="col-md-2">
									
										 <button class='btn-sm btn-primary' type="button" name="validatebtn"  <%=enableStaus%>  value="Validate" onclick="location.href='competitionReg.html?process=exceptionResult&eventId=<%=event_id%>&upId=<%=uploadId%>'">Validate</button>
										 
									</div>
									
									<div class="col-md-1">
												<%
														String disStatus = "";
														if(newRoleName!=null && !(newRoleName.equalsIgnoreCase("Admin"))){
															disStatus = "disabled";
														}
														%>
														
								
									
									
									 <button type="button" name="process" value="Delete"  class='btn-sm btn-danger' onclick="confirmation('<%=uploadId%>','<%=url_file_path%>');" /> Delete</button>
									</div>
								</div>
							</div>
						</div>	
											
       </form>
		   <%}}
			else {
			%>
				<div class="form-group">
					
					<div class="row">
					
						<div class="col-md-4">
						</div>
						<div class="col-md-4">
						
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
