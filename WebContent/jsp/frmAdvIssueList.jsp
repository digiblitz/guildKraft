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
<script src="file:///D|/Jboss 4.2.3GA-18080/server/default/tmp/deploy/tmp2705039946229227853guildKraft-exp.war/jsp/js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<script language="javascript">
function postIssueData(mid){
if(mid!=""){
	   
		var form = document.getElementById('frmAdvIssueLst'); 
		form.advProcess.value = "advIssueTypeShow";
		form.method="post";
		form.action="./advertisement.html?mid="+mid;
		form.submit();
		}
else {
	    form.advProcess.value = "advIssueLst";
		form.method="post";
		form.action="advertisement.html";
		form.submit();

}		
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


<%
String  mId = (String)request.getAttribute("mid");
if(mId==null || mId.equals("")){
mId="";
}
%>
 	
            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                       
					    <div class='panel-heading'>
						 <h2> HLC Advertisement: Advertisement Issue Listing</h2>
						 </div>
					<!--==============================Form Title=================================-->

                        <div class='panel-body'>
						
						
						<!--==============================Form Description=================================-->
						
		<p>The Advertisement Sub-Types are as follows. 
		
		To edit a Sub-Type, click on the 'Edit' button beside it. To delete a record click on the'Delete' button. </p>
						
		<form name="frmAdvIssueLst" id="frmAdvIssueLst" class='form-horizontal' role='form'>
		<input name="advProcess" type="hidden" value="">
			
			  <div class='form-group'>
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type </label>
								  <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					<select name="selMediaType" class="form-control" onchange="postIssueData(this.value);">
					<option selected="selected" value="">Select One</option>
					<%
			Vector mediaType = (Vector)session.getAttribute("objSesAdvMediaIssue");
			if(mediaType!=null && mediaType.size()!=0){
		
			
            Enumeration e = mediaType.elements();
			    String mediaId = "";
				String mediaName = "";
				String mediaDesc  = "";
				String mediaStatus = "";
                while(e.hasMoreElements()){
                String[] s = (String [])e.nextElement();
					mediaId = s[0];
				//	out.print("mediaId" + mediaId);
					mediaName = s[1];
					mediaDesc  = s[2];
					mediaStatus = s[3];
					if(mediaId.equals(mId)){
							%>
							<option value="<%=mediaId%>" selected="selected"><%=mediaName%></option>
						    <%}
							else{
							%>
              			     <option value="<%=mediaId%>"><%=mediaName%></option>
							<%		
							}
							}
							}%>
				    </select>                
									</div>
								</div>
							</div>
						</div>
		 
		 		 </form>
		  
                     
							<div class='form-group'>
 					 			 <div class="container"> 
								   
									  <div class="row"> 
									   
										<div class='col-md-3 col-md-offset-2'>
										
											<label class='control-label label1  '>Issue Name </label>
													
										</div>
										
										<div class='col-md-2'>
											
											<label class='control-label label1' name='advIssueButton' type='submit' value='Edit'>Edit</label>   
												
										</div>
										<div class='col-md-2'>
											
											<label class='control-label label1' name='advIssueButton' type='submit' value='Delete'>Delete</label>   
												
										</div>
										</div>
										
									</div>
									
                                
								
							</div>
		 
				
				
				
			 <%
			String deleteStatus = (String)request.getAttribute("errStat");
			if(deleteStatus!=null && deleteStatus.equals("eConfirmDelete")){
			%>
			<p>Cannot delete this record. its already in use</p>
			
			<%
			}
			%> 	  
			
			
			
			 <%
			Vector vIssueLst = (Vector)session.getAttribute("objSesAdvIssueLst");
			if(vIssueLst!=null && vIssueLst.size()!=0){
			%>
			 
					<%
					Enumeration eIssueLst =vIssueLst.elements();
						while(eIssueLst.hasMoreElements()){
						String[] sIss = (String [])eIssueLst.nextElement();
						//Debug.print("===============================");
						String issue_id=sIss[0];
						String issue_name=sIss[1];
						String media_id=sIss[2];
						String issue_status=sIss[3];
						//Debug.print("===============================");
					%>
			 <form name="frmAdvIssue" method="post" action="./advertisement.html"  class='form-horizontal' role='form' >		
			<input name="advProcess" type="hidden" value="advManupIssue">		
			
				
				<input type="hidden" value="<%=issue_id%>" name="issue_id">
				
				
                 
						<div class='form-group'>
 					 		 <div class="container"> 
								   
									  <div class="row"> 
									   
										<div class='col-md-3 col-md-offset-2'>
										
											<label class='control-label'>&emsp;&nbsp;<%=issue_name%></label>
										</div>
				
				 						<div class='col-md-2'>
															
											&emsp; <button class='btn-sm btn-primary' name='advIssueButton'  value='Edit' type='submit'>Edit</button>
																
										</div>
                                       
                                 	 	<div class='col-md-2'>
                                            &emsp;<button class='btn-sm btn-danger' name="advIssueButton"  value="Delete" type='submit' style=''>Delete</button>
                                   		 </div>
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
