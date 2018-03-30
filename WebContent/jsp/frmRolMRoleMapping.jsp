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
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

</head>
<script language="javascript">

function checkAll(chkBoxName) {
	//alert(chkBoxName);
	//alert(chkBoxName.substring(0,chkBoxName.length-3));
	var chkBoxNameChk = chkBoxName.substring(0,chkBoxName.length-3);
     el = document.forms['frmRoleEntPriv'].elements;
     for (i=0; i < el.length; i++) {
       if(el[i].type == "checkbox") {
          if(el[i].checked== true && el[i].value== chkBoxName) {
            //alert("ok");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox" && el[j].name == chkBoxNameChk) {
                  void(el[j].checked=1);
               }
            }
            break;
          }
          if(el[i].checked== false && el[i].value== chkBoxName) {
            //alert("uncheck");
            for (j=0; j < el.length; j++) {
               if(el[j].type == "checkbox" && el[j].name == chkBoxNameChk) {
			   	// alert(el[j].name);
                  void(el[j].checked=0);
               }
            }
          } 
       }
     }
 }
 
function checkAll (index,frmRoleEntPriv) {

		     var cntPerm =0;
			var cntPriv =0;

				 for(var j =0;j<document.frmRoleEntPriv.chk.length;j++)
				 {
						var chkPerm = document.frmRoleEntPriv.chk[j].value;
						var privPerm = chkPerm.substring(0,chkPerm.indexOf('!'));

						if(privPerm == frmRoleEntPriv)
						{

 							 if(document.frmRoleEntPriv.chkAll[index].checked ==true )
							 {
									document.frmRoleEntPriv.chk[j].checked = true;

									for(k=0;k<document.frmRoleEntPriv.subPermChk.length;k++)
									{
										//alert(chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length)+"=="+document.frmRoleEntPriv.subPermChk[k].value.substring(0,document.frmRoleEntPriv.subPermChk[k].value.indexOf('#')));
										//alert(chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length)+'===='+document.frmRoleEntPriv.subPermChk[k].value.substring(0,document.frmRoleEntPriv.subPermChk[k].value.indexOf('#')));
										var chkSubPerm = document.frmRoleEntPriv.subPermChk[k].value;
										var priPrem=chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length);
										var suPrem=chkSubPerm.substring(0,chkSubPerm.indexOf('#'));
										if(priPrem==suPrem)
										{
											document.frmRoleEntPriv.subPermChk[k].checked = true;
										}

									}
							 }

							 if(document.frmRoleEntPriv.chkAll[index].checked ==false )
							 {
									document.frmRoleEntPriv.chk[j].checked = false;

									for(k=0;k<document.frmRoleEntPriv.subPermChk.length;k++)
									{
										//alert(chkPerm.substring(chkPerm.indexOf('!'),chkPerm.length)+"=="+document.frmRoleEntPriv.subPermChk[k].value.substring(0,document.frmRoleEntPriv.subPermChk[k].value.indexOf('#')));
										var chkSubPerm = document.frmRoleEntPriv.subPermChk[k].value;
										var priPrem=chkPerm.substring(chkPerm.indexOf('!')+1,chkPerm.length);
										var suPrem=chkSubPerm.substring(0,chkSubPerm.indexOf('#'));
										if(priPrem==suPrem)
										{
											document.frmRoleEntPriv.subPermChk[k].checked = false;
										}

									}
							 }

						}


				 }
      }


function chkPrivilege(obj,privId,permId)
{

    var permSubPermId = new Array();

	for(var i=0; i<document.frmRoleEntPriv.subPermChk.length;i++)
	{
		permSubPermId = document.frmRoleEntPriv.subPermChk[i].value.split('#');
		if(permId==permSubPermId[0])
		{
			if(obj.checked==true)
				document.frmRoleEntPriv.subPermChk[i].checked=true;



			else
				document.frmRoleEntPriv.subPermChk[i].checked=false;
		}
	}

	var privIndex = 0;
	var vFlag = false;
	var chkPermArray = new Array();
	//var chkPermlist = new generic.list();
	//var chkPermlist= new list();
	var permIndex =0;
	var cntt=0;
	//alert(obj.value);

	for(var i =0;i<document.frmRoleEntPriv.chkAll.length;i++)
	{
		var allPrivId = document.frmRoleEntPriv.chkAll[i].value;
		if(allPrivId == privId+'all')
		{
			document.frmRoleEntPriv.chkAll[i].checked = true;
			privIndex = i;

		}
	}



		for(var j =0;j<document.frmRoleEntPriv.chk.length;j++)
		{
			if(privId==document.frmRoleEntPriv.chk[j].value.substring(0,document.frmRoleEntPriv.chk[j].value.indexOf('!')))
			{
				chkPermArray[permIndex]=j;
			permIndex++;
			}
		}

		var cnt = 0;
        for(var k =0;k<chkPermArray.length;k++)
		{
			if(document.frmRoleEntPriv.chk[chkPermArray[k]].checked==false)
			{
				vFlag = true;
				cnt++;
			}
		}


		if(vFlag==true && chkPermArray.length==cnt)
		{
			document.frmRoleEntPriv.chkAll[privIndex].checked = false;
		}


}

function chkPermission(obj, permId, subPermId)
{

 var privPermId = new Array();

	for(var i=0; i<document.frmRoleEntPriv.chk.length;i++)
	{
		privPermId = document.frmRoleEntPriv.chk[i].value.split('!');
		if(permId==privPermId[1])
		{
			if(obj.checked==true)
			{
				document.frmRoleEntPriv.chk[i].checked=true;
				chkPrivilege(document.frmRoleEntPriv.chk[i],privPermId[0],permId);
			}
			else
			{
				document.frmRoleEntPriv.chk[i].checked=false;
				chkPrivilege(document.frmRoleEntPriv.chk[i],privPermId[0],permId);
			}
		}
	}

	for(var i=0; i<document.frmRoleEntPriv.subPermChk.length;i++)
	{
		permSubPermId = document.frmRoleEntPriv.subPermChk[i].value.split('#');
		if(permId==permSubPermId[0])
		{
			if(obj.checked==true)
				document.frmRoleEntPriv.subPermChk[i].checked=true;
			else
				document.frmRoleEntPriv.subPermChk[i].checked=false;
		}
	}




}

 function checkMain(mainChkBoxName){
 	//alert(mainChkBoxName);
	var chkValue = "uncheck";
	var chkBoxNameChk = mainChkBoxName.substring(0,mainChkBoxName.length-3);
	el = document.forms['frmRoleEntPriv'].elements;
	
 	for (j=0; j < el.length; j++) {
	   if(el[j].type == "checkbox" && el[j].name == chkBoxNameChk && el[j].checked == true) {
		  //alert("Final Value:" + chkBoxNameChk);
		  //document.getElementById(mainChkBoxName).checked=1;
		  chkValue = "checked"
	   }
	}
	
	if(chkValue == "uncheck"){
		 document.getElementById(mainChkBoxName).checked=0;
	}
	else{
		 document.getElementById(mainChkBoxName).checked=1;
	}
 }
 
 
 
function DelAll(){
	var chkValue = "";
	e = document.forms['frmRoleEntPriv'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
			var chkBoxNameChk = e[i].value.substring(e[i].value.length-3,e[i].value.length);
			//alert(chkBoxNameChk);
			 if(e[i].checked == true && chkBoxNameChk != "all") {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}
		//alert(chkValue);
		document.frmRoleEntPriv.PrivPermIds.value = chkValue;
}

function entPrivValidate(){
	if(document.frmRoleEntPriv.roleId.value==""){
		alert("Select any one Role.");
		document.frmRoleEntPriv.roleId.focus();
		return false;
	}
	if(document.frmRoleEntPriv.entityId.value==""){
		alert("Select any one Entity.");
		document.frmRoleEntPriv.entityId.focus();
		return false;
	}
	DelAll();
	return true;
}

	
	

function postData(rProcess){



	if(rProcess=="initRoleEntPriv"){
		if(document.frmRoleEntPrivSelect.roleId.value!=""){

			document.frmRoleEntPrivSelect.roleProcess.value = rProcess;
			//alert(frmRewalList.eventProcess.value);
			document.frmRoleEntPrivSelect.method="post";
			document.frmRoleEntPrivSelect.action="roles.html";
			document.frmRoleEntPrivSelect.submit();
		}
	}
	else{



	//if(document.frmRoleEntPrivSelect.roleId.value!=""){
		//alert(rProcess);

		document.frmRoleEntPrivSelect.roleProcess.value = rProcess;
		//alert(frmRewalList.eventProcess.value);
		document.frmRoleEntPrivSelect.method="post";
		document.frmRoleEntPrivSelect.action="roles.html";
		document.frmRoleEntPrivSelect.submit();
	}
	//}
/*else{
		if(rProcess=="initSelectRoleEnt"){
			alert("Select any one Role");
			document.frmRoleEntPrivSelect.roleId.focus();
		}
		else{
			alert("Select any one Entity");
			document.frmRoleEntPrivSelect.roleId.focus();
		}
	}*/
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

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

<%
	String roleId = (String) request.getAttribute("roleId");
	if(roleId==null){
		roleId = "";
	}
	
	String entityId = (String) request.getAttribute("entityId");
	if(entityId==null){
		entityId = "";
	}
String privilegeID = (String) request.getAttribute("privilegeID");
	if(privilegeID==null){
		privilegeID = "";
	}

	//String privId = "";

%>
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
                            
        						<h2>Map: Role, Entity, Privilege, Permission Mapping</h2>
								
						</div>
					<!--==============================Form Title=================================-->
						
						 <div class='panel-body'>	
						 
							<p>Check the required 'Permissions' to be given for a selected 'Privilege' and corresponding 'Entity'.</p> 
							<p id="p_error">Note: Please select at least one required permission for the corresponding privilege otherwise Privilege and Permission will not be mapped. </p>
							
		
        
              <form class='form-horizontal' role='form' name="frmRoleEntPrivSelect" id="frmRoleEntPrivSelect" method="post" >
                <input type="hidden" name="roleProcess" value="" />
                
                  <div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select an Role:</label>
							<div class='col-md-8'>
								<div class='col-md-3 indent-small'>
									  <div class='form-group internal'>			
  										 <select name="roleId" id="roleId" class="form-control" onchange="postData('initSelectRoleEnt');">
                      						<option selected="selected" value="">Select One</option>
								
											  <%
															ArrayList arrayRoleList = (ArrayList)request.getAttribute("roleDetails");
															if(arrayRoleList!=null && arrayRoleList.size()!=0){
																Iterator itRoleList = arrayRoleList.iterator();
																while(itRoleList.hasNext()){
																	String[] roleList = (String [])itRoleList.next();
																	//String[] roleList = {roleId, roleName};
																	String rolId = roleList[0];
																	String rolName = roleList[1];
																	if(roleId.equals(rolId)){
																	%>
											  <option value="<%=rolId%>" selected="selected"><%=rolName%></option>
											  <%
																	 }
																	 
						
																	 else{
																	 %>
											  <option value="<%=rolId%>"><%=rolName%></option>
											  <%
																	 }
																}
															}
													%>
                    					</select>
							</div>			
						</div>
					</div>
                  
                		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select A Entity:</label>
                  				<div class='col-md-8'>
                           			 <div class='col-md-3 indent-small'>
                                  			<div class='form-group internal'>	
												<select name="entityId" id="entityId" class="form-control" onchange="postData('initSelectRoleEntPriv');">
												  <option selected="selected" value="">Select One</option>
												  <%
																ArrayList arrayMapRoleEntList = (ArrayList)request.getAttribute("mapDetails");
																if(arrayMapRoleEntList!=null && arrayMapRoleEntList.size()!=0){
																	Iterator itRoleEntList = arrayMapRoleEntList.iterator();
																	while(itRoleEntList.hasNext()){
																		String[] mapEntList = (String [])itRoleEntList.next();
																		//{mapEntityId, roleIdVal, entityId, roleName, entityName};
																		String entId = mapEntList[2];
																		String entityName = mapEntList[4];
																		if(entityId.equals(entId)){
																			%>
												  <option value="<%=entId%>" selected="selected"><%=entityName%></option>
												  <%	
																			}
																			else{
																			%>
												  <option value="<%=entId%>"><%=entityName%></option>
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
						 
            <form class='form-horizontal' role='form' name="frmRoleEntPriv" id="frmRoleEntPriv" method="post" onsubmit="return entPrivValidate();">
                <input type="hidden" name="roleProcess" value="mapRoleEntityPrivPerms" />
                <input type="hidden" name="PrivPermIds" value="sury" />
                <input type="hidden" name="roleId" value="<%=roleId%>" />
                <input type="hidden" name="entityId" value="<%=entityId%>" />
				 
				 		
                					<%
										
										// Get All Permission
										String viewId = "";
										String deleteId = "";
										String createId = "";
										String editId = "";


                                   ArrayList arrayMapEntPrivList = (ArrayList)request.getAttribute("allMapPrivDetails");
										if(arrayMapEntPrivList!=null && arrayMapEntPrivList.size()!=0){
											Iterator itEntPrivList = arrayMapEntPrivList.iterator();
											int privIndex = 0;
											while(itEntPrivList.hasNext()){
												String[] mapEntPrivList = (String [])itEntPrivList.next();
												//{mapPrivilegeId, entityIdVal, privilegeId, entityName, privilegeName};
												String privMapCheck = mapEntPrivList[0];
                                                String privId = mapEntPrivList[1];
												String privilegeName = mapEntPrivList[2];

										%>
											
											
								<div class='form-group'>
								
									<div class="col-sm-offset-1 ">
								
								<% if(privMapCheck.equalsIgnoreCase("map")){%>
										
											 <input  type="checkbox"  id="<%=privId%>all"  checked ="checked" value="<%=privId%>all" alt="Select or Deselect All" name="chkAll" onclick="checkAll('<%=privIndex%>','<%=privId%>');">
										 
										
                             			 <%
										}
										else
										{
										%>
														
									 <input  type="checkbox"  id="<%=privId%>all"  value="<%=privId%>all" alt="Select or Deselect All" name="chkAll" onclick="checkAll('<%=privIndex%>','<%=privId%>');">
										
										  <%}%>
								
										<label class="control-label label1"><%=privilegeName%> </label>
								
								</div>
							</div>
							
				
									 
												
															
															                          
												<%
													ArrayList arrayPermList = (ArrayList)request.getAttribute("allMapPermDetails");
														if(arrayPermList!=null && arrayPermList.size()!=0){
															Iterator itPermList = arrayPermList.iterator();
															while(itPermList.hasNext()){
																String [] perList = (String [])itPermList.next(); //{permissionId, permissionName};
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
																String permMapCheck=perList[0];
																String privilegeId = perList[1];
																String permissionId = perList[2];
																String accessName = perList[3];
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
												%>
                        						<%		
										   
											
													//System.out.println("privilegeID.equals(privId) "+privilegeId+"==equals="+privId);
													if(privilegeId.equals(privId))
													{
                                                      ArrayList arraySubPermList = (ArrayList)request.getAttribute("allSubPerm");
														if(arraySubPermList!=null && arraySubPermList.size()!=0){
															Iterator itSubPermList = arraySubPermList.iterator();
														if(permMapCheck.equalsIgnoreCase("Map"))
														{

												%>
												
                       <div class='form-group'>
					   		 
							 <div class='col-sm-offset-1'>
									
										&emsp;&emsp; <input  type="checkbox" value="<%=privId%>!<%=permissionId%>" checked="checked" name="chk" onclick="chkPrivilege(this,'<%=privId%>','<%=permissionId%>')"/><%=accessName%>
						
							</div>
						
						  </div>
                          
                      
                        <%
															while(itSubPermList.hasNext()){
																String [] subPerList = (String [])itSubPermList.next(); //{permissionId, permissionName};
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
																String permId=subPerList[0];
																String subPermId = subPerList[1];
                                                                                                                                String status = subPerList[2];

																	if(permId.equals(permissionId))
																	{
                                                                                                                                            if(status.equals("1"))
                                                                                                                                                {%>
						<div class='form-group'>										
                        
								<div class='col-sm-offset-2'>
									
								<input  type="checkbox" value="<%=permId%>#<%=subPermId%>" name = "subPermChk" checked = "checked" onclick="chkPermission(this,'<%=permId%>','<%=subPermId%>')"/> <%=subPermId%> 
								
								</div>
						</div>
                         
                       
                        <%	}	else	{%>
								
								
								<div class='form-group'>											
								 
										<div class='col-sm-offset-2'>
												
											<input  type="checkbox" value="<%=permId%>#<%=subPermId%>" name = "subPermChk" onclick="chkPermission(this,'<%=permId%>','<%=subPermId%>')"/> <%=subPermId%>
								 		 </div>
										 
							  </div>
                          
                        
                        <%
																		}

														}
														}
																%>
                        <% }
														   else
															{%>
						<div class='form-group'>									
                       
					   			<div class='col-sm-offset-1'>
					   					
										&emsp;&emsp; <input  type="checkbox" value="<%=privId%>!<%=permissionId%>" name="chk" onclick="chkPrivilege(this,'<%=privId%>','<%=permissionId%>')"/><%=accessName%>
								</div>
						</div>
                        
                    
                       										 <%
															while(itSubPermList.hasNext()){
																String [] subPerList1 = (String [])itSubPermList.next(); //{permissionId, permissionName};
																//Start:[RoleMgt] For Role,Entity,Privilege,Permission,SubPermission Mapping
																String permId1=subPerList1[0];
																String subPermId1 = subPerList1[1];
                                                                  String status1 = subPerList1[2];
																	if(permId1.equals(permissionId))
																	{
                                                                       if(permMapCheck.equalsIgnoreCase("Map"))																		
                                                                                                                                               
													 				{	%>		
						<div class='form-group'>	
															
                        		 <div class='col-sm-offset-2'>
								 
										<input  type="checkbox" value="<%=permId1%>#<%=subPermId1%>" name = "subPermChk" checked = "checked" onclick="chkPermission(this,'<%=permId1%>','<%=subPermId1%>')"/> <%=subPermId1%>
						
								</div>
						
						</div>
                          
                       
                        									<%
																	}
																else
																		{%>
								
								<div class='form-group'>									
								 <div class='col-sm-offset-2'>
								 
									 <input  type="checkbox" value="<%=permId1%>#<%=subPermId1%>" name = "subPermChk" onclick="chkPermission(this,'<%=permId1%>','<%=subPermId1%>')"/> <%=subPermId1%> 
								</div>
							</div>
						
                        
                        <%}}}}%>
                        <%}%>
                        <%}}%>
                        <%}
						privIndex++;}%>
                      
                    <%}else{%>
								
								<div class='form-group'>
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
											 No Privileges are Available.	
											</div>
										</div>
									</div>
								</div>   
                      
                    <%
									}
								%>
					
								<div class='form-group'>
					 			
                                    <div class='col-md-offset-4 col-md-1'>
									
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
					 					<div class='col-md-2'>
					 					
                                        <button class='btn-lg btn-danger' style='' type="button"  onclick = "clearField(this.form)" >Clear</button>
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
