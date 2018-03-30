<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
<script>

function validate()
{
	
	var vFlag = false;
	var obj=document.frmAddListgroups;
	
	if(obj.masterId.selectedIndex==0 )
    {
		alert("Please select any one of the Group");
		return false;
    }
	if(obj.groupDet.value=="" )
    {
		alert("Details cannot be empty");
		return false;
    }

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			if((obj.elements[i].value.indexOf('	') == 0) || (obj.elements[i].value.lastIndexOf('	') == (obj.elements[i].value.length-1)) ||
				(obj.elements[i].value.indexOf(' ') == 0) || (obj.elements[i].value.lastIndexOf(' ') == (obj.elements[i].value.length-1)))
			{
				obj.elements[i].value = obj.elements[i].value.trim();
				//obj.elements[i].focus();
				vFlag = true;
			}
		}
	}

	if(vFlag==true)
	{
		alert("Leading and Trailing spaces will be trimmed. Please Submit again");
		return false;
	}
	
}

function cancelGroup()
{
	var masterId=document.frmAddListgroups.groupId.value;
	   strURL = "./artifactMapping.html?artiMapProcess=searchList&masterId="+masterId;
    window.location.href = strURL;	
	}
</script>
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
</head>

<body>

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
						    
							<h2>Group - Details : Create</h2>
						   
						  </div>							 
					
						<!--==============================Form Title=================================-->
						
                    <div class='panel-body'>
					
					<!--==============================Form Description=================================-->	
                 <p>You can Create a New Group - Detail for all users.</p>
			   
			      <form class='form-horizontal' role='form'name="frmAddListgroups" id="frmAddListgroups" method="post" action="artifactMapping.html" onsubmit="return validate();">
				    <input type="hidden" name="artiMapProcess" value="createGroups" />
                     <input type="hidden" name="layerId" value="" />
                              <%
    							String groupIdObj=(String)request.getAttribute("groupId");
								%>                          
                             
							  <input type="hidden" name="groupId" value="<%=groupIdObj%>" />
                             
							 <p>Fields marked with an asterisk (<span style="color:#FF0000">*</span>) are required.</p>
                           
										  <% String statuscheck = (String)request.getAttribute("status");
								if(statuscheck!=null && statuscheck.equals("error")){
								%>
										 <p id="p_error"> Detail already exist</p> 
										  <%
								}
								%>
					
					
								 <div class='form-group'>
								 
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Groups:</label>
                            
                               			 <div class='col-md-8'>
                                        		
												<div class='col-md-3 indent-small'>
                                           			
													 <div class='form-group internal'>
													 
							                        	<select name="masterId" class="form-control"  >
                                                       	<option  selected="selected" value="">Select One</option>
														<%
																	ArrayList viewGroupList = (ArrayList)request.getAttribute("groupList");
																 if(viewGroupList!=null && viewGroupList.size()!=0){
														Iterator it = viewGroupList.iterator();
														while(it.hasNext()){
															String[] groupList = (String[])it.next();
															String group_id = groupList[0];
															String group_name = groupList[1];
														   if (group_id.equals(groupIdObj)){
																																	
																				%>
														<option  value="<%=group_id%>" selected="selected" ><%=group_name%></option>
														<%
																}
																else{
																%>
														<option  value="<%=group_id%>" ><%=group_name%></option>
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
			 
                             
								<div class='form-group'>
								 
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Details:</label>
                            
                               			 <div class='col-md-8'>
                                        		
												<div class='col-md-3 indent-small'>
                                           			
													 <div class='form-group internal'>
													 
													 <input name="groupDet" type="text" class="form-control" />
                               	
														 <span id="span_astriesk">*</span>
													 
													 </div>
											</div>
									</div>
								
							</div>
							
						
							
							 <div class='form-group'>
                             <div class='col-md-8'>
					 			 <div class='col-md-offset-5 col-md-1'>
									<button class='btn-lg btn-primary' type="submit" name="submit" class="button-add" value="Create">Create</button>
								</div>
								 <div class='col-md-offset-1 col-md-1'>
									<button class='btn-lg btn-danger' name="Clear"  type="reset" value="Clear" onclick = "clearFields(this.form)">Clear</button>
								</div>
								 <div class='col-md-offset-1 col-md-2'>
									<button  class='btn-lg btn-danger' name="Cancel" type = "button" value="Cancel" onclick = "cancelGroup();">Cancel</button>
								</div>
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
