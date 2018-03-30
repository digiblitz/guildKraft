<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.hlcform.util.HLCUserSearchResultVO" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="javascript">
function listUsers(){
	var viewRoleId=document.frmListViewsRoleUser.viewRoleId.value;
	 strURL = "./artifactMapping.html?artiMapProcess=viewRoles&viewRoleId="+viewRoleId;
	window.location.href = strURL;
}
function assignViewPoint(userId){
	var viewRoleId=document.frmListViewsRoleUser.viewRoleId.value;
	 strURL = "./artifactMapping.html?artiMapProcess=LobViewpointMapping&viewRoleId="+viewRoleId+"&userId="+userId;
	 	window.location.href = strURL;
}
</script>
<!-- <script src="javascripts/frmSearchPattern.js" type="text/javascript" ></script>-->
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
						<%
						System.out.print("session.getAttribute(sessionId) in search page :"+session.getAttribute("sessionId")); 
						 String viewRoleIdObj=(String)request.getAttribute("viewRoleId");
						 String viewLobIdObj=(String)request.getAttribute("viewLobId");
						%>
						
                        <div class='panel-heading'>
						
                            <h2>User LOB Level Map: Listing</h2>
							
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
       				 <p> You are viewing the list of user's mapped with lob based on roles.</p>
                       
                              <form class='form-horizontal' role='form' name="frmListViewsRoleUser" id="frmListViewsRoleUser" method="post" action="../Artifact_pages1/Artifact_pages1/artifactMapping.html">
                                <input type="hidden" name="artiMapProcess" value="insertLobViewpointMapping" />
                               
							   
							 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Roles view:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                 					<select name="viewRoleId" class="form-control" onchange="listUsers(); ">
														  <option  selected="selected" value="">Select One</option>
														  <%
																	ArrayList viewsRelatedRoleList = (ArrayList)request.getAttribute("viewsRelatedRoleList");
																 if(viewsRelatedRoleList!=null && viewsRelatedRoleList.size()!=0){
														Iterator itViewRole = viewsRelatedRoleList.iterator();
														while(itViewRole.hasNext()){
															String[] viewRoleList = (String[])itViewRole.next();
															String role_id = viewRoleList[0];
															String role_name = viewRoleList[1];
														   if (role_id.equals(viewRoleIdObj)){
																												
															%>
														  <option  value="<%=role_id%>" selected="selected" ><%=role_name%></option>
														  <%
																}
																else{
																%>
														  <option  value="<%=role_id%>" ><%=role_name%></option>
														  <%
																}
															}
																 }									
													%>
												</select>
                                    					  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								
								
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Users:</label>
                                    	<div class='col-md-8'>
                                       		 <div class='col-md-3 indent-small'>
                                           		 <div class='form-group internal'>
                               							<select name="userId" class="form-control" >
															  <option  selected="selected" value="">Select One</option>
															  <%
																		ArrayList viewRoleUserList = (ArrayList)request.getAttribute("viewRoleUserList");
																	 if(viewRoleUserList!=null && viewRoleUserList.size()!=0){
															Iterator itViewLob = viewRoleUserList.iterator();
															while(itViewLob.hasNext()){
																String[] viewLobList = (String[])itViewLob.next();
																String user_id = viewLobList[0];
																String user_name = viewLobList[1];
															
																	%>
															  <option  value="<%=user_id%>" ><%=user_name%></option>
															  <%
																	
																}
																	 }									
														%>
															</select>
                                     					 <span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
								
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>LOB:</label>
                                    	<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
                                					<select name="lobId" class="form-control" >
														  <option  selected="selected" value="">Select One</option>
														  <%
																	ArrayList viewRoleLOBList = (ArrayList)request.getAttribute("viewRoleLOBList");
																 if(viewRoleLOBList!=null && viewRoleLOBList.size()!=0){
														Iterator itViewLob = viewRoleLOBList.iterator();
														while(itViewLob.hasNext()){
															String[] viewLobList = (String[])itViewLob.next();
															String lob_id = viewLobList[0];
															String lob_name = viewLobList[1];
														 
																												
															%>
														  <option  value="<%=lob_id%>"><%=lob_name%></option>
														  <%
															}
																 }									
													%>
														</select>
                                       					<span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
									</div>
								
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" type="submit">Submit</button>
                                    </div>
                                </div>
                               
                           </form>
						   
						   
                            <form class='form-horizontal' role='form' action="" name="frmUserLobList" id="frmUserLobList">
                               
							   
							   		<div class="form-group">
									
										<div class="row">
										
											<div class="col-md-offset-3 col-md-2"> 
											
												<label class="control-label label1">View</label>
												
											</div>
											
											<div class=" col-md-2"> 
											
												<label class="control-label label1">Login Name</label>
												
											</div>
											
											<div class=" col-md-2"> 
											
												<label class="control-label label1">Mapping LOB</label>
												
											</div>
											
										</div>
										
									</div>
                                  
                                  <%ArrayList viewUserLobList = (ArrayList)request.getAttribute("viewUserLobList");
           									 if(viewUserLobList!=null && viewUserLobList.size()!=0){
           							Iterator itviewUserLob = viewUserLobList.iterator();
           							while(itviewUserLob.hasNext()){
           								String[] viewRoleUsers = (String[])itviewUserLob.next();
           								String view = viewRoleUsers[0];
           								String usrLogin = viewRoleUsers[1];
           								String mapLob = viewRoleUsers[2];
           								
		  							 %>
									 <div class="form-group">
									
										<div class="row">
										
											<div class="col-md-offset-3 col-md-2"> 
											
												<label class="control-label "><%=view%></label>
												
											</div>
											
											<div class=" col-md-2"> 
											
												<label class="control-label "><%=usrLogin%></label>
												
											</div>
											
											<div class=" col-md-2"> 
											
												<label class="control-label "><%=mapLob%></label>
												
											</div>
											
										</div>
										
									</div>
                                  
                                  <%}
           							}else{ %>
                                 
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
                                    <%} %>
                                 
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
