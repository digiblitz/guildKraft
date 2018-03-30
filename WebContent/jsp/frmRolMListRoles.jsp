<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*" errorPage="error.jsp"%>
<!DOCTYPE html>
<html class="no-js">

<head>
    <title><%=(String)session.getAttribute("title")%></title>
	
	<!--Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
<script language="javascript">
 function addRow()
{
	strURL = "./roles.html?roleProcess=initCreateRole";
	window.location.href = strURL;
}

function editRow(tableID)
{
	var roleId;
	var chkCnt=0;
	var vFlag = false;
	var chkBoxCnt = document.frmRoleMgtListRole.chk.length;

    if(chkBoxCnt!=undefined && chkBoxCnt!='undefined' && chkBoxCnt > 1)
	{
		for(var i=0;i<chkBoxCnt;i++)
		{
			if(document.frmRoleMgtListRole.chk[i].checked==true)
			{
				   roleId = document.frmRoleMgtListRole.chk[i].value;
				   chkCnt++;
			}

		}
	}
	else
	{
			if(document.frmRoleMgtListRole.chk.checked==true)
			{
				   roleId = document.frmRoleMgtListRole.chk.value;
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

                strURL = "./roles.html?roleId="+roleId+"&roleProcess=initeditRole&Submit2=Edit";
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
			 document.frmRoleMgtListRole.roleProcess.value = 'deleteRole';
			 document.frmRoleMgtListRole.submit();
		}
	}

}

/*function multiChkBoxValidation(tableID)
{
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
            var chkCnt = 0;

            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                var rolename = row.cells[1].childNodes[0];
                var roledesc = row.cells[2].childNodes[0];
                var activeradio = row.cells[3].childNodes[0];
                var inactiveradio = row.cells[4].childNodes[0];

                if(null != chkbox && true == chkbox.checked)
                {

					if(document.frmRoleMgtListRole.chk.checked==true)
					{
						alert("First enter the details for new Role and click Save button");
						chkbox.checked = false;
						return;

					}

                }
				else{

						rolename.disabled =true;
						roledesc.disabled =true;
						activeradio.disabled=true;
						inactiveradio.disabled =true;

				}


            }
}*/

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

    </script>
<!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
	
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
                            <h2>Maintain Roles: Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>You are viewing the list of Roles created by you.
          To create a Role click Add button.
            To edit a Role select the checkbox before each record and then click on the Edit button.
            To delete Roles select the checkbox(s) before each record and then click on the Delete button.</p>
							
						<!--==============================Form Description=================================-->
							
                           
							<!--==============================Form Body=================================-->
							
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1' >
                                        <button class='btn-lg btn-primary' onClick="addRow()" value="Add">Add</button>
                                    </div>
                                    <div class='col-md-1'>
                                        <button class='btn-lg btn-primary' style='' onClick="editRow('dataTable')" value="Edit">Edit</button>
                                    </div>
									<div class='col-md-1'>
                                        <button class='btn-lg btn-danger' style='' value="Delete" onClick="deleteRow('dataTable')">Delete</button>
                                    </div>
                            </div>
							
                            <form class='form-horizontal' role='form' name="frmRoleMgtListRole" id="frmRoleMgtListRole" action="roles.html">
							
                      			<input type="hidden" name="roleProcess" value="initeditRole" />

                                <div class='form-group'>
                                    <div class='col-md-12 gp'>
									
                                        <div class="col-md-1 ">
											<input type="checkbox" name="chkAll" onclick = "checkAll()" id='id_interest' style="margin-top:11px"/>
										</div>
										
										<div class="col-md-3 ">
											<label class='control-label label1'>Role </label>
										</div>
										
										<div class="col-md-4 ">
											<label class='control-label label1'>Description </label>
										</div>
											
							   
										<div class="col-md-2 ">
											<label class='control-label label1 '>Active</label>
										</div>
										
										<div class="col-md-2 ">
											<label class='control-label label1 mar'>Inactive</label>
										</div>
		
									</div>
                                </div>

                                <%
						 ArrayList roleList = (ArrayList) request.getAttribute("allRoleList");
          					 if(roleList!=null && roleList.size()!=0){
							Iterator it = roleList.iterator();
							while(it.hasNext()){
								String[] s = (String[])it.next();
								String roleId = s[0];
								String rolName = s[1];
							//Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
                                                                String roledesc=s[2];
                                                                String status=s[3];
                                                                String flag=s[4];
                                                                int chkBoxIndex = 0;
							//End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011

		                %>
                      		<input type="hidden" name="roleId" value="<%=roleId%>" />
							
							<div class='form-group'>
                                    <div class='col-md-12 '>
									
                                        <div class="col-md-1">
											<input type="checkbox" name="chk" value ="<%=roleId%>" id='id_interest' style="margin-top:11px"/>
										</div>
										
										<div class="col-md-3">
											<label class='control-label'><%=rolName%> </label>
										</div>
										
										<div class="col-md-4">
											<label class='control-label'><%=roledesc%> </label>
										</div>
										
										<%if(Integer.parseInt(status)==1){%>
							   
											<div class="col-md-2 ">
												<input type="radio" name="<%=roleId%>" value="1" checked="checked" disabled="disabled" />
											</div>
											
											<div class="col-md-2 ">
												<input type="radio" name="<%=roleId%>" value="0"  disabled="disabled" />
											</div>
										
										<%}else{%>
										
											<div class="col-md-2 ">
												<input type="radio" name="<%=roleId%>" value="1"  disabled="disabled" />
											</div>
											
											<div class="col-md-2 ">
												<input type="radio" name="<%=roleId%>" value="0" checked="checked" disabled="disabled">
											</div>
											
										<% } %>
										
                        				<input type ="hidden" name ="flag" value ="<%=flag%>"/>
										
										
										
									</div>
                                </div>
										<%		//Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
                                                chkBoxIndex++;
                                                //End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
												}}else {
										%>
										<div class='form-group'>
											<div class="col-md-4">
											</div>
											<div class="col-md-4">
												No Records are found 
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
