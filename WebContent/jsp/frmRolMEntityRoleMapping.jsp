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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>guildKraft</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script language="javascript">

function checkAll() {
     el = document.forms['frmRoleEnt'].elements;
     for (i=0; i < el.length; i++) {
       if(el[i].type == "checkbox") {
          if(el[i].checked== true && el[i].value== "ChkAll") {
            //alert("ok");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox") {
                  void(el[j].checked=1);
               }
            }
            break;
          }
          if(el[i].checked== false && el[i].value== "ChkAll") {
            //alert("uncheck");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox") {
                  void(el[j].checked=0);
               }
            }
          }   
       }
     }
 }
 
function DelAll(){
	var chkValue = "";
	e = document.forms['frmRoleEnt'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}
		//alert(chkValue);
		document.frmRoleEnt.entityIds.value = chkValue;
}

function entPrivValidate(){
	if(document.frmRoleEnt.roleId.value==""){
		alert("Select any one Role.");
		document.frmRoleEnt.roleId.focus();
		return false;
	}
	DelAll();
	return true;
}
	
	
function postData(){
	if(document.frmRoleEntSelect.roleId.value!=""){
		document.frmRoleEntSelect.roleProcess.value = "roleEntSelect";
		//alert(frmRewalList.eventProcess.value);
		document.frmRoleEntSelect.method="post";
		document.frmRoleEntSelect.action="roles.html";
		document.frmRoleEntSelect.submit();
	}
	else{
		alert("Select any one Role");
		document.frmRoleEntSelect.roleId.focus();
	}
}


function clearField(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		
		if(obj.elements[i].type=='checkbox')
		{
			obj.elements[i].checked = false;
		}
	}
}

</script>
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->


				<%
					String roleRoleId = (String) request.getAttribute("roleId");
					if(roleRoleId==null){
						roleRoleId = "";
					}
					//String privId = "";
				
				%>

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
                            <h2>Map: Role Entity Mapping </h2>
						</div>
						
					<div class='panel-body'>
              
                <p>You can map an Entity or Multiple Entities for a given role as given below.</p>
               
                      <form class='form-horizontal' role='form' name="frmRoleEntSelect" id="frmRoleEntSelect" >
                        <input type="hidden" name="roleProcess" value="" />
                       		 
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Role:</label>
									 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                          						<select name="roleId" id="roleId" class="form-control" onchange="postData();">
													  <option selected="selected" value="">Select One</option>
													  <%
															ArrayList arrayRoleList = (ArrayList)request.getAttribute("roleDetails");
															if(arrayRoleList!=null && arrayRoleList.size()!=0){
																Iterator itRoleList = arrayRoleList.iterator();
																while(itRoleList.hasNext()){
																	String[] rRoleList = (String [])itRoleList.next();
																	//String[] roleList = {roleId, roleName};
																	String rRolId = rRoleList[0];
																	String roleRoleName = rRoleList[1];
																	if(rRolId.equals(roleRoleId)){
																	%>
													  <option value="<%=rRolId%>" selected="selected"><%=roleRoleName%></option>
													  <%
																	 }
																	 
																	 else{
																	 %>
													  <option value="<%=rRolId%>"><%=roleRoleName%></option>
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
					  
                    <form class='form-horizontal' role='form' name="frmRoleEnt" id="frmRoleEnt" onsubmit="return entPrivValidate();">
                        <input type="hidden" name="roleProcess" value="mappingRoleEnt" />
                        <input type="hidden" name="entityIds" value="sury" />
                        <input type="hidden" name="roleId" value="<%=roleRoleId%>" />
                        	
							<div class='form-group'>
								<label class='control-label label1 col-md-3 col-md-offset-1' for='id_title'>Accessible Entity(ies):</label>
							
									<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
							
                        			<input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onclick="checkAll();" id='id_interest'>
										<label class="control-label">Select All 	</label>
											
											</div>
										</div>
									</div>
							</div>
													
								
									
													
                             
                              <%
									ArrayList arrayEntityList = (ArrayList)request.getAttribute("enityDetails");
									if(arrayEntityList!=null && arrayEntityList.size()!=0){
										Iterator itEntList = arrayEntityList.iterator();
										while(itEntList.hasNext()){
											String[] entList = (String [])itEntList.next();
											//String[] entList = {entityId, entityName};
											String roleEntityId = entList[0];
											String roleEntityName = entList[1];
											boolean entIdStatus = false;
											ArrayList arrayMapRoleEntList = (ArrayList)request.getAttribute("mapDetails");
											if(arrayMapRoleEntList!=null && arrayMapRoleEntList.size()!=0){
												Iterator itRoleEntList = arrayMapRoleEntList.iterator();
												while(itRoleEntList.hasNext()){
													String[] mapEntList = (String [])itRoleEntList.next();
													//{mapEntityId, roleIdVal, entityId, roleName, entityName};
													String entId = mapEntList[2];
													if(roleEntityId.equals(entId)){
														entIdStatus = true;
														break;
													}
												}
											}
											if(entIdStatus==true){
											%>
                           						
											<div class="form-group">
												<div class="col-md-offset-4">
													&emsp;<input type="checkbox" name="checkbox5" checked="checked" value="<%=roleEntityId%>" id='id_interest' /><%=roleEntityName%>
												</div>
											</div>
											
										
									
										
                                 
                              <%
											 }
											 else{
											 %>
                             					
												<div class="form-group">
													<div class="col-md-offset-4">
													&emsp;<input type="checkbox" name="checkbox5" value="<%=roleEntityId%>" id='id_interest'/> <%=roleEntityName%>	
													</div>
												</div>
												
                                
                              <%
											 }
										}
									}
									%>
												
								
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type='reset' onclick = "clearField(this.form)">Clear</button>
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
