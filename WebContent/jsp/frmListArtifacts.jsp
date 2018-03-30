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
<script language="javascript">
 function addRow(mainArtiName, mainArtifatId)
{

	strURL = "./artifactMapping.html?artiMapProcess=initCreateArtifact&mainArtifactName="+mainArtiName+"&mainArtiId="+mainArtifatId;
	window.location.href = strURL;
}

function editRow(tableID,mainArtiName, mainArtifatId)
{
	var artifactId;
	var chkCnt=0;
	var vFlag = false;
	var chkBoxCnt = document.frmRoleMgtListRole.chk.length;

    if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmRoleMgtListRole.chk[i].checked==true)
			{
				   artifactId = document.frmRoleMgtListRole.chk[i].value;
				   chkCnt++;
			}

		}
	}
	else
	{
			if(document.frmRoleMgtListRole.chk.checked==true)
			{
				   artifactId = document.frmRoleMgtListRole.chk.value;
				   chkCnt++;
			}

	}
//Starts for checkbox
                if(chkCnt>1)
                {
                    for(var j=0;j<chkBoxCnt;j++)
                    {
                        vFlag = true;
                        document.frmRoleMgtListRole.chk[j].checked = false;
                        document.frmRoleMgtListRole.chkAll.checked = false;
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
//alert(mainArtiName);
                strURL = "./artifactMapping.html?artifactId="+artifactId+"&artiMapProcess=initeditArtifact&mainArtifactName="+mainArtiName+"&mainArtiId="+mainArtifatId;
		window.location.href = strURL;
}
    function deleteRow(tableID) {

	var roleId;
	var chkCnt=0;
	var vFlag = 0;
	var cannotDelete=0;
	var canDelete = 0;
	var chkBoxCnt = document.frmRoleMgtListRole.chk.length;
	if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmRoleMgtListRole.chk[i].checked==true)
			{
				   if(document.frmRoleMgtListRole.flag[i].value==0)
				   {
					cannotDelete++;
					document.frmRoleMgtListRole.chk[i].checked = false;
                                         //For Debug Starts
                                document.frmRoleMgtListRole.chkAll.checked = false;
                                //For Debug Ends
				   }

				   if(document.frmRoleMgtListRole.flag[i].value==1)
				   {
					canDelete++;
				   }
			}

			if(cannotDelete > 0 && canDelete > 0)
			{
							vFlag = 1;
			}
			else if(cannotDelete > 0 && canDelete == 0)
			{
							vFlag = 2;
			}
			else if(cannotDelete == 0 && canDelete == 0)
			{
							vFlag = 3;
			}
			else if(cannotDelete == 0 && canDelete > 0)
			{
							vFlag = 4;

			}
		}
	}
	else
	{
			if(document.frmRoleMgtListRole.chk.checked==true)
			{
				   if(document.frmRoleMgtListRole.flag.value==0)
				   {
					cannotDelete++;
					document.frmRoleMgtListRole.chk.checked = false;
                                          //For Debug Starts
                                document.frmRoleMgtListRole.chkAll.checked = false;
                                //For Debug Ends
				   }

				   if(document.frmRoleMgtListRole.flag.value==1)
				   {
					canDelete++;
				   }
			}

			if(cannotDelete > 0 && canDelete == 0)
			{
							vFlag = 2;
			}
			else if(cannotDelete == 0 && canDelete == 0)
			{
							vFlag = 3;
			}
			else if(cannotDelete == 0 && canDelete > 0)
			{
							vFlag = 4;

			}

	}

	if(vFlag == 1)
	{
		confirm("Only the checked records will be deleted. Click the Delete button again");
	}

	if(vFlag == 2)
	{
	   alert("Checked records cannot be deleted as it is being referred or mapped.");
	}

	if(vFlag == 3)
	{
		alert("Please check the record(s) to be deleted");
	}

	if(vFlag == 4)
	{
		if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
		{
			 document.frmRoleMgtListRole.artiMapProcess.value = 'deleteArtifact';
			 document.frmRoleMgtListRole.submit();
		}
	}

}


function checkAll()
{

		var chkBoxCnt = document.frmRoleMgtListRole.chk.length;
		if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
		{
			for(var i=0;i<chkBoxCnt;i++)
			{
				 if(document.frmRoleMgtListRole.chkAll.checked==true)
				 {
					 document.frmRoleMgtListRole.chk[i].checked = true;
				 }
				 else
				 {
					document.frmRoleMgtListRole.chk[i].checked = false;
				 }
			}
		}
		else
		{
				 if(document.frmRoleMgtListRole.chkAll.checked==true)
				 {
					 document.frmRoleMgtListRole.chk.checked = true;
				 }
				 else
				 {
					document.frmRoleMgtListRole.chk.checked = false;
				 }

		}



}


function postData(){
	if(document.frmView.viewId.value!=""){
		document.frmView.artiMapProcess.value = "artifactList";
		//alert(frmRewalList.eventProcess.value);
		document.frmView.method="post";
		document.frmView.action="artifactMapping.html";
		document.frmView.submit();
	}
	else{
		alert("Select any one View");
		document.frmView.viewId.focus();
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
					
							 <% String mainArtifactName1=(String) request.getAttribute("artifactName");
								  String mainArtiId1=(String) request.getAttribute("mapPerId");
								   String retViewId=(String) request.getAttribute("viewId");
								  
							 %>
                        <div class='panel-heading'>
						
                            <h2><%=mainArtifactName1%> Artifact Table</h2>
							
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
         
         
         <p> To create a Sub Artifact for the respective Main Artifact click Add button.
                    To edit a Sub Artifact select the checkbox before each record and then click on the Edit button. </p>
               
			   			<input type="hidden" name="mainArtifactName" value="<%=mainArtifactName1%>" />
                      <input type="hidden" name="mainArtiId" value="<%=mainArtiId1%>" />
					  
					  
					   		<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="button" type="button" onclick="addRow('<%=mainArtifactName1%>','<%=mainArtiId1%>')" value="Add">Add</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="button" type="button"  onclick="editRow('dataTable','<%=mainArtifactName1%>','<%=mainArtiId1%>')" value="Edit" style=''>Edit</button>
                                    </div>
							</div>
                     
                      <!--<input type="submit" value="Delete" onclick="deleteRow('dataTable')" class="gradBtn" align="right" name="del"/>-->                 
					  
					  
                  <% 
				if(sessionRoleName!=null && sessionRoleName.equalsIgnoreCase("Admin")){
				
				%>
				
				
                  <form class='form-horizontal' role='form' name="frmView" id="frmView">
                    <input type="hidden" name="artiMapProcess" value="" />
                  
               
			   			 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a View:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <select name="viewId" id="viewId" class="form-control" onchange="postData();">
													<option selected="selected" value="">Select One</option>
													<%
																ArrayList viewDrop = (ArrayList)request.getAttribute("viewDrop");
																if(viewDrop!=null && viewDrop.size()!=0){
																	Iterator itViewDropList = viewDrop.iterator();
																	while(itViewDropList.hasNext()){
																		String[] viewObj = (String [])itViewDropList.next();
																		
																		String privViewId = viewObj[0];
																		String privViewName = viewObj[1];
																		String viewRoleId = viewObj[2];
																		String viewEntityId = viewObj[3];
																		if(privViewId.equals(retViewId)){
																		%>
													<option value="<%=privViewId%>" selected="selected"><%=privViewName%></option>
													<%
																		 }
																		 
																		 else{
																		 %>
													<option value="<%=privViewId%>"><%=privViewName%></option>
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
         								
										 <%}%>
       
											  <%
													  
												String artifactId=null;
												String subArtifactName ="";						
												String artifactName1="";
																			   
										 ArrayList artiList = (ArrayList) request.getAttribute("allartifactList");
											 if(artiList!=null && artiList.size()!=0){
											Iterator it = artiList.iterator();
											%>
        
							  <form class='form-horizontal' role='form' name="frmRoleMgtListRole" id="frmRoleMgtListRole">
								<input type="hidden" name="artiMapProcess" value="initeditArtifact" />

									<div class='form-group'>
									
										<div class='col-md-1 col-offset-2'>                
												
												<input type="checkbox" name="chkAll" onclick = "checkAll()" />                  
												
										</div>
										
										<div class="col-md-3">
										
											<label class="control-label label1">Sub Artifact Name</label>
										
										</div>

									</div>
                 
											<%
										
											while(it.hasNext()){
												String[] s = (String[])it.next();
												 artifactId = s[0];
												 subArtifactName = s[1];
											
																				 //artifactName1=s[2];
																			   
												 int chkBoxIndex = 0;
											
				
											 %>
											 
											<input type="hidden" name="artifactId" value="<%=artifactId%>" />
											 
								<div class='form-group'>
									
										<div class='col-md-1 col-offset-2'>                
												
												<input type="checkbox" name="chk" value ="<%=artifactId%>" />                 
												
										</div>
										
										<div class="col-md-3">
										
											<label class="control-label "><%=subArtifactName%></label>
										
										</div>

									</div>
                			
               
               								 <%
                                               
                                                chkBoxIndex++;
                                              
                                                        }
											 }
						 else {%>
						 
								<div class='form-group'>
								
                                 <div class="container"> 
								   
									   <div class="row"> 
									   
											<div class='col-md-4'>
											</div>
											
											<div class='col-md-4'>
												No records are available 
											</div>
											
										</div>
										
									 </div>
								
								</div>      
								
			          <% } %>
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
