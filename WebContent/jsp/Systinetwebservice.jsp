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

function submit(){
	
	 document.forms["requestIns"].submit();


}
function goBack(){
	strURL = "./SysMgmt.html?process=callArtifactWSList";
	window.location.href = strURL;
}

function callpopupDoc(url) {

	document.getElementById("pop").style.display = 'none'; 
	document.getElementById("popDoc").style.display = 'block'; 
	
}

function callpopup() {
	
	document.getElementById("pop").style.display = 'block'; 

	document.getElementById("popDoc").style.display = 'none';


}
function validate(){
	if(document.requestIns.name.value==""){
		alert("Please enter a name");
		document.requestIns.name.focus();
		return false;
		}
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
						
                            <h2>Business Service:  Initiate Governance for Business Service</h2>
							
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                           
                            <%String id=(String)request.getParameter("id");
							String name=(String)request.getParameter("wsName");
							String version=(String)request.getParameter("wsVersion");
							String govStatus=(String)request.getParameter("govStatus");	
  							 %>
                           
						    <form class='form-horizontal' role='form' name="requestIns" id="requestIns"   method="post" action="SysMgmt.html?process=webserviceProcesubmit" >
                              <input type="hidden" name="method" value="insertrequest"/>
                              <input type="hidden" name="id" value="<%=id%>"/>
                              <input type="hidden" name="gov" value="stopGov"/>
                              <input type="hidden" name="govStatus" value="<%=govStatus%>"/>
                             
                               <div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="name" id="name" class="form-control"  value="<%=name%>" readonly="readonly"/>
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
			                                      <textarea class="form-control" rows="4" cols="20" name="textarea"></textarea>
                                    </div>
										</div>
									</div>
								</div>
                                    
                                <div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Version:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>   
												<input type="text" name="version"  class="form-control"  value="<%=version%>" readonly="readonly"/>
												</div>
										</div>
									</div>
								</div>
                                   
								<div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Criticality:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>   
												<select  id="select2" name="criticality" class="form-control">
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
                                     					 <input type="checkbox" name="cons" style="margin-top:12px" size="20" />
												</div>
											</div>
										</div>
									</div>
									
									<div class='form-group'>
										<div class='col-md-offset-4 col-md-1'>
											<button class='btn-sm btn-primary'  type="button" value="Add WSDL"  name="method2"  onclick="callpopup()">Add WSDL </button>
										</div>
										<div class="col-md-2">
											<button class='btn-sm btn-primary' type="button" value="Add Document"  name="method2"  onclick="callpopupDoc()">Add Document</button>
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
