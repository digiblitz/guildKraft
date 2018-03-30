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
	var className = document.getElementById("listType").value;
	//document.mainfrm.method="post";
	//document.mainfrm.action="./TransactDet.html?process=listtransac&className="+className;
	window.location.href="./TransactDet.html?process=listtransac&className="+className;
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
<%!
	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	String dateCheck(Date fieldName){
	String detValue = "N/A";
		if(fieldName!=null){
		 detValue = sdf.format(fieldName);
		}
	return detValue;
}

%>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                       
					    <div class='panel-heading'>
						 <h2><strong> Accounts:</strong><span class="styleBoldTwo">Edit Transaction Master </span></h2>
						 </div>
					<!--==============================Form Title=================================-->

                        <div class='panel-body'>
						
						
						<!--==============================Form Description=================================-->
						
		<p>To edit a Transaction Details click on <strong>'Edit'</strong> button. </p>
						
		<form name="frmAdvIssueLst" id="frmAdvIssueLst" class='form-horizontal' role='form'>
		<input name="advProcess" type="hidden" value="">
			<%
							String prevType = "";
							if(session.getAttribute("className")!=null){
								prevType = (String) session.getAttribute("className");
							}
							%>
			  <div class='form-group'>
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Class: </label>
								  <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					
										<select name="listType" id="listType" class="form-control" onchange="getsubArrays();">
										<option value="">Select One</option>
										<%
											ArrayList serviceMaster=(ArrayList)request.getAttribute("classMaster");
											System.out.print("serviceMaster " +serviceMaster.size());
											if(serviceMaster!=null && serviceMaster.size()!=0){
												Iterator itemEvent = serviceMaster.iterator();
													while(itemEvent.hasNext()){
														HLCClassDetailsVO classDet = (HLCClassDetailsVO) itemEvent.next();
														String classId = classDet.getClass_id();
														String className = classDet.getClass_name();
														String parenetName = classDet.getParent_class_name();
															if(prevType.trim().equalsIgnoreCase(className)){		%>
															<option value="<%=className%>" selected="selected"><%=className%></option>
											<%				}else{
													%>
															<option value="<%=className%>"><%=className%></option>
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
										
											<label class='control-label label1  '>Transaction  Name </label>
													
										</div>
										
											<div class='col-md-2'>
										
											<label class='control-label label1  '>Account Number </label>
													
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label label1  '>Item Number  </label>
													
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label label1  '>Add Date  </label>
													
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
							ArrayList listTransacItem =(ArrayList)request.getAttribute("listTransacItem");
							if(listTransacItem!=null && listTransacItem.size()!=0){
							Iterator listItems = listTransacItem.iterator();
								while(listItems.hasNext()){
									HLCAccTxnTypeDetailVO accTxnTypVO = (HLCAccTxnTypeDetailVO) listItems.next();
									String transId = accTxnTypVO.getTransaction_type_id();
									String transName = accTxnTypVO.getTransaction_name();
									String AccNo = accTxnTypVO.getAccount_no();
									String itemNo = accTxnTypVO.getItem_no();
									Date addDate = accTxnTypVO.getAdd_date();
						%>
			 <form name="frmTransListMaster" method="post" action="./TransactDet.html"  class='form-horizontal' role='form' >					 
			<input name="process" type="hidden" value="edittransac"/>
			<input name="transId" type="hidden" value="<%=transId%>"/>
			
			<div class='form-group'>
 					 		 <div class="container"> 
								   
									  <div class="row"> 
									   
										<div class='col-md-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=transName%></label>
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=AccNo%></label>
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=itemNo%></label>
										</div>
										
										<div class='col-md-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=dateCheck(addDate)%></label>
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
