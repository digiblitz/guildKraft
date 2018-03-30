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
<script src="js/calendar2.js" type="text/javascript"></script>

 <script language="javascript">
    
function callpopup() {

	document.getElementById("pop").style.display = 'block'; 
	document.getElementById("popDoc").style.display = 'none'; 
	
}
function goBack(){
	strURL = "./SysMgmt.html?process=callArtifactBPList";
	window.location.href = strURL;
}

function callpopupDoc() {

	document.getElementById("pop").style.display = 'none'; 
	document.getElementById("popDoc").style.display = 'block'; 
	
}
function validate()
{
	if(document.requestIns.name.value==""){
		alert("Please enter a name");
		document.requestIns.name.focus();
		return false;
		}
	return true;
}

function submit(){
	
	 document.forms["requestIns"].submit();


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
                            <h2>Business Process: Governance for Business Process</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                          
                            <%
									String id=(String)request.getParameter("id");
									String Name=(String)request.getParameter("bpName");
									String Version=(String)request.getParameter("bpVersion");
									String govStatus=(String)request.getParameter("govStatus");	

							%>
                           
						 <form  class='form-horizontal' role='form' name="requestIns" id="requestIns"    method="post" action="SysMgmt.html?process=busineessProceSubmit" >
                              <input type="hidden" name="id" value="<%=id%>"/>
                              <input type="hidden" name="gov" value="stopGov"/>
                              <input type="hidden" name="govStatus" value="<%=govStatus%>"/>
                            
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="name" id="name" class="form-control"  value ="<%=Name%>" readonly="readonly"/>
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
											  <textarea rows="4" cols="22" class="form-control" name="desc"></textarea>
											</div>
										</div>
									</div>
								</div>
                                    
                                <div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Version:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>   
                                      				<input type="text" name="version"  class="form-control"  value ="<%=Version%>"  readonly="readonly"/>
											</div>
										</div>
									</div>
								</div>
                                   
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Criticality:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>   
												<select  id="select" name="criticality" class="form-control">
												<option selected="selected" value="">Select One</option>
												<option value="high">High</option>
												<option value="medium">Medium</option>
												<option value="low">Low</option>
											  </select>											
											  </div>
										</div>
									</div>
								</div>
                                   
                                 <div class='form-group'>
                                  	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Consumable:</label>
                                    	<div class='col-md-8'>
											<div class='col-md-3 indent-small'>
                                           		 <div class='form-group internal style="margin-top:12px"'>  
                                     					 <input type="checkbox" name="cons" style="margin-top:12px"  />
												</div>
											</div>
										</div>
									</div>
									
									<div class='form-group'>
										<div class='col-md-offset-4 col-md-1'>
											<button class='btn-sm btn-primary' type="button" value="Add BPEL"  name="method"  onclick="callpopup()">Add BPEL</button>
										</div>
										<div class="col-md-2">
											<button class='btn-sm btn-primary' type="button" value="Add Document"  name="method"  onclick="callpopupDoc()">Add Document</button>
										</div>
									</div>
                                 
							<div id="pop" style="display:none;">  
							
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>File Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="bpname"  class="form-control"  />
											</div>
										</div>
									</div>
								</div>
												
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Path:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
    												<input type="text" name="bppath"  class="form-control" />
											</div>
										</div>
									</div>
								</div>
													
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="bpdesc"  class="form-control" />
											</div>
										</div>
									</div>
								</div>
								
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Criticality:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select  id="select" name="bpcriticality" class="form-control">
													<option selected="selected" value="">Select One</option>
													  <option value="high">High</option>
														<option value="medium">Medium</option>
														<option value="low">Low</option>
												</select>
											</div>
										</div>
									</div>
								</div>
													 
  								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Version:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
    											<input	type="text" name="bpversion"  class="form-control"  />
											</div>
										</div>
									</div>
								</div>
  								
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Target Namespace:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="bptrname"  class="form-control"  />
											</div>
										</div>
									</div>
								</div>
											
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input	type="text" name="bplocation"  class="form-control"  />
											</div>
										</div>
									</div>
								</div>
								
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Document Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input	type="text" name="docname"  class="form-control"  />
											</div>
										</div>
									</div>
								</div>
											
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input	type="text" name="docdesc"  class="form-control"  />
											</div>
										</div>
									</div>
								</div>
												
								
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>From Path:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input	type="text" name="docpath"  class="form-control"  />
										</div>
										</div>
									</div>
								</div>
											
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location (To Path)</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input	type="text" name="doclocat"  class="form-control"  />
											</div>
										</div>
									</div>
								</div>
							</div>
							
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  type="button" value="Save"  name="method2" onclick="validate();submit()" >Save</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="button" type="button"  onclick="goBack();" value="Cancel"  style=''>Cancel</button>
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
