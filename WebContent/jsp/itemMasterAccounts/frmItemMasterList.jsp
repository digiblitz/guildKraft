<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.hlcaccounts.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->

<script src="javascripts/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<script language="javascript">
function getsubArrays(){	
	var serviceType = document.getElementById("serviceType").value;
	
	//document.mainfrm.method="post";
	window.location.href="./ItemMaster.html?process=listSubitems&servType="+serviceType;
	//document.mainfrm.submit();	
}
</script>
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

<%! 
	DecimalFormat result  = new DecimalFormat("0.00");
	String amtFormat(String amtVal){
	String amountValue = "0.00";
		if(amtVal!=null && amtVal.trim().length()!=0){
		//System.out.print(Double.parseDouble(amtVal));
		amountValue = result.format(Double.parseDouble(amtVal));
		}
	return amountValue;
}

%>

 	
            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                       
					    <div class='panel-heading'>
						 <h2><strong> Accounts:</strong><span class="styleBoldTwo">Item List  Master </span></h2>
						 </div>
					<!--==============================Form Title=================================-->

                        <div class='panel-body'>
						
						
						<!--==============================Form Description=================================-->
						
		<p>To edit a Item List click on <strong>'Edit'</strong> button. </p>
						
		<form name="frmAdvIssueLst" id="frmAdvIssueLst" class='form-horizontal' role='form'>
		<input name="advProcess" type="hidden" value="">
			<%
							String prevType =null;
							
							if(request.getParameter("servType")!=null){
								prevType = request.getParameter("servType");
							//	prevType = (String) session.getAttribute("serviceType");
							}
							else{
								prevType = "";
							}
/*							if(session.getAttribute("accountType")!=null){
								prevType = (String) session.getAttribute("serviceType");
							}*/
							%>
			  <div class='form-group'>
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Type: </label>
								  <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					
					<select name="serviceType" id="serviceType" class="form-control" onchange="getsubArrays();">
										<option value="">Select One</option>
										<%
											ArrayList serviceMaster=(ArrayList)request.getAttribute("serviceMaster");
											if(serviceMaster!=null && serviceMaster.size()!=0){ 
												Iterator itemEvent = serviceMaster.iterator();
													while(itemEvent.hasNext()){
														String serviceTypeArray[] = (String[])itemEvent.next();
														String serviceTypeId= serviceTypeArray[0];
														String serviceTypeName = serviceTypeArray[1];
															if(prevType.trim().equalsIgnoreCase(serviceTypeName)){		%>
																<option value="<%=serviceTypeName%>" selected="selected"><%=serviceTypeName%></option>
												<%			}
															else{
															%>
																<option value="<%=serviceTypeName%>"><%=serviceTypeName%></option>
												<%	}
											}
											}
										%>
										</select>               
									</div>
								</div>
							</div>
						</div>
		 
		 		 </form>
		  
                     
							<div class='form-group'>
 					 			 <div class="container"> 
								   
									  <div class="row"> 
									   
										<div class='col-md-2'>
										
											<label class='control-label label1  '>Item Number </label>
													
										</div>
										
											<div class='col-md-3 col-md-offset-2'>
										
											<label class='control-label label1  '>Item Description </label>
													
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label label1  '>Item Rate </label>
													
										</div>
										
										<div class='col-md-2'>
											
											<label class='control-label label1' name='advIssueButton' type='submit' value='Edit'>Edit</label>   
												
										</div>
									<!--	<div class='col-md-2'>
											
											<label class='control-label label1' name='advIssueButton' type='submit' value='Delete'>Delete</label>   
												
										</div>-->
										</div>
										
									</div>
									
                                
								
							</div>
		 
						
			
			 <%
			ArrayList subitemType =(ArrayList)request.getAttribute("subitemType");
			if(subitemType!=null && subitemType.size()!=0){ 
			%>
			 
					<%
					Iterator subItemList = subitemType.iterator();
								while(subItemList.hasNext()){
									String subItemArray[] = (String[]) subItemList.next();
									String itemId = subItemArray[0];
									String serviceTypeName = subItemArray[1];
									String itemNo = subItemArray[2];
									String parentItemNo = subItemArray[3];
									String itemDesc = subItemArray[4];
									String accountNo = subItemArray[5];
									String rate = subItemArray[6];
					%>
			 <form name="frmAdvIssue" method="post" action="./ItemMaster.html"  class='form-horizontal' role='form' >		
			<input name="process" type="hidden" value="editListMaster">		
				
			<input name="itemId" type="hidden" value="<%=itemId%>"/>
			
			<div class='form-group'>
 					 		 <div class="container"> 
								   
									  <div class="row"> 
									   
										<div class='col-md-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=itemNo%></label>
										</div>
										
										<div class='col-md-3 col-md-offset-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=itemDesc%></label>
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=amtFormat(rate)%></label>
										</div>
				
				 						<div class='col-md-2'>
															
											&emsp; <button class='btn-sm btn-primary' name='advIssueButton'  value='Edit' type='submit'>Edit</button>
																
										</div>
                                       
                                 	<!-- 	<div class='col-md-2'>
                                            &emsp;<button class='btn-sm btn-danger' name="advIssueButton"  value="Delete" type='submit' style=''>Delete</button>
                                   		 </div>-->
                                </div>
							</div>
						</div>
				
						
				</form>
					<%}	
					 }
					else {
					%>
					 
						<div class='form-group'>
 					 		   <div class='col-md-4'>
									   </div>
											<div class='col-md-4'>
												No records are available. 
										</div>
									</div>
								
					<%}%>
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
