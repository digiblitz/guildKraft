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
package com.coupondetails.action;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.ELMTdbaction;
import com.db.GeneralDBAction;
import com.login.action.KlgLoginAction;
public class CouponlistAction implements Controller {
static Logger log = Logger.getLogger(CouponlistAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws  ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
		try{
			GeneralDBAction db=new GeneralDBAction();
			ELMTdbaction db1=new ELMTdbaction();
			 HttpSession session = request.getSession();
			  String cmd = request.getParameter("cmd");
			  
			  
			  
			  if(cmd.equalsIgnoreCase("applycode")){
					String sessionuserid=request.getParameter("sessionuserid");
				    String  couponcode = (String)request.getParameter("coupon");
				    String  fromTryNowSignUp = request.getParameter("fromTryNowSignUp");				    
				    String  amount = request.getParameter("amount");
				    String coupo = null;
				    
				    coupo =db1.getcouponcodedetailbycouponName(couponcode);
				    log.info("coupon code"+coupo);
				    log.info("sessionuserid------->"+sessionuserid);
				    if(coupo != null){
				    	 String purchase = "try_now";
				    	String off=db1.getcouponoffer(coupo);
				    	request.setAttribute("offer",off);
				    	request.setAttribute("purchase",purchase);
				    	request.setAttribute("sessionuserid", sessionuserid);
				    	request.setAttribute("fromTryNowSignUp", fromTryNowSignUp);
				    	request.setAttribute("productPrice", amount);
				    	 return new ModelAndView("onlineEdition");	
				    }else{
				    	request.setAttribute("status", "Coupon code invalid");
				    	 return new ModelAndView("applycoupon");		
				    }
					
					
					 //return new ModelAndView("onlineEdition");
			  }  else if(cmd.equalsIgnoreCase("couponcodeneed")){
				 /* String  price = (String)request.getParameter("getProductPrice");
					String Productplan=request.getParameter("Productplan");
					String onetimecost=request.getParameter("onetime");
					 String purchase = "try_now";
					 if(price!=null){
							purchase = "buy_now";
						//Double temp = Double.valueOf(price);
							String productPrice = price;
						log.info("Product Price :::: "+productPrice);
						//double productPrice = temp;
						request.setAttribute("productPrice", productPrice);
						request.setAttribute("purchase", purchase);
						request.setAttribute("Productplan",Productplan);
						request.setAttribute("onetimecost",onetimecost);
						
						}*/
				  
				  String amount = request.getParameter("amount");
				  String fromTryNowSignUp = request.getParameter("fromTryNowSignUp");
				  
				  request.setAttribute("fromTryNowSignUp",fromTryNowSignUp);
				  request.setAttribute("amount",amount);
			  
				  return new ModelAndView("couponoption");  
			  }
			  else if(cmd.equalsIgnoreCase("couponcodeapply")){
				  String user_id=(String)session.getAttribute("userId");
				  String amount = request.getParameter("amount");
				  String fromTryNowSignUp = request.getParameter("fromTryNowSignUp");
				  
				  request.setAttribute("fromTryNowSignUp",fromTryNowSignUp);
				  request.setAttribute("amount",amount);
				  request.setAttribute("user_id", user_id);
				  return new ModelAndView("applycoupon");  
			  }
			  else if(cmd.equalsIgnoreCase("insertcoupon")){
		        	 String coupon_code=request.getParameter("coupon_name");
		        	 String coupon_des=request.getParameter("coupon_des");
		        	 String coupon_offer=request.getParameter("coupon_offer");
		        	 
		        	 String coupondet=db1.insertcoupondet(coupon_code,coupon_des,coupon_offer);
		        	 
		        	 request.setAttribute("coupondet", coupondet);
		        	 return new ModelAndView("frmInsertCouponcode");
		         }
			  else if(cmd.equalsIgnoreCase("coupondetails")){
		        	 ArrayList showcoupondet=db1.getcoupondetails();
		        	 
		        	 request.setAttribute("showcoupondet", showcoupondet);
		        	 return new ModelAndView("showcouponcode");
		         }
		         
		         else if(cmd.equalsIgnoreCase("couponofferedit")){
		        	 String coupon_id=request.getParameter("coupon_id");
		        	 
		        	 ArrayList getcouponeditdet=db1.getcouponeditdet(coupon_id);
		        	 ArrayList showcoupondet=db1.getcoupondetails();
		        	 
		        	 
		        	 request.setAttribute("getcouponeditdet", getcouponeditdet);
		        	 request.setAttribute("showcoupondet", showcoupondet);
		        	 return new ModelAndView("editcouponcode");
		         }
		         
		         else if(cmd.equalsIgnoreCase("updatecode")){
		        	 String coupon_id=request.getParameter("coupon_id");
		        	 String coupon_code=request.getParameter("coupon_code");
		        	 String coupon_offer=request.getParameter("couponoffer");
		        	 
		        	 ArrayList showcoupondet=db1.getcoupondetails();
		        	 boolean getupdatecoupondet=db1.getupdatecoupondet(coupon_id,coupon_code,coupon_offer);
		        	 

		        	 
		        	 request.setAttribute("showcoupondet", showcoupondet);
		        	 request.setAttribute("getupdatecoupondet", getupdatecoupondet);
		        	 return new ModelAndView("showcouponcode");
		         }
		         
		         
		         else if(cmd.equalsIgnoreCase("coupondeactivate")){
		        	 String status=request.getParameter("status");
		        	 String coupon_id=request.getParameter("coupon_id");
		        	 
		        	 boolean deactivecode=db1.getdeactivecode(coupon_id,status);
		        	
		        	 
		        	 
		        	 request.setAttribute("deactivecode", deactivecode);
		        	 return new ModelAndView("showcouponcode");
		         }
			  
			 
			  
		}
			  catch(Exception e){
					e.printStackTrace();
					
				}
				
					
					return null;
	}

}
