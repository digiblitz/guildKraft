<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="css/style.css">
</head>
<script language="javascript">

function checkAll() {
     el = document.forms['frmRoleEntPriv'].elements;
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
	e = document.forms['frmRoleEntPriv'].elements;
	
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
		//return chkValue;
		document.frmRoleEntPriv.privilegeIds.value=chkValue;
}

function entPrivValidate(){
	if(document.frmRoleEntPriv.entityId.value==""){
		alert("Select any one Entity.");
		document.frmRoleEntPriv.entityId.focus();
		return false;
	}
	DelAll();
	return true;
}
	
	
	
function postData(){
	if(document.frmRoleSelectEntPriv.entityId.value!=""){
		document.frmRoleSelectEntPriv.roleProcess.value = "entPrivSelect";
		//alert(frmRewalList.eventProcess.value);
		document.frmRoleSelectEntPriv.method="post";
		document.frmRoleSelectEntPriv.action="roles.html";
		document.frmRoleSelectEntPriv.submit();
	}
	else{
		alert("Select any one Entity");
		document.frmRoleSelectEntPriv.entityId.focus();
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
						
						<h2>Map: Privilege Entity Mapping</h2>
						
						</div>
					
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
						<%
							String entityId = (String) request.getAttribute("entityId");
							if(entityId==null){
								entityId = "";
							}
							//String privId = "";
						
						%>

                 <p>You can map a Privilege or Multiple Privileges for a given Entity as shown below. </p>
               
                      <form  class='form-horizontal' role='form' name="frmRoleSelectEntPriv" id="frmRoleSelectEntPriv">
                        <input type="hidden" name="roleProcess" value="" />
                        
						<div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select an Entity:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<select name="entityId" id="entityId" class="form-control" onchange="postData();">
											  <option selected="selected" value="">Select One</option>
											  <%
													ArrayList arrayEntityList = (ArrayList)request.getAttribute("enityDetails");
													if(arrayEntityList!=null && arrayEntityList.size()!=0){
														Iterator itEntList = arrayEntityList.iterator();
														while(itEntList.hasNext()){
															String[] entList = (String [])itEntList.next();
															//String[] entList = {entityId, entityName};
															String entId = entList[0];
															String entityName = entList[1];
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
                    
					<form class='form-horizontal' role='form' name="frmRoleEntPriv" id="frmRoleEntPriv" method="post" action="roles.html" onsubmit="return entPrivValidate();">
                        <input type="hidden" name="roleProcess" value="mappingEntPriv" />
                        <input type="hidden" name="privilegeIds" value="" />
                        <input type="hidden" name="entityId" value="<%=entityId%>" />
                        
						<div class='form-group'>
							 <label class='control-label label1 col-md-2 col-md-offset-2' for='id_title'>Available Privileges:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>

												<input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onclick="checkAll();" >
												<label class="control-label">Select All </label>								
											</div>
										</div>
									</div>	
							</div>
                          
                        		<%
									ArrayList arrayPrivList = (ArrayList)request.getAttribute("privillegeDetails");
									if(arrayPrivList!=null && arrayPrivList.size()!=0){
										Iterator itPrivList = arrayPrivList.iterator();
										while(itPrivList.hasNext()){
											String[] priList = (String [])itPrivList.next(); //{privilegeId, privilegeName, privilegePath};
											String privilegeId = priList[0];
											String privilegeName = priList[1];
											boolean privIdStatus = false;
											ArrayList arrayMapEntPrivList = (ArrayList)request.getAttribute("mapDetails");
											if(arrayMapEntPrivList!=null && arrayMapEntPrivList.size()!=0){
												Iterator itEntPrivList = arrayMapEntPrivList.iterator();
												while(itEntPrivList.hasNext()){
													String[] mapPriList = (String [])itEntPrivList.next(); //{privilegeId, privilegeName, privilegePath};
													String privId = mapPriList[2];
													if(privilegeId.equals(privId)){
														privIdStatus = true;
														break;
													}
													//{mapPrivilegeId, entityIdVal, privilegeId, entityName, privilegeName};
												}
											}
											if(privIdStatus==true){
											%>
									 
									 <div class='form-group'>
									 	
				 						<div class='col-md-offset-4'>
										
										&emsp;<input type="checkbox" name="checkbox5" value="<%=privilegeId%>" checked="checked" /> <%=privilegeName%>
										
										</div>
									
									</div>
									
                         
                          			  
                       					 <%
											 }
											 else{
											 %>
                      		
							 <div class='form-group'>
							 	<div class='col-md-offset-4'>
							 	
                            		&emsp;<input type="checkbox" name="checkbox5" value="<%=privilegeId%>" /><%=privilegeName%>
								</div>
							</div>
                          
									<%
														 }
													}
												}
										%>
                       
					   
					   		<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1 gp'>
                                        <button class='btn-lg btn-primary' name="submit" type="submit" value="Submit">Submit</button>
                                    </div>
                                    <div class='col-md-2 gp'>
                                        <button class='btn-lg btn-danger' style='' name="button" type="button" value="Clear" onclick = "clearField(this.form)">Clear</button>
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
