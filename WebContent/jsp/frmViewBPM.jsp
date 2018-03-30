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
 
 
  function callEdit(id,artiUid,lifecycleId,processname,proceDesc,BPversion){
	 
	 if(id!='Pending'){

	 if(confirm('This is a governed Business Process. \n Please raise a request approval for the stage.'))
	 {
	strURL = "./SysMgmt.html?process=callBPMEdit&id="+id+"&artUid="+artiUid+"&lifecycleId="+lifecycleId+"&artifactName="+processname+"&description="+proceDesc+"&version="+BPversion;
		window.location.href = strURL;
	 }
	 else
	 {
		 return;
	 }
	 }
	 else
		 {
		 alert ("This process has a request in pending. Please wait until the current request is processed.");
		 
		 }
		
	       }


	 </script>
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
                            <h2>View Business Process</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
									<%String success=(String)request.getAttribute("success");
							  
							  if(success!=null&&success.equalsIgnoreCase("success")){%>
       
	   									<p>Request Submitted Successfully to the Systinet.</p>
                 					<%}%>
      							
						 <div class="form-group">
								<div class="container">
									<div class="col-md-12 gp ">
										 <div class="row">
													<div class=' col-md-1 '>
														<label class='control-label label1 '>Id</label>
													</div>
													<div class=' col-md-2 '>
														<label class='control-label label1 '>Name </label>
													</div>
													<div class=' col-md-1 '>
														<label class='control-label label1 mar'>Version </label>
													</div>
													<div class=' col-md-2 '>
														<label class='control-label label1 '>Category </label>
													</div>
													<div class=' col-md-2 '>
														<label class='control-label label1 '>Production Status </label>
													</div>
													<div class=' col-md-2 '>
														<label class='control-label label1 '>Governance Status </label>
													</div>
													<div class=' col-md-2 '>
														<label class='control-label label1 '>Action </label>
													</div>
											</div>
										</div>
									</div>
								</div>
                    
														  <%
												   ArrayList bpmData=(ArrayList)request.getAttribute("bpmData");
													//System.out.println  ("artifactData"+artifactData.size());                                           
																								 
												   if (bpmData != null && bpmData.size() != 0) {  
																											
												   Iterator iter = bpmData.iterator();
																		//String [] userType = {ID, name };
																		while (iter.hasNext()) {
																			
                                                                	
                                                                	String [] artiType=(String[])iter.next();
                                                                	String id=artiType[0]; 
                                                                	String processname=artiType[1]; 
                                                                	String BPversion=artiType[2];
                                                                	String status=artiType[3];
                                                                	String artiUid=artiType[4];
                                                                	String lifecycleId=artiType[5];
																	String proceDesc=artiType[6];
                                                                	

                                               			 %>
														 
							<div class="form-group">
								<div class="container">
									<div class="col-md-12 gp ">
										 <div class="row">
												<div class=' col-md-1 '>
													<label class='control-label '><%=id%></label>
												</div>
												<div class=' col-md-2 '>
													<label class='control-label '><%=processname%></label>
												</div>
												<div class=' col-md-1 '>
													<label class='control-label mar'><%=BPversion%></label>
												</div>
												<div class=' col-md-2 '>
													<label class='control-label '>business process</label>
												</div>
												<div class=' col-md-2 '>
													<label class='control-label '>Active</label>
												</div>
												<div class=' col-md-2 '>
												
														<%if(status.equalsIgnoreCase("Pending")){%>
													   <label class='control-label '>Modify Request <%=status%></label>
														<%}else{%>
														<label class='control-label '>Active</label>
														<%}%>
												</div>
												<div class=' col-md-2 '>
                   									<a href="#" style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#00CCFF;color:#3366FF;" onclick="callEdit('<%=status%>','<%=artiUid%>','<%=lifecycleId%>','<%=processname%>','<%=proceDesc%>','<%=BPversion%>')" ><strong>Move Lifecycle Stage </strong></a> 
                  								</div>
											</div>
										</div>
									</div>
								</div>
                  				
										<%   }}
									
									
							
											else{
										   %>
                 						<div class="form-group">
												<div class=' col-md-5'>
													</div>
													<div class=' col-md-5'>
														No DATA 
													</div>
											</div>
											
                 				 <% } %>
  
                                               
              	
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
