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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Login</title>
<meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/camera.css"> 
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">
	 <%
	   
  String sessLogId = (String) session.getAttribute("sessionId");
  String chkLogout = (String) request.getAttribute("logout");
    

 

  
  System.out.println("chkLogout==="+chkLogout);
  
  if(sessLogId!=null){
   session.removeAttribute("sessionId");
            session.removeAttribute("userId");
            session.removeAttribute("userCode");
            session.removeAttribute("firstName");
            session.removeAttribute("userTypeName");
            session.removeAttribute("emailId");
            session.removeAttribute("memberId");
   response.setHeader("Cache-Control", "no-cache");
  response.sendRedirect("login.jsp"); 
  }
  
  
  %>
  <script language="javascript">

 
    function noBack() {  
   
  window.history.forward(); }

    noBack();
    window.onload = noBack;
    window.onpageshow = function (evt) { if (evt.persisted) noBack(); }
    window.onunload = function () { void (o); }
	</script>
	
</head>
<body>
<!--==============================header=================================-->
<header id="header">
<%@ include file = "../../include/LoginHeader.jsp" %>
</header>

<form id="form1" name="form1" method="post" action="login.html">
  <div align="center" class="bg1">
 <table width="887" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab" style="border-left-style:groove;border-left-width:thin;border-right-style:groove;border-right-width:thin;border-top-style:groove;border-top-width:thin;border-bottom-style:groove;border-bottom-width:thin">
              <tr>
                <td class="alignTop" align="center">
					<p>
					   <!-- HEADER STARTS HERE -->
					
					 <!-- HEADER ENDS HERE -->
				    </p></td>
     		 </tr>
   					
   			<tr>
   
		      <td>
			    	 <table width="875">
			    		 <tr>
			    		   <td height="78" class="tableCommonBg">&nbsp;</td>
		    		   </tr>
			    		 <tr>
						    
                <td width="867" height="237" class="tableCommonBg">
                  
                    <div>
					<table width="328" height="144" align="left">
					  <tr>
					    <td height="20"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					  <tr>
					    <td height="94" align="center" valign="middle"><strong>Welcome to KlugWerks</strong></td>
				      <tr>
				        <td height="20">&nbsp;</td>
			          </table>
                      <table width="375" border="1" cellpadding="2" cellspacing="2" bordercolor="#999999" bgcolor="#FFFFFF" align="right">
					  <%
					              String status = (String) request.getAttribute("status");
            if (status != null) {
                if (status.equals("fail")) {%>
                
                     <tr>
                                                                    <td height="25" colspan="2" class="styleError">Invalid Login! Try logging in again.</td>
                                                                </tr>
                                                                <%} else if (status.equals("expired")) {%>
                                                                <tr>
                                                                    <td height="25" colspan="2" class="styleError">License Expired.</td>
                                                                </tr>
                                                                <% } else if (status.equals("conFailed")) {%>
                                                                <tr>
                                                                <td height="25" colspan="2" class="styleError">Connection Problem ! Please Login Again.</td>
                                                            </tr>
                                                            <% } else if (status.equals("users")) {%>
                                                                <tr>
                                                                    <td height="25" colspan="2" class="styleError">Licensed Users Exceeded.</td>
                                                                </tr>
                                                                <% } } %>
																
                        <tr>
                          <td colspan="2" valign="middle" bgcolor="#999999"><div align="center"><strong style="color:#FFFFFF">Login</strong></div></td>
                        </tr>
                        <tr>
                          <td width="181" height="28" valign="middle"><label>Username </label>
                          &nbsp;</td>
                          <td width="174" valign="middle"><label>
                          <input type="text" name="textfield">
                          </label></td>
                        </tr>
                        <tr>
                          <td height="28" valign="middle"><label>                          Password </label>
&nbsp;</td>
                          <td valign="middle"><input type="password" name="textfield2"></td>
                        </tr>

                        <tr>
                          <td height="28" colspan="2" valign="middle"><div align="center" style="margin-bottom:15px;margin-top:15px">
                            
                              <input type="submit" name="Submit" value="Submit"></br>
                           
                              </div></td>
                        </tr>
                        
                        <tr>
                          <td height="23" align="right" valign="middle" style="border-right-style:groove;border-right-width:medium">
                          	<label style="color: blue;"><a href="user.html?cmd=initUsr" style="color:#0000FF">New user signup</a>&nbsp;</label>
                          </td>
                          <td height="23" valign="middle">
                          	<label style="color: blue;"><a href="user.html?cmd=view" style="color:#0000FF">&nbsp;Forget password?</a> </label>
                          </td>
                        </tr>
                      </table>
                    </div></td>
	 	 			</tr>
	 	 		</table>
	 	 	        
 	         </td>
	 	 </tr>
	 	 				 
	 	 	
 
	 	 
 </table>
<br>
 </div>
 </form>
 
<!--=======footer=================================-->

 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>
