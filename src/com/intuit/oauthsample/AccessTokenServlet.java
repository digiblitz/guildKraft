/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.intuit.oauthsample;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oauth.signpost.OAuth;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.http.HttpParameters;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@SuppressWarnings("serial")
public class AccessTokenServlet extends HttpServlet {


	Logger logger = LoggerFactory.getLogger("AccessTokenServlet.class");
	
	public AccessTokenServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	// The Oauth Callback URL is configured in the properties file and redirects to here
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("AccessTokenServlet");
		

		try{
			
		HttpSession session = request.getSession();
		
		// The realm Id is returned in the callback and read into the session
		String realmID = request.getParameter("realmId");
		session.setAttribute("realmId", realmID);

		OAuthConsumer oauthconsumer = (OAuthConsumer) session.getAttribute("oauthConsumer");


		HttpParameters additionalParams = new HttpParameters();
		additionalParams.put("oauth_callback", OAuth.OUT_OF_BAND);
		additionalParams.put("oauth_verifier", request.getParameter("oauth_verifier"));
		oauthconsumer.setAdditionalParameters(additionalParams);
		
		
		// Sign the call to retrieve the access token request
		String signedURL = oauthconsumer.sign(OAuthUtils.ACCESS_TOKEN_URL);
		URL url = new URL(signedURL);

		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		urlConnection.setRequestMethod("GET");

		String accesstokenresponse = "";
		String accessToken, accessTokenSecret = "";
		if (urlConnection != null) {
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					urlConnection.getInputStream()));
			StringBuffer sb = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
				System.out.println(sb.toString());
			}
			rd.close();
			accesstokenresponse = sb.toString();
		}
		if (accesstokenresponse != null) {
			String[] responseElements = accesstokenresponse.split("&");
			if (responseElements.length > 1) {
				accessToken = responseElements[1].split("=")[1];
				accessTokenSecret = responseElements[0].split("=")[1];
				logger.info("OAuth accessToken: " + accessToken);
				logger.info("OAuth accessTokenSecret: " + accessTokenSecret);
				Map<String, String> accesstokenmap = new HashMap<String, String>();
				accesstokenmap.put("accessToken", accessToken);
				accesstokenmap.put("accessTokenSecret", accessTokenSecret);
				session.setAttribute("accessToken", accesstokenmap.get("accessToken"));
				session.setAttribute("accessTokenSecret", accesstokenmap.get("accessTokenSecret"));
				response.sendRedirect("/guildKraft/QB_jsp/connected.jsp");
			}
		}

	} catch (Exception e) {
		logger.error(e.getLocalizedMessage());
	}

}
}
