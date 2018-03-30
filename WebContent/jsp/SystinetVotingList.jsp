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
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 <script language="javascript">

//window.onload=call();
 
  function approved(url) {
	  
	  strURL = "./SysMgmt.do?process=approved";
      window.location.href = strURL;
		
	}
 
  function denied(url) {
		
	  strURL = "./SysMgmt.do?process=denied";
      window.location.href = strURL;
	}

	 </script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
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
                       
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
                    
                      <form action="SysMgmt.do" name="artifactlist" id="artifactlist">
					  
					   <div class="form-group">
							 	<div class="container">
									<div class="col-md-12 gp ">
									  	 <div class="row"> 
												<div class=' col-md-1'>
												<label class='control-label label1'>Serial Id </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 '>Artifact Name </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 '> Artifact Description</label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 '>Date of Request Raised</label>
												</div>
												<div class=' col-md-1'>
												<label class='control-label label1 '>Stage Name </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 '>Actions </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 '>Comments</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							
                       
                            <%
								   Map <String,String[]> artifactlist=(HashMap)request.getAttribute("votinglist");
									//System.out.println  ("artifactData"+artifactData.size());                                           
																				 
								   if (artifactlist != null && artifactlist.size() != 0) {  
																							
								   Iterator iter = artifactlist.entrySet().iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	Map.Entry mEntry = (Map.Entry) iter.next();
                                                                	
                                                                	String [] artiType=(String[])mEntry.getValue();
                                                                	String id1=artiType[0];
                                                                	String id=artiType[1];
                                                                	String name=artiType[2]; 
                                                                	String version=artiType[3];
                                                                	String category=artiType[4];
                                                                	String status=artiType[5];
                                                                	

                                       %>
									   
									   
							<div class="form-group">
							 	<div class="container">
									<div class="col-md-12 gp ">
									  	 <div class="row"> 
												<div class=' col-md-1'>
												<label class='control-label '><%=id1%> </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label '><%=id%> </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label  '> <%=name%></label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label  '><%=version%></label>
												</div>
												<div class=' col-md-1'>
												<label class='control-label  '><%=category%> </label>
												</div>
												<div class=' col-md-2 '>
												 <button class='btn-sm btn-primary'  name="button" type="button" onclick="approved()" value="Approved">Approved</button>
												 <button class='btn-sm btn-primary' name="button2" type="button" onclick="denied()" value="Denied">Denied</button>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label  '><%=status%></label>
												</div>
											</div>
										</div>
									</div>
								</div>
                           
                            <%          } }
						   else{
							   %>
                            <div class="form-group">
							 	<div class="container">
									<div class="col-md-12 gp ">
									  	 <div class="row"> 
												<div class=' col-md-4'>
												</div>
												<div class='col-md-4'>
												NO DATA
												</div>
											</div>
										</div>
									</div>
								</div>
												
                            <%
  										 }
                                                %>
                          
                       
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
