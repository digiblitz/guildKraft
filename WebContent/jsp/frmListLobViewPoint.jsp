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
                       
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		<%
			System.out.print("session.getAttribute(sessionId) in search page :"+session.getAttribute("sessionId")); 
		     String viewLobIdObj=(String)request.getAttribute("viewLobId");
		     String viewRoleIdObj=(String)request.getAttribute("viewRoleId");
		     String viewUserId=(String)request.getAttribute("viewUserId");
		%>
              <input type="hidden" name="viewId" value="<%=viewRoleIdObj%>"/>
              <input type="hidden" name="userId" value="<%=viewUserId%>"/>
              
                        <form class='form-horizontal' role='form' name="frmListLobViewPoint" id="frmListLobViewPoint" method="post" action="artifactMapping.html">
                          <input type="hidden" name="artiMapProcess" value="insertLobViewpointMapping" />
                         
						  <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'></label>
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
														   if (lob_id.equals(viewLobIdObj)){
																												
															%>
													<option  value="<%=lob_id%>" selected="selected" ><%=lob_name%></option>
													<%
																}
																else{
																%>
													<option  value="<%=lob_id%>" ><%=lob_name%></option>
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
									</div>
                        
						<p>Views related User List</p>
						
								 <div class="form-group">
								 	<div class="col-md-12 gp">
										<div class="row">
											<div class="col-md-1 col-md-offset-2">
												<input type="checkbox" name="viewPointId" value="<%=viewPointId%>" />
											</div>
											<div class="col-md-2">
												<label class="control-label "><%=viewPointName%></label>
											</div>
										</div>
										</div>
									</div>
                           
                                <%ArrayList viewRoleViewpointList = (ArrayList)request.getAttribute("viewRoleViewpointList");
           									 if(viewRoleViewpointList!=null && viewRoleViewpointList.size()!=0){
           							Iterator itViewPoint = viewRoleViewpointList.iterator();
           							while(itViewPoint.hasNext()){
           								String[] viewPointList = (String[])itViewPoint.next();
           								String viewPointId = viewPointList[0];
           								String viewPointName = viewPointList[1];
           								
		 						  %>
                               
                                <%}
           							}else{ %>
 										
										<div class="form-group">
								 			<div class="col-md-12 gp">
												<div class="row">
													<div class="col-md-4">  
													</div>         
													<div class="col-md-4">                        
														No Records were Found !
													</div>
												</div>
											</div>
										</div>
                                  <%} %>
								  
								  
                                 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="submit" type='submit'>Submit</button>
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
