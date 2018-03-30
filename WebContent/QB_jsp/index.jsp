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
    <%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ipp="">
  <head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     <title>My Connect Page</title>
     <script type="text/javascript" src="https://appcenter.intuit.com/Content/IA/intuit.ipp.anywhere-1.3.2.js">
        </script>
     <script>intuit.ipp.anywhere.setup({
          menuProxy: '',
          grantUrl: 'https://digiblitzonline.com:8643/guildKraft/RequestTokenTest.html'});
     </script>
   </head>
   <body>
   
   <div>
<%@ include file = "../../include/HeaderProcess.jsp" %>

  <!-- HEADER ENDS HERE -->
</div>
   
   <section id="content">
     <div style="margin-left:500px; margin-top:200px; "> <span>Click this button</span> <ipp:connectToIntuit></ipp:connectToIntuit></div>
	</section>   
	   
  <div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
</div>
   </body>
</html>
