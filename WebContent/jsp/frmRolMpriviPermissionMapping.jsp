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
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.hlccommon.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
</head>

<script language="javascript">
	function privPerValidate(){
		if(document.frmMeeRoleMgnPriPerm.privId.value==""){
			alert("Select any one privilege.");
			document.frmMeeRoleMgnPriPerm.privId.focus();
			return false;
		}
		return true;
	}
	
	
	function postData(){
		if(document.frmMeeRoleMgnPriPermSelect.privId.value!=""){
			document.frmMeeRoleMgnPriPermSelect.roleProcess.value = "privPermissionSelect";
			//alert(frmRewalList.eventProcess.value);
			document.frmMeeRoleMgnPriPermSelect.method="post";
			document.frmMeeRoleMgnPriPermSelect.action="roles.html";
			document.frmMeeRoleMgnPriPermSelect.submit();
		}
		else{
			document.frmMeeRoleMgnPriPermSelect.privId.focus();
		}
	}
	
	
	function clearField(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.elements[i].value = "";
		}
	}
}
</script>
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
						
						<h2> Map:  Privilege Permission Mapping</h2>
						
						</div>
					
				<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
							<%
								String privId = (String) request.getAttribute("privId");
								if(privId==null){
									privId = "";
								}
							
							%>

                 	<!--<img src="images/usea_logo.jpg" class="imgFloatLeft" />-->
					<p>Fill the required Menu Name for the link to be shown and it's relevant Link URL too. </p>
					
              
                      <form class='form-horizontal' role='form' action="roles.html" name="frmMeeRoleMgnPriPermSelect" id="frmMeeRoleMgnPriPermSelect" >
                        <input type="hidden" name="roleProcess" value="" />
                        
						<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Privilege:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="privId" id="privId" class="form-control" onchange="postData();">
												  <option selected="selected" value="">Select One</option>
												  <%
														ArrayList arrayPrivList = (ArrayList)request.getAttribute("privillegeDetails");
														if(arrayPrivList!=null && arrayPrivList.size()!=0){
															Iterator itPrivList = arrayPrivList.iterator();
															while(itPrivList.hasNext()){
																String[] priList = (String [])itPrivList.next(); //{privilegeId, privilegeName, privilegePath};
																String privilegeId = priList[0];
																String privilegeName = priList[1];
																if(privId.equals(privilegeId)){
																%>
												  <option value="<%=privilegeId%>" selected="selected"><%=privilegeName%></option>
												  <%
																 }
																 
																 else{
																 %>
												  <option value="<%=privilegeId%>"><%=privilegeName%></option>
												  <%
																 }
															}
														}
												%>
												</select>
                        					</div>
										</div>
									</div>
								</div>
                      </form>
                    
					<form class='form-horizontal' role='form' action="roles.html" name="frmMeeRoleMgnPriPerm" id="frmMeeRoleMgnPriPerm" onsubmit="return privPerValidate();">
                        <input type="hidden" name="roleProcess" value="mappingPrivPermission" />
                        <input type="hidden" name="privId" value="<%=privId%>"/>
                        <%
						    String viewId = "";
							String deleteId = "";
							String createId = "";
							String editId = "";
							String viewName = "";
							String viewURL = "";
							String editName = "";
							String editURL = "";
							String createName = "";
							String createUrl = "";
							String deleteName = "";
							String deleteURL = "";
							String mapCreateId = "";
							String mapEditId = "";
							String mapViewId = "";
							String mapDeleteId = "";
							//String editStatus = "";
							String perm1 = "";
							String perm2 = "";
							String perm3 = "";
							String perm4 = "";
							String perm5 = "";
							String perm6 = "";
							String perm7 = "";
							String perm8 = "";

							String permName1 = "";
							String permURL1 = "";
							String permName2 = "";
							String permURL2 = "";
							String permName3 = "";
							String permURL3 = "";
							String permName4 = "";
							String permURL4= "";
							String permName5 = "";
							String permURL5 = "";
							String permName6 = "";
							String permURL6 = "";
							String permName7 = "";
							String permURL7= "";
							String permName8 = "";
							String permURL8 = "";

						
							String mapPermId1 = "";
							String mapPermId2 = "";
							String mapPermId3 = "";
							String mapPermId4 = "";
							String mapPermId5 = "";
							String mapPermId6 = "";
							String mapPermId7 = "";
							String mapPermId8 = "";
							
							String editStatus = "";
							
																												
							// Get Selected PrivMapid
							ArrayList arrayMapPriPermList = (ArrayList)request.getAttribute("mapDetails");
							if(arrayMapPriPermList!=null && arrayMapPriPermList.size() !=0){
								Iterator itMapPrivPermList = arrayMapPriPermList.iterator();
									while(itMapPrivPermList.hasNext()){
										editStatus = "editMapPrivPerm";
										String[] mapPrivPer = (String [])itMapPrivPermList.next(); 
										//{mapPermissionId, permissionName, accessName, accessUrl};
										String mapId = mapPrivPer[0];
										String accessName = mapPrivPer[2];
										String accessUrl = mapPrivPer[3];
										String mapPermissionName = mapPrivPer[1];
										if(mapPermissionName.equalsIgnoreCase("View")) {
											mapViewId = mapId;
											viewName = accessName;
											viewURL = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("Delete")) {
											mapDeleteId = mapId;
											deleteName = accessName;
											deleteURL = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("Add")) {
											mapCreateId = mapId;
											createName = accessName;
											createUrl = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("Edit")) {
											mapEditId = mapId;
											editName = accessName;
											editURL = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission1")) {
											mapPermId1 = mapId;
											permName1 = accessName;
											permURL1 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission2")) {
											mapPermId2 = mapId;
											permName2 = accessName;
											permURL2 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission3")) {
											mapPermId3 = mapId;
											permName3 = accessName;
											permURL3 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission4")) {
										mapPermId4 = mapId;
											permName4 = accessName;
											permURL4 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission5")) {
											mapPermId5 = mapId;
											permName5 = accessName;
											permURL5 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission6")) {
											mapPermId6 = mapId;
											permName6 = accessName;
											permURL6 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission7")) {
											mapPermId7 = mapId;
											permName7 = accessName;
											permURL7 = accessUrl;
										}
										else if(mapPermissionName.equalsIgnoreCase("permission8")) {
											mapPermId8 = mapId;
											permName8 = accessName;
											permURL8 = accessUrl;
										}
									}
							}
							
							// Get All Permission
							ArrayList arrayPermList = (ArrayList)request.getAttribute("permissionDetails");
								if(arrayPermList!=null && arrayPermList.size()!=0){
									Iterator itPermList = arrayPermList.iterator();
									while(itPermList.hasNext()){
										String [] perList = (String [])itPermList.next(); //{permissionId, permissionName};
										String permissionId = perList[0];
										String permissionName = perList[1];
										if(permissionName.equalsIgnoreCase("View")) viewId = permissionId;
										if(permissionName.equalsIgnoreCase("Delete")) deleteId = permissionId;
										if(permissionName.equalsIgnoreCase("Add")) createId = permissionId;
										if(permissionName.equalsIgnoreCase("Edit")) editId = permissionId;
										if(permissionName.equalsIgnoreCase("permission1")) perm1 = permissionId;
										if(permissionName.equalsIgnoreCase("permission2")) perm2 = permissionId;
										if(permissionName.equalsIgnoreCase("permission3")) perm3 = permissionId;
										if(permissionName.equalsIgnoreCase("permission4")) perm4 = permissionId;
										if(permissionName.equalsIgnoreCase("permission5")) perm5 = permissionId;
										if(permissionName.equalsIgnoreCase("permission6")) perm6 = permissionId;
										if(permissionName.equalsIgnoreCase("permission7")) perm7 = permissionId;
										if(permissionName.equalsIgnoreCase("permission8")) perm8 = permissionId;
									}
								}
								//	out.print("editStatus:" + editStatus);
								if(editStatus.equals("editMapPrivPerm")){
								%>
                        <input type="hidden" name="editStatus" value="editMapPrivPerm" />
                        <%if(mapViewId!=null && mapViewId!=""){ %>
                        <input type="hidden" name="viewId" value="<%=mapViewId%>" />
                        <%}else{ %>
                        <input type="hidden" name="viewId" value="<%=viewId%>" />
                        <%} %>
                        <%if(mapEditId!=null && mapEditId!=""){ %>
                        <input type="hidden" name="editId" value="<%=mapEditId%>" />
                        <%}else{ %>
                        <input type="hidden" name="editId" value="<%=editId%>" />
                        <%} %>
                        <%if(mapDeleteId!=null && mapDeleteId!=""){ %>
                        <input type="hidden" name="deleteId" value="<%=mapDeleteId%>" />
                        <%}else{ %>
                        <input type="hidden" name="deleteId" value="<%=deleteId%>" />
                        <%} %>
                        <%if(mapCreateId!=null && mapCreateId!=""){ %>
                        <input type="hidden" name="createId" value="<%=mapCreateId%>" />
                        <%}else{ %>
                        <input type="hidden" name="createId" value="<%=createId%>" />
                        <%} %>
                        <%if(mapPermId1!=null && mapPermId1!=""){ %>
                        <input type="hidden" name="permissionId1" value="<%=mapPermId1%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId1" value="<%=perm1%>" />
                        <%} %>
                        <%if(mapPermId2!=null && mapPermId2!=""){ %>
                        <input type="hidden" name="permissionId2" value="<%=mapPermId2%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId2" value="<%=perm2%>" />
                        <%} %>
                        <%if(mapPermId3!=null && mapPermId3!=""){ %>
                        <input type="hidden" name="permissionId3" value="<%=mapPermId3%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId3" value="<%=perm3%>" />
                        <%} %>
                        <%if(mapPermId4!=null && mapPermId4!=""){ %>
                        <input type="hidden" name="permissionId4" value="<%=mapPermId4%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId4" value="<%=perm4%>" />
                        <%} %>
                        <%if(mapPermId5!=null && mapPermId5!=""){ %>
                        <input type="hidden" name="permissionId5" value="<%=mapPermId5%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId5" value="<%=perm5%>" />
                        <%} %>
                        <%if(mapPermId6!=null && mapPermId6!=""){ %>
                        <input type="hidden" name="permissionId6" value="<%=mapPermId6%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId6" value="<%=perm6%>" />
                        <%} %>
                        <%if(mapPermId7!=null && mapPermId7!=""){ %>
                        <input type="hidden" name="permissionId7" value="<%=mapPermId7%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId7" value="<%=perm7%>" />
                        <%} %>
                        <%if(mapPermId8!=null && mapPermId8!=""){ %>
                        <input type="hidden" name="permissionId8" value="<%=mapPermId8%>" />
                        <%}else{ %>
                        <input type="hidden" name="permissionId8" value="<%=perm8%>" />
                        <%} %>
                        <%
								}
								else{
								%>
                        <input type="hidden" name="editStatus" value=" " />
                        <input type="hidden" name="viewId" value="<%=viewId%>" />
                        <input type="hidden" name="deleteId" value="<%=deleteId%>" />
                        <input type="hidden" name="createId" value="<%=createId%>" />
                        <input type="hidden" name="editId" value="<%=editId%>" />
                        <input type="hidden" name="permissionId1" value="<%=perm1%>" />
                        <input type="hidden" name="permissionId2" value="<%=perm2%>" />
                        <input type="hidden" name="permissionId3" value="<%=perm3%>" />
                        <input type="hidden" name="permissionId4" value="<%=perm4%>" />
                        <input type="hidden" name="permissionId5" value="<%=perm5%>" />
                        <input type="hidden" name="permissionId6" value="<%=perm6%>" />
                        <input type="hidden" name="permissionId7" value="<%=perm7%>" />
                        <input type="hidden" name="permissionId8" value="<%=perm8%>" />
                        <%
								}
						  %>
                     
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label label1'>Permission</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label label1 col-sm-offset-1'>Application Name</label>    
											
										</div>
										
										<div class='col-md-4'>
										
											<label class='control-label label1 col-sm-offset-3'>Application URL</label>    
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission1</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="viewName" type="text" class="form-control"  value="<%=viewName%>" />
											
										</div>
										
										<div class='col-md-4'>
										
										 <input name="viewURL" type="text" class="form-control"  value="<%=viewURL%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission2</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="editName" type="text" class="form-control"  value="<%=editName%>" />
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="editURL" type="text" class="form-control"  value="<%=editURL%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission3</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="createName" type="text" class="form-control"  value="<%=createName%>"/>
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="createUrl" type="text" class="form-control"  value="<%=createUrl%>"/>
											
										</div>
									
									</div>
								
							</div>
						
						</div>
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission4</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="deleteName" type="text" class="form-control"  value="<%=deleteName%>"/>
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="deleteURL" type="text" class="form-control"  value="<%=deleteURL%>"/>
												
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission5</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="perName1" type="text" class="form-control"  value="<%=permName1%>" />
												
										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL1" type="text" class="form-control"  value="<%=permURL1%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission6</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="perName2" type="text" class="form-control"  value="<%=permName2%>" />
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL2" type="text" class="form-control"  value="<%=permURL2%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission7</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="perName3" type="text" class="form-control"  value="<%=permName3%>"/>
												
										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL3" type="text" class="form-control"  value="<%=permURL3%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
					
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission8</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="perName4" type="text" class="form-control"  value="<%=permName4%>"/>
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL4" type="text" class="form-control"  value="<%=permURL4%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission9</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="perName5" type="text" class="form-control"  value="<%=permName5%>"/>
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL5" type="text" class="form-control"  value="<%=permURL5%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission10</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="perName6" type="text" class="form-control"  value="<%=permName6%>"/>
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL6" type="text" class="form-control"  value="<%=permURL6%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission11</label>    
											
										</div>
										
										<div class='col-md-2'>
										
												<input name="perName7" type="text" class="form-control"  value="<%=permName7%>"/>											

										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL7" type="text" class="form-control"  value="<%=permURL7%>"/>
											
										</div>
									
									</div>
								
								</div>
							
							</div>
						
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-2 col-md-offset-2'>
										
											<label class='control-label '>Permission12</label>    
											
										</div>
										
										<div class='col-md-2'>
										
											<input name="perName8" type="text" class="form-control"  value="<%=permName8%>"/> 
											
										</div>
										
										<div class='col-md-4'>
										
											<input name="perURL8" type="text" class="form-control" value="<%=permURL8%>"/>  
										
										</div>
									
									</div>
								
								</div>
							
							</div>
						
						
						       <div class='form-group'>
                                    <div class='col-md-offset-5 col-md-1 gp'>
                                        <button class='btn-lg btn-primary'  name="submit" type="submit" value="Submit">Submit</button>
                                    </div>
                                    <div class='col-md-2 gp'>
                                        <button class='btn-lg btn-danger' name="button" type="button" style='' value="Clear" onclick = "clearField(this.form)">Clear</button>
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
