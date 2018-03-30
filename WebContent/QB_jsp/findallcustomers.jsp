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
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.util.Properties, com.intuit.oauthsample.OAuthUtils, java.util.Iterator, java.net.URL, java.net.HttpURLConnection, oauth.signpost.OAuthConsumer, oauth.signpost.basic.DefaultOAuthConsumer"  %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
OAuthUtils utils = new OAuthUtils();
Properties prop = utils.readProperties();

Logger logger = LoggerFactory.getLogger("OauthSample");

%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" media="screen" href="css/_reset.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/common.css">
<title>Retrieve Customers</title>
</head>
<body>
This jsp calls the QBO Customer endpoint to retrieve customer with id 2
<ul>

 <% 
	String accesstoken = (String)session.getAttribute("accessToken");
	String accessstokensecret = (String)session.getAttribute("accessTokenSecret");
	String realmID = (String)session.getAttribute("realmId");

	OAuthConsumer ouathconsumer = new DefaultOAuthConsumer(prop.getProperty("oauth_consumer_key"),prop.getProperty("oauth_consumer_secret"));
    ouathconsumer.setTokenWithSecret(accesstoken, accessstokensecret);
   
    HttpURLConnection urlConnection =null;
    URL url=null;
   
    try {
         
         
    url = new URL(prop.getProperty("qbo_url") + realmID + "/customer/2");
   
   urlConnection = (HttpURLConnection)url.openConnection();
   urlConnection.setRequestMethod("GET");
   urlConnection.setUseCaches(false);
   urlConnection.setDoInput(true);
   urlConnection.setDoOutput(true);
   urlConnection.setRequestProperty("Connection", "Keep-Alive");
   urlConnection.setRequestProperty("Content-Type", "application/json");
   urlConnection.setRequestProperty("Accept", "application/json");
   
   ouathconsumer.sign(urlConnection);
   
   urlConnection.connect();
   
   if(urlConnection!=null)
   {  

   BufferedReader rd = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
   out.println(rd.readLine()); 
   rd.close();

   }
    }catch(Exception e)
    {
    	e.printStackTrace();
    }
  

 %>

</ul>
</body>
</html>
