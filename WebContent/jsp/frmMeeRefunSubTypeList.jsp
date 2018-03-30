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

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

</head>
<script language="javascript">

function postData(){
	frmRefundSubList.eventProcess.value = "show";
	//alert(frmRewalList.eventProcess.value);
    frmRefundSubList.method="post";
    frmRefundSubList.action="refundsubtype.html";
    frmRefundSubList.submit();
}
</script>
<%
String  status = (String)request.getAttribute("status");
System.out.println("status in list:"+status);
if(status==null || status.equals("")){
	status="";
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
                            <h2>Meetings: View Existing Refund SubType Level Names</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>To edit a Refund Sub Type Name click on 'Edit' button. To change the status click on the 'Activate/Deactivate' button.</p>
							
						<!--==============================Form Description=================================-->
							
                           
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmRefundSubList" id="frmRefundSubList">
							
                                 <input type="hidden" name="process" value="newSubTypeList"  />
 
						   		<input type="hidden" name="eventProcess" value="" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="status" class="selectboxOne" onchange="postData();">
												  <%if(status==""){%>
												  <option selected="selected" value="">Select One</option>
												  <%} else{%>
												  <option value="">Select One</option>
												  <%}%>
												  <%
													 if(status.equals("true")){
												%>
												  <option value="true" selected="selected" >Active</option>
												  <%
													} else {%>
												  <option value="true" >Active</option>
												  <%}%>
												  <%
													 if(status.equals("false")){
												%>
												  <option value="false" selected="selected" >Deactive</option>
												  <%} else {%>
												  <option value="false"  >Deactive</option>
												  <%}%>
												</select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
							</form>
							
							<%
								String deleteStatus = (String)request.getAttribute("errStat");
								if(deleteStatus!=null && deleteStatus.equals("eConfirmDelete")){
							%>
						  
						  <%}%>
						  
							<%
								Vector vDimLst = (Vector)request.getAttribute("DisplayEventLevel");
								
								if(vDimLst!=null && vDimLst.size()!=0){
							%>
							
							<div class='form-group'>
								<div class='col-md-8'>
								
								<div class='col-md-3'>
								 <label class='control-label label1'>Refund SubType Name:</label>
								</div>
								
								<div class="col-md-2">
								 <label class='control-label label1'>Status</label>
								</div>
								
								<div class="col-md-2">
								 <label class='control-label label1'>Edit</label>
								</div>
								
							</div>
						</div>
						
							<%
								Enumeration eDimLst = vDimLst.elements();
								String refundListId = "";
								String refundListName = "";
								String refundListStatus = "";
								while(eDimLst.hasMoreElements()){
									String[] s = (String [])eDimLst.nextElement();
									  refundListId = s[0];
									  refundListName = s[1];
									  refundListStatus = s[2];
									  
									  
						%>
						
						<form name="frmAdvDimensionLst" id="frmAdvDimensionLst" method="post" action="./refundsubtype.html">
								<input name="process2" type="hidden" value="editRefundLevel" />
							  <input type="hidden" value="<%=refundListId%>" name="refundListId" />
							  <input type="hidden" value="<%=refundListName%>" name="refundListName" />
							  <input type="hidden" value="<%=refundListStatus%>" name="rdstatus" />
							  
							  
							  
							<div class='form-group'>
								<div class='col-md-8'>
								
								<div class='col-md-3'>
								 <label class='control-label'><%=refundListName%></label>
								</div>
								
								 <% if(refundListStatus.equalsIgnoreCase("0")){ %>
								
								<div class="col-md-2">
								 <button name="btnSubmit" type="button" class="btn-sm btn-primary" value=" Activate " onclick="location.href='./refundsubtype.html?process=Activate&refundListId=<%=refundListId%>&status=<%=status%>'" >Activate</button>
								  
								</div>
								
								 <%} else if(refundListStatus.equalsIgnoreCase("1")){	%>
								
								<div class="col-md-2">
								 <button name="btnSubmit2" type="button" class="btn-sm btn-danger" value="Deactivate" onclick="location.href='./refundsubtype.html?process=Deactivate&refundListId=<%=refundListId%>&status=<%=status%>'" >Deactivate</button>
								</div>
								
								 <%}%>
								 
								 <div class="col-md-2">
								 <button name="advDimButton" type="submit" value="Edit" class="btn-sm btn-primary" >Edit</button>
								 </div>
								 
							</div>
						</div>

                     </form> 
					 
					  <%}}else {%>
					  
					   <div class='form-group'>
                           <div class='col-md-offset-4'>
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
