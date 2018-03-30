/*
 * UploadResultsAction.java
 *
 * Created on November 22, 2007, 6:45 PM
 */

package com.oee.action;

import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCCalendarVO;
import com.hlcutil.HLCCompRegistrationVO;
import com.hlcutil.Debug;
import com.hlcutil.HLCMemberVO;
import java.io.*;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import com.oee.actionform.UploadResultsActionForm;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.upload.FormFile;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;
/**
 *
 * @author Ellamaran
 * @version
 */


	public class UploadResultsAction implements Controller {
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        try{
            HttpSession session = request.getSession();
            HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
            HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
            UploadResultsActionForm  uploadForm = new UploadResultsActionForm();
            FormFile fileUpload = uploadForm.getFileUpload();
            String cmd = request.getParameter("cmd");
            String eventId = (String)session.getAttribute("eventId");
            HLCCalendarVO calVO = (HLCCalendarVO)session.getAttribute("calVO");
            String userId = (String)session.getAttribute("userId");
            String horseMemberId = request.getParameter("horseMemberId");

            if(cmd!=null && cmd.equalsIgnoreCase("upload")) {
                
                String imagePath="horseComp_uploadPath";
                String fullFilePath = "";
                String fileName = fileUpload.getFileName();
                String[] tmpFileName = fileName.split("\\.");
                String finalFileName = "";
                
                for(int i=0;i<tmpFileName.length-1;i++) {
                    if(finalFileName.trim().length() != 0) {
                        finalFileName = finalFileName+"."+tmpFileName[i];
                    } else {
                        finalFileName = tmpFileName[i];
                    }
                }
                
                java.util.Date curDat = new java.util.Date();
                fileName = finalFileName+" "+curDat.getTime()+"."+tmpFileName[tmpFileName.length-1];
                BufferedOutputStream outFile = null;
                String imageFilePath = imagePath+File.separator+fileName;
                
                try {
                    File fDir = new File(imagePath);
                    if (!fDir.exists()) {
                        if (!fDir.mkdir()) {
                            throw new IOException("Cannot create tmpdir for dimension file");
                        }
                    }
                    File newFile = new File(imageFilePath);
                    fullFilePath = newFile.getAbsolutePath();
                    outFile = new BufferedOutputStream(new FileOutputStream(newFile));
                    outFile.write(fileUpload.getFileData());
                    
                } catch (IOException ie) {
                    Debug.print("Error while writing into the file");
                } finally {
                    if(outFile!=null){
                        outFile.flush();
                        outFile.close();
                    }
                }
                request.setAttribute("fileName",fullFilePath);
                String riderId = request.getParameter("riderId");
                String evLevel = request.getParameter("evLevel");
                String redir = request.getParameter("redir");
                String chStat = request.getParameter("chStat");
                
                String evLevelId = evLevel.substring(0,evLevel.indexOf("|"));
                String evTypeId = evLevel.substring((1+evLevel.indexOf("|")),evLevel.length());
                String evLevelName = membQualBean.getEventLevelName(evLevelId);
                String evTypeName = membQualBean.getEventTypeName(evTypeId);
                String divId = (String)session.getAttribute("divisionId");
                String divName = divId.substring((1+divId.indexOf("|")),divId.length());
                
                ArrayList fixedAmtDetails = new ArrayList();
                ArrayList userInfo = new ArrayList();
                ArrayList orgPriceDetails = new ArrayList();
                HLCCompRegistrationVO compVO = new HLCCompRegistrationVO();
                ArrayList selectEventDetails = new ArrayList();
                
                fixedAmtDetails = membQualBean.getFixedAmount(evTypeId, evLevelId, chStat);
                orgPriceDetails = membQualBean.getorganizerPriceDetails(eventId, chStat, evLevelId, evTypeId);
                
                ArrayList horseDetails = membQualBean.getHorseDetailsByHorseId(horseMemberId);
                HLCMemberVO memVO = membQualBean.getMemberDetails(riderId);
                ArrayList sessionVal = (ArrayList)session.getAttribute("sessionVal");                
                if(userId!=null && userId.trim().length()!=0) userInfo = membQualBean.getAllHorseDetailsByOwnerId(userId);
                
                String memberId=(String)session.getAttribute("memberId");

                if(memberId!=null && memberId.trim().length()!=0){
                    memVO = membQualBean.getMemberDetails(memberId);
                    request.setAttribute("memDetails",memVO);
                    request.setAttribute("isMember","yes");
                }else request.setAttribute("isMember","no");

                String horseFirstName = "";
                String horseLastName = "";
                String horseOwnerId = "";
                String horseOwnerFirstName = "";
                String horseOwnerLastName = "";
                String horseRiderId = "";
                String horseRiderFirstName = "";
                String horseRiderLastName = "";
                String selEventId = "";
                String organizerId = "";
                int compYear = 0;
                String eventTypeId = "";
                String eventLevel = "";
                int dueDatePriceValue = 0;
                int afterDueDatePriceValue = 0;
                int depositPriceValue = 0;
                int totalChargeablePrice = 0;
                Date beginDate = null;
                Date endDate = null;
                Date extDate = null;
                totalChargeablePrice = Integer.parseInt((String)session.getAttribute("totalChargeablePrice").toString());
                
                if(fixedAmtDetails!=null && fixedAmtDetails.size()!=0){
                    Iterator it = fixedAmtDetails.iterator();
                    int[] prDet = (int[])it.next();
                    dueDatePriceValue = dueDatePriceValue+prDet[0];
                    afterDueDatePriceValue = afterDueDatePriceValue+prDet[1];
                    depositPriceValue = depositPriceValue+prDet[2];
                }
                
                if(orgPriceDetails!=null && orgPriceDetails.size()!=0){
                    Iterator itt = orgPriceDetails.iterator();
                    int[] prDet = (int[])itt.next();
                    dueDatePriceValue = dueDatePriceValue+prDet[0];
                    afterDueDatePriceValue = afterDueDatePriceValue+prDet[1];
                    depositPriceValue = depositPriceValue+prDet[2];
                }
                
                if(calVO!=null){
                    selEventId = calVO.getEventId();
                    organizerId = calVO.getOrganizerId();
                    compYear = calVO.getCompYear();
                    eventTypeId = calVO.getEventTypeId();
                    eventLevel = calVO.getEventLevel();
                    beginDate = calVO.getEntryStrtDate();
                    endDate = calVO.getEntryEndDate();
                    extDate = calVO.getExtDueDate();
                }
                
                Date currentDate = new Date();
                long currentTime = 0;
                long beginTime = 0;
                long endTime = 0;
                if(currentDate!=null) currentTime = currentDate.getTime();
                if(beginDate!=null) beginTime = beginDate.getTime();
                if(endDate!=null) endTime = endDate.getTime();
                
                long timeDiff = 0;
                timeDiff = endTime - currentTime;

                if(timeDiff<0){
                    totalChargeablePrice = totalChargeablePrice + afterDueDatePriceValue;
                }else if(endDate.getTime()-currentDate.getTime()>0){
                    totalChargeablePrice = totalChargeablePrice + dueDatePriceValue;
                }
                
                Debug.print("Total Chargeable Price: "+totalChargeablePrice);
                
                if(horseDetails!=null && horseDetails.size()!=0){
                    Iterator itr = horseDetails.iterator();
                    while(itr.hasNext()){
                        String [] horseDet = (String[])itr.next();
                        horseFirstName = horseDet[0];
                        horseLastName = horseDet[1];
                        horseRiderId = horseDet[2];
                        horseOwnerId = horseDet[3];
                        horseOwnerFirstName = horseDet[4];
                        horseOwnerLastName = horseDet[5];
                    }
                }
                if(calVO!=null){
                    selEventId = calVO.getEventId();
                    organizerId = calVO.getOrganizerId();
                    compYear = calVO.getCompYear();
                    eventTypeId = calVO.getEventTypeId();
                    eventLevel = calVO.getEventLevel();
                }
                if(memVO!=null){
                    horseRiderFirstName = memVO.getFirstName();
                    horseRiderLastName = memVO.getLastName();
                }
                if(eventId!=null && eventId.trim().length()!=0 ) selectEventDetails=krishnaBean.searchEventDetailsListAdmin(eventId,null,null,compYear);
                
                String horseFinalName = horseFirstName;
                if(horseLastName!=null && horseLastName.trim().length()!=0){
                    horseFinalName = horseFirstName+" "+horseLastName;
                }
                
                compVO.setEventId(selEventId);
                compVO.setOrganizerId(organizerId);
                compVO.setCompetitionYear(compYear);
                compVO.setEventType(evTypeName);
                compVO.setEventLevel(evLevelName);
                compVO.setHorseMemberId(horseMemberId);
                compVO.setHorseName(horseFinalName);
                compVO.setRiderMemberId(riderId);
                compVO.setRiderFirstName(horseRiderFirstName);
                compVO.setRiderLastName(horseRiderLastName);
                compVO.setOwnerFirstName(horseOwnerFirstName);
                compVO.setOwnerLastName(horseOwnerLastName);
                compVO.setRiderUserId(userId);
                compVO.setQualFilePath(fullFilePath);
                compVO.setEventDivision(divName);
                
                ArrayList selectedHorseMemberIds = (ArrayList)session.getAttribute("selectedHorseMemberIds");
                selectedHorseMemberIds.add(horseMemberId);
                session.setAttribute("selectedHorseMemberIds",selectedHorseMemberIds);
                
                sessionVal.add(compVO);
                session.setAttribute("sessionVal",sessionVal);
                session.setAttribute("totalChargeablePrice",Integer.valueOf(totalChargeablePrice));
                request.setAttribute("selectEventDetails",selectEventDetails);
                request.setAttribute("userInfo",userInfo);
                
                if(redir!=null && redir.equalsIgnoreCase("Upload & Select Another Horse")) return new ModelAndView("selAnotherHorse");
                else if(redir!=null && redir.equalsIgnoreCase("Upload & Proceed To Payment")) return new ModelAndView("toFinalPayment");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
