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
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.math.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <script src="javascripts/validate.js" type="text/javascript" ></script>

        <script language="javascript">
            function postData(tableID){
                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;

                for(var i=3; i<rowCount; i++) {
                    var row = table.rows[i];
                    var chkbox = row.cells[0].childNodes[0];
                    // var strmembershipId=new Array();
                    //  var i=0;
                    if(null != chkbox && true == chkbox.checked)
                    {
                        var memID=chkbox.value;
                        strURL = "./memberMaster.html?memProcess=memTyDelete";
                        window.location.href = strURL;

                    }
                }
            }

            function valid2() {
                var chkCnt=0;
                var vFlag = 0;
                var cannotDelete=0;
                var canDeleted = 0;
                var chkBoxCnt = document.viewEdit.select11.length;
                if(chkBoxCnt!='undefined' && chkBoxCnt > 1)
                {
                    for(var i=0;i<chkBoxCnt;i++)
                    {
                        if(document.viewEdit.select11[i].checked==true)
                        {
                            if(document.viewEdit.candelete[i].value=='No')
                            {
                                cannotDelete++;
                                document.viewEdit.select11[i].checked = false;
								//For Debug Starts
                                document.viewEdit.selectHead.checked = false;
                                //For Debug Ends
                            }

                            if(document.viewEdit.candelete[i].value=='Yes')
                            {
                                canDeleted++;
                            }
                        }

                        if(cannotDelete > 0 && canDeleted > 0)
                        {
                            vFlag = 1;
                        }
                        else if(cannotDelete > 0 && canDeleted == 0)
                        {
                            vFlag = 2;
                        }
                        else if(cannotDelete == 0 && canDeleted == 0)
                        {
                            vFlag = 3;
                        }
                        else if(cannotDelete == 0 && canDeleted > 0)
                        {
                            vFlag = 4;

                        }
                    }
                }
                else
                {
                    if(document.viewEdit.select11.checked==true)
                    {
                        if(document.viewEdit.candelete.value=='No')
                        {
                            cannotDelete++;
                            document.viewEdit.select11.checked = false;
						//For Debug Starts
                                document.viewEdit.selectHead.checked = false;
                                //For Debug Ends
                        }

                        if(document.viewEdit.candelete.value=='Yes')
                        {
                            canDeleted++;
                        }
                    }

                    if(cannotDelete > 0 && canDeleted == 0)
                    {
                        vFlag = 2;
                    }
                    else if(cannotDelete == 0 && canDeleted == 0)
                    {
                        vFlag = 3;
                    }
                    else if(cannotDelete == 0 && canDeleted > 0)
                    {
                        vFlag = 4;

                    }

                }

                if(vFlag == 1)
                {
                    confirm("Only checked records will be deleted, Click the Delete button again");
                    return false;
                }

                if(vFlag == 2)
                {
                    alert("Checked records cannot be deleted as it is being referred or mapped.");
                    return false;
                }

                if(vFlag == 3)
                {
                    alert("Please select the record(s) to be deleted");
                    return false;
                }

                if(vFlag == 4)
                {
                    if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
                    {
                        document.viewEdit.memProcess.value = 'memTyDelete';
                        document.viewEdit.submit();
                    }
                }
            }

            function edit()
            {
                var memId;
                var chkCnt=0;
                var vFlag = false;
                var select11=document.getElementById('select11');
                if(select11==null)
                {
                    alert("No Records Found");
                    return;
                }
                var chkBoxCnt =document.viewEdit.select11.length;
                if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
                {
                    for(var i=0;i<chkBoxCnt;i++)
                    {
                        if(document.viewEdit.select11[i].checked==true)
                        {
                            document.viewEdit.memId.value = document.viewEdit.select11[i].value;
                            chkCnt++;
                        }
                    }
                }
                else
                {
                    if(document.viewEdit.select11.checked==true)
                    {
                        document.viewEdit.memId.value = document.viewEdit.select11.value;
                        chkCnt++;
                    }
                }
				 //Starts for checkbox
                if(chkCnt>1)
                {
                    for(var j=0;j<chkBoxCnt;j++)
                    {
                        vFlag = true;
                        document.viewEdit.selectHead.checked = false;
                        document.viewEdit.select11[j].checked = false;
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
                document.viewEdit.memProcess.value='initEdit';
                document.viewEdit.submit();
            }

            function checkAll(checkbox1)
            {
                var i,len = document.viewEdit.select11.length;

                if (checkbox1.checked)
                {
                    for(i=0;i<len;i++)
                    {
                        document.viewEdit.select11[i].checked=true;
                    }
                }
                else
                {
                    for(i=0;i<len;i++)
                    {
                        document.viewEdit.select11[i].checked=false;
                    }

                }
            }

            function onChangeCheck()
            {
                if(document.viewEdit.selectHead.checked)
                {
                    document.viewEdit.selectHead.checked=false;
                }
            }

            function onsubmitvalidate()
            {
                if(gtAct=='Delete')
                {
                    return valid2();
                }
                else
                {
                    return true;
                }
            }
        </script>

        <!--SCRIPTING BLOCK STARTS HERE -->
        <%

                    String uTypeId = (String) request.getAttribute("uTypeId");
                    if (uTypeId == null || uTypeId.trim().length() == 0) {
                        uTypeId = "";
                    }
        %>


       
    </head>
    <% String membTxt = (String) request.getAttribute("membTxt");
                boolean flag = true;
                if (membTxt == null) {
                    membTxt = (String) session.getAttribute("membTxt");
                    flag = false;
                }
    %>
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
						
                            <h2>Membership Types Human: Listing</h2>
							
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
          
          <p>You are viewing the list of Membership Types - Human created by you.To create a Membership Type - Human click Add button.To edit a Membership Type - Human select the checkbox before each record and then click on the Edit button.To delete Membership Types - Human select the checkbox(s) before each record and then click on the Delete button.</p>
                                 
                                    <form  class='form-horizontal' role='form' name="viewEdit" action="./memberMaster.html" method="post" onsubmit="return onsubmitvalidate();" >
                                        <input type="hidden" name="memProcess" value="Listing"/>
                                        <input type="hidden" name="memId" />
                                        <input type="hidden" name="index1" value=""/>

                                         <div class='form-group'>
										 	<div class='col-md-1 col-md-offset-4'>
									            <button class='btn-lg btn-primary' type='submit' name="btnsubmit" value="Add"  onclick="gtAct=this.value;">Add</button>
											</div>
											<div class='col-md-1'>
									           <button class='btn-lg btn-primary' name="btnEdit" value="Edit" type="button"  onclick="edit();">Edit</button>
											</div>
											<div class='col-md-1'>
												<button class='btn-lg btn-danger' name="btnsubmit" value="Delete" type="submit"  onclick="gtAct=this.value;">Delete</button>
											</div>
										</div>
										
										
									
										 <div class='form-group'>
										 	<div class='row'>
										 		<div class='col-md-1 col-sm-offset-1'>
                                                  <input type="checkbox" name="selectHead" id="selectHead"  style="margin-top:10px" value="membershipTypeId" onclick="checkAll(this);"/>
												</div>
												<div class='col-md-3'>
													 <label class='control-label label1'>Membership type</label>
												</div>
												<div class='col-md-2'>
													 <label class='control-label label1'>Membership Cost $</label>
												</div>
												<div class='col-md-2'>
													 <label class='control-label label1'>Duration</label>
												</div>
												<div class='col-md-1'>
													 <label class='control-label label1'>Active</label>
												</div>
												<div class='col-md-1'>
													 <label class='control-label label1'>InActive</label>
												</div>
                                             </div>
										</div>
								
										
                                                        <%
                                                                    Vector memType = (Vector) session.getAttribute("displayMemDetails");
                                                                    if (memType != null && memType.size() != 0) {
                                                                        Enumeration memTypeEnum = memType.elements();
                                                                        int i = 0;
                                                                        while (memTypeEnum.hasMoreElements()) {
                                                                            i++;
                                                                            String memTypeDet[] = (String[]) memTypeEnum.nextElement();
                                                                            String candelete = memTypeDet[0];
                                                                            String membershipTypeId = memTypeDet[1];
                                                                            String membershipTypeName = memTypeDet[2];
                                                                            String membershipAmount = memTypeDet[3];
                                                                            //String periodValue = memTypeDet[3];
                                                                            String durationno = memTypeDet[4];
                                                                            String durationValue = memTypeDet[5];
                                                                            int active_status = Integer.parseInt(memTypeDet[6]);

                                                                            if (durationValue == null) {
                                                                                durationValue = "N/A";
                                                                            }

                                                                            //String memberTypeDet[] = {membershipTypeId,membershipTypeName, membershipAmount,mDate};
															%>
									
									
										 <div class='form-group'>
										 	<div class='row'>
										 		<div class='col-md-1 col-sm-offset-1 '>
                                                  <input type="checkbox" name="select11" id="select11" style="margin-top:10px" value="<%=membershipTypeId%>" onclick="onChangeCheck();" />
												  <input type="hidden" name="candelete" value="<%=candelete%>"/>
												</div>
												<div class='col-md-3'>
													 <label class='control-label '><%=membershipTypeName%></label>
												</div>
												<div class='col-md-2'>
													 <label class='control-label '><%=membershipAmount%></label>
													 <input type="hidden" name="index" value="<%=i%>"/>   
												</div>
												<div class='col-md-2'>
													 <label class='control-label '><%=durationno%> &nbsp;<%=durationValue%></label>
												</div>
												
															 <%

                                                              if (active_status == 1) {
                                                            %>
															
												<div class='col-md-1'>
													<input type="radio" name=<%="rd" + i%> style="margin-left:13px" value="active" checked="true" disabled />
												</div>
												<div class='col-md-1'>
													 <input type="radio" name=<%="rd" + i%> style="margin-left:14px" value="inactive" disabled/>
												</div>
															
															
															 <%
                                                                                                                                                                                                    											} else {
                                                            %>
															
															
												
												<div class='col-md-1'>
													 <input type="radio" name=<%="rd" + i%> style="margin-left:13px" value="active" disabled/>
												</div>
												
												<div class='col-md-1'>
													 <input type="radio" name=<%="rd" + i%> style="margin-left:14px" value="inactive" checked="true" readonly=true disabled />
												</div>
											 
												 <% }%>
												 </div>
											</div>
										
												
												 
												  <% }  } else {%>
												  
												  <div class='form-group'>
										 				<div class='row'>
															<div class='col-md-4'>
															</div>
															<div class='col-md-4'>
																No Records Found!
															</div>
														</div>
													</div>
                                             
												 <% }

                                                        %>
									
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
