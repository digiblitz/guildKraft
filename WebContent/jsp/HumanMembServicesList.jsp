<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.math.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/validate.js" type="text/javascript" ></script>
<script language="javascript">
    function postData(){

		var typId = document.viewHrsServiceList.uType.value ;


	if(typId!=""){
                strURL = "./horseServiceMaster.html?horseProcess=getSerTypeDet&uType="+typId+"&userTypeName=Human";
	        window.location.href = strURL;

	}
	else{
                 strURL = "./horseServiceMaster.html?horseProcess=initList&userTypeName=Human";
	        window.location.href = strURL;
	}
}
function checkAll()
{
	if(document.viewHrsServiceList.select11!=null){
	var len = document.viewHrsServiceList.select11.length;
	 if(len!=undefined && len!='undefined')
	{
	    for(var i=0;i<len;i++)
	    {
		if (document.viewHrsServiceList.selectHead.checked==true)
		{
			document.viewHrsServiceList.select11[i].checked=true;
		}
		else
		{
			document.viewHrsServiceList.select11[i].checked=false;
		}
	    }
        }
	else
	{
	   if (document.viewHrsServiceList.selectHead.checked==true)
	   {
			document.viewHrsServiceList.select11.checked=true;
		}
		else
		{
			document.viewHrsServiceList.select11.checked=false;
		}

	 	 }
    }
}

/*function onChangeCheck()
{
	if(document.viewHrsServiceList.selectHead.checked)
	{
		document.viewHrsServiceList.selectHead.checked=false;
	}
}*/

function Add_Submit()
{
//	alert('add');
    document.viewHrsServiceList.horseProcess.value='initHorseMaster';
	//alert('add1');
	document.viewHrsServiceList.submit();

}
function Edit_Submit()
{
	var species=document.viewHrsServiceList.uType.value;
	if(species==""){
				alert ("Please select valid User Type" );
				return;
	}
	var checkId=document.getElementById('select11');
	 if(checkId==null&&species!=null)
                {
                    alert("No Records Found");
                    return;
                }
	var i,cnt,len = document.viewHrsServiceList.select11.length;
	cnt=0;
	if(len==undefined)
	{len=1;
            if(document.viewHrsServiceList.select11.checked)
	   {
               document.viewHrsServiceList.hrsTyId.value=document.viewHrsServiceList.select11.value;
		//Debug for Checkboxes purpose
		//alert(document.viewHrsServiceList.hrsTyId.value);
		//document.viewHrsServiceList.select11.checked=false;
		//document.viewHrsServiceList.selectHead.checked=false;
                cnt=cnt+1
					//Debug for Checkboxes purpose
           }
        }
        else
        {
	   for(i=0;i<len;i++)
	   {
		if(document.viewHrsServiceList.select11[i].checked)
		{
			document.viewHrsServiceList.hrsTyId.value=document.viewHrsServiceList.select11[i].value;
			//alert("enter edit");
			/*if(cnt==0)
			{
			//	alert("Enter the function");
				document.viewHrsServiceList.hrsTyId.value=document.viewHrsServiceList.select11[i].value;
				//alert(document.viewHrsServiceList.hrsTyId.value);
				document.viewHrsServiceList.select11[i].checked=false;
				document.viewHrsServiceList.selectHead.checked=false;
			}
			else
			{
				document.viewHrsServiceList.select11[i].checked=false;
			}*/
			cnt=cnt+1;
		}

	  }
        }
		//Debug for Checkboxes purpose
        if(cnt>1)
		{
			for(j=0;j<len;j++)
			{
				document.viewHrsServiceList.select11[j].checked=false;
				document.viewHrsServiceList.selectHead.checked=false;
			}
		}
		//Debug for Checkboxes purpose
	if(cnt==1)
	{
		//alert("Inside if condition");
		document.viewHrsServiceList.horseProcess.value='initEdit';
		document.viewHrsServiceList.submit();
	}
	else if(cnt>1)
	{
	       alert("Only one record can be edited.Please check one record to edit.");
		return;
	}
	else if(cnt==0)
	{
		alert("Please check one record to edit");
		return;
	}

}
function Delete_Submit()
{
var species=document.viewHrsServiceList.uType.value;
	if(species==""){
				alert ("Please select valid User Type" );
				return;
	}
	var checkId=document.getElementById('select11');
	 if(checkId==null&&species!=null)
                {
                    alert("No Records Found");

                    return;
                }
	var i,cnt,len = document.viewHrsServiceList.select11.length;
	cnt=0;
	if(len==undefined)
	{len=1;
            if(document.viewHrsServiceList.select11.checked)
                {
                    if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
		   {
                    document.viewHrsServiceList.horseProcess.value='HrsServiceTyDelete';
                    document.viewHrsServiceList.submit();
		}
                else
		 {return;
		 }
                }
                else
                    {alert("Please select one record to Delete")
					return;}
        }
	for(i=0;i<len;i++)
	{
		if(document.viewHrsServiceList.select11[i].checked)
		{
			cnt=cnt+1;
		}

	}

	if(cnt==0)
	{
		alert("Please check the record(s) to be deleted.");
		return;
	}
        else
            {
                if(document.viewHrsServiceList.selectHead.checked)
                 {
					if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
					{
                    document.viewHrsServiceList.horseProcess.value='HrsServiceTyDelete';
                    document.viewHrsServiceList.submit();
					}
					else
					 {return;
					 }
                 }
				 else
				{
					 if(confirm("Only the checked records will be deleted. \nAre you sure you want to delete these records?"))
					{
						document.viewHrsServiceList.horseProcess.value='HrsServiceTyDelete';
                    document.viewHrsServiceList.submit();
					}
                                        else
                                            {
                                                return;
                                            }
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
                            <h2>Membership Services - Human: Listings</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p> You are viewing the list of Membership Services - Human created by you.<br/>To create a Membership Service - Human click Add button.To edit a Membership Service - Human select the checkbox before each record and then click on the Edit button.To delete Membership Services - Human select the checkbox(s) before each record and then click on the Delete button.</p>
							
						<!--==============================Form Description=================================-->
							
                           
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="viewHrsServiceList" action="horseServiceMaster.html" method="post" >
							
                                <input type="hidden" name="horseProcess" value="initEdit" />
								  <% String userTypeName=(String)session.getAttribute("userTypeName");%>
								  <input type="hidden" name="userTypeName" value="<%=userTypeName%>"/>
								  <input type="hidden" name="hrsTyId" value=""/>
								 <%                  String uTypeName=null;
											 String status = (String)request.getAttribute("status");
								
												if(status!=null)
												{
													if(status.equalsIgnoreCase("false"))
													{
												%>
												<!--<tr>
												<td class="styleError" colspan="4">Cannot delete this record. its already in use</td>
												</tr>-->
												<%
											}}
											%>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="uType" class="form-control" onchange="postData();">
																					<option value="" selected="selected" >Select One</option>
												  <%
													Vector vUType = (Vector)session.getAttribute("displayUserTypeDetails");
																						String uTypeId=(String)session.getAttribute("userTypeId");
													if(vUType!=null && vUType.size()!=0){
														Enumeration eUtype = vUType.elements();
														 //String [] userType = {ID, name };
														while(eUtype.hasMoreElements()){
															String[] strType = (String [])eUtype.nextElement();
															String uTypeID = strType[0];
														 uTypeName = strType[1];
															if(uTypeID.equals(uTypeId)){
														%>
														  <option value="<%=uTypeID%>" selected="selected" ><%=uTypeName%></option>
														<%
															}
															else{
															%>
															 <option value="<%=uTypeID%>" ><%=uTypeName%></option>
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
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="Add" value="Add" type="button" onclick="Add_Submit();">Add</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-primary'  name="Edit" value="Edit" type="button" onclick="Edit_Submit();">Edit</button>
                                    </div>
									
									<div class='col-md-2'>
									<button class='btn-lg btn-danger'   name="Delete" value="Delete" type="button" onclick="Delete_Submit();">Delete</button>
									</div>
									
                                </div>
								
							<div class='form-group'>
								<div class='col-md-8' id="dataTable">
									<div class="col-md-2">
									<input type="checkbox" name="selectHead" id="selectHead"  value="membershipTypeId" onclick="checkAll();"/>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Service</label>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Cost $</label>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Active</label>
									</div>
									
									<div class="col-md-2">
									<label class='control-label label1'>Inactive</label>
									</div>
									
								</div>
							</div>
							
							
							<input type="hidden" name="UserTypeName" value="<%=uTypeName%>" />
					   		<%
							Vector vDisHrsServiceType =(Vector)session.getAttribute("displayNonHumServiceDetails");
							if(vDisHrsServiceType!=null && vDisHrsServiceType.size()!=0){
								Enumeration hrsServiceTypeEnum = vDisHrsServiceType.elements();
													int i=0;
								while(hrsServiceTypeEnum.hasMoreElements()){
									String hrsServiceTypeDet[] = (String[])hrsServiceTypeEnum.nextElement();
									String hrsTyId = hrsServiceTypeDet[0];
									String horseServiceTypeName = hrsServiceTypeDet[1];
									String horseServiceTypeAmount = hrsServiceTypeDet[2];
															 int active_status=Integer.parseInt(hrsServiceTypeDet[3]);
									//String memberTypeDet[] = {membershipTypeId,membershipTypeName, membershipAmount,mDate};
									%>
									
							<div class='form-group'>
								<div class='col-md-8' id="dataTable">
								
								<div class="col-md-2">
									<input type="checkbox" name="select11" id="select11"  value="<%=hrsTyId%>"/>
									</div>
									
									<div class="col-md-2">
									<label class='control-label'><%=horseServiceTypeName%></label>
									</div>
									
									<%
									float price = Float.parseFloat(horseServiceTypeAmount);
									BigDecimal bdAmount = new BigDecimal(price);
									bdAmount = bdAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
									%>
									
									<div class="col-md-2">
									<label class='control-label'><%=bdAmount%></label>
									</div>
									 <%if(active_status==1){ %>

									
									<div class="col-md-2">
									<input type="radio" name=<%="rd"+ i%> value="active" checked="true" disabled />
									</div>
									<div class="col-md-2">
                                     <input type="radio" name=<%="rd"+ i%> value="inactive" disabled/>
									</div>
									
									 <% }else{%>
									
									<div class="col-md-2">
									<input type="radio" name=<%="rd"+ i%> value="active" disabled/>
									</div>]
									<div class="col-md-2">
                                    <input type="radio" name=<%="rd"+ i%> value="inactive" checked="true" readonly=true disabled />
									</div>
									<% } %>
								</div>
							</div>
							
							<%
							i=i+1;	}
						   }
							else{
						   %>
						   
						   		<div class='form-group'>
                                    <div class='col-md-offset-4 '>
                                        No Records  Found 
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
