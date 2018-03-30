/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.paypal.action;

/**
 *
 * @author Dhivya
 */


import com.paypal.sdk.core.nvp.NVPDecoder;
import com.paypal.sdk.core.nvp.NVPEncoder;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.util.MessageResources;

public class PayPalPayments {

    
static PayPalPayments myInstance = new PayPalPayments();
	
	public static PayPalPayments getInstance(){
		return myInstance;
	}
	
	static Logger log = Logger.getLogger(PayPalPayments.class.getName());
	
	public static final String prop_file = "paypalapi.properties";
	
	InputStream inputStream;
	
	
	
	//getting url from paypalapi.properties	
	public String getPayPalProperty() throws FileNotFoundException{
		
		Properties prop = new Properties();  	     
		inputStream = getClass().getClassLoader().getResourceAsStream(prop_file);

		if (inputStream != null) {
			try {
				prop.load(inputStream);				
			} catch (IOException e) {				
				e.printStackTrace();
			}
		} else {
			throw new FileNotFoundException("property file '" + prop_file + "' not found in the classpath");
		}		
		String url = prop.getProperty("url");		
		return url;
	}
	
	public static String[] DoDirectPaymentCode(String API_username, String API_password, String API_Signature, String method, String amount, String version, String Environ, String payAction, String ccType, String acct, String expDt, String cvvNo, String fName, String ipAdd, String emailId, String inVId, String inVoiceId1, String lName,String street,String city,String state,String ccode,String zip) {
    	System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");
    	
    	String validDetails = "";
        log.info("inVoiceId1  " + inVoiceId1 + "  inVId  " + inVId);

        String[] ppResDoPay = new String[8];
      //log.info("Inside DoDirect ++++++++++++++++++++++++++++");
        System.out.print("API_username"+API_username);
        System.out.print("API_password"+API_password);
        System.out.print("API_Signature"+API_Signature);
        System.out.print("method"+method);
        System.out.print("amount"+amount);
        System.out.print("version"+"51.0");
        System.out.print("Environ"+Environ);
        System.out.print("payAction"+payAction);
        System.out.print("ccType"+ccType);
        System.out.print("acct"+acct);
        System.out.print("expDt"+expDt);
        System.out.print("cvvNo"+cvvNo);
        System.out.print("fName"+fName);
        System.out.print("ipAdd"+ipAdd);
        System.out.print("emailId"+emailId);
        System.out.print("inVId"+inVId);
        System.out.print("inVoiceId1"+inVoiceId1);
                     
        try {

            URL url;
            HttpURLConnection urlConn;
            DataOutputStream printout;
            BufferedReader input;

            String paypalUrl = myInstance.getPayPalProperty();
            
            url = new URL(paypalUrl); //live
            //url = new URL("https://api-3t.paypal.com/nvp"); //live
           //url = new URL("https://api-3t.sandbox.paypal.com/nvp"); //sandbox

            urlConn = (HttpURLConnection) url.openConnection();
            urlConn.setDoInput(true);
            urlConn.setDoOutput(true);
            urlConn.setUseCaches(false);
            urlConn.setRequestMethod("POST");
            urlConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            System.out.print("Inside Do Direct Payment Code Method");

            if (inVId.equalsIgnoreCase("start") && inVoiceId1.equalsIgnoreCase("1")) {
                UUID idOne = UUID.randomUUID();
                String Id = String.valueOf(idOne);

                System.out.print("invoiceId" + idOne);
                System.out.print("Id in String Type" + Id);


                // data-value pairs are separated by &
                String content =
                        "USER=" + URLEncoder.encode(API_username, "UTF-8") +
                        "&" +
                        "PWD=" + URLEncoder.encode(API_password, "UTF-8") +
                        "&" +
                        "SIGNATURE=" + URLEncoder.encode(API_Signature, "UTF-8") +
                        "&" +
                        "VERSION=" + URLEncoder.encode("51.0", "UTF-8") +
                        "&" +
                        "METHOD=" + URLEncoder.encode(method, "UTF-8") +
                        "&" +
                        "AMT=" + URLEncoder.encode(amount, "UTF-8") +
                        "&" +
                        "ENVIRON=" + URLEncoder.encode(Environ, "UTF-8") +
                        "&" +
                        "PAYMENTACTION=" + URLEncoder.encode(payAction, "UTF-8") +
                        "&" +
                        "CREDITCARDTYPE=" + URLEncoder.encode(ccType, "UTF-8") +
                        "&" +
                        "ACCT=" + URLEncoder.encode(acct, "UTF-8") +
                        "&" +
                        "EXPDATE=" + URLEncoder.encode(expDt, "UTF-8") +
                        "&" +
                        "IPADDRESS=" + URLEncoder.encode(ipAdd, "UTF-8") +
                        "&" +
                        "FIRSTNAME=" + URLEncoder.encode(fName, "UTF-8") +
                        "&" +
                        "CVV2=" + URLEncoder.encode(cvvNo, "UTF-8") +
                        "&" +
                        "INVNUM=" + URLEncoder.encode(Id, "UTF-8") +
                        "&" +
                        "EMAIL=" + URLEncoder.encode(emailId, "UTF-8")+
                         "&" +
                        "STREET=" + URLEncoder.encode(street, "UTF-8")+ 
                        "&" +
                        "CITY=" + URLEncoder.encode(city, "UTF-8")+ 
                        "&" +
                        "STATE=" + URLEncoder.encode(state,"UTF-8") +
                        "&" +
                        "ZIP=" + URLEncoder.encode(zip,"UTF-8") +
                        "&" +
                        "COUNTRYCODE=" + URLEncoder.encode(ccode,"UTF-8")+
                        "&" +
                        "LASTNAME=" + URLEncoder.encode(lName,"UTF-8");

        
       
                urlConn.setRequestProperty("Content-Length", content.length() + "");


                printout = new DataOutputStream(urlConn.getOutputStream());
                printout.writeBytes(content);

                printout.flush();
                printout.close();

                input = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));

                String paypal_back = input.readLine();

                input.close();

                String PP_back[] = FeedbackCalc(paypal_back);

                validDetails = (String) PP_back[0];
                String corId = (String) PP_back[1];
                String transId = (String) PP_back[2];
                String ppAmt = (String) PP_back[3];
                String avsCode = (String) PP_back[4];
                String cvv2 = (String) PP_back[5];
                String lngMsg = (String) PP_back[6];
                String errCode = (String) PP_back[7];
                String tmStmp = (String) PP_back[8];
                String environ = (String) PP_back[9];

                String[] ppResDoPay1 = {validDetails, corId, transId, ppAmt, avsCode, cvv2, Id, lngMsg, errCode, tmStmp,environ};
                ppResDoPay = ppResDoPay1;

                log.info("validDetails:" + validDetails);
                log.info("transId:" + transId);

            //String ack=URLDecoder.decode("ACK");
            // String transId=URLDecoder.decode("TRANSACTIONID");

            /*String msg=decoder.get("L_LONGMESSAGE0");
            String payResult=decoder.get("ACK");
            String tranxId=decoder.get("TRANSACTIONID");
            String payAction=decoder.get("PAYMENTACTION");
            String amt=decoder.get("AMT"); */
//log.info("ack:" + ack);
            // String[] validResults = {ack,transId};
            //validDetails = validResults;  
            } else {
                ppResDoPay = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ppResDoPay;
    }

    public static String[] FeedbackCalc(String data_in) {

        String statusID = "";
        String PP_back = "";
        String PP_back_longMsg = "";
        String PP_back_timeStmp = "";
        String PP_back_errorCd = "";

        String PP_back_CorId = null;
        String PP_back_TransacId = null;
        String PP_back_Amt = "";
        String PP_back_AvsCode = "";
        String PP_back_Cvv2 = "";
        String PP_back_environ="";

        String[] ppRes1 = new String[7];

        String paypal_back = data_in.replaceAll("=&", "=null&");

        StringTokenizer st = new StringTokenizer(paypal_back, "&");

        int numberofvalues = st.countTokens();
        String[] resultnames = new String[numberofvalues];
        String[] resultvalues = new String[numberofvalues];

        String paypal_values = "";

        int i = 0;
        while (st.hasMoreTokens()) {

            paypal_values = st.nextToken();

            String[] splitstring = paypal_values.split("=");
            resultnames[i] = splitstring[0];
            resultvalues[i] = splitstring[1];

            i++;
        }

        for (int x = 0; x < resultnames.length; x++) {
           log.info("resultnames[x] in doDirectpayment" + resultnames[x]);

            if (resultnames[x].equals("ACK")) {
                statusID = resultvalues[x];

                log.info("statusID: in doDirectpayment" + statusID);
                if (statusID.equals("Failure")) {

                    for (int y = 0; y < resultnames.length; y++) {
               log.info("resultvalues[y] Failure in doDirectpayment" + resultvalues[y]);

                        if (resultnames[y].equals("L_LONGMESSAGE0")) {
                            try {
                                PP_back_longMsg = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_SHORTMESSAGE0")) {
                            try {
                                PP_back = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_ERRORCODE0")) {
                            try {
                                PP_back_errorCd = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("TIMESTAMP")) {
                            try {
                                PP_back_timeStmp = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }
                        } else if (resultnames[y].equals("AVSCODE")) {
                            try {
                                PP_back_AvsCode = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }
                        } else if (resultnames[y].equals("CVV2MATCH")) {
                            try {
                                PP_back_Cvv2 = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }
                        }

                    }
                }
                if (statusID.equals("Success")) {
                    log.info("Inside:::::: in doDirectpayment" + statusID);
                    for (int y = 0; y < resultnames.length; y++) {
                       log.info("resultnames[y] in doDirectpayment"+resultnames[y]);
                       log.info("resultvalues[y] in doDirectpayment"+resultvalues[y]);
                        if (resultnames[y].equals("REFUNDTRANSACTIONID")) {
                            PP_back = "SUCCESS:" + resultvalues[y];
                        } else if (resultnames[y].equals("CORRELATIONID")) {
                            PP_back_CorId = resultvalues[y];
                        } else if (resultnames[y].equals("TRANSACTIONID")) {
                            PP_back_TransacId = resultvalues[y];
                        } else if (resultnames[y].equals("AMT")) {
                            PP_back_Amt = resultvalues[y];
                        } else if (resultnames[y].equals("AVSCODE")) {
                            PP_back_AvsCode = resultvalues[y];
                        } else if (resultnames[y].equals("CVV2MATCH")) {
                            PP_back_Cvv2 = resultvalues[y];
                        }
                        else if (resultnames[y].equals("ENVIRON")) {
                            PP_back_environ = resultvalues[y];
                        }
                    }

                }
                if (statusID.equals("SuccessWithWarning")) {

                    for (int y = 0; y < resultnames.length; y++) {
               log.info("resultvalues[y] Failure in doDirectpayment" + resultvalues[y]);

                        if (resultnames[y].equals("L_LONGMESSAGE0")) {
                            try {
                                PP_back_longMsg = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_SHORTMESSAGE0")) {
                            try {
                                PP_back = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_ERRORCODE0")) {
                            try {
                                PP_back_errorCd = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("TIMESTAMP")) {
                            try {
                                PP_back_timeStmp = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }
                        } else if (resultnames[y].equals("AVSCODE")) {
                            try {
                                PP_back_AvsCode = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }
                        } else if (resultnames[y].equals("CVV2MATCH")) {
                            try {
                                PP_back_Cvv2 = URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }
                        }

                    }
                }

            }
            String[] ppRes = {statusID, PP_back_CorId, PP_back_TransacId, PP_back_Amt, PP_back_AvsCode, PP_back_Cvv2, PP_back_longMsg, PP_back_errorCd, PP_back_timeStmp,PP_back_environ};
            ppRes1 = ppRes;
        }
        return ppRes1;
    }

    public static String[] doCapture(String API_username, String API_password, String API_Signature, String method, String amount, String version, String Environ, String payAction, String authId, String completeCodeType, String invoiceId) throws Exception {
        String validDetails = "";

        String[] ppResDoPay = null ;
        
      /* Debug.print("API_username"+API_username);
        Debug.print("API_password"+API_password);
        Debug.print("API_Signature"+API_Signature);
        Debug.print("method"+method);
        Debug.print("amount"+amount);
        Debug.print("version"+"51.0");
        Debug.print("Environ"+Environ);
        Debug.print("payAction"+payAction);
        Debug.print("authId"+authId);
        Debug.print("completeCodeType"+completeCodeType);
        Debug.print("invoiceId"+invoiceId);
       */
                    
            URL url;
            HttpURLConnection urlConn;
            DataOutputStream printout;
            BufferedReader input;

            String paypalUrl = myInstance.getPayPalProperty();
            
            url = new URL(paypalUrl); //live
            //url = new URL("https://api-3t.paypal.com/nvp"); //live
           //url = new URL("https://api-3t.sandbox.paypal.com/nvp"); //sandbox

            urlConn = (HttpURLConnection) url.openConnection();
            urlConn.setDoInput(true);
            urlConn.setDoOutput(true);
            urlConn.setUseCaches(false);
            urlConn.setRequestMethod("POST");
            urlConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            ppResDoPay = new String[8];
            System.out.print("Inside Do Capture Code Method");
            System.out.print("authId:" + authId);

            // data-value pairs are separated by &
            String content =
                    "USER=" + URLEncoder.encode(API_username, "UTF-8") +
                    "&" +
                    "PWD=" + URLEncoder.encode(API_password, "UTF-8") +
                    "&" +
                    "SIGNATURE=" + URLEncoder.encode(API_Signature, "UTF-8") +
                    "&" +
                    "VERSION=" + URLEncoder.encode("51.0", "UTF-8") +
                    "&" +
                    "METHOD=" + URLEncoder.encode("DoCapture", "UTF-8") +
                    "&" +
                    "AMT=" + URLEncoder.encode(amount, "UTF-8") +
                    "&" +
                    "ENVIRON=" + URLEncoder.encode(Environ, "UTF-8") +
                    "&" +
                    "PAYMENTACTION=" + URLEncoder.encode(payAction, "UTF-8") +
                    "&" +
                    "AUTHORIZATIONID=" + URLEncoder.encode(authId, "UTF-8") +
                    "&" +
                    "COMPLETETYPE=" + URLEncoder.encode(completeCodeType, "UTF-8") +
                    "&" +
                    "INVNUM=" + URLEncoder.encode(invoiceId, "UTF-8");
            /*   "&" +
            "IPADDRESS=" + URLEncoder.encode(ipAdd,"UTF-8")+
            "&" +
            "FIRSTNAME=" + URLEncoder.encode(fName,"UTF-8") +
            "&" +
            "CVV2=" + URLEncoder.encode(cvvNo,"UTF-8")+
            "&" +
            "INVNUM=" + URLEncoder.encode(Id,"UTF-8") +
            "&" +
            "EMAIL=" + URLEncoder.encode(emailId,"UTF-8");
            "&" +
            "STATE=" + URLEncoder.encode(state,"UTF-8") +
            "&" +
            "ZIP=" + URLEncoder.encode(zip,"UTF-8") +
            "&" +
            "COUNTRYCODE=" + URLEncoder.encode(ccode,"UTF-8");*/


            urlConn.setRequestProperty("Content-Length", content.length() + "");


            printout = new DataOutputStream(urlConn.getOutputStream());
            printout.writeBytes(content);

            printout.flush();
            printout.close();

            input = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));

            String paypal_back = input.readLine();

            input.close();

            String PP_back[] = FeedbackCalc1(paypal_back);

            validDetails = (String) PP_back[0];
            String authorId = (String) PP_back[1];
            String payInfo = (String) PP_back[2];
            String transacId = (String) PP_back[3];
            String transacTyp = (String) PP_back[4];
            String payType = (String) PP_back[5];
            String payDt = (String) PP_back[6];
            String grsAmt = (String) PP_back[7];
            String feAmt = (String) PP_back[8];
            String sAmt = (String) PP_back[9];
            String tAmt = (String) PP_back[10];
            String exRt = (String) PP_back[11];
            String payStat = (String) PP_back[12];
            String pendR = (String) PP_back[13];
            String PP_back1 = (String) PP_back[14];
            String recId = (String) PP_back[15];
            String doCpTimeSt = (String) PP_back[16];
            String doCpCorelId = (String) PP_back[17];
            String doCapParentId = (String) PP_back[18];
            String doCapRrsCode = (String) PP_back[19];


            String[] ppResDoPay1 = {validDetails, authorId, payInfo, transacId, transacTyp, payType, payDt, grsAmt, feAmt, sAmt, tAmt, exRt, payStat, pendR, PP_back1, recId, doCpTimeSt, doCpCorelId, doCapParentId, doCapRrsCode};
            ppResDoPay = ppResDoPay1;

            log.info("validDetails in doCaptute:" + validDetails);
            log.info("authorId in doCaptute:" + authorId);
            log.info("PP_back1 in doCaptute:" + PP_back1);

        //String ack=URLDecoder.decode("ACK");
        // String transId=URLDecoder.decode("TRANSACTIONID");

        /*String msg=decoder.get("L_LONGMESSAGE0");
        String payResult=decoder.get("ACK");
        String tranxId=decoder.get("TRANSACTIONID");
        String payAction=decoder.get("PAYMENTACTION");
        String amt=decoder.get("AMT"); */
//log.info("ack:" + ack);
        // String[] validResults = {ack,transId};
        //validDetails = validResults;  

       
        return ppResDoPay;
    }

    public static String[] FeedbackCalc1(String data_in) {

        String statusID = "";
        String PP_back = "";

        String PP_back_AuthorId = null;
        String PP_back_TransacId = null;
        String PP_back_PayInfo = "";
        String PP_back_TransacTyp = "";
        String PP_back_PayTyp = "";
        String PP_back_PayDt = "";
        String PP_back_GAmt = "";
        String PP_back_FAmt = "";
        String PP_back_SAmt = "";
        String PP_back_TAmt = "";
        String PP_back_ExRate = "";
        String PP_back_PayStat = "";
        String PP_back_PendRr = "";
        String PP_back_recId = null;
        String PP_back_payTimeStmp = "";
        String PP_back_doCapCorrelId = null;
        String PP_back_doCapParTrnId = null;
        String PP_back_doCapRrsCode = null;

        String[] ppRes1 = new String[7];

        String paypal_back = data_in.replaceAll("=&", "=null&");

        StringTokenizer st = new StringTokenizer(paypal_back, "&");

        int numberofvalues = st.countTokens();
        String[] resultnames = new String[numberofvalues];
        String[] resultvalues = new String[numberofvalues];

        String paypal_values = "";

        int i = 0;
        while (st.hasMoreTokens()) {

            paypal_values = st.nextToken();

            String[] splitstring = paypal_values.split("=");
            resultnames[i] = splitstring[0];
            resultvalues[i] = splitstring[1];

            i++;
        }

        for (int x = 0; x < resultnames.length; x++) {
           log.info("resultnames[x] in doCapture:::::" + resultnames[x]);
            if (resultnames[x].equals("ACK")) {
                statusID = resultvalues[x];

               log.info("statusID in doCapture method:" + statusID);
                if (statusID.equals("Failure")) {

                    for (int y = 0; y < resultnames.length; y++) {
                   log.info("resultvalues[y] in doCapture:::::" + resultvalues[y]);

                        if (resultnames[y].equals("L_LONGMESSAGE0")) {
                            try {
                                PP_back = "FAIL:" + URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_SHORTMESSAGE0")) {
                            try {
                                PP_back = "FAIL 1:" + URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_SEVERITYCODE0")) {
                            try {
                                PP_back = "FAIL 2:" + URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_ERRORCODE0")) {
                            try {
                                PP_back = "FAIL 3:" + URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        }

                    }
                }
                if (statusID.equals("Success")) {
                    log.info("Inside:::::: in doCapture" + statusID);
                    for (int y = 0; y < resultnames.length; y++) {
                       log.info("resultnames[y] in doCapture"+resultnames[y]);
                      log.info("resultvalues[y] in doCapture"+resultvalues[y]);
                        
                        if (resultnames[y].equals("REFUNDTRANSACTIONID")) {
                            PP_back = "SUCCESS:" + resultvalues[y];
                        } else if (resultnames[y].equals("AUTHORIZATIONID")) {
                            PP_back_AuthorId = resultvalues[y];
                        } else if (resultnames[y].equals("TRANSACTIONID")) {
                            PP_back_TransacId = resultvalues[y];
                        } else if (resultnames[y].equals("TRANSACTIONTYPE")) {
                            PP_back_TransacTyp = resultvalues[y];
                        } else if (resultnames[y].equals("PAYMENTTYPE")) {
                            PP_back_PayTyp = resultvalues[y];
                        } else if (resultnames[y].equals("ORDERTIME")) {
                            PP_back_PayDt = resultvalues[y];
                        } else if (resultnames[y].equals("AMT")) {
                            PP_back_GAmt = resultvalues[y];
                        } else if (resultnames[y].equals("FEEAMT")) {
                            PP_back_FAmt = resultvalues[y];
                        } else if (resultnames[y].equals("SETTLEAMT")) {
                            PP_back_SAmt = resultvalues[y];
                        } else if (resultnames[y].equals("TAXAMT")) {
                            PP_back_TAmt = resultvalues[y];
                        } else if (resultnames[y].equals("EXCHANGERATE")) {
                            PP_back_ExRate = resultvalues[y];
                        } else if (resultnames[y].equals("PAYMENTSTATUS")) {
                            PP_back_PayStat = resultvalues[y];
                        } else if (resultnames[y].equals("PENDINGREASON")) {
                            PP_back_PendRr = resultvalues[y];
                        } else if (resultnames[y].equals("RECEIPTID")) {
                            PP_back_recId = resultvalues[y];
                        } else if (resultnames[y].equals("TIMESTAMP")) {
                            PP_back_payTimeStmp = resultvalues[y];
                        } else if (resultnames[y].equals("CORRELATIONID")) {
                            PP_back_doCapCorrelId = resultvalues[y];
                        } else if (resultnames[y].equals("PARENTTRANSACTIONID")) {
                            PP_back_doCapParTrnId = resultvalues[y];
                        } else if (resultnames[y].equals("REASONCODE")) {
                            PP_back_doCapRrsCode = resultvalues[y];
                        }

                    }

                }


            }
            String[] ppRes = {statusID, PP_back_AuthorId, PP_back_PayInfo, PP_back_TransacId, PP_back_TransacTyp, PP_back_PayTyp, PP_back_PayDt, PP_back_GAmt, PP_back_FAmt, PP_back_SAmt, PP_back_TAmt, PP_back_ExRate, PP_back_PayStat, PP_back_PendRr, PP_back, PP_back_recId, PP_back_payTimeStmp, PP_back_doCapCorrelId, PP_back_doCapParTrnId, PP_back_doCapRrsCode};
            ppRes1 = ppRes;
        }
        return ppRes1;
    }

    public static String[] DoAuthorizationCode(String API_username, String API_password, String API_Signature, String method1, String ppAmt, String version1, String Environ1, String authId, String currCode1) {
        String validDetails = "";

        String[] ppResDoPay = new String[8];

        try {

            URL url;
            HttpURLConnection urlConn;
            DataOutputStream printout;
            BufferedReader input;

            String paypalUrl = myInstance.getPayPalProperty();
            
            url = new URL(paypalUrl); //live
            //url = new URL("https://api-3t.paypal.com/nvp"); //live
           //url = new URL("https://api-3t.sandbox.paypal.com/nvp"); //sandbox

            urlConn = (HttpURLConnection) url.openConnection();
            urlConn.setDoInput(true);
            urlConn.setDoOutput(true);
            urlConn.setUseCaches(false);
            urlConn.setRequestMethod("POST");
            urlConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            System.out.print("Inside Do Authorization Code Method");
            System.out.print("transactionId Inside Do Authorization Code Method"+authId);


            // data-value pairs are separated by &
            String content =
                    "USER=" + URLEncoder.encode(API_username, "UTF-8") +
                    "&" +
                    "PWD=" + URLEncoder.encode(API_password, "UTF-8") +
                    "&" +
                    "SIGNATURE=" + URLEncoder.encode(API_Signature, "UTF-8") +
                    "&" +
                    "VERSION=" + URLEncoder.encode("51.0", "UTF-8") +
                    "&" +
                    "METHOD=" + URLEncoder.encode("DoAuthorization", "UTF-8") +
                    "&" +
                    "AMT=" + URLEncoder.encode(ppAmt, "UTF-8") +
                    "&" +
                    "ENVIRON=" + URLEncoder.encode(Environ1, "UTF-8") +
                    /*"&" +
                    "PAYMENTACTION=" + URLEncoder.encode(payAction,"UTF-8") +*/
                    "&" +
                    "TRANSACTIONID=" + URLEncoder.encode(authId, "UTF-8") +
                    "&" +
                    "CURRENCYCODE=" + URLEncoder.encode(currCode1, "UTF-8");
            /*  "&" +
            "INVNUM=" + URLEncoder.encode(invoiceId,"UTF-8");
            "&" +
            "IPADDRESS=" + URLEncoder.encode(ipAdd,"UTF-8")+
            "&" +
            "FIRSTNAME=" + URLEncoder.encode(fName,"UTF-8") +
            "&" +
            "CVV2=" + URLEncoder.encode(cvvNo,"UTF-8")+
            "&" +
            "INVNUM=" + URLEncoder.encode(Id,"UTF-8") +
            "&" +
            "EMAIL=" + URLEncoder.encode(emailId,"UTF-8");
            "&" +
            "STATE=" + URLEncoder.encode(state,"UTF-8") +
            "&" +
            "ZIP=" + URLEncoder.encode(zip,"UTF-8") +
            "&" +
            "COUNTRYCODE=" + URLEncoder.encode(ccode,"UTF-8");*/


            urlConn.setRequestProperty("Content-Length", content.length() + "");


            printout = new DataOutputStream(urlConn.getOutputStream());
            printout.writeBytes(content);

            printout.flush();
            printout.close();

            input = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));

            String paypal_back = input.readLine();

            input.close();

            String PP_back[] = FeedbackCalc2(paypal_back);

            validDetails = (String) PP_back[0];
            String transacId = (String) PP_back[1];
            String payAmt = (String) PP_back[2];


            String[] ppResDoPay1 = {validDetails, transacId, payAmt};
            ppResDoPay = ppResDoPay1;

        // log.info("validDetails in doAuthorization:" + validDetails); 
        // log.info("transacId in doAuthorization:" + transacId); 
        // log.info("payAmt in doAuthorization:" + payAmt);



        } catch (Exception e) {
            e.printStackTrace();
        }
        return ppResDoPay;
    }

    public static String[] FeedbackCalc2(String data_in) {

        String statusID = "";
        String PP_back = "";


        String PP_back_TransacId = null;
        String PP_back_Amt = "";


        String[] ppRes1 = new String[7];

        String paypal_back = data_in.replaceAll("=&", "=null&");

        StringTokenizer st = new StringTokenizer(paypal_back, "&");

        int numberofvalues = st.countTokens();
        String[] resultnames = new String[numberofvalues];
        String[] resultvalues = new String[numberofvalues];

        String paypal_values = "";

        int i = 0;
        while (st.hasMoreTokens()) {

            paypal_values = st.nextToken();

            String[] splitstring = paypal_values.split("=");
            resultnames[i] = splitstring[0];
            resultvalues[i] = splitstring[1];

            i++;
        }

        for (int x = 0; x < resultnames.length; x++) {
            if (resultnames[x].equals("ACK")) {
                statusID = resultvalues[x];

                log.info("statusID in doAuthorization method:" + statusID); 
                if (statusID.equals("Failure")) {

                    for (int y = 0; y < resultnames.length; y++) {
                        if (resultnames[y].equals("L_LONGMESSAGE0")) {
                            try {
                                PP_back = "FAIL:" + URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_SHORTMESSAGE0")) {
                            try {
                                PP_back = "FAIL 1:" + URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        } else if (resultnames[y].equals("L_SEVERITYCODE0")) {
                            try {
                                PP_back = "FAIL 2:" + URLDecoder.decode(resultvalues[y], "UTF-8");
                            } catch (IOException ioe) {
                                System.err.println("IOException; " + ioe.getMessage());
                            }

                        }

                    }
                }
                if (statusID.equals("Success")) {
                    log.info("Inside::::::" + statusID); 
                    for (int y = 0; y < resultnames.length; y++) {
                        if (resultnames[y].equals("REFUNDTRANSACTIONID")) {
                            PP_back = "SUCCESS:" + resultvalues[y];
                        } else if (resultnames[y].equals("TRANSACTIONID")) {
                            PP_back_TransacId = resultvalues[y];
                        } else if (resultnames[y].equals("AMT")) {
                            PP_back_Amt = resultvalues[y];
                        }

                    }

                }


            }
            String[] ppRes = {statusID, PP_back_TransacId, PP_back_Amt};
            ppRes1 = ppRes;
        }
        return ppRes1;
    }
}
