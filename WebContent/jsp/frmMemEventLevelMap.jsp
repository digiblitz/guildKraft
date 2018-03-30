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
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

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
  	if(document.frmMapLevel.membershipTypeId.value==""){
		alert("Select any one Role.");
		document.frmMapLevel.membershipTypeId.focus();
		return false;
	}
	if(document.myform.eventTypeId.value==""){
		alert("Select any Event Type.");
		document.myform.eventTypeId.focus();
		return false;
	}
 	DelAll();
	return true;
}
	
	
function postData(){
 	if(frmMapLevel.membershipTypeId.value!=""){
		frmMapLevel.process.value = "mapProcess";
		frmMapLevel.method="post";
		frmMapLevel.action="map.html";
		frmMapLevel.submit();
	}
	else{
		alert("Select any one Role");
		frmMapLevel.membershipTypeId.focus();
	}
}
 </script>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

	<%
	String memberId = (String)request.getAttribute("memberId");
	System.out.print("memberId:" + memberId);
	if(memberId==null){
		memberId = "";
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
                            <h2>Roles &amp; Privileges: Entity Role Mapping</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>You can map an Event Level or Multiple Event Level for
 				a given Membership Type Name as given below. </p>
							
						<!--==============================Form Description=================================-->
							
							<p> Map An Event Level For A Member:</p>
                           
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmMapLevel" id="frmMapLevel">
							
                                <input type="hidden" name="process" value="" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Membership:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <select name="membershipTypeId" id="membershipTypeId" class="form-control" onchange="postData();">
											<option selected="selected" value="">Select One</option>
											<%
													ArrayList horsememberVect=(ArrayList)request.getAttribute("horsememberVect");
													if(horsememberVect!= null && horsememberVect.size()!=0){
													Iterator itr = horsememberVect.iterator();
														while(itr.hasNext()){
															String[] sarray = (String[]) itr.next();
															String memberTypeId = sarray[0];
															String membershipName = sarray[1];
															String membershipAmount =sarray[2];
															if(memberTypeId.equals(memberId)){
															%>
															<option  value="<%=memberTypeId%>" selected="selected"><%=membershipName%></option>
															 <%
															 }
															 else{
															 %>
															<option  value="<%=memberTypeId%>"><%=membershipName%></option>
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
								
                            
							
							
					<form class='form-horizontal' role='form' name="myform" id="myform" method="post" action="map.html" onsubmit="return entPrivValidate();">
						  <input type="hidden" name="process" value="mappingMemLevel" />
							<input type="hidden" name="entityIds" value="puni">
							<input type="hidden" name="memberId" value="<%=memberId%>"> 
							
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="eventTypeId" id="eventTypeId" class="form-control" >
														<option selected="selected" value="">Select One</option>
														<%
														String eventTypeId1 = "";
																			String eventLevelId1 = "";
															Vector allTypesVect=(Vector)request.getAttribute("allTypesVect");
															if(allTypesVect!=null){
															Enumeration itrators1= (Enumeration)allTypesVect.elements();
															while(itrators1.hasMoreElements()){
																String[] level = (String[]) itrators1.nextElement();                                    
																String typeid=level[0];
																String typename=level[1];
																String typestatus = level[2];
																String typeadd_date = level[3];
																		ArrayList mapMemLevelDetails1 = (ArrayList)request.getAttribute("mapMemLevelDetails");
																								if(mapMemLevelDetails1!=null && mapMemLevelDetails1.size()!=0){
																									Iterator itMemEventLevelList1 = mapMemLevelDetails1.iterator();
																									
																									while(itMemEventLevelList1.hasNext()){
																										String[] mapEntList1 = (String [])itMemEventLevelList1.next();
																										  eventTypeId1 = mapEntList1[2];
																										  eventLevelId1 = mapEntList1[3];
																										  }		
																									}		  					
																
																  if(typeid.equals(eventTypeId1)){
														%>
													 <option  value="<%=typeid%>" selected="selected"><%=typename%></option> 
														<%
															 }
															 else{
														%>
													<option  value="<%=typeid%>"><%=typename%></option>
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
								<div class='form-group'>
									
									<label class='control-label label1 col-md-2 col-md-offset-2' for='id_title'>Accessible Event Level(s):<span id="span_astriesk">*</span></label>
                                   
                                  </div>
								<div class='form-group'>
								  <div class="col-md-offset-4">
									 <input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" id='id_interest' > Select All
								</div>
								</div>
													
								
								<%
									 
											
											String eventTypeId = "";
											String eventLevelId = "";
											Vector allLevelsVect=(Vector)request.getAttribute("allLevelsVect");
											if(allLevelsVect!=null){
											Enumeration itrators= (Enumeration)allLevelsVect.elements();
													while(itrators.hasMoreElements()){
															String[] levels = (String[]) itrators.nextElement();                                    
															String levelid=levels[0];
															String name=levels[1];
															String code=levels[2];
															boolean entIdStatus = false;
																ArrayList mapMemLevelDetails = (ArrayList)request.getAttribute("mapMemLevelDetails");
																if(mapMemLevelDetails!=null && mapMemLevelDetails.size()!=0){
																	Iterator itMemEventLevelList = mapMemLevelDetails.iterator();
																	
																	while(itMemEventLevelList.hasNext()){
																		String[] mapEntList = (String [])itMemEventLevelList.next();
																		  eventTypeId = mapEntList[2];
																		  eventLevelId = mapEntList[3];
																		if(levelid.equals(eventLevelId)){
																			entIdStatus = true;
																			break;
																		}
																	}
											}
											 
											
											
											
											
											
											if(entIdStatus==true){
											
											%>
							<div class='form-group '>
								<div class="col-md-2 col-md-offset-4">
								<input type="checkbox" size="10" name="<%=name%>" checked="checked" value="<%=levelid%>" id='id_interest' />&nbsp;<%=code%><br />	
							</div>
							</div>
											
											
											
											<%}else{%>
						    <div class='form-group '>
								<div class="col-md-2 col-md-offset-4">
								<input type="checkbox" size="10" name="<%=name%>" value="<%=levelid%>" id='id_interest' />&nbsp;<%=code%><br/>	
							</div>
							</div>		
													
													
											 <%
											 }
										}
									 }
									%>
									
											
								
								<div class='form-group'>
								   <div class="col-md-12 col-md-offset-3">
                                    <div class=' col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-offset-1 col-md-2'>
                                        <button class='btn-lg btn-danger' style='' type='button' value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
                                    </div>
                                </div>
								</div>
								
									
						   	
											
											
											
											
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
