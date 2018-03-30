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
<script src="file:///D|/Jboss 4.2.3GA-18080/server/default/tmp/deploy/tmp4639256501122020805guildKraft-exp.war/jsp/js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->

<script language="javascript">
function postData(mid){
if(mid!=""){
	var Form = document.getElementById('frmAdvDispLst'); 
    Form.advProcess.value = "advDispTypeLstShow";
    Form.method="post";
    Form.action="./advertisement.html?mid="+mid;
    Form.submit();
}
else{
    Form.advProcess.value = "advDispTypeLst";
    Form.method="post";
    Form.action="advertisement.html";
    Form.submit();
}
}
</script>
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
<!--==============================================content start here============================================-->

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
					  
					        <h2>HLC Advertisement: Advertisement Display Type Listing Names</h2>
							
						 </div>
					  <!--==============================Form Title=================================-->
						 
						 <div class='panel-body'>

					 <!--==============================Form Description=================================-->

               <p>Following are the  Display Type for all the advertisements that are to be placed in HLC for all the event.
                      
                    To edit a Display Type click on 'Edit' button. To delete a record click on the 'Delete' button. </p>
              
                      <form class='form-horizontal' role='form'  name="frmAdvDispLst" id="frmAdvDispLst">
                        <input name="advProcess" type="hidden" value="" />
                        
						 <div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type:&nbsp; </label>
                               			<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<select name="media" class="form-control" onchange="postData(this.value);" >
                                                     <option selected="selected" value="">Select One</option>
                                    <%
								
									Vector vMedia = (Vector)session.getAttribute("objSesAdvDispTypeMedia");
									if(vMedia!=null && vMedia.size()!=0){
										Enumeration emedia = vMedia.elements();
										String mediaId = "";
										String mediaName = "";
										String mediaDesc  = "";
										String mediaStatus = "";
										while(emedia.hasMoreElements()){
											String[] s = (String [])emedia.nextElement();
											mediaId = s[0];
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
					 
                    <%
			String deleteStatus = (String)request.getAttribute("errStat");
			if(deleteStatus!=null && deleteStatus.equals("eConfirmDelete")){
			%>
                     <p id="p_error">Cannot delete this record. The file is in use.</p>
                      
                      <%
			}
			%>
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
											<div class='col-md-4 col-md-offset-2'>
										
												<label class='control-label label1'>Advertisement Type</label>
												
											</div>
											
											<div class='col-md-2'>
											
												<label class='control-label label1'>Edit</label> 
											
											</div>
											
											<div class='col-md-2'>
											
												<label class='control-label label1'>Delete</label> 
											
											</div>
										</div>
									</div>
								</div>
  
  
												
                      <%
			Vector vDispLst = (Vector)session.getAttribute("objSesAdvDispType");
			if(vDispLst!=null && vDispLst.size()!=0){
			
						Enumeration eDispLst =vDispLst.elements();
			
						while(eDispLst.hasMoreElements()){
						String[] s = (String [])eDispLst.nextElement();
						
						String display_id=s[0];
						String display_name=s[1];
						String media_id=s[2];
						String display_desc=s[3];
						String display_status = s[4];
					
					%>
                      <form class='form-horizontal' role='form' name="frmAdvDisp" method="post" action="./advertisement.html">
                       <input type="hidden" name="advProcess" value="advManupDispType" />
                       <input type="hidden" value="<%=display_id%>" name="display_id" />
                         
							  <div class='form-group'>
									<div class="container"> 
									   <div class="row"> 
										<div class='col-md-4 col-md-offset-2'>
                                   			<label class='control-label'>&emsp;&nbsp;<%=display_name%></label>
										</div>
										 <div class='col-md-2'>
                                       		 &emsp;<button class='btn-sm btn-primary' type='submit' value='Edit' name='advButtonDisp'>Edit</button>
                                         </div>
										 <div class='col-md-2'>
                                       		&emsp;<button class='btn-sm btn-danger' style='' type='submit' value='Delete' name='advButtonDisp'>Delete</button>
                                   		 </div>
									 </div>
								</div>
							</div>
									
                   
                    <%}	
					 }
					else {
					%>
                     
					
							
						   <div class='form-group'>
								
                                   <div class="container"> 
								   
									   
									   		<div class='col-md-4'>
											
											</div>
									   
											<div class='col-md-4'>
										
					 							No records are available. 
												
											</div>
											
									</div>
                             </div>
						 
                      <%}%>
					 
             </form>
	  <!--==============================================import content code end here============================================-->
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
