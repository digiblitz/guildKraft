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
<title>Klugwerks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="javascript">

function checkAll() {
     el = document.forms['frmRoleUserMap'].elements;
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
	var chkValue = "";var chk="";
	e = document.forms['frmRoleUserMap'].elements;
	var count =0;
        //Start:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
        if(e.length!=undefined && e.length!='undefined' && e.length > 1)
	{
        //End:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
            for(i=0 ; i< e.length; i++){
		//Start:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
                //if(e[i].type == "checkbox"){
                  if(e[i].type == "radio" && e[i].name == "role"){
                //End:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 //Start:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
                                 //chkValue +=  e[i].value + "#";chk+=e[i]+",";
                                 chkValue +=  e[i].value;
                                 //End:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011

			}
		}
            }
        //Start:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
        }
        //End:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
		document.frmRoleUserMap.roleIds.value = chkValue;
                 //Start:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
                 //document.frmRoleUserMap.roleIdValue.value = chk;
                 //End:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011
}


function cancelEditRole()
    {
        strURL = "./roles.html?roleProcess=roleList";
	window.location.href = strURL;
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
                            <h2>Map: User Role Mapping</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
							<%
								
								String userId1 = (String) request.getAttribute("userId");
								
								String usrCrit = (String) request.getAttribute("usrCrit");
								if(userId1==null){
									userId1 = "";
								}
								
							ArrayList listContact = (ArrayList) request.getAttribute("userContactDetails");
								
									String prefix1 = "";
									String first_name = "";
									String middle_name = "";
									String last_name = "";
									String sufix = "";
									String email_id = "";
									String suite = "";
									String address1 = "";
									String address2 = "";
									String city = "";
									String state = "";
									String country = "";
									String zip = "";
									String phone_no = "";
									String mobile_no = "";
									String fax_no = "";
									
									if(listContact !=null && listContact.size()!=0){
										Iterator it = listContact.iterator();
										while(it.hasNext()){
											prefix1 = (String)it.next();
											if(prefix1==null)
											prefix1 = "";
											first_name  = (String)it.next();
											if(first_name==null)
											first_name = "";
											middle_name  = (String)it.next();
											if(middle_name==null)
											middle_name = "";
											last_name = (String)it.next();
											if(last_name==null)
											last_name = "";
											sufix =  (String)it.next();
											if(sufix==null)
											sufix = "";
											email_id  = (String)it.next();
											if(email_id==null)
											email_id = "";
											suite =  (String)it.next();
											if(suite==null)
											suite = "";
											address1 =  (String)it.next();
											if(address1==null)
											address1 = "";
											address2 = (String)it.next();
											if(address2==null)
											address2 = "";
											city = (String)it.next();
											if(city==null)
											city = "";
											state =  (String)it.next();
											if(state==null)
											state = "";
											country = (String)it.next();
											if(country==null)
											country = "";
											zip = (String)it.next();
											if(zip==null)
											zip = "";
											phone_no = (String)it.next();
											if(phone_no==null)
											phone_no = "";
											mobile_no = (String)it.next();
											if(mobile_no==null)
											mobile_no = "";
											fax_no = (String)it.next();
											if(fax_no==null)
											fax_no = "";
										}
									}	
								
								
								//String privId = "";
								
								
								
							%>
							<%String user_Name = (String)request.getAttribute("login_name");
							System.out.println("Login name :"+user_Name);
							%>
				
				<p>Select the required 'Role' to be assigned to a selected 'User'. </p>
                
				
						<%String empScreen = (String)request.getAttribute("empMapScr");
						  System.out.println("first Name : "+first_name);
						   System.out.println("first Name : "+last_name);
						  %>
                  
				    <form  class='form-horizontal' role='form' name="frmRoleUserMap" id="frmRoleUserMap" action="roles.html" onsubmit="DelAll();">
					<input type="hidden" name="roleProcess" value="mapUserRoles" />
                      <input type="hidden" name="roleIds" value="sury" />
                      <input type="hidden" name="empScreen" value="<%=empScreen%>"/>
                      <input type="hidden" name="roleIdValue"/>
                      <input type="hidden" name="userId" value="<%=userId1%>" />
                      <input type="hidden" name="lastname" value="<%=last_name%>" />
                      <input type="hidden" name="firstname" value="<%=first_name%>" />
                      <input type="hidden" name="username" value="<%=user_Name%>" />
<%System.out.println("parasu checking ------------------>>>>>>>"+user_Name); %>
                      <p>Assign  Role To User: </p>
                          
						  <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<label class="control-label"><%=first_name%>&nbsp;<%=last_name%> </label>
											</div>
										</div>
									</div>
					  </div>
								
                                <%
									ArrayList arrayRoleList = (ArrayList)request.getAttribute("roleDetails");
									if(arrayRoleList!=null && arrayRoleList.size()!=0){
										Iterator itRoleList = arrayRoleList.iterator();
										while(itRoleList.hasNext()){
											String[] roleList = (String [])itRoleList.next(); //{privilegeId, privilegeName, privilegePath};
											String roleId = roleList[0];
											String rolName = roleList[1];
											boolean roleIdStatus = false;
											ArrayList arrayMapUSerRoleList = (ArrayList)request.getAttribute("userRoleDetails");
											if(arrayMapUSerRoleList!=null && arrayMapUSerRoleList.size()!=0){
												Iterator itUserRoleList = arrayMapUSerRoleList.iterator();
												while(itUserRoleList.hasNext()){
													String[] mapUserRoleList = (String [])itUserRoleList.next(); //{privilegeId, privilegeName, privilegePath};
													String rolId = mapUserRoleList[2];
													if(roleId.equals(rolId)){
														roleIdStatus = true;
														break;
													}
													//{mapPrivilegeId, entityIdVal, privilegeId, entityName, privilegeName};
												}
											}
											if(roleIdStatus==true){
											%>
                                <!--Start:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011-->
                                  <%--<td colspan="2" class="tableLeftTxtArea">
													<input type="checkbox" class="tblMainHead" name="checkbox5" value="<%=roleId%>" checked="checked" />
													<span class="tblMainHead"><%=rolName%></span>
												</td>--%>
                                  <!--Start: Dhivya Here(Included the checked option)-->
								  
								  <div class="form-group">
								  		<div class="col-md-offset-1">
                                   		 	<input type="radio" name="role" checked="checked" value="<%=roleId%>"/><%=rolName%>
										</div>
					  </div>
									
                                 
                                  <!--End:Divya Here-->
                                  <!--End:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011-->
                             
                               			 <%
											 }
											 else{
											 %>
                              
                                  <!--Start:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011-->
                                  <%--<td colspan="2" class="tableLeftTxtArea">
													<input type="checkbox" class="tblMainHead" name="checkbox5" value="<%=roleId%>" />
													<span class="tblMainHead"><%=rolName%></span>
												</td>--%>
												
								 <div class="form-group">
								  		<div class="col-md-offset-1">			
                                    		<input type="radio" name="role" value="<%=roleId%>"/><%=rolName%>
										</div>
					  </div>
                                
                                  <!--End:[RoleMgt-AsgnRole] For Single Role to Single User Assignment changes dated 24-Mar-2011-->
                               
                                <%
											 }
										}
									}
							%>
                              
								<!--div class="form-group" >
									<label class="control-label label1">View Points:</label>
								</div>
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Criteria:</label>
											<div class='col-md-8'>
												<div class='col-md-3 indent-small'>
													<div class='form-group internal'>
														<label class="control-label "><%=usrCrit%></label>
													</div>
												</div>
											</div>
										</div>
							
					
					
							<%
									 ArrayList viewPoint = (ArrayList) request.getAttribute("viewPoint");
									 ArrayList usrViewPnt = (ArrayList) request.getAttribute("usrViewPnt");
									 
          					 if(viewPoint!=null && viewPoint.size()!=0){
							 int j=0;
							Iterator itview = viewPoint.iterator();
							while(itview.hasNext()){
								String[] sview = (String[])itview.next();
								String viewId = sview[0];
								String viewName = sview[1];		
									boolean usrViewStatus=false;
					if(usrViewPnt!=null && usrViewPnt.size()!=0){
							
							Iterator itUsrview = usrViewPnt.iterator();
							while(itUsrview.hasNext()){
								String[] sUsrview = (String[])itUsrview.next();
								String usrViewPntId = sUsrview[0];
								String usrViewPntName = sUsrview[1];
								if(viewId.equals(usrViewPntId)){
														usrViewStatus = true;
														break;
													}
								}
								}
								if(usrViewStatus==true){		
											 %>
									
									<div class="form-group">
								  		<div class="col-md-offset-1">	
											<input checked="checked" type="checkbox" name="viewPnt<%=j%>" id="viewPnt<%=j%>" value="<%=viewId%>"/><%=viewName%>
										</div>
									</div>
										
											<%}else{%>
										
										<div class="form-group">
								  			<div class="col-md-offset-1">
												<input type="checkbox" name="viewPnt<%=j%>" id="viewPnt<%=j%>" value="<%=viewId%>"/><%=viewName%>
											</div>
										</div>
											 <%
											 }
											j++; }
										}
									%>
							<input type="hidden" name="viewPntCnt" id="viewPntCnt" value="<%=viewPoint.size()%>">	
							
							<input type="hidden" name="usrCrit" id="usrCrit" value="<%=usrCrit%>">	
							
						   <!--tr> 
							<td colspan="2" class="alignCenter">
							<input type="submit" value="Assign" class="gradBtn" />
						    <input name="button" type="button" class="gradBtn" value="Cancel" onClick="history.back();"/></td>
						  </tr>
						  <tr> 
							<td colspan="2" class="alignCenter">&nbsp;<!-- DO NOT DELETE THIS ROW -->
                          <!--/td>
						  </tr!-->
						  
						  
						  <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" type="submit"  value="Assign">Assign</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="button" type="button"  value="Cancel" onclick="history.back();" style=''>Cancel</button>
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
