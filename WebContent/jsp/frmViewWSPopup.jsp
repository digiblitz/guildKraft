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
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 
 <script language="javascript">

//window.onload=call();

function selfClose(name,id) {
refreshProductList(name,id);
self.close();
}



function refreshProductList(name,id){
	var val=document.getElementById("reqVal").value;
	window.opener.document.frmWSArti.name.value=name;
	window.opener.document.frmWSArti.drop.value=val;
	window.opener.document.frmWSArti.id.value=id;

	window.opener.document.frmWSArti.submit();
}
 
 function call(){

	document.frmDrop.submit();
	window.close();
		
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
                        
									  <%String name=(String)request.getAttribute("name");
										 String artId=(String)request.getAttribute("artId");

										%>
							
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
                
               
                    <form class='form-horizontal' role='form'  action="SysMgmt.do" method="post" name="frmDrop" id="frmDrop">
                     
					  <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Process Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
                         							<label class='control-label'><%=name%></label>
											</div>
										</div>
									</div>
								</div>
                       
                         <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select LifeCycle:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
											  <select name="reqVal" id="reqVal" class="form-control">
												  <option value="high">High</option>
												  <option value="medium">Medium</option>
												  <option value="low">Low</option>
												</select>                         
                      					 </div>
									</div>
								</div>
							</div>                      
                       
                     			<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' name="button" type="button" onclick="selfClose('<%=name%>','<%=artId%>')" value="OK" >OK</button>
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
