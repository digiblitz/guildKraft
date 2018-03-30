<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html>
<html class="no-js">

<head>
<title><%=(String)session.getAttribute("title")%></title>
<script src="js/validate.js" type="text/javascript" ></script>
<script>

function search()
{
	
			var masterId=document.frmSearchListgroups.masterId.value;
			   strURL = "./artifactMapping.html?artiMapProcess=searchList&masterId="+masterId;
               window.location.href = strURL;
			
		
	
	}
	
	function AddGroups()
	{
		
		var masterId=document.frmSearchListgroups.masterId.value;
		   strURL = "./artifactMapping.html?artiMapProcess=AddGroups&masterId="+masterId;
           window.location.href = strURL;
	}
	function EditGroups()
	{
	
	var layer_value_id;
	var chkCnt=0;
	var vFlag = false;
	var masterId=document.frmSearchListgroups.masterId.value;
	var chkBoxCnt = document.frmSearchListgroups.chk.length;

    if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmSearchListgroups.chk[i].checked==true)
			{
				layer_value_id = document.frmSearchListgroups.chk[i].value;
				   chkCnt++;
			}

		}
	}
	else
	{
			if(document.frmSearchListgroups.chk.checked==true)
			{
				layer_value_id = document.frmSearchListgroups.chk.value;
				   chkCnt++;
			}

	}
//Starts for checkbox
                if(chkCnt>1)
                {
                    for(var j=0;j<chkBoxCnt;j++)
                    {
                        vFlag = true;
                        document.frmSearchListgroups.chk[j].checked = false;
                        document.frmSearchListgroups.chkall.checked = false;
                    }

                }
                //Ends for checkbox
		if(chkCnt==0){

			 alert("Please check one record to edit");
			return;
		}

			if(vFlag == true)
			{
				alert("Only one record can be edited.Please check one record to edit.");
                                return;
			}
				
			strURL = "./artifactMapping.html?artiMapProcess=EditGroups&layer_value_id="+layer_value_id+"&masterId="+masterId;
		window.location.href = strURL;
}
	
	  function deleteGroups() {
			 var checkId=document.getElementById('chk');

			var chkCnt=0;					
					
						var canDelete = 0;
						var chkBoxCnt = document.frmSearchListgroups.chk.length;
						//alert("chkBoxCnt---"+chkBoxCnt);

						if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
						{
							for(var i=0;i<chkBoxCnt;i++)
							{
								if(document.frmSearchListgroups.chk[i].checked==true)
								{
									canDelete++;
								}

							}
						}
						else
						{
								if(document.frmSearchListgroups.chk.checked==true)
								{
									canDelete++;
								}

						}

						if(canDelete == 0)
						{
							alert("Please check the record(s) for Delete.");
						}

						if(canDelete > 0)
						{
							if(confirm("Only selected records will be deleted.Are you sure you want to delete the same?"))

							{
									//alert("canDelete---"+canDelete);
								document.frmSearchListgroups.artiMapProcess.value ='deleteGroups';
								document.frmSearchListgroups.submit();

							}
						}
				 }
				 
function checkAll()
{

		var chkBoxCnt = document.frmSearchListgroups.chk.length;
		if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
		{
			for(var i=0;i<chkBoxCnt;i++)
			{
				 if(document.frmSearchListgroups.chkAll.checked==true)
				 {
					 document.frmSearchListgroups.chk[i].checked = true;
				 }
				 else
				 {
					document.frmSearchListgroups.chk[i].checked = false;
				 }
			}
		}
		else
		{
				 if(document.frmSearchListgroups.chkAll.checked==true)
				 {
					 document.frmSearchListgroups.chk.checked = true;
				 }
				 else
				 {
					document.frmSearchListgroups.chk.checked = false;
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
						  
							<h2>Group-Details: List</h2>
						    
						</div>
						
						<!--==============================Form Title=================================-->
                    
					<div class='panel-body'>
					
						 <div class='form-group'>
                             <div class='col-md-8'>
					 			 <div class='col-md-offset-5 col-md-1'>
								<button name="add" class='btn-lg btn-primary' onClick="AddGroups();" value="Add">Add</button>
								</div>
								 <div class='col-md-offset-1 col-md-1'>
								<button name="edit" class='btn-lg btn-primary' onClick="EditGroups();" value="Edit">Edit</button>
								</div>
								 <div class='col-md-offset-1 col-md-1'>
								<button name="delete" class='btn-lg btn-danger' onClick="deleteGroups();" value="Delete">Delete</button>
								</div>
							</div>
						  </div>
						  <div class='form-group'>
                             <div class='col-md-8'>&nbsp;</div>
						</div>
						
						<!--==============================Form Description=================================-->
                            <form class='form-horizontal' role='form' name="frmSearchListgroups" id="frmSearchListgroups" method="post" action="./artifactMapping.html">
                              <input type="hidden" name="artiMapProcess" value="" />
							    
								<%
											String groupIdObj=(String)request.getAttribute("groupId");
								%>
								
								 <div class='form-group'>
								 
                               			 <div class='col-md-8 gp'>
										 
										 <div class='col-md-2'></div>
										 
										 <label class='control-label col-md-2 col-md-offset-3' for='id_title'>Groups:</label>
                                        		
												<div class='col-md-3 indent-small'>
                                           			
													 <div class='form-group internal'>
													 
														 <select name="masterId" class="form-control" onChange="search(); ">
														<option  selected="selected" value="">Select One</option>
														<%ArrayList viewGroupSrchList = (ArrayList)request.getAttribute("groupList");
															if(viewGroupSrchList!=null && viewGroupSrchList.size()!=0){
															Iterator itGprSrch = viewGroupSrchList.iterator();
															while(itGprSrch.hasNext()){
																String[] groupSrchList = (String[])itGprSrch.next();
																String group_id_srch = groupSrchList[0];
																String group_name_srch = groupSrchList[1];
															   if (group_id_srch.equals(groupIdObj)){
																												
														%>
														<option  value="<%=group_id_srch%>" selected="selected" ><%=group_name_srch%></option>
														<%}else{%>
														
														<option  value="<%=group_id_srch%>" ><%=group_name_srch%></option>
														
														<%}}}%>
														</select>
                               						 <span id="span_astriesk">*</span>
							
												</div>
							
											</div>
						
										</div>
				
						</div>
						
						<div class="form-group">
					 
							 <div class='col-md-12 gp'>
							 
							 			
									   
										<div class='col-md-1 col-md-offset-3'>
										
										<input type="checkbox" name="chkAll" onClick="checkAll();" style="margin-top:11px"/>
						
											</div>
										
										<div class='col-md-3'>
											
											<label class='control-label label1'>Group</label>
										
										</div>
											
										<div class='col-md-4'>
										
											<label class='control-label label1'> Details </label>
											
										</div>
										
									</div>
								</div>
									
											 <%
											  ArrayList viewGroupAllList = (ArrayList)request.getAttribute("viewGroupList");
												 if(viewGroupAllList!=null && viewGroupAllList.size()!=0){
											Iterator itViewGrp = viewGroupAllList.iterator();
											while(itViewGrp.hasNext()){
											String[] viewGroupAllStr = (String[])itViewGrp.next();
											String layer_value_id = viewGroupAllStr[0];
											String masterIdList = viewGroupAllStr[1];
											String layer_value = viewGroupAllStr[2];
											String masterNameList = viewGroupAllStr[3];
											  %>
								  
                          
							 <div class="form-group">
					 
							 <div class='col-md-12'>
							 
										<div class='col-md-1 col-md-offset-3'>
						
											<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
													
													 <input type="checkbox" name="chk" value="<%=layer_value_id%>" style="margin-top:11px"/>
											</div>
										
										</div>
										
									 <div class='col-md-3'>
											
											<label class='control-label'> <%=masterNameList%></label>
									
									</div>
									
									 <div class='col-md-4'>
									 
									 	<label class='control-label'><%=layer_value%></label>
										
									</div>
								
								</div>
							
							</div>
						
                              <%}
                                 }else{ %>
							
										<div class='form-group'>
								
                                   			<div class="container"> 
								   
									   				<div class="row">
													 
														<div class='col-md-4'>
                              
														</div>
									   
														<div class='col-md-4'>
                              								
															No Records Found
																
														</div>
													
								                   </div>
							
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
