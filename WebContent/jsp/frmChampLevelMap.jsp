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
//alert();
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
		 
		document.myform.chkdEveLevels.value = chkValue;
		
		//alert("Final" + count + " checked Value:  ********" + document.myform.chkdEveLevels.value);
}

function myValidate(){
//alert();
  	if(document.myform.selArea.value==""){
		alert("Select an Area");
		document.myform.selArea.focus();
		return false;
	}
	
	
var eventLvlValue=document.myform.eventLevelCnt.value;
var isChecked = false;
	
	for(var k=0;k<eventLvlValue;k++){
	var chName = "tmpEventLevel"+k;
		if(document.getElementById(chName).checked){
			isChecked = true;
		}
	}
if(isChecked==false){
		alert("Check any one of the check box");
		return false;
	}	
 	DelAll();
	return true;
}
</script>	
	
<script language="javascript">
function postData(selArea){
	if(selArea!=null && selArea!=""){
		document.myform.method="post";
		document.myform.action="./ChampLevel.html?cmd=eveLevel&selArea="+selArea;
		document.myform.submit();
	}else{
		alert("Select a Valid Area");
		return false;		
	}
	return true;
}	

 </script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
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
						
						<h2>Online Entries: Championship Level Map</h2>
						
						</div>
				
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						

						<%
						String eventTypeId = (String)request.getAttribute("eventType");
						String areaId = (String)request.getAttribute("areaId");			
						%>  			
				  
 						<p>You can map an Area for an Event Level.</p>
				 		
						 
						  <form class='form-horizontal' role='form' name="myform" id="myform" action="ChampLevel.html" method="post" onsubmit="return myValidate();">
					    	<input type="hidden" name="cmd" value="mapLevel" />
							<input type="hidden" name="chkdEveLevels" id="chkdEveLevels" value=""/>	
							<input type="hidden" name="eventType" id="eventType" value=""/>	
				  
				  
				  			<div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 					   				  
												 <select name="selArea" id="selArea" class="form-control" onchange="postData(this.value);">
													<option selected="selected" value="">Select One</option>
													<%
													
													ArrayList allAreaList = (ArrayList)request.getAttribute("areaDetails");
													if(allAreaList!=null&& allAreaList.size()!=0){
													Iterator areaLst = allAreaList.iterator();
													while(areaLst.hasNext()){
															String AreaLstArr[] = (String [])areaLst.next();
															String area_id = AreaLstArr[0];
															String area_code = AreaLstArr[1];
															String area_name = AreaLstArr[2];
															out.print("area_id "+area_id);
															if(areaId.trim().equalsIgnoreCase(area_id)){
													%>
														<option  value="<%=area_id%>" selected="selected"><%=area_name%></option>
														<%
																		}
																		else{
																%>
														<option  value="<%=area_id%>"><%=area_name%></option>
														<%
							
														}
														}
													}
												
													%>
												  </select>
												  <span id="span_astriesk">*</span>			
											</div>
										</div>
									</div>
								</div>
												  
				
									<%
								ArrayList eventLevelDetails = (ArrayList)request.getAttribute("eventLevelDetails");
								System.out.println("eventLevelDetails in jsp: "+eventLevelDetails);		
													if(eventLevelDetails!=null && eventLevelDetails.size()!=0){
									
									%>
			
							<div class='form-group'>
							
                                 <label class='control-label label1 col-sm-offset-1 '>Event Levels:<span id="span_astriesk">*</span></label>
								 
							</div>	
							
								
								
								<div class='form-group'>
								
									 <div class='col-md-offset-1'>
				
										<input  type="checkbox" name="chkAll" value="ChkAll" alt="Select or Deselect All" onClick="checkAll();" > Select All									
			
										<input type="hidden" name="eventLevelCnt" id="eventLevelCnt" value="<%=eventLevelDetails.size()%>"/>		
									
									</div>
								</div>	
																
											<% Iterator itl = eventLevelDetails.iterator();
														int i=0;
													  while(itl.hasNext()){
													  
													String [] levelDet = (String [])itl.next();
													//String evId = levelDet[0];
													String evLevelId = levelDet[0];
													String evLevelCode = levelDet[1];
													
													
											boolean entIdStatus = false;
											ArrayList eventLevelAreaDets = (ArrayList)request.getAttribute("eventLevelAreaDets");
											String chStatus = "";
										if(eventLevelAreaDets!=null && eventLevelAreaDets.size()!=0){
										Iterator itr = eventLevelAreaDets.iterator();	
										
									while(itr.hasNext()){
													String[] mapEntList = (String [])itr.next();
													String areaEventLevelId = mapEntList[1];
													if(evLevelId.equals(areaEventLevelId)){
													entIdStatus = true;
													break;
													}
													}
													}
											if(entIdStatus==true) chStatus = "checked";
											else chStatus = "";
																
										%>
								<div class='form-group'>
								
									<div class='col-md-offset-1'>
									
											<input type="checkbox" size="10" name="tmpEventLevel" id="tmpEventLevel<%=i%>" <%=chStatus%> value="<%=evLevelId%>" />&nbsp;<%=evLevelCode%>		
									</div>
								</div>
									
								
										<% 
											i++;													
											}%>
										
							
									
				 				<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1 gp'>
                                        <button class='btn-lg btn-primary' value="Submit" type='submit'>Submit</button>
                                    </div>
                                    <div class='col-md-2 gp'>
                                        <button class='btn-lg btn-danger' name="button" type="button"  value="Cancel"  onclick="javascript:history.back(-1);" style=''>Cancel</button>
                                    </div>
                                </div> 
					
					
								<%}%>
								
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
