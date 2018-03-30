/*
 * EventEntryPaymentConfirmAction.java
 *
 * Created on November 23, 2007, 2:48 PM
 */

package com.oee.action;

import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCCalendarVO;
import com.hlcutil.HLCCompRegistrationVO;
import com.hlcutil.Debug;
import com.hlcutil.HLCPaymentDetailVO;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;
/**
 *
 * @author Ellamaran
 * @version
 */


	public class EventEntryPaymentConfirmAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {

        try{
            HttpSession session=request.getSession();
            HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
			HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			
            String userId = (String)session.getAttribute("userId");
            String totalAmount =(String)session.getAttribute("totalAmount");
            String paymentId = (String)session.getAttribute("paymentId");
            
            HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
            objPayDet = (HLCPaymentDetailVO)session.getAttribute("payVOList");
            ArrayList sessionVal = (ArrayList)session.getAttribute("sessionVal");
            HLCCalendarVO calVO = (HLCCalendarVO)session.getAttribute("calVO");
            
            if(userId!=null){
                String sslResult = request.getParameter("ssl_result");
                String sslResultMessage =  request.getParameter("ssl_result_message");
                String sslTxnId =  request.getParameter("ssl_txn_id");
                String sslApprovalCode = request.getParameter("ssl_approval_code");
                String sslCvv2Response = request.getParameter("ssl_cvv2_response");
                String sslAvsResponse = request.getParameter("ssl_avs_response");
                String sslTransactionType =  request.getParameter("ssl_transaction_type");
                String sslInvoiceNo = request.getParameter("ssl_invoice_number");
                String sslEmail = request.getParameter("ssl_email");
                
                objPayDet.setSslResult(sslResult);
                objPayDet.setSslResultMessage(sslResultMessage);
                objPayDet.setSslTxnId(sslTxnId);
                objPayDet.setSslApprovalCode(sslApprovalCode);
                objPayDet.setSslCvv2Response(sslCvv2Response);
                objPayDet.setSslAvsResponse(sslAvsResponse);
                objPayDet.setSslTransactionType(sslTransactionType);
                objPayDet.setSslInvoiceNo(sslInvoiceNo);
                objPayDet.setSslEmail(sslEmail);
                
                String oePaymentId = "";
                boolean flag = false;
                
                if(objPayDet!=null){
                    oePaymentId  = membQualBean.createPayment(objPayDet);
                    if(oePaymentId!=null && oePaymentId.trim().length()!=0){
                        if(sessionVal!=null && sessionVal.size()!=0){
                            Iterator its = sessionVal.iterator();
                            while(its.hasNext()){
                                HLCCompRegistrationVO compVO = (HLCCompRegistrationVO)its.next();
                                boolean result = membQualBean.insertEventRegistrationDetails(compVO, oePaymentId);
                                if(result) flag = true;
                                else flag = false;
                            }
                        }
                    }
                }
                if(flag) request.setAttribute("payResult","success");
                else request.setAttribute("payResult","failure");
            }
            return new ModelAndView("paymentSuccess");
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}