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

<!--==============================================IMPORT THE CLASS END HERE============================================-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMapValidate.js" type="text/javascript" ></script>
 
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
                            <h2>Map a Qualification Details:</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
                           
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' id="myform">
							
                                <input name="roleProcess" type="hidden" value="insertPriv" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="eventTypeId" id="eventTypeId" class="form-control" >
													<option selected="selected" value="">Select One</option>
													<%
														Vector allTypesVect=(Vector)request.getAttribute("allTypesVect");
														if(allTypesVect!=null){
														Enumeration itrators= (Enumeration)allTypesVect.elements();
														while(itrators.hasMoreElements()){
															String[] levels = (String[]) itrators.nextElement();                                    
															String typeid=levels[0];
															String name=levels[1];
															String status = levels[2];
															String add_date = levels[3];
															  
													%>
												<option  value="<%=typeid%>"><%=name%></option>
													<%
														}
														}
													 
													%>
												</select>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Event Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="eventLevelId" id="eventLevelId" class="form-control" >
													<option selected="selected" value="">Select One</option>
													<%
																Vector allLevelsVect=(Vector)request.getAttribute("allLevelsVect");
																if(allLevelsVect!=null){
																Enumeration itrators= (Enumeration)allLevelsVect.elements();
																while(itrators.hasMoreElements()){
																		String[] levels = (String[]) itrators.nextElement();                                    
																		String levelid=levels[0];
																		String name=levels[1];
																		String code=levels[2];
															  
													%>
												<option  value="<%=levelid%>"><%=code%></option>
													<%
														}
														}
														 
													%>
												</select>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider Age: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input name="riderAge" type="text" class="form-control" id="riderAge"  />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Age:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="horseAge" type="text" class="form-control" id="horseAge" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Horse Rank:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="horseRank" type="text" class="form-control" id="horseRank" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amateur Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal' style="margin-top:7px">
                                              <input name="amateurStatus" type="radio" value="Yes" id="amateurStatus" size="15" maxlength="10" />Yes
											<input name="amateurStatus" type="radio" value="No" checked="checked" id="amateurStatus" size="15" maxlength="10" />No
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group'>
									<div class='col-md-10' >
									<div class='col-md-3'>
									</div>
										<div class='col-md-2' >
								
										<label class='control-label label1'>Division</label>
										</div>
									<div class='col-md-2' >
										<label class='control-label label1'>Age From</label> 
										</div>
										<div class='col-md-2'>
										<label class='control-label label1'>Age To</label>
										</div>
									</div>
								</div>
										
										
										 <%
															Vector divisionList=(Vector)request.getAttribute("allDivisionsVect");
															int vectSize = 0;
															if(divisionList!=null && divisionList.size()!=0){ 
															Enumeration itEvent = divisionList.elements();
															  vectSize = divisionList.size();
															int i=1;
															while(itEvent.hasMoreElements()){
																	
																	String [] eventTypeDetail  = (String[]) itEvent.nextElement();
																	String divisionId = eventTypeDetail[0];
																	String divisionName = eventTypeDetail[1];
																	String divisionStatus= eventTypeDetail[2];
																	String divisionDate = eventTypeDetail[3];
																	String val = "";
																	 
														 
																 							
													%>
												<div class='form-group'>
													<div class='col-md-10' >
													<div class='col-md-3'>
												</div>
													
													<div class='col-md-2'>
														<input type="checkbox" size="10" name="divisionName<%=i%>" id="divisionName<%=i%>"  value="<%=divisionId%>" onclick="clearFileds();" />&nbsp;<%=divisionName%>						
													
												</div>
												<div class='col-md-2'>
												<input name="ageFrom<%=i%>" id="ageFrom<%=i%>" type="text" class="form-control" />
												</div>
												<div class='col-md-2'>
												 <input name="ageTo<%=i%>" id="ageTo<%=i%>" type="text" class="form-control"  />
												</div>
											</div>
										</div>
											
											<% 
											 i++; 
											 }
											  %>
											
										<% }%>
										 <input type="hidden" name="divisionCount" id="divisionCount" value="<%=vectSize%>" />
									
									
                                

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' type='button' value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
										
										
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
