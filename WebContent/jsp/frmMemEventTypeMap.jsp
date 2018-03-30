<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
</head>

<script language="javascript">

function checkAll() {
     el = document.forms['myform'].elements;
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
	e = document.forms['myform'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){

			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}

		document.myform.entityIds.value = chkValue;
		//alert("Final" + count + " checked Value:  ********" + document.myform.entityIds.value);
}

function entPrivValidate(){
  	if(document.myform.eventTypeId.value==""){
		alert("Select any Event Type.");
		document.myform.eventTypeId.focus();

//		document.myform.eventTypeId.value = document.myform.eventTypeId.value;
		return false;
	}
 	DelAll();
	return true;
}


function postData(){
 	if(document.myform.eventTypeId.value!=""){
		document.myform.process.value = "MapEvntLevel";
		document.myform.method="post";
		document.myform.action="EvntLvlTypeMap.html";
		document.myform.submit();
	}
	else{
		alert("Select any one Role");
		document.myform.eventTypeId.focus();
	}
}
 </script>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
 <%
/*	String memberId = (String)request.getAttribute("memberId");
	System.out.print("memberId:" + memberId);
	if(memberId==null){
		memberId = "";
	}
	//String privId = "";*/

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
                            <h2>Roles &amp; Privileges: Entity Role Mapping</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				  
 				<p>You can map an Event Type for  Multiple Event Level for
 				a selected  Event Type Name as given below. </p>

					
						<p> Map An Event Level For A Member:</p>
						  
						  <form class='form-horizontal' role='form' name="myform" id="myform" action="EvntLvlTypeMap.html" method="post" onsubmit="return entPrivValidate();">
					    	<input type="hidden" name="process" value="insertEvntLevel" />
									  
							<div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
														<%
														String typeid = "";
														if(request.getAttribute("eventTypeId")!=null){
															typeid = (String) request.getAttribute("eventTypeId");
														}
														%>
													<select name="eventTypeId" id="eventTypeId" class="form-control" onchange="postData();">
													<option selected="selected" value="">Select One</option>
													<%
														Vector allTypesVect=(Vector)request.getAttribute("allTypesVect");
														if(allTypesVect!=null){
															Enumeration itrators= (Enumeration)allTypesVect.elements();
															while(itrators.hasMoreElements()){
																String[] levels1 = (String[]) itrators.nextElement();
																String id = levels1[0];
																String name = levels1[1];
																String status = levels1[2];
																String add_date = levels1[3];
																 if(typeid.equals(id)){
														%>
														<option  value="<%=id%>" selected="selected"><%=name%></option>
															<%
																}
																else{
															%>
														<option  value="<%=id%>"><%=name%></option>
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
											
											<input type="hidden" name="entityIds" value="puni">
							
							<div class='form-group'>
                                 <label class='control-label label1 col-sm-offset-1  gp '>Existing Event Level(s):</label>
								</div>
			
										<%
										String eventLevelCode="";
										ArrayList eventLevelList = (ArrayList)request.getAttribute("eventLevelList");
											if(eventLevelList!=null && eventLevelList.size()!=0){
												Iterator itMemEventLevelList = eventLevelList.iterator();
						
												while(itMemEventLevelList.hasNext()){
													String[] mapEntList = (String [])itMemEventLevelList.next();
													//{mapEntityId, roleIdVal, entityId, roleName, entityName};
													String mapTypeid =mapEntList[0];
													String tempEveTypeId = mapEntList[1];
													String eveLevelId = mapEntList[2];
													String eveTypName = mapEntList[3];
													String eventLevelName = mapEntList[4];
													 eventLevelCode = mapEntList[5];
										%>
								<div class='form-group'>
									<div class='col-md-offset-1 '>
												<%=eventLevelCode%>
											</div>
								</div>
										
							
				

								<%
								}
								}
								%>
								
							
								<%
								if(eventLevelCode==null){
								%>

						 	  <div class='form-group'>
									
									 <label class='control-label label1 col-sm-offset-1 gp '> Accessible Event Level(s):</label>
							 
								 	<div class='col-md-offset-1 gp'>
									 	 <input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" > Select All
									 </div>	
								
															
							
											<%
											Vector allLvlsVect=(Vector)request.getAttribute("allLvlsVect");
											if(allLvlsVect!=null){
												Enumeration itrators= (Enumeration)allLvlsVect.elements();
													while(itrators.hasMoreElements()){
															String[] levels = (String[]) itrators.nextElement();
															String levelid =levels[0];
															String levelName = levels[1];
															String code = levels[2];
															String jumping_efforts = levels[3];
											%>
											
											 
													 <div class='col-md-offset-1'>
															<input type="checkbox" size="10" name="<%=levelName%>" value="<%=levelid%>" />&nbsp;<%=code%>
													</div>
											</div>
											 <%
											 }
										}
									}else{
									%>
							  <div class='form-group'>
							  
			 					 <label class='control-label label1 col-sm-offset-1 gp'>Additional Event Level(s):</label>
								 
						 			<div class='col-md-offset-1 gp'>
								 		 <input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" > Select All	
									</div>	
							</div>
																								
											
											<%
											Vector allLvlsVect=(Vector)request.getAttribute("allLvlsVect");
											if(allLvlsVect!=null){
												Enumeration itrators= (Enumeration)allLvlsVect.elements();
													while(itrators.hasMoreElements()){
															String[] levels = (String[]) itrators.nextElement();
															String levelid =levels[0];
															String name = levels[1];
															String code = levels[2];
															String jumping_efforts = levels[3];

															boolean entIdStatus = false;
												ArrayList eventLevelList1 = (ArrayList)request.getAttribute("eventLevelList");
																if(eventLevelList1!=null && eventLevelList1.size()!=0){
																	Iterator itMemEventLevelList = eventLevelList1.iterator();

																	while(itMemEventLevelList.hasNext()){
																		String[] mapEntList = (String [])itMemEventLevelList.next();
																		//{mapEntityId, roleIdVal, entityId, roleName, entityName};
																		String eventLevelCode1 = mapEntList[5];
																		if(code.equals(eventLevelCode1)){
																			entIdStatus = true;
																			break;
																		}
																	}
											}
											if(entIdStatus==true){

											%>

											<%
											}
											else{
											%>
											<div class='form-group'>
													 <div class='col-md-offset-1'>
															<input type="checkbox" size="10" name="<%=name%>" value="<%=levelid%>" />&nbsp;<%=code%>
													</div>
											</div>
														
											
											 <%
											 }
										}
									 }
									 }
									%>
								
										
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  value="Submit" type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger'  name="button" value="Cancel" onclick="location.href='index.jsp'" type="button" style=''>Cancel</button>
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
