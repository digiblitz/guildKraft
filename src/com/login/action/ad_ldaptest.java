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
package com.login.action;

/* --------------------------------------------------------------------------- *
 * file:        ad_ldaptest.java v1.0                                          *
 * author:      5/23/2011 Frank4DD, see http://www.frank4dd.com/howto          *
 * purpose:     This test program connects to a Actice Directory LDAP using    *
 *              simple bind and returns the groups for a given domain user.    *
 *                                                                             *
 * compile:     javac ad_ldaptest.java                                         *
 * run:         java  ad_ldaptest                                              *
 * --------------------------------------------------------------------------- */

import java.util.*;
import javax.naming.*;
import javax.naming.directory.*;

public class ad_ldaptest {
  public static boolean active(String loginName, String password) {
	  
	  String sAMAloginName = null;
	  boolean validate = false;
	  

    // set the LDAP authentication method
    String auth_method  = "simple";
    // set the LDAP client Version
    String ldap_version = "3";
    // This is our LDAP Server's IP
    String ldap_host    = "localhost";
    // This is our LDAP Server's Port
    String ldap_port    = "389";
    // This is our access ID
    //String ldap_dn      = loginName+"@ELMT-DEVSERVER.COM";
    String ldap_dn      = "Administrator@ELMT-DEVSERVER.COM";
   // This is our access PW
    String ldap_pw      = "digiBlitz@2482";
   // String ldap_pw      = password;
    // This is our base DN
    String base_dn      = "DC=ELMT-DEVSERVER,DC=com";

    DirContext ctx      = null;
    Hashtable env       = new Hashtable();

    // Here we store the returned LDAP object data
    String dn           = "";
    // This will hold the returned attribute list
    Attributes attrs;

    env.put(Context.INITIAL_CONTEXT_FACTORY,"com.sun.jndi.ldap.LdapCtxFactory");
    env.put(Context.PROVIDER_URL,"ldap://" + ldap_host + ":" + ldap_port);
    env.put(Context.SECURITY_AUTHENTICATION, auth_method);
    env.put(Context.SECURITY_PRINCIPAL, ldap_dn);
    env.put(Context.SECURITY_CREDENTIALS, ldap_pw);
    env.put("java.naming.ldap.version", ldap_version);

    try{
        System.out.println("Connecting to host " + ldap_host + " at port " + ldap_port + "...");
        System.out.println();

        ctx = new InitialDirContext(env);
        System.out.println("LDAP authentication successful!");

        // Specify the attribute list to be returned
        //String[] attrIDs = { "memberOf","sn","givenname", "mail","telephonenumber","samaccountname"};
  	  String[] attrIDs = {"samaccountname"};
                                                           
        SearchControls ctls = new SearchControls();
        ctls.setReturningAttributes(attrIDs);
        ctls.setSearchScope(SearchControls.SUBTREE_SCOPE);

        // Specify the search filter to match
        String filter = "(&(objectClass=user)(sAMAccountName="+loginName+"))";

        // Search the subtree for objects using the given filter
        NamingEnumeration answer = ctx.search(base_dn, filter, ctls);

        // Print the answer
        //Search.printSearchEnumeration(answer);
  	 
   System.out.println("<-----------------------------PRABHU HERE----------------------------------->");
        while (answer.hasMoreElements()) {
  		  
          SearchResult sr = (SearchResult)answer.next();
          dn = sr.getName();
  		     
          attrs = sr.getAttributes();

          System.out.println("Found Object: " + dn + "," + base_dn);
          if (attrs != null) {
            // we have some attributes for this object
            NamingEnumeration ae = attrs.getAll();
            while (ae.hasMoreElements()) {
              Attribute attr = (Attribute)ae.next();
              String attrId = attr.getID();
              System.out.println("Found Attribute: " + attrId);
              Enumeration vals = attr.getAll();
              while (vals.hasMoreElements()) {
            	  sAMAloginName = (String)vals.nextElement();
                System.out.println(attrId + ": " + sAMAloginName);
  			  //System.out.println("givenname "+ attrs.get("givenname"));

              }
            }
          }
       }

        // Close the context when we're done
        ctx.close();
      } catch (AuthenticationException authEx) {
    	  authEx.printStackTrace();
      System.out.println("LDAP authentication failed!");
    } catch (NamingException namEx) {
      System.out.println("LDAP connection failed!");
      namEx.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
   }
    System.out.println("sAMAloginName OUTSIDE THE LDAP : "+sAMAloginName);
    
    if((sAMAloginName != null) &&(sAMAloginName.equals(loginName))){
    	
    	validate = true;
    	
    }
    System.out.println("VALIDATING THE USERNAME : "+validate);
    return validate;
    
  }
}
