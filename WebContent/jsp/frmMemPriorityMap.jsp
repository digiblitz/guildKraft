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
            
            for (j=0; j < el.length; j++) {
			 //alert(el[j].type);
               if(el[j].type == "checkbox") {
                  void(el[j].checked=0);
               }
			    if(el[j].type == "select-one") {
                  void(el[j].selectedIndex=0);
               }
			   
            }
          }   
       }
     }
 }
 
function DelAll(){
	var chkValue = "";
	//alert(document.getElementById('priorityIdfinal_place').value);
	e = document.forms['myform'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
	 ///alert("elements:" +el[i].type);
		if(e[i].type == "checkbox"){
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 //alert(e[i].name);
				 var selComBoName = "priorityId"+e[i].name;
				 //alert(selComBoName);
				 
				 var selVal = document.getElementById(selComBoName).value;
				 
				 chkValue +=  e[i].value + "!" + selVal + "#";
			}
		}
	}
		//alert(chkValue);
		document.myform.entityIds.value = chkValue;
		//alert("Final" + count + " checked Value:  ********" + document.myform.entityIds.value);
}

function entPrivValidate(){
//alert(document.frmMapLevel.eventTypeId.value);
  	if(document.frmMapLevel.eventTypeId.value==""){
		alert("Select any one Role.");
		document.frmMapLevel.eventTypeId.focus();
		return false;
	}
/*	e = document.forms['myform'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
	if(e[i].type == "checkbox"){
			 if(e[i].checked == true && e[i].value != "ChkAll") {
				 count++;
				 var selComBoName = "priorityId"+e[i].name;
	 			 var selVal = document.getElementById(selComBoName).value;
				 if(selVal==""){
				 alert("please select priority value");
				 document.getElementById(selComBoName).focus();
				 return false;
				 }
			}
		}
	}*/
   
 	DelAll();
	return true;
}
	
	
function postData(){
//alert(document.frmMapLevel.eventTypeId.value);
 	if(frmMapLevel.eventTypeId.value!=""){
		frmMapLevel.process.value = "mapPriorityProcess";
		frmMapLevel.method="post";
		frmMapLevel.action="map.html";
		frmMapLevel.submit();
	}
	else{
		alert("Select any one Event Type");
		frmMapLevel.eventTypeId.focus();
	}
}
 </script>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

		<%
			String EventId = (String)request.getAttribute("eventTypeId");
			System.out.print("EventId:" + EventId);
			if(EventId==null){
				EventId = "";
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
                            <h2>Roles Privileges:Entity Role Mapping</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>You can map an Event Level or Multiple Event Level for
 				a given Membership Type Name as given below.</p>
							<p>Map An Event Level For A Member:</p>
							
						<!--==============================Form Description=================================-->
							
                           
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMapLevel" id="frmMapLevel">
							
                               <input type="hidden" name="process" value="" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="eventTypeId" id="eventTypeId" class="form-control" onchange="postData();">
													<option selected="selected" value="">Select One</option>
													<%
														Vector allTypesVect=(Vector)request.getAttribute("allTypesVect");
														if(allTypesVect!=null){
														Enumeration itrators= (Enumeration)allTypesVect.elements();
														while(itrators.hasMoreElements()){
															String[] levels = (String[]) itrators.nextElement();                                    
															String typeid=levels[0];
															String name=levels[1];
															String status = levels[2];
															String add_date = levels[3];
															 if(typeid.equals(EventId)){
													%>
												<option  value="<%=typeid%>" selected="selected"><%=name%></option>
													<%
														}
														else{
													%>
												<option  value="<%=typeid%>"><%=name%></option>
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
							
						<form class='form-horizontal' role='form' name="myform" id="myform" method="post" action="map.html" onsubmit="return entPrivValidate();" >
						  <input type="hidden" name="process" value="mappingPriorityLevel" />
							<input type="hidden" name="entityIds" value="puni">
							<input type="hidden" name="EventId" value="<%=EventId%>">
							
							<div class='col-md-offset-2'>
							
							<label class='control-label label1'>Accessible Event Level(s):</label>
							
							</div>
                                    
								
								
								 <div class='form-group'>
								 <div class='col-md-8'>
								 
								 <div class='col-md-4'>
								 </div>
								 
                                 <div class='col-md-4'>  
                                   <input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" > Select All	
								   </div>
								   							
                                     <div class='col-md-3'>Priority
											</div>
											
										</div>
									</div>
									<%
													//int chkSelct = 0;
													ArrayList DispCompResult=(ArrayList)request.getAttribute("DispCompResult");
													if(DispCompResult!= null && DispCompResult.size()!=0){
													int n = DispCompResult.size();
													System.out.print("n" +n);
													Iterator itr = DispCompResult.iterator();
													while(itr.hasNext()){
														//chkSelct++;
														String[] res = (String[]) itr.next();
															String compResultTypeId = res[0];
															String compResultName = res[1];
															String compResultDesc = res[2];
															String addDate = res[3];
															int pNo =0;
															//System.out.print("compResultTypeId:" + compResultTypeId);
															boolean entIdStatus = false;
																ArrayList mapCompResultDetails = (ArrayList)request.getAttribute("mapEventTypeDetails");
																
																if(mapCompResultDetails!=null && mapCompResultDetails.size()!=0){
																	Iterator itMemCompResultList = mapCompResultDetails.iterator();
																	//String[] evtMapList = {mapEventTypeId, tepmEventTypeId, compResultId, eventTypeName, resultName,String.valueOf(priority)};
																	while(itMemCompResultList.hasNext()){
																		String[] mapEntList = (String [])itMemCompResultList.next();
																	 	String mapEventTypeId = mapEntList[0];
																		String tepmEventTypeId = mapEntList[1];
																		String compResultId = mapEntList[2];
																		String eventTypeName = mapEntList[3];
																		String resultName = mapEntList[4];
																		String priority = mapEntList[5];
																		pNo = Integer.parseInt(priority);
																		//System.out.print("compResultId:" + compResultId);
																		//System.out.print("pNo" + pNo);
																		if(compResultTypeId.equals(compResultId)){
																			entIdStatus = true;
																			break;
																		}
																	}
											}
											if(entIdStatus==true){									
													%>
													
							<div class='form-group'>
								<div class='col-md-8'>
								
								 <div class='col-md-4'>
								 </div>
								 
                                 <div class='col-md-4'>  
								 
                                  <input type="checkbox" size="10"  name="<%=compResultName%>"  value="<%=compResultTypeId%>" checked="checked"  /><%=compResultName%>
								  </div>			
                                    
									<div class='col-md-3'> 
										<select name="priorityId<%=compResultName%>" id="priorityId<%=compResultName%>" class="form-control">
													  <option value="0" selected="selected">0</option>
                                               		<%
														
															for(int i=1;i<=n;i++) {
															if(pNo==i){
															%>
                                                            <option value="<%=i%>" selected="selected"><%=i%></option>
															<%
															}
															else{%>
															  <option value="<%=i%>"><%=i%></option>
															<%}
															}
														%>
                                                      </select>
											</div>
											
										</div>
									</div>
									
									
									<%}else{%>
									
							<div class='form-group'>	
								<div class='col-md-8'>
								
								 <div class='col-md-4'>
								 </div>
								 
                                 <div class='col-md-4'>  
							
									<input type="checkbox" size="10" name="<%=compResultName%>"  value="<%=compResultTypeId%>" /><%=compResultName%>
									
								</div>
									
									
									<div class='col-md-3'>  
											<select name="priorityId<%=compResultName%>" id="priorityId<%=compResultName%>" class="form-control">
                                                          <option value="0" selected="selected">0</option>
														   <%
															for(int i=1;i<=n;i++) {
															%>
                                                        <option value="<%=i%>"><%=i%></option>
															<%
															}
														%>
                                                      </select>
													</div>
													
												</div>
											</div>
											
									<%}}}%>									
									
								

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
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
