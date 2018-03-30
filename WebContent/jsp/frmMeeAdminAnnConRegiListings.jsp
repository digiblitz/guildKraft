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
<%@ page import = "java.text.*" %>
<%@ page import ="com.hlcmeeting.util.*" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script language="javascript">

function postData(){

	/*frmMeeDispLst.memProcess.value = "adminViewList";
    frmMeeDispLst.method="post";
    frmMeeDispLst.action="AnnualRegList.html";
    frmMeeDispLst.submit();*/
		
	var stat = document.frmMeeDispLst.status.value;
	strURL = "./AnnualRegList.html?memProcess=adminViewList&status="+stat;
	window.location.href = strURL;	
	
}
	function postDataForPagination() {
		var pn = document.frmPaginationTop.pn.value;
		var stat = document.frmMeeDispLst.status.value;
		strURL = "./AnnualRegList.html?&memProcess=adminViewList&pn="+pn+"&status="+stat;
		window.location.href = strURL;	
	
	//var selMemTypeId = document.frmmemRegiList.selMemTypeId.value;
	}
	function postDataForPagination1() {
		var pn = document.frmPaginationBottom.pn.value;
		var stat = document.frmMeeDispLst.status.value;
		strURL = "./AnnualRegList.html?&memProcess=adminViewList&pn="+pn+"&status="+stat;
		window.location.href = strURL;	
	}

</script>

<%
try{
String  status = (String)request.getAttribute("status");
if(status!=null && status.trim().length()!=0){
	status=status;
}else{
	status = "";
}
%>

</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


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
                            <h2>Annual Meeting &amp; Convention List Page</h2>
							</div>
							
				 	 <div class='panel-body'>
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Status </label>
					 		 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                       <div class='form-group internal'>
					  						<select name="status" class="form-control" onchange="postData();">
                        						<option selected="selected" value="">Select One</option>
													<%
														if(status!=null && status.trim().length()!=0 && status.equals("Pending")){
													%>
													<option value="Pending" selected="selected" >Pending</option>
													<%
														}
														else{
													%>
														<option value="Pending" >Pending</option>
													<%
														}
														if(status!=null && status.trim().length()!=0 && status.equals("Registered")){
													%>
													<option value="Registered" selected="selected" >Registered</option>
													
													<%
													}
													else{
													%>
														<option value="Registered" >Registered</option>
													<%
													}
													if(status!=null && status.trim().length()!=0 && status.equals("Rejected")){
													%>
													
													<option value="Rejected" selected="selected" >Rejected</option>
													<%
													}
													else{
													%>
													<option value="Rejected" >Rejected</option>
													<%
													}
													%>
                      						</select>
										</div>
									</div>
								</div>
				 
		   <form class='form-horizontal' role='form' name="frmPaginationTop" id="frmPaginationTop" method="post" action="AnnualRegList.html">


		  	 				<%
							int start = 1;
							int end = 1;
							int totalPage = 0;
							String rowCnt = (String)request.getAttribute("rCnt");
							String pageNo = (String) request.getAttribute("pNo");
							
							int rCnt = 0;
							int pNo = 0;

							if(rowCnt!=null && rowCnt.trim().length()!=0){
								rCnt = Integer.parseInt(rowCnt);
								end = (rCnt/50);
								totalPage = (rCnt%50);
								if(totalPage>0){end = end  +1;}
							}else{
								rCnt = 0;
							}

							if(pageNo!=null && pageNo.trim().length()!=0){
								pNo = Integer.parseInt(pageNo);
							}else{
								pNo = 0;
							}
							
							if(rCnt!=0){
							%>
							
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Page(s): </label>
						<div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>
											<select name="pn" id="pn" class="form-control" onchange="postDataForPagination();">
											<%
												for(int i = 1; i <=end; i++) { 
													if(pNo==i){
													%>
														<option selected="selected" value="<%=i%>"><%=i%></option>
													<%
													}
													else{
													%>
														<option value="<%=i%>"><%=i%></option>
													<%
													}
												}
												%>
											  </select>
											 </div>
										</div>
									</div>
						
						   <%
						   }
						   %>
		  		  </form>
		   
								<div class="margin marginn">
									<div class="form-group">
										<div class="col-md-16">
										
										
											<div class="col-md-2">
												<label class='control-label label1'>First Name</label>
											</div>
											
											<div class="col-md-2">
												<label class='control-label label1'>Last Name </label>
											</div>
											
											<div class="col-md-2">
												<label class='control-label label1'>Request Date </label>
											</div>
											
											<div class="col-md-3">
												<label class='control-label label1'>Request Status </label>
											</div>
											<div class="col-md-3">
												<label class='control-label label1'>View</label>
											</div>
										 </div>
									</div>
								</div>
						  

					<%
		   		
					 ArrayList memberDetail=(ArrayList)request.getAttribute("AnnualList");
					 SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
					 if(memberDetail!=null && memberDetail.size()!=0){
						Iterator  enm1 = memberDetail.iterator();
						while(enm1.hasNext()){
							HLCAnnualRegistrationDetailVO objRegDet = (HLCAnnualRegistrationDetailVO) enm1.next();
							String annualMeetingId = objRegDet.getAnnualMeetingId();
							String firstName = objRegDet.getFirstName();
							String lastName = objRegDet.getLastName();
							String reqStatus = objRegDet.getRequestStatus();
							Date today = objRegDet.getAddDate();
		   %>
		   <!-- {annualMeetingId,badgeInfo,firstName,lastName,areaName,requestStatus,addDate,email};  -->

						<form class='form-horizontal' role='form' name="frmDisplayAdminList" method="post" action="AnnualRegList.html">		
						<input name="memProcess" type="hidden" value="dispViewDetail">
						<input name="annualMeetingId" type="hidden" value="<%=annualMeetingId%>">
						
				<div class="margin marginn">
					<div class="form-group">
						<div class="col-md-10">
						
							<div class='col-md-2'>
								<label class='control-label'><a href="AnnualRegList.html?memProcess=statusShow&annualMeetingId=<%=annualMeetingId%>"><%=firstName%></a>
								</label>
								
							<div class='col-md-2'>
								<label class='control-label'><%=lastName%> </label>
							</div>
							
							<div class='col-md-2'>
								<label class='control-label'><%=sdf.format(today)%></label>
							</div>
							
							<%if(!reqStatus.equals("Registered")){%>
							
							<div class='col-md-3'>
										
								<button class='btn-lg btn-primary' type='button' onclick="javascript:location.href='AnnualRegList.html?memProcess=statusChange&annualMeetingId=<%=annualMeetingId%>'"><%=reqStatus%></button>
								</div>		
									
							<%}
							else{
							out.println(reqStatus);
							}
							%>			
								</div>
							</div>
						</div>
							
							<div class='col-md-3'>
										
								<button class='btn-lg btn-primary' type='submit'>View</button>
										</div>	
									</form>
					   
					      <%	
									}
									}else {
								%>
								
								<div class='form-group'>
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
												No Records are available.
											</div>
										</div>
									</div>
								</div>
								
								<%}
							if(rCnt!=0){
							%>
				<form  class='form-horizontal' role='form' name="frmPaginationBottom" id="frmPaginationBottom" action="AnnualRegList.html" >
				
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Page(s): </label>
							<div class='col-md-8'>
                            	<div class='col-md-3 indent-small'>
                                 <div class='form-group internal'>
									<select name="pn" id="pn" class="selectboxOne" onchange="postDataForPagination1(this.value);">
										<%
											for(int i = 1; i <=end; i++) { 
												if(pNo==i){
												%>
													<option selected="selected" value="<%=i%>"><%=i%></option>
												<%
												}
												else{
												%>
													<option value="<%=i%>"><%=i%></option>
												<%
												}
											}
											%>
							  </select>
							 of <%=end%> 	
							 </div>
						</div>
					</div>					  
						
						 </form>
						   <%
						   }
						   }catch(Exception e){
						   		e.printStackTrace();
						   }
								%>
		<!--==============================Form Body=================================-->
							
                        </div>
						
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
						  
				 
	  
	  
	  
	  
	  
	 
  
