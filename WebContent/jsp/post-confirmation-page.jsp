<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

	
  					<%
                        String uname=(String)request.getAttribute("usrname");
                        String pwd=(String)request.getAttribute("cpwd");
			System.out.print("uname :"+uname +" "+ "pwd :"+pwd);
                    %>
	
	<div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">


	<%if(uname=="" && uname==null){%>
 
 
					<!-- HEADER STARTS HERE -->
					<%@ include file = "../../include/login_header.jsp" %>
					<!-- HEADER ENDS HERE -->

 	 <%}else{%>

  	
		<%@ include file = "../../include/header.jsp" %>
	
				<div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
				 <div class="col-md-2 pad">
				
				<!--==============================include infobar Here=================================-->
				
					<%@ include file = "../../include/infobar.jsp" %>
					
				<!--==============================include infobar Here=================================-->
				</div>
				
				
  <%}%>
			 <div class="col-md-2 pad">
			 
					<!-- LEFT MENU STARTS HERE -->
					
					<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
					
					<!-- LEFT MENU ENDS HERE -->
					
			</div>
			
			<%
				String source = (String)request.getAttribute("source");
				String eventTypeId = (String)request.getAttribute("eventTypeId");
				String compYear = (String)request.getAttribute("compYear");
				String action = "";
				if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
					action = "OEELogin.do";
				}else{
					action = "MemberLogin.do";
				}
			%>
					<form name="confrm" method="post" action="<%=action%>"/>
				  <input type="hidden" name="cmd" value="checkLogin" />
				  <input type="hidden" name="eventTypeId" id="eventTypeId" value="<%=eventTypeId%>" />
				  <input type="hidden" name="compYear" id="compYear" value="<%=compYear%>" />
				
                    <input type="hidden" name="textfield" value="<%=uname%>" />
		    <input type="hidden" name="textfield2" value="<%=pwd%>" />
		
		<%if(uname=="" && uname==null){%>
			 
			 
			 <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership: Confirmation</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
			
		
    <p> You have successfully updated your profile <br />
		
       
          Login now to access your information. </p>
		  			
					
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Login</button>
                                    </div>
								</div>
  </form>
 			
			
			<!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				
            </div>
			
			
  
			<%}else{%>
			
			  <div class='panel-body'>
						
				
						 <p> You have successfully updated your profile </p>
						 
				</div>
  <%}%>
			
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
