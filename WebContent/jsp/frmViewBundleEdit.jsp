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
<script  src="js/ts_picker.js"></script>

 <script language="javascript">
     function callUni(){
    	 var val= Math.random().toString();
         var ch=val.substring(2,val.length);
   document.getElementById("reqId").value=ch;  


	  
}
     function validate()
     {
     	if(document.requestIns.reqId.value==""){
     		alert("Id cannot be empty. Please click on the 'Generate ID' button");
     		document.requestIns.reqId.focus();
     		return false;
     		}
     	else
     
     	return true;
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
                        <div class='panel-heading'>
                            <h2>Request Status: Modify Request Status</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
     						
							
     					
								<% String artUid=(String)request.getAttribute("artUid");
						 String lifecycleId=(String)request.getAttribute("lifecycleId");
						 
						 String artifactName=(String)request.getAttribute("artifactName");
						 String description=(String)request.getAttribute("description");
						 
						 
						 %>
       
                        
                            <form class='form-horizontal' role='form' name="requestIns" id="requestIns" method="post" action="SysMgmt.html?process=subRequest"  >
                              <input type="hidden" name="method" value="insertrequest"/>
                              <input type="hidden" name="artifactName" id="artifactName" value="<%=artifactName%>"/>
                              <input type="hidden" name="description" id="description" value="<%=description%>"/>
                           
						    <p>Request Status Information:</p>
							 <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request ID:</label>
                                      <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="reqId" id="reqId" class="form-control"  readonly="readonly"/>
											  <span id="span_astriesk">*</span>
											   <button class='btn-sm btn-primary' name="button" type="button" onclick="callUni(); " value="Generate ID">Generate ID</button>
										  </div>
										</div>
									</div>
                                   
                                  
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                     			 <input type="text" name="reqTitle" class="form-control"  value="<%=artifactName%>" readonly="readonly"/>
												 <span id="span_astriesk">*</span>
											 </div>
										</div>
									</div>
                                   
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of the WS in :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                     			 <input type="text" name="date1" class="form-control" />
												<a href="javascript:show_calendar('document.requestIns.date1', document.requestIns.date1.value);"><i id="calendar1" class="fa fa-calendar"></i></a>
											 </div>
										</div>
									</div>	
													
														
                               
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date by when approval is required:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                     			 <input type="text" name="date2" class="form-control"  />
												<a href="javascript:show_calendar('document.requestIns.date2', document.requestIns.date2.value);"><i id="calendar1" class="fa fa-calendar"></i></a>
															
												 </div>
											</div>
										</div>		
															<%
														   ArrayList Stagename=(ArrayList)request.getAttribute("Stagename");
															//System.out.println  ("artifactData"+artifactData.size());                                           
																										 
														   if (Stagename != null && Stagename.size() != 0) {  
																													
														   Iterator iter = Stagename.iterator();
																							//String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	
                                                                	
                                                                	String [] artiType=(String[])iter.next();
                                                                	String stagename=artiType[0]; 
                                                                	String Stagevalue=artiType[1]; 
                                                                	
                                                                	 %>
                                
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Stage Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                    		  <input type="text" name="stagename" value="<%=stagename %>" class="form-control"  />
											 </div>
										</div>
									</div>
											  
											  
                                      <input type="hidden" name="Stagevalue" value="<%=Stagevalue %>" class="form-control"  />
                                      <input type="hidden" name="artifactId" value="<%=artUid %>" class="form-control"  />
                                      <input type="hidden" name="lifecycleId" value="<%=lifecycleId %>" class="form-control"  />
                                   
                                <%
                                       }
   											}
                                                %>
                                    
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Current Version:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                     			 <input type="text" name="curVersion" class="form-control"  />
											 </div>
										</div>
									</div>

                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Modified Version:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="modVersion" class="form-control"  />
											 </div>
										</div>
									</div>
                                
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Priority:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'></span>
												  <select  id="select" name="reqPriority" class="form-control">
													<option value="high">High</option>
													<option value="medium">Medium</option>
													<option value="low">Low</option>
												  </select>
											 </div>
										</div>
									</div>
                                    
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                     			 <input type="text" name="reqDesc" class="form-control"  />
											 </div>
										</div>
									</div>
                                  </div>
								  
								  
								  <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Submit"  name="method2" onclick="validate();">Submit</button>
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

<script type="text/javascript">


function onValidate()
{
	
	if(document.requestIns.date1.value==""){
		alert("Startdate cannot be empty");
		document.requestIns.date1.focus();
		return false;
	}
	if(document.requestIns.date2.value==""){
		alert("Lastdate cannot be empty");
		document.requestIns.date2.focus();
		return false;
	}
	
	return true;
}
</script>
</body>


</html>
