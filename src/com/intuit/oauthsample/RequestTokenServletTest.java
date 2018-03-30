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

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oauth.signpost.OAuthConsumer;
import oauth.signpost.OAuthProvider;
import oauth.signpost.basic.DefaultOAuthConsumer;
import oauth.signpost.basic.DefaultOAuthProvider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RequestTokenServletTest {
	
	Logger logger = LoggerFactory.getLogger("RequestTokenServletTest.class");

	public RequestTokenServletTest()
	{
		super();	 
	}
	
	@RequestMapping("/RequestTokenTest.html")
	public ModelAndView helloWorld(HttpServletRequest request,
			HttpServletResponse response){
		logger.info("RequestToken");
		System.out.println("java sai nath");
		// Invoke the helper class and retrieve the request token. 
		OAuthConsumer oauthconsumer;
		
		OAuthUtils utils = new OAuthUtils();
		Properties prop = utils.readProperties();

		// Initialize the Provider class with the request token, access token and authorize URLs
		OAuthProvider provider = new DefaultOAuthProvider(OAuthUtils.REQUEST_TOKEN_URL, OAuthUtils.ACCESS_TOKEN_URL, OAuthUtils.AUTHORIZE_URL);
		try {

			// Read the consumer key and secret from the Properties file to create the OauthConsumer object
			oauthconsumer = new DefaultOAuthConsumer(prop.getProperty("oauth_consumer_key"), prop.getProperty("oauth_consumer_secret"));
			
			// The retrieveRequestToken method in the signpost library calls the request token URL configured in the OAuthProvider object 
			// to retrieve the token and sends the response to the URL configured in the Oauth Callback URL configured in the properties file
			String authUrl = provider.retrieveRequestToken(oauthconsumer, prop.getProperty("oauth_callbackURL"));
						
			System.out.println("AuthURL - " + authUrl);
			System.out.println("RequestToken - " + oauthconsumer.getToken());
			System.out.println("RequestTokenSecret - " + oauthconsumer.getTokenSecret());
			
			//Store the request token and secret in the session object. These tokens need not be persisted in DB
			HttpSession session = request.getSession();
			session.setAttribute("requestToken",oauthconsumer.getToken());
			session.setAttribute("requestTokenSecret",oauthconsumer.getTokenSecret());
			session.setAttribute("oauthConsumer",oauthconsumer);
			response.sendRedirect(authUrl);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
		
	}


