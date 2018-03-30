<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html class="no-js">

<head>
    <title><%=(String)session.getAttribute("title")%></title>
    <script src="js/frmRolMgtCreatePriv.js" type="text/javascript"></script>
	
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
                            <h2>Roles &amp; Privileges: Privilege Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>You are viewing the list of Privileges created by you. To edit a	privilege click on the Edit button beside each record. To deactivate a privilege &nbsp;click on the 'Deactivate' button beside the corresponding record.</p>
							
							<div class="margin">
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4'>
										
											<label class='control-label label1'>Name of Privilege</label>    
											
										</div>
										
										<div class='col-md-2'>
											
											<label class='control-label label1'>Edit</label>   
												
										</div>
										
										</div>
										
									</div>
									
                                </div>
								
							</div>
							
						<!--==============================Form Description=================================-->
							
							<!--==============================Form Body=================================-->
							<%  
									ArrayList roleList = (ArrayList) request.getAttribute("allPrivList");
									if(roleList!=null && roleList.size()!=0){
									Iterator it = roleList.iterator();
									while(it.hasNext()){
									String[] s = (String[])it.next();
									String privilegeId = s[0];
									String privilegeName = s[1];
								%>
							
                            <form class='form-horizontal' role='form' name="frmRolMgtListPriv" id="frmRolMgtListPriv" method="post" action="roles.html" onSubmit="return myvalidate();">
							
								<input type="hidden" name="roleProcess" value="initEditPriv" />
								<input name="privId" type="hidden" class="oneBtn" value="<%=privilegeId%>" />
								
								<div class="margin">
								
										<div class='form-group'>
									
											<div class="col-md-12">
												<div class="container">
													<div class="row">
														<div class='col-md-4'>
														
															<label class='control-label'><%=privilegeName%></label>
															
														</div>
														
														<div class='col-md-2'>
															
															<button class='btn-sm btn-primary' type='submit'>Edit</button>
																
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								
							
                            </form>
							
							<%}}else {%>
								
								<div class='form-group'>
								
									<div class='col-md-4'>
									</div>
									<div class='col-md-4'>
                                    
									No Records are found
									
									</div>
                                    
                                </div>
								
								<%}%>
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
