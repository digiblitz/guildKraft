/*
 * EventOrgRegEdit.java
 *
 * Created on December 19, 2006, 2:40 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;


import com.hlcmro.display.HLCVaigaiStatelessBean;
import com.hlcmro.org.HLCVaigaiSessionBean;
import com.hlcmro.util.*;
import com.hlcspnr.util.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.naming.*;
import javax.rmi.PortableRemoteObject;
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
 * @author karthikeyan
 */

	public class EventOrgRegEditAction implements Controller {
    
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
            String fwd="";
            
        try
        {
           
            
            HttpSession session=request.getSession();
            
            String process=request.getParameter("process");
            Debug.print("process :"+process);
            
            if(process.equalsIgnoreCase("disp"))
            {
            	HLCVaigaiStatelessBean vaigaimroBean=new HLCVaigaiStatelessBean();
            	
            	HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();	
                    
                    Vector allTypesVect = new Vector();
                    Vector getAllMapRuleSubRule= new Vector();
                    
                    Vector distanceSpeedVect = new Vector();
                    Vector dressageHorseTrialsVect = new Vector();
                    ArrayList arenaSizeVect = new ArrayList();
                    ArrayList jdDet=new ArrayList();
                    
                   
                    allTypesVect = vaigaimroBean.getAllMapTyLe();
                    getAllMapRuleSubRule=vaigaimroBean.getAllMapRuleSubRule();
                    jdDet=vaigaimroBean.selectJudgesDetails();
                    System.out.println("jdDet size in servlet :"+jdDet.size());
                    
                    dressageHorseTrialsVect = vaigaimroBean.selectDressageHorseTrials();
                    arenaSizeVect = vaigaimroBean.getAreaPriceMaster();//selectArenaSize();
                    
                    request.setAttribute("allTypesVect", allTypesVect);
                    request.setAttribute("distanceSpeedVect",distanceSpeedVect);
                    request.setAttribute("getAllMapRuleSubRule",getAllMapRuleSubRule);
                    request.setAttribute("dressageHorseTrialsVect",dressageHorseTrialsVect);
                    request.setAttribute("arenaSizeVect",arenaSizeVect);
                    request.setAttribute("jdDet",jdDet);
                   
                    String eventId=request.getParameter("eventId");
                    Debug.print("eventId :"+eventId);
                    ArrayList eventDetails=new ArrayList();
                   // HLCEventDetailsVO objEventDet=new HLCEventDetailsVO();
                   
                    eventDetails=vaigaiBean.getDetailedEvents(eventId);
                    request.setAttribute("eventDetails",eventDetails);
                    
                    fwd="dispEditEventDetails";
            }
            
            if(process.equalsIgnoreCase("view"))
            {
            	HLCVaigaiStatelessBean vaigaiStatelessBean=new HLCVaigaiStatelessBean();

            	HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();	     
                    String eventId=request.getParameter("eventId");
                    Debug.print("eventId :"+eventId);
                    
                    //Vector allTypesVect = new Vector();
                    Vector getAllMapRuleSubRule= new Vector();
                    
                    Vector distanceSpeedVect = new Vector();
                    Vector dressageHorseTrialsVect = new Vector();
                    ArrayList arenaSizeVect = new ArrayList();
                    ArrayList jdDet=new ArrayList();
                    
                    
                    //allTypesVect = remote1.getAllMapTyLe();
                    getAllMapRuleSubRule=vaigaiStatelessBean.getAllMapRuleSubRule();
                    jdDet=vaigaiStatelessBean.selectOfficialDetails(eventId);
                    System.out.println("jdDet size in servlet :"+jdDet.size());
                    
                    dressageHorseTrialsVect = vaigaiStatelessBean.selectDressageHorseTrials();
                    arenaSizeVect = vaigaiStatelessBean.getAreaPriceMaster();//selectArenaSize();
                    
                    //request.setAttribute("allTypesVect", allTypesVect);
                    request.setAttribute("distanceSpeedVect",distanceSpeedVect);
                    request.setAttribute("getAllMapRuleSubRule",getAllMapRuleSubRule);
                    request.setAttribute("dressageHorseTrialsVect",dressageHorseTrialsVect);
                    request.setAttribute("arenaSizeVect",arenaSizeVect);
                    request.setAttribute("jdDet",jdDet);
                   
                    
                    ArrayList eventDetails=new ArrayList();
                   // HLCEventDetailsVO objEventDet=new HLCEventDetailsVO();
                   
                    eventDetails=vaigaiBean.getDetailedEvents(eventId);
                    request.setAttribute("eventDetails",eventDetails);
                    
                    //for event title, event type and event level.
                //String eventId = (String)request.getAttribute("eventId");//"10026";
                Debug.print("eventId :"+eventId);
                String type = request.getParameter("type");
                HLCEventRequestVO eventReqVO = new HLCEventRequestVO();
                ArrayList areaDetails = new ArrayList();
                if(eventId!= null && eventId.trim().length()!=0){
                    eventReqVO = vaigaiBean.getEventRequestDetails(eventId);
                    areaDetails = vaigaiBean.getZipcodeFromToOnStateId(eventReqVO.getCompetition_state(),eventReqVO.getCompetition_zip());
                }
                Debug.print("EventReqVO returned:"+eventReqVO.toString());
                ArrayList stateDetails = new ArrayList();
                Vector allTypesVect = new Vector();
                stateDetails = vaigaiBean.getAllStates();
                allTypesVect = vaigaiStatelessBean.getAllMapTyLe();
                Vector eventTypeDetails = new Vector();
                HashMap hm = new HashMap();
                HashMap eventTypeMap = new HashMap();
                ArrayList subLevel = new ArrayList();
                if(allTypesVect!=null ){
                    Enumeration e = allTypesVect.elements();
                    while(e.hasMoreElements()){
                        String[] typeDetails = (String[])e.nextElement();
                        String mapId = typeDetails[0];
                        String typeId = typeDetails[1];
                        String levelId = typeDetails[2];
                        String typeName = typeDetails[3];
                        String levelCode = typeDetails[4];
                        String levelName = typeDetails[5];
                        if(hm.containsKey(typeId)){
                            String[] subEntry = {mapId,levelId,levelCode,levelName};
                            subLevel.add(subEntry);
                            eventTypeMap.put(typeId,subLevel);
                        }else{
                            subLevel = new ArrayList();
                            String[] subEntry = {mapId,levelId,levelCode,levelName};
                            subLevel.add(subEntry);
                        }
                        hm.put(typeId,typeName);
                    }
                    Set set = hm.keySet();
                    Iterator itr = set.iterator();
                    while(itr.hasNext()){
                        String keyId = (String)itr.next();
                        String valueName = (String)hm.get(keyId);
                        String[] eventTypeDet = {keyId,valueName};
                        eventTypeDetails.add(eventTypeDet);
                    }
                }
                Iterator arItr = areaDetails.iterator();
                if(arItr.hasNext()){
                    String[] areaDet = (String[])arItr.next();
                    System.out.println("Area  details"+areaDet);
                    request.setAttribute("AREA_DETAILS",areaDet);
                }
                request.setAttribute("EVENT_REQUEST_VO",eventReqVO);
                request.setAttribute("stateDetails",stateDetails);
                request.setAttribute("eventTypeDetails",eventTypeDetails);
                request.setAttribute("eventTypeMap",eventTypeMap);
                //==============================================================
                    
                    fwd="viewEventDetails";
            }
            
             if(process.equalsIgnoreCase("update"))
            {
                System.out.println("Inside Organizer Reg form update Action..........");
                    String memberId=(String)session.getAttribute("memberId");  
                    HLCVaigaiStatelessBean vaigaiStatelessBean=new HLCVaigaiStatelessBean();

                	HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();	
                    String eventId = request.getParameter("eventId");
                                           
                    System.out.print("request.getParameter(eventId) :" + eventId);
                    
                    System.out.println("After ejb create ......");
                    
                        Vector accommodation = new Vector();
                        Vector crossCountry = new Vector();
                        Vector cogginsDetails = new Vector();
                        Vector divisionLevels = new Vector();
                        Vector judgesDetails = new Vector();
                        Vector hDressage = new Vector();
                        Vector refundRuleDetails = new Vector();
                        Vector tentativeTime= new Vector();
                    
                          HLCRenewalOrganizerDetails objRenewalDet = new HLCRenewalOrganizerDetails();
                          HLCOtherDetailsVO othersDet = new HLCOtherDetailsVO();
                          HLCPaymentDetails objPayDet = new HLCPaymentDetails();
                          HLCEventDetailsVO objEventDet = new HLCEventDetailsVO();
                        
                        
                        //********** Part A of the form starts here **********
                    
                     objEventDet.setEventId(eventId); 
                          
                    String eventsecid=request.getParameter("eventsecid");
                    System.out.println("eventsecid :" +eventsecid);
                    
                    String eventtitle=request.getParameter("eventtitle");
                    System.out.println("eventtitle :" +eventtitle);
                    
                    /*
                     * Adding Divisions Checked Values
                     */
                    
                    String divcbxct=request.getParameter("divcbxct");
                    System.out.println("divcbxct :"+divcbxct);
                
                     int dcbxct=Integer.parseInt(divcbxct);
                     int x=0;
                     String[] nam=new String[500];
                   
                     Enumeration en=request.getParameterNames();
                     while(en.hasMoreElements())
                     {
                         String na=(String)en.nextElement();
                         nam[x]=na;
                         System.out.println("Param names :"+nam[x]);
                         x++;
                     }

                     for(int i=0;i<=dcbxct;i++)
                     {
                          String chbx="divlevel"+Integer.toString(i);
                          System.out.println("divisions made : "+chbx);
                      for(int y=0;y<nam.length;y++)
                      {

                         if(chbx.equals(nam[y])){
                            String chkd=null;
                            chkd =request.getParameter(chbx);
                            System.out.println("checked val: "+chkd);
                            
                           if(chkd!=null && chkd.trim().length()!=0)
                           {
                                ArrayList divLevelAr=new ArrayList();
                                
                                divLevelAr.add(chkd);
                                
                                divisionLevels.add(divLevelAr);
                           //divisionLevels.add(chkd);
                           System.out.println("after adding division detail :"+chkd);
                           }
                             
                         }
                      }
                     }
                  
                    /*
                     * Adding Judges Checked Id & TextBox Name Values
                     */
                    
                    String offcnt=request.getParameter("offct");
                    System.out.println("offct :"+offcnt);
                
                     int offct=Integer.parseInt(offcnt);
                     int y=0;
                    
                     for(int c=0;c<=offct;c++)
                     {
                          String ofchbx="official"+Integer.toString(c);
                          System.out.println("official cbx made : "+ofchbx);
                          
                          String oftbx="officialtxt"+Integer.toString(c);
                          System.out.println("official tbx made : "+oftbx);
                          
                      for(int z=0;z<nam.length;z++)
                      {

                         if(ofchbx.equals(nam[z])){
                             
                             String offchkd=null;
                             String offtbx=null;
                             
                            offchkd =request.getParameter(ofchbx);
                            System.out.println("off checked val: "+offchkd);
                           
                            offtbx =request.getParameter(oftbx);
                            System.out.println("off txt val: "+offtbx);
                            
                            if(offchkd!=null&&offchkd.trim().length()!=0&&offtbx!=null&&offtbx.trim().length()!=0)
                            {
                            //String[] jud = {offchkd,offtbx};
                            ArrayList judAr=new ArrayList();
                            judAr.add(offchkd);
                            judAr.add(offtbx);
                            
                            judgesDetails.add(judAr);
                            
                            //judgesDetails.add(jud);
                            
                            System.out.println("after adding judge detail judAr.size() :" +judAr.size());
                            }
                         }
                      }
                     }
                    
                  
                   // *********** Part B of the form starts here **********
                    
                    String fees=request.getParameter("fees");
                    String others=request.getParameter("others");
                    String memblevel=request.getParameter("memblevel");
                    String comppay=request.getParameter("comppay");
                    
                    String dblE=request.getParameter("dblE");
                    String dblEntry="0";
                    
                    if(fees==null && fees.trim().length()==0)
                        fees="0";
                    dblEntry=request.getParameter("dblEntry");
                      if(dblEntry==null && dblEntry.trim().length()!=0)
                        dblEntry="0";
                    String drawCheck=request.getParameter("drawCheck");
                    String r1=request.getParameter("r1");
                    String lpOne=request.getParameter("lpOne");
                    String lpTwo=request.getParameter("lpTwo");
                    String lpOther=request.getParameter("lpOther");
                    String r5=request.getParameter("r5");
                    
                    System.out.println(fees);
                    System.out.println(others);
                    System.out.println(memblevel);
                    System.out.println(comppay);
                    System.out.println(dblE);
                    System.out.println(dblEntry);
                    System.out.println(drawCheck);
                    System.out.println(r1);
                   /* System.out.println(lpOne);
                    System.out.println(lpTwo);
                    System.out.println(lpOther);
                    System.out.println(r5);*/
                        
                        /*
                         * EventSecretary Details
                         */
                          System.out.println("memberId inside insert block :" +memberId );
                          
                        objEventDet.setOrganizeId(memberId);
                        objEventDet.setEventSecretaryId(eventsecid);
                        objEventDet.setEventTitle(eventtitle);
                        
                        objEventDet.setEntryFee(fees);
                        objEventDet.setOtherEntryFee(others);
                        
                        /*
                         * Double Entries 
                         */
                       
                        if(dblE!=null)
                        {
                            if(dblE.equalsIgnoreCase("yes"))
                            {
                                
                                objEventDet.setDoubleEntryFee(dblE);
                                objEventDet.setOfficeFee(dblEntry);
                                System.out.println("dblEntry selected and added :" +dblEntry);
                            }
                            else
                            {
                                objEventDet.setDoubleEntryFee(dblE);
                                objEventDet.setOfficeFee("0");
                                System.out.println("dblEntry selected and added : 0");
                                
                            }
                        }
                        
                        objEventDet.setMembershipApplicable(memblevel+"#"+comppay);
                        objEventDet.setCheckPayableTo(drawCheck);
                        
                        /*
                         * Lost Pinny
                         */
                        
                        if(r1!=null)
                        {
                            objEventDet.setPinniesPosition(r1);
                            
                            if(r1.equals("0"))
                                objEventDet.setPinniesCharge(lpOne);    
                            if(r1.equals("1"))
                                objEventDet.setPinniesCharge(lpTwo); 
                            if(r1.equals("2"))
                                objEventDet.setPinniesCharge(lpOther);
                        }
                        
                    /*
                     * To get the refund details from cbx & txt
                     */
                        
                      String rulecbxct=request.getParameter("rulecbxct");
                   
                      int rcbxct=Integer.parseInt(rulecbxct);
                      for(int j=0;j<rcbxct;j++)
                     {
                            
                          String rcb="refund"+Integer.toString(j);
                          System.out.println("refund cbx made : "+rcb);
                          
                          String rtb="refundtxt"+Integer.toString(j);
                          System.out.println("refund txt box made : "+rtb);
                          
                          for(int a=0;a<nam.length;a++)
                          {
                              String rulertb=null;
                              String rulercb=null;
                              
                              if(rcb.equals(nam[a]))
                             {
                             rulercb=request.getParameter(rcb);
                             System.out.println("refunds cbx val: "+rulercb);
                              
                             for(int t=0;t<nam.length;t++)
                             {
                             if(rtb.equals(nam[t]))
                             {
                                    rulertb=request.getParameter(rtb);
                                    System.out.println("refunds txt val: "+rulertb);
                                    
                             }
                             else
                             {
                                rulertb=" ";
                                System.out.println("refunds txt val inside else : "+rulertb);
                             }
                           }
                         
                                  //String[] reffinal={rulercb,rulertb};
                                  ArrayList refAr=new ArrayList(); 
                                  refAr.add(rulercb);
                                  refAr.add(rulertb);
                                  
                                  //refundRuleDetails.add(reffinal);
                                  refundRuleDetails.add(refAr);
                                  
                                  System.out.println("refunds after adding refAr.size():" +refAr.size());
                        }
                                  
                      }
                     }
                        
                      /*
                       * Negative Coggins Test 
                       */
                        
                      if(r5!=null)
                      {
                        
                          if(r5.equalsIgnoreCase("nctRef"))
                          {
                             String nctReq1=request.getParameter("nctReq1");
                             
                             cogginsDetails.add(eventId);
                             cogginsDetails.add(nctReq1);
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             System.out.println(" Coggins : Required for all horses added" +nctReq1);
                          }
                          
                           if(r5.equalsIgnoreCase("nctRef1"))
                          {
                             String nctInState=request.getParameter("nctInState");
                             String nctOutState=request.getParameter("nctOutState");
                             
                             cogginsDetails.add(eventId);
                             cogginsDetails.add(" ");
                             cogginsDetails.add(nctInState);
                             cogginsDetails.add(nctOutState);
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             System.out.println(" Coggins : Required Within " +nctInState+"#"+nctOutState);
                          }
                          
                          if(r5.equalsIgnoreCase("Not Required"))
                          {
                              
                             cogginsDetails.add(eventId);
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             cogginsDetails.add("Not Required");
                             cogginsDetails.add(" ");
                             System.out.println(" Coggins : Not Required" +r5);
                          }
                          
                           if(r5.equalsIgnoreCase("Others"))
                          {
                             
                             cogginsDetails.add(eventId); 
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             cogginsDetails.add(" ");
                             cogginsDetails.add("Others");
                             System.out.println(" Coggins : Others" +r5);
                          }
                          
                      }
                      
                  //********** Part C of the form starts here **********
                      
                      /*
                       * Tentative Schedule 1
                       */
                      
                        String DateImported1=request.getParameter("DateImported1");
                        String PhaseImported1=request.getParameter("PhaseImported1");
                        String TimeImported1=request.getParameter("TimeImported1");
                        String MinuteImported1=request.getParameter("MinuteImported1");
                        String FormatImported1=request.getParameter("FormatImported1");
                        
                        String finaltime1=TimeImported1+":"+MinuteImported1+" "+FormatImported1;
                        
                       // String [] tt1 = {DateImported1,PhaseImported1,finaltime1};
                        
                         SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
                         java.util.Date tent_date1 =null;
                         tent_date1=(java.util.Date)sdf.parse(DateImported1);
                                                 
                        ArrayList tentativeTime1= new ArrayList();
                        tentativeTime1.add(tent_date1);
                        tentativeTime1.add(PhaseImported1);
                        tentativeTime1.add(finaltime1);
                        
                        tentativeTime.add(tentativeTime1);
                        
                        System.out.println("Tentative Schedule 1 added.... date :"+tent_date1+"phase :"+PhaseImported1+"final time :"+finaltime1);
                        
                        /*
                         * Tentative Schedule 2
                         */
                        
                        String PhaseImported2=request.getParameter("PhaseImported2");
                        if(PhaseImported2!=null&&PhaseImported2.trim().length()!=0)
                        {
                            String DateImported2=request.getParameter("DateImported2");
                            String TimeImported2=request.getParameter("TimeImported2");
                            String MinuteImported2=request.getParameter("MinuteImported2");
                            String FormatImported2=request.getParameter("FormatImported2");

                            String finaltime2=TimeImported2+":"+MinuteImported2+" "+FormatImported2;
                        
                          //  String [] tt2 = {DateImported2,PhaseImported2,finaltime2};
                            
                          //  tentativeTime.add(tt2);
                            
                         java.util.Date tent_date2 =null;
                         tent_date2=(java.util.Date)sdf.parse(DateImported2);
                                                  
                        ArrayList tentativeTime2= new ArrayList();
                        tentativeTime2.add(tent_date2);
                        tentativeTime2.add(PhaseImported2);
                        tentativeTime2.add(finaltime2);
                        
                        tentativeTime.add(tentativeTime2);      
                        System.out.println("Tentative Schedule 2 added.... date :"+tent_date2+"phase :"+PhaseImported2+"final time :"+finaltime2);
                        

                        }
                       
                        /*
                         * Tentative Schedule 3
                         */
                        
                        String PhaseImported3=request.getParameter("PhaseImported3");
                        if(PhaseImported3!=null&&PhaseImported3.trim().length()!=0)
                        {
                            String DateImported3=request.getParameter("DateImported3");
                            String TimeImported3=request.getParameter("TimeImported3");
                            String MinuteImported3=request.getParameter("MinuteImported3");
                            String FormatImported3=request.getParameter("FormatImported3");

                            String finaltime3=TimeImported3+":"+MinuteImported3+" "+FormatImported3;
                        
                        //    String [] tt3 = {DateImported3,PhaseImported3,finaltime3};
                            
                        //    tentativeTime.add(tt3);
                            
                              java.util.Date tent_date3 =null;
                              tent_date3=(java.util.Date)sdf.parse(DateImported3);
                             
                              ArrayList tentativeTime3= new ArrayList();
                              tentativeTime3.add(tent_date3);
                              tentativeTime3.add(PhaseImported3);
                              tentativeTime3.add(finaltime3);

                              tentativeTime.add(tentativeTime3); 
                               
                            System.out.println("Tentative Schedule 3 added.... date :"+tent_date3+"phase :"+PhaseImported3+"final time :"+finaltime3);
                        
                        }
                       Debug.print("tentativeTime.size() :"+tentativeTime.size());
                       
                       /*
                        * Awards Radio and txt  : 
                        */
                        
                        
                        String r6=request.getParameter("r6");
                        if(r6!=null)
                        {
                             if(r6.equalsIgnoreCase("awardOne"))
                            {
                                  String ribbons=request.getParameter("ribbons");
                                     
                                  objEventDet.setAwardTrophy(ribbons);
                                  System.out.println("Awards : tropy & ribbon :" +ribbons);
                             }
                             
                             if(r6.equalsIgnoreCase("awardTwo"))
                            {
                                 String award2=request.getParameter("award2");
                                 objEventDet.setAwardPrize(award2);
                                 System.out.println("Awards : Prize money :" +award2);
                            
                             }
                             
                              if(r6.equalsIgnoreCase("awardThree"))
                             {
                                 String awrdOth=request.getParameter("awrdOth");
                                 objEventDet.setAwardOthers(awrdOth);
                                 System.out.println("Awards : Other :" +awrdOth);
                            
                             }
                        }
                        
                        /*
                        * Date Available  : 
                        */
                        
                       String dateAvailable=request.getParameter("dateAvailable");
                       System.out.println("dateAvailable :"+dateAvailable);
                       objEventDet.setDateAvailable(dateAvailable);
                       
                       /*
                        * Available from  : 
                        */
                       
                       String r7=request.getParameter("r7");
                        objEventDet.setAvailablePosition("0");
                       if(r7!=null)
                       {
                            if(r7.equalsIgnoreCase("The secretary"))
                            {
                                  objEventDet.setAvailableFrom("The secretary");
                                  System.out.println("Available from  : The secretary ");
                                  objEventDet.setAvailablePosition("0");
                            }
                            if(r7.equalsIgnoreCase("Postcards will be sent"))
                            {
                                  objEventDet.setAvailableFrom("Postcards will be sent");
                                  System.out.println("Available from  : Postcards will be sent ");
                                  objEventDet.setAvailablePosition("1");
                            }
                            if(r7.equalsIgnoreCase("dateThree"))
                            {
                                String dateDivOth=request.getParameter("dateDivOth");
                                //objEventDet.setAvailableFrom(dateDivOth);
                                System.out.println("Available from  : others "+dateDivOth);
                                objEventDet.setAvailableFromOther(dateDivOth);
                                objEventDet.setAvailablePosition("2");
                            }
                     }
                       
           //********** Part D of the form starts here **********
                       
                         /*
                          * Stabling / Veterinarian details : 
                          */
                       
                       /*
                        * Stabling Info: 
                        */
                       objEventDet.setStablingLimited("0");
                        String r8=request.getParameter("r8");
                        if(r8!=null)
                        {
                            if(r8.equalsIgnoreCase("stableOne"))
                            {
                                 objEventDet.setStablingLimited("1");
                                 System.out.println("Limited stabling : 1");
                                 
                            }
                            
                             if(r8.equalsIgnoreCase("stableTwo"))
                            {
                                objEventDet.setStablingLimited("1");
                                System.out.println("UnLimited stabling : 1");
                            }
                          
                             if(r8.equalsIgnoreCase("stableThree"))
                            {
                                objEventDet.setStablingLimited("0");
                                System.out.println("No stabling available : 0");
                            }
                            
                        }
                       
                        /*
                         * Stall Info :
                         */
                        objEventDet.setStallPernightPrice("0");
                         objEventDet.setPerStallPrice("0");
                        String r81=request.getParameter("r81");
                        
                        if(r8 != null)
                        {
                            if(!r8.equalsIgnoreCase("stableThree"))                            
                             {
                            
                               
                         if(r81!=null)
                        {
                                if(r81.equalsIgnoreCase("unlStbOne"))
                            {
                                    
                                String perStallOne1=request.getParameter("perStallOne1");
                        
                                if(perStallOne1==null && perStallOne1.trim().length()==0)
                                    perStallOne1="0";
                                objEventDet.setStallPernightPrice(perStallOne1);
                                System.out.println("Charges per stall per night :"+perStallOne1);
                          
                            }
                                 if(r81.equalsIgnoreCase("unlStbTwo"))
                            {
                                     String amount1=request.getParameter("amount1");
                                     
                                     String stablingtime1=request.getParameter("stablingtime1");
                                     String stablingminute1=request.getParameter("stablingminute1");
                                     String stablingformat1=request.getParameter("stablingformat1");
                                     String date1=request.getParameter("date1");
                        
                                     String finalsttime1=stablingtime1+":"+stablingminute1+" "+stablingformat1;
                        
                                     String stablingtime2=request.getParameter("stablingtime2");
                                     String stablingminute2=request.getParameter("stablingminute2");
                                     String stablingformat2=request.getParameter("stablingformat2");
                                     String todate=request.getParameter("todate");
                                      
                                     String finalsttime2=stablingtime2+":"+stablingminute2+" "+stablingformat2;
                                     if(amount1==null && amount1.trim().length()==0)
                                         amount1="0";
                                 objEventDet.setPerStallPrice(amount1);
                                 objEventDet.setPerStallFromTime(finalsttime1);
                                 objEventDet.setPerStallFromDate(date1);
                                 objEventDet.setPerStallToTime(finalsttime2);
                                 objEventDet.setPerStallToDate(todate);

                                System.out.println("Per stall on a given time & date price :"+amount1);
                                System.out.println("Per stall on a given time & date PerStallFromTime :"+finalsttime1);
                                System.out.println("Per stall on a given time & date  PerStallFromDate :"+date1);
                                System.out.println("Per stall on a given time & date PerStallToTime :"+finalsttime2);
                                System.out.println("Per stall on a given time & date PerStallToDate :"+todate);
                                
                                 }
                         }
                               
                            }
                        }
                        
                        /*
                         * Type of stabling: 
                         */
                        
                        String r9=request.getParameter("r9");
                        System.out.println("Type of stabling selected :" +r9);
                        objEventDet.setNoOfTempPermanentStalls("0");
                        objEventDet.setMilesFromEvent("0");
                        objEventDet.setNoOfStalls("0");
                        objEventDet.setNoOfTempStalls("0");
                         if(r9!=null)
                        {
                                if(r9.equalsIgnoreCase("typStableOne"))
                                {
                                    
                                String permStall=request.getParameter("qtyOne");
                                if(permStall==null && permStall.trim().length()==0)
                                    permStall="0";
                                objEventDet.setNoOfStalls(permStall);
                                System.out.println("Type of stabling Permanent stalls on ground :" +permStall);
                               
                                }
                                if(r9.equalsIgnoreCase("typStableTwo"))
                                {
                                    String tempStall=request.getParameter("qtyTwo");
                                    if(tempStall==null && tempStall.trim().length()==0)
                                    tempStall="0";
                                    objEventDet.setNoOfTempStalls(tempStall);
                                    System.out.println("Type of stabling Temporary stalls on ground :" +tempStall);
                               
                                }
                                
                                 if(r9.equalsIgnoreCase("typStableThree"))
                                {   
                                    String pertempStall=request.getParameter("amountnew");
                                    String miles=request.getParameter("timenew");
                                    if(pertempStall==null && pertempStall.trim().length()==0)
                                    pertempStall="0";
                                    objEventDet.setNoOfTempPermanentStalls(pertempStall);
                                    if(miles==null && miles.trim().length()==0)
                                    miles="0";
                                    objEventDet.setMilesFromEvent(miles);
                                    
                                    System.out.println("Permanent/temporary stalls with approximate distance from event :" +pertempStall);
                                    System.out.println("Permanent/temporary stalls with approximate distance from event :" +miles);
                               
                                 }
                                
                         }
                        
                        /*
                         * Veterinarian Info: 
                         */ 
                        
                        String vetName=request.getParameter("vetName");
                        String phNum=request.getParameter("phNum");
                        String vetNo=request.getParameter("vetNo");
                        
                        objEventDet.setVeterinarianName(vetName);
                        objEventDet.setVeterinarianPhone(phNum);
                        objEventDet.setVeterinarianPlace(vetNo);
                        
                        System.out.println("Veterinarian Name :" +vetName);
                        System.out.println("Veterinarian phone no. at event :" +phNum);
                        System.out.println("Where Vet. no. will be posted at event :" +vetNo);       
                     
                        /*
                         * Accomodations: 
                         */
                                               
                        String hotel1=request.getParameter("hotel1");
                        String phone1=request.getParameter("phone1");
                        String mile1=request.getParameter("mile1");

                        System.out.println("Accomodations hotel1 :" +hotel1);
                        System.out.println("Accomodations phone1:" +phone1);
                        System.out.println("Accomodations mile1:" +mile1);    
                        
                       // String acc1[] = {hotel1,phone1,mile1};
                        ArrayList accAr=new ArrayList();
                        accAr.add(hotel1);
                        accAr.add(phone1);
                        accAr.add(mile1);
                        
                        //accommodation.addElement(acc1);
                        accommodation.addElement(accAr);
                        System.out.println("After adding Accomodations 1 accAr.size() :" +accAr.size());  
                        
                        String hotel2=request.getParameter("hotel2");
                        if(hotel2!=null && hotel2.trim().length()!=0)
                        {
                            
                            String phone2=request.getParameter("phone2");
                            String mile2=request.getParameter("mile2");
                            
                            System.out.println("Accomodations hotel2 :" +hotel2);
                            System.out.println("Accomodations phone2 :" +phone2);
                            System.out.println("Accomodations mile2 :" +mile2);
                            
                           // String acc2[] = {hotel2,phone2,mile2};
                            
                             ArrayList accAr2=new ArrayList();
                             accAr2.add(hotel2);
                             accAr2.add(phone2);
                             accAr2.add(mile2);
                            
                            //accommodation.addElement(acc2);
                             accommodation.addElement(accAr2);
                             
                            System.out.println("After adding Accomodations 2 accAr2.size() :" +accAr2.size()); 
                        }
                        
                        String hotel3=request.getParameter("hotel3");
                        if(hotel3!=null && hotel3.trim().length()!=0)
                        {
                            
                            String phone3=request.getParameter("phone3");
                            String mile3=request.getParameter("mile3");
                            
                            System.out.println("Accomodations hotel3 :" +hotel3);
                            System.out.println("Accomodations phone3 :" +phone3);
                            System.out.println("Accomodations mile3 :" +mile3);
                            
                            //String acc3[] = {hotel3,phone3,mile3};
                            
                            ArrayList accAr3=new ArrayList();
                             accAr3.add(hotel3);
                             accAr3.add(phone3);
                             accAr3.add(mile3);
                            
                            //accommodation.addElement(acc3);
                             
                             accommodation.addElement(accAr3);
                            System.out.println("After adding Accomodations 3 accAr3.size() :" +accAr3.size()); 
                        }
                        
                        /*
                         * Directions
                         */
                                
                         String textarea=request.getParameter("textarea");
                         objEventDet.setDirections(textarea);
                         System.out.println("After adding Directions :" +textarea); 

            /********** Part E of the form starts here **********
                         
                         /*
                          * Dressage test for horse trials
                          */
                         
                    String dtct=request.getParameter("dtct");
                    System.out.println("dtct :"+dtct);
                
                     int dct=Integer.parseInt(dtct);
                   
                     for(int e=0;e<=dct;e++)
                     {
                          String chbxnam="advlevel"+Integer.toString(e);
                          System.out.println("dressage cbx made : "+chbxnam);
                          
                          String aropt="arena"+Integer.toString(e);
                          System.out.println("dressage opt made : "+aropt);
                         
                      for(int z=0;z<nam.length;z++)
                      {

                         if(chbxnam.equals(nam[z])){
                             
                            String dtchkd=null;
                            String dtOpt=null;
                             
                            dtchkd =request.getParameter(chbxnam);
                            System.out.println("dressage checked val: "+dtchkd);
                            
                            dtOpt =request.getParameter(aropt);
                            System.out.println("dressage option val: "+dtOpt);
                                                        
                            //String hDress1[] = {dtchkd,dtOpt};
                            
                            ArrayList hdAr=new ArrayList();
                            hdAr.add(dtchkd);
                            hdAr.add(dtOpt);
                            
                            //hDressage.addElement(hDress1);
                            hDressage.addElement(hdAr);
                            
                            System.out.println("dressage after adding : "+"horse :"+dtchkd+ "arena :"+dtOpt);
                            Debug.print("hdAr.size() :"+hdAr.size());
                         }
                      }
                     }
                    
                   
                     /*
                      * Footing :
                      */
                     
                    String footing=request.getParameter("footing");
                    objEventDet.setFootingDesc(footing);
                     System.out.println(" footing : " +footing);
                     
                    /*
                     * Cross-Country :
                     */
                    
                        String division1=request.getParameter("division1");
                        String length1=request.getParameter("length1");
                        String speed1=request.getParameter("speed1");
                        String AdditionalInfo=request.getParameter("AdditionalInfo");
                        String r10=request.getParameter("r10");
                        
                        //String cross1[] = {division1,length1,speed1,r10,AdditionalInfo};
                        
                        ArrayList ccAr=new ArrayList();
                        ccAr.add(division1);
                        ccAr.add(length1);
                        ccAr.add(speed1);
                        ccAr.add(r10);
                        ccAr.add(AdditionalInfo);
                        
                        //crossCountry.addElement(cross1);
                        crossCountry.addElement(ccAr);
                        
                        System.out.println("After adding Cross-Country 1 ccAr.size() :" +ccAr.size());
                       
                        String length2=request.getParameter("length2");
                        if(length2!=null && length2.trim().length()!=0)
                        {
                            
                        String division2=request.getParameter("division2");
                        String speed2=request.getParameter("speed2");
                        
                       // String cross2[] = {division2,length2,speed2," "," "};
                        
                        ArrayList ccAr2=new ArrayList();
                        ccAr2.add(division2);
                        ccAr2.add(length2);
                        ccAr2.add(speed2);
                        ccAr2.add(" ");
                        ccAr2.add(" ");
                        
                        //crossCountry.addElement(cross2);
                        crossCountry.addElement(ccAr2);
                        
                        System.out.println("After adding Cross-Country 2 ccAr2.size() :" +ccAr2.size());
                       }
                        
                        String length3=request.getParameter("length3");
                        if(length3!=null && length3.trim().length()!=0)
                        {
                            
                        String division3=request.getParameter("division3");
                        String speed3=request.getParameter("speed3");
                        
                        //String cross3[] = {division3,length3,speed3," "," "};
                        
                        ArrayList ccAr3=new ArrayList();
                        ccAr3.add(division3);
                        ccAr3.add(length3);
                        ccAr3.add(speed3);
                        ccAr3.add(" ");
                        ccAr3.add(" ");
                        
                        //crossCountry.addElement(cross3);
                        crossCountry.addElement(ccAr3);
                        
                        System.out.println("After adding Cross-Country 3 ccAr3.size() :" +ccAr3.size());
                      
                        }
                        
                       /*
                        * Cross-country course officially closed on
                        */ 
                         SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyy");
                         java.util.Date crctdate =null;
                         
                         othersDet.setEventId(eventId);
                                 
                         if(request.getParameter("CrossCountryDate")!=null && request.getParameter("CrossCountryDate").trim().length()!=0)
                         {
                            String CrossCountryDate=request.getParameter("CrossCountryDate");
                            crctdate=sdf.parse(CrossCountryDate);
                            othersDet.setCourseCloseDate(crctdate);
                         }
                         else
                         {
                            othersDet.setCourseCloseDate(null);
                         }
                                 
                        
                        /*
                         * EntryLimit
                         */
                         
                         if(request.getParameter("EntryLimit")!=null && request.getParameter("EntryLimit").trim().length()!=0)
                         {
                            String EntryLimit=request.getParameter("EntryLimit");
                            othersDet.setEntryLimit(EntryLimit);
                         }
                         else
                         {
                            othersDet.setEntryLimit(null);
                         }
                        
                        
                          
                        /*
                         * Riders limited to horse/level * (or) horse/entire event.**
                         */
                         
                         if(request.getParameter("RiderLimit1")!=null && request.getParameter("RiderLimit1").trim().length()!=0)
                         {
                            String RiderLimit1=request.getParameter("RiderLimit1");
                            othersDet.setRidersHorseLevelLimit(RiderLimit1);
                         }
                         else
                         {
                            othersDet.setRidersHorseLevelLimit(null);
                         }
                         
                          if(request.getParameter("RiderLimit2")!=null && request.getParameter("RiderLimit2").trim().length()!=0)
                         {
                            String RiderLimit2=request.getParameter("RiderLimit2");
                            othersDet.setRidersHorseEntireLimit(RiderLimit2);
                         }
                         else
                         {
                             othersDet.setRidersHorseEntireLimit(null);
                         }
                   
                        
                        /*
                         * Divisions further divided if entries warrant; state birth date on entry.
                         */
                        
                          java.util.Date divdate=null;
                     
                          String BirthDate=request.getParameter("BirthDate");
                          if(request.getParameter("BirthDate")!=null && request.getParameter("BirthDate").trim().length()!=0)
                          {
                          divdate=(java.util.Date)sdf.parse(request.getParameter("BirthDate"));
                          othersDet.setDivisionEntryBirthDate(divdate);
                          }
                          else
                          {
                           othersDet.setDivisionEntryBirthDate(null);
                          }
                          
                          /*
                           * Dogs must be leashed
                           */
                         
                        String r11=request.getParameter("r11");
                        if(r11!=null)
                        {
                        if(r11.equalsIgnoreCase("true"))
                        {
                         othersDet.setLeaseDogs(true);
                        }
                        if(r11.equalsIgnoreCase("false"))
                        {
                         othersDet.setLeaseDogs(false);
                        }
                        }
                        else
                        {
                            othersDet.setLeaseDogs(false);
                        }
                        
                        /*
                         * Team of three of four, best three scores
                         */
                        
                        String PerHead=request.getParameter("PerHead");
                        String TeamTotal=request.getParameter("TeamTotal");
                        String Party=request.getParameter("Party");
                        
                        if(request.getParameter("PerHead")!=null && request.getParameter("PerHead").trim().length()!=0)
                        {
                            othersDet.setPerTimePrice(request.getParameter("PerHead"));
                            
                        }
                        else
                        {
                            PerHead="0";
                            othersDet.setPerTimePrice(PerHead);
                            
                        }
                        
                         if(request.getParameter("TeamTotal")!=null && request.getParameter("TeamTotal").trim().length()!=0)
                         {
                             othersDet.setTeamCompetition(request.getParameter("TeamTotal"));                            
                         }
                         else
                         {
                            TeamTotal="0";
                            othersDet.setTeamCompetition(TeamTotal);                             
                         }
                        
                         othersDet.setPartyName(Party);
                         
                         /*
                          * Additional information
                          */ 
                          String AdditionalInfo2=request.getParameter("AdditionalInfo2");
                          othersDet.setAddInfo(AdditionalInfo2);
                         
                      //-------------   
                        objEventDet.setAccomodationCamping("setAccomodationCamping");
                        othersDet.setOtherTeamInfo(null);
                       
                        Debug.print("================================="); 
                Debug.print("Event ID:"+objEventDet.getEventId());
                Debug.print("=================================");
                Debug.print(objEventDet.getOrganizeId());
                Debug.print( objEventDet.getEventSecretaryId());
                Debug.print(objEventDet.getEntryFee());
                Debug.print(objEventDet.getOtherEntryFee());
                Debug.print(objEventDet.getOfficeFee());
                Debug.print(objEventDet.getCheckPayableTo());
                Debug.print(objEventDet.getPinniesCharge());
                Debug.print(objEventDet.getPinniesPosition());
                Debug.print(objEventDet.getAwardTrophy());        
                Debug.print(objEventDet.getAwardPrize());
                Debug.print(objEventDet.getAwardOthers());
                Debug.print(objEventDet.getDateAvailable());
                Debug.print(objEventDet.getAvailableFrom());
                Debug.print(objEventDet.getAvailableFromOther());
                Debug.print(objEventDet.getAvailablePosition());
                Debug.print(objEventDet.getStablingLimited());
                Debug.print(objEventDet.getStallPernightPrice());
                Debug.print(objEventDet.getPerStallPrice());
                Debug.print(objEventDet.getPerStallFromTime());
                Debug.print(objEventDet.getPerStallFromDate());
                Debug.print(objEventDet.getPerStallToTime());
                Debug.print(objEventDet.getPerStallToDate());
                Debug.print(objEventDet.getNoOfStalls());
                Debug.print(objEventDet.getNoOfTempStalls());
                Debug.print(objEventDet.getNoOfTempPermanentStalls());
                Debug.print(objEventDet.getMilesFromEvent());
                Debug.print(objEventDet.getVeterinarianName());
                Debug.print(objEventDet.getVeterinarianPhone());
                Debug.print(objEventDet.getVeterinarianPlace());
                Debug.print(objEventDet.getAccomodationCamping());
                Debug.print(objEventDet.getDirections());
                Debug.print(objEventDet.getFootingDesc());
                
                Debug.print("Event ID in objEventDet.getEventId() :"+objEventDet.getEventId());
                Debug.print(othersDet.getCourseCloseDate().toString());
                Debug.print(othersDet.getEntryLimit());
                Debug.print(othersDet.getPerTimePrice());
                Debug.print(othersDet.getTeamCompetition());
                                                
                if(othersDet.getDivisionEntryBirthDate()!=null)
                {
                Debug.print(othersDet.getDivisionEntryBirthDate().toString());
                }
                
                Debug.print(othersDet.getRidersHorseEntireLimit());
                Debug.print(othersDet.getRidersHorseLevelLimit());
                Debug.print(othersDet.getPartyName());
                Debug.print(othersDet.getAddInfo());
               
                Debug.print("=================================");
              
                        boolean edStat=vaigaiBean.editEventOrganizer(objEventDet, accommodation, crossCountry,
                                cogginsDetails, divisionLevels, hDressage, judgesDetails, othersDet, refundRuleDetails, tentativeTime);
                        
                        Debug.print("remote.editEventOrganizer() :"+edStat);
        
                             
                        String organizerId = (String)session.getAttribute("memberId");
                        String indieventID = (String)request.getAttribute("indieventID");
                        Debug.print("eventViewOrg():memberId:" + organizerId);
                        ArrayList eventList = new ArrayList();
                            if(organizerId!=null){
                            eventList = vaigaiBean.getAllOrgEventDetails(organizerId);
                            }
                        
                        request.setAttribute("displayOrgAllEventDet",eventList);  
                         request.setAttribute("indieventID",indieventID); 
                       
                    fwd="frmMeeOrgEventListings";
            }
                      
        }
                   
        catch(Exception ex)
        {
            System.err.println("Caught an exception."+ex.getMessage());
            ex.printStackTrace();
        }
        return new ModelAndView(fwd);
        
    }
}
