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

	
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Connected to Intuit</title>
</head>
<body>

<% String memberCount = (String)request.getAttribute("membercount"); 
%>
<input type="hidden" name="memberCount" id="memberCount" value="<%=memberCount%>">

OAuth Successful!!
 <script type="text/javascript">
 
 var memberCount = document.getElementById("memberCount").value;
 window.opener.location.href="/guildKraft/getcustomer.html?cmd=success&memberCount="+memberCount;
 window.close();
 </script>
</body>
</html>
