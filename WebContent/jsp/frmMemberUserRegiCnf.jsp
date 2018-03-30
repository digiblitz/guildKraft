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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Member register Confirmation</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmAdvertise.js" type="text/javascript" ></script>
</head>


<<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->

     <%
  	String source = (String)request.getAttribute("source");
	System.out.println("source Value: "+source);
  %>
    
          
          <%
				String action = "";
				if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
					action = "OEELogin.do";
				}else{
					action = "MemberLogin.do";
				}
			%>
			
			<div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
						  <form class='form-horizontal' role='form' action="<%=action%>" method="post" name="confrm" id="confrm"/>
						  
						  <input type="hidden" name="cmd" value="checkLogin" />
						  <%
										String uname=(String)request.getAttribute("loginName");
										String pwd=(String)request.getAttribute("pwd");
										System.out.print("uname :"+uname +" "+ "pwd :"+pwd);
									%>
						  <input type="hidden" name="textfield" value="<%=uname%>" />
						  <input type="hidden" name="textfield2" value="<%=pwd%>" />
						  
						  <div class='panel-heading'>
                            <h2>Membership: Confirmation</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
          
                 		<p> The login details have been sent to your email id. You could login now. </p>
						
						  <div class='from-group'>
							<div class='col-md-offset-4 col-md-1'>
							 
							<a href="login.html?cmd=initLogin" >Sign In</a>
							</div>
						</div>
						
					</div>
                   </form>
				   
				   
				  
					
                </div>
				
            </div>
			
			
        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
