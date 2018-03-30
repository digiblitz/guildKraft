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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->

<script language="javascript">


function onValidate(){

	if(document.myform.acStatus.value==""){
		alert("Select a Status");
		document.myform.acStatus.focus();
		return false;
	}
	
	return true;
}
</script>
<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%String status1 = (String)request.getAttribute("status");%>

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
						
							<h2>OnLine Event Entries: Item List</h2>
							
						 </div>
						 
						 <!-- ==================================================Add Dimension Details==============================================-->  
						<div class='panel-body'>
				 
					<p>To edit a Item Name click on 'Edit' button. To change the status click on the 'Activate/Deactivate' button.</p>
	
				<form  class='form-horizontal' role='form' name="myform" id="myform" method="post" action="./OEEPriceItem.html" onsubmit="return onValidate();">
				<input name="cmd" type="hidden" value="listDetails">						
				
				<div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
								<div class='col-md-8'>
                          			<div class='col-md-3 indent-small'>
                               			<div class='form-group internal'>
												<select name="acStatus" id="acStatus" class="form-control" >
													<option selected="selected" value="" >Select One</option>
												<%
												String[] status = new String[]{"Activate","Deactivate"};
												for(int k =0; k<status.length; k++){
												if(status1!=null && status1.equalsIgnoreCase(status[k])){
												%>
													<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
												<%}else{%>
													<option value="<%=status[k]%>"><%=status[k]%></option>
												<%}}%>
												</select><span  id="span_astriesk">*</span>
											</div>
                                        </div>
                                    </div>
								</div>
					
					<div class="form-group">
						<div class="col-md-8">
							<div class='col-md-6 indent-small'>
							</div>
							
							 <div class='col-md-2 '>
					 	 	<button class='btn-lg btn-primary' style='' type='submit'>Submit</button>
							</div>
							</div>
							</div>
					</form>
								<div class="form-group">
									
									<div class="col-md-12 gp ">
										
									  		 <div class="row"> 
											 
													<div class='col-md-offset-2 col-md-2'>
													<label class='control-label label1'>Item Name</label>
													</div>
													
													<div class="col-md-3">
															<label class='control-label label1'>Organizer Edit Status</label>
													</div>
													
													<div class=" col-md-2">
															<label class='control-label label1'>Status</label>
													</div>
													
													<div class="col-md-2">
															<label class='control-label label1 col-sm-offset-1'>Edit</label>
													</div>
												</div>
											</div>
										</div>

					<%
					 ArrayList itemDetails=(ArrayList)request.getAttribute("itemList");
					 if(itemDetails!=null && itemDetails.size()!=0){ 
					 Iterator it = itemDetails.iterator();
					  while(it.hasNext()){
						    String [] itemDetail  = (String[])it.next();
							String itemId = itemDetail[0];
							String itemName = itemDetail[1];
							boolean orgStatus = Boolean.parseBoolean(itemDetail[2]);
							String itemStatus= itemDetail[3];
							String orgEditstatus="";
							if(orgStatus==true){
							orgEditstatus="Yes";
							}else{
							orgEditstatus="No";
							}
					%>
							<form  class='form-horizontal' role='form' name="myform" method="post" action="./OEEPriceItem.html">	
							<input name="cmd" type="hidden" value="initUpdateItem">	
							<input name="itemId" type="hidden" value="<%=itemId%>">
							<input name="itemName" type="hidden" value="<%=itemName%>">
							<input name="orgStatus" type="hidden" value="<%=orgStatus%>">
							<input name="itemStatus" type="hidden" value="<%=itemStatus%>">
							
							
								<div class='form-group'>
								
									<div class="col-md-12 gp">
								
									  		 <div class="row"> 
											
												<div class='col-md-offset-2 col-md-2'>
						  							<label class='control-label'>&emsp;<%=itemName%></label>
												</div>
												
												<div class=' col-md-3'>
						  							<label class='control-label col-md-offset-3'><%=orgEditstatus%></label>
												</div>
												
												
										<% if(itemStatus.equalsIgnoreCase("false")){ %>
										
										<div class='  col-md-2'>
											<button class='btn-sm btn-primary' name="btnSubmit" type="button" onclick="location.href='OEEPriceItem.html?cmd=activate&itemId=<%=itemId%>'" >Activate</button>
										</div>
										<%} else if(itemStatus.equalsIgnoreCase("true")){%>
										
										<div class=' col-md-2'>
										
											<button class='btn-sm btn-danger' name="btnSubmit" type="button"  onclick="location.href='OEEPriceItem.html?cmd=deActivate&itemId=<%=itemId%>'" >Deactivate</button>
										</div>
										 <% }%>
										<div class='col-md-2'>
											<button class='btn-sm btn-primary' name="btnSubmit"  type='submit'>Edit</button>
										</div>
									
										</div>
										
									</div>
									
								</div>
							
		
						</form>
		   
					      <%	}
									}else {
								%>
								<div class='form-group'>
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
													<p>No records are available</p>
													
											</div>
							</div>
									
					<%}%> 
				
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
