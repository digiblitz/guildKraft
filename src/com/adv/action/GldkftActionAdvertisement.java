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
/*  Program Name    : ActionAdvertisement.java
 *  Created Date    : September 1, 2006, 10:25 AM
 *  Author          : Punitha.R
 *  Version         : 1.27
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.adv.action;
import com.db.GeneralDBAction;
import com.hlcadv.advertise.HLCAdvertiseSessionBean;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlcadv.masters.HLCMediaMasterLocal;
import com.hlccommon.util.Debug;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import java.io.*;
import java.net.ProtocolException;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.*;

import javax.ejb.EJBException;
import javax.ejb.FinderException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.util.*;

public class GldkftActionAdvertisement implements Controller {
	 
    
 /*
  * Media details
  */
    private final static String HOME = "show";
    
    
    
    private final static String NEWMEDIA = "advMediaPlanAddNew";
    private final static String INSERTMEDIA = "advInsertNewMedia";
    private final static String LISTMEDIA = "advMediaLst";
    private final static String EDITDELETEMEDIA ="advManupMedia";
    private final static String EDITMEDIA ="advEditMedia";
    private final static String CONFIRMDELETEMEDIA ="advConfirmDelete";
 /*
  * Dimension details
  */ 
    private final static String NEWDIMENSION = "advDimensionAdd";
    private final static String INSERTDIMENSION ="advDimAdd";
    private final static String LISTDIMENSION = "advLstDimension";
    private final static String EDITDIMENSION ="advDimEdit";
    private final static String EDITDELETEDIMENSION ="advManupDimension";
    private final static String CONFIRMDELETEDIM ="advConfirmDeleteDim";
   /*
    * Issue details
    */ 
    private final static String NEWISSUE ="advIssueAdd";
    private final static String INSERTISSUE ="advIssueInsert";
    private final static String LISTISSUE="advIssueLst";
    private final static String EDITDELETEISSUE ="advManupIssue";
    private final static String EDITISSUE = "advIssueEdit";
    private final static String CONFIRMDELETEISS ="advIssueDeleteIss";
    /*
    * Display Type Details
    */
    private final static String NEWDISPTYPE  = "advDispTypeAdd";
    private final static String LISTDISPTYPE = "advDispTypeLst";
    private final static String INSERTDISPTYPE = "advDispTypeInsert";
    private final static String EDITDELETEDISPTYPE = "advManupDispType";
    private final static String EDITDISPTYPE = "advDispEdit";
    private final static String CONFIRMDELETEDISPTYPE = "confirmDeleteDisp";
     
    /*
     * Display Sub Type Details
     */
    private final static String NEWDISPSUBTYPE  = "advDispSubTypeAdd";
    private final static String LISTDISPSUBTYPE = "advDispSubTypeLst";
    private final static String INSERTDISPSUBTYPE = "advDispSubTypeInsert";
    private final static String GETTYPEID= "advDispTypeShow";
    private final static String EDITDELETEDISPSUBTYPE = "advManupDispSubType";
    private final static String EDITDISPSUBTYPE = "advUpdateDispSubType";
    private final static String CONFIRMDELETEDISPSUBTYPE = "deleteDispSubType";
    private final static String GETLISTTYPEID = "advDispLstShow";
    GeneralDBAction db=new GeneralDBAction();
    /**
     * @Method Name    :createIssue.
     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
     * @param          :String issueName,String mediaId.
     * @return         :boolean value.
     * @throws         :RemoteException.
     */  
       public boolean createIssue(String issueName,String mediaId) throws RemoteException{
           Debug.print("AdvertiseSessionBean createIssue");
           boolean result = false;
           try{
               if (issueNameExists(issueName) == false) {
                   Debug.print("This name is already Exists");
                   result = false;
               }
               else{
            	   result = db.createRowIssue(issueName, mediaId);
               }
           }
           catch(Exception exp){
               exp.printStackTrace();
           }
           finally{
               return result;
           }   
       } 
       /**
        * @Method Name    :issueNameExists.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :String issueId.
        * @return         :boolean value.
        * @throws         :Null.
        */
          private boolean issueNameExists(String issueName) {
              Debug.print("AdvertiseSessionBean issueNameExists");
              boolean result = true;
             // if (!(issueName.equalsIgnoreCase(this.issueName))) {
                  try {
                     ArrayList  iName = (ArrayList) db.findByIssueName(issueName);
                     Iterator e = iName.iterator();
                     while(e.hasNext()){
                        // HLCIssueMasterLocal objIssueLocalRemote = (HLCIssueMasterLocal)e.next();
                         String issueNameRs = (String)e.next();
                         
                         if(issueNameRs!=null){
                             //this.issueName = issueName;
                             result = false;
                             Debug.print("Issue Name alreay exists:" + issueName);
                             //break;
                         }
                     }
                  } catch (Exception ex) {
                       result = false;
                       Debug.print("Exception:" + ex.getMessage());
                  }
             /* }
              else{
                   result = false;
              }
              */
              Debug.print("Issues Name Outer Most" + result);
              return result;
          }
    /**
     * @Method Name    :editIssue.
     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
     * @param          :String issueId, String issueName,String mediaId.
     * @return         :boolean value.
     * @throws         :RemoteException.
     */
       public boolean editIssue(String issueId, String issueName,String mediaId) throws RemoteException{
           Debug.print("AdvertiseSessionBean editIssue");
           boolean result = false;
           try{
               if (issueId == null ) {
                   throw new EJBException("Issue ID can't be empty");
               }
               if (issueNameEditExists(issueId,issueName) == false) {
                   Debug.print("AdvertiseSessionBean editIssue This name is already Exists");
                   result = false;
                  // throw new EJBException("PlanName Already Exist" + planName);
               }
               else{
                   if (issueExists(issueId) == false) {
                       //throw new EJBException("Issue ID does not Exists" + dimensionTypeId);
                       Debug.print("Issue ID does not Exists" + issueId);
                       result = false;
                   }
                   else{
                      
                       result = db.editIssueDetails(issueId, issueName, mediaId);
                   }
               }
           }
           catch(Exception exp){
               exp.printStackTrace();
           }
           finally{
               return result;
           }
       }
       /**
        * @Method Name    :issueNameEditExists.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :String issueId, String issueName.
        * @return         :boolean value.
        * @throws         :Null.
        */
          private boolean issueNameEditExists(String issueId, String issueName) {
              Debug.print("AdvertiseSessionBean issueNameEditExists");
              boolean result = true;
              Debug.print("issueNameEditExists  issueName:" + issueName);
             // Debug.print("issueNameEditExists  this.issueName:" + this.issueName);
             // if (!(issueName.equalsIgnoreCase(this.issueName))) {
                  try {
                     ArrayList  iName = (ArrayList) db.findByIssueEditName(issueId,issueName);
                     Debug.print("issueNameEditExists  issueName:" + issueName);
                     Iterator e = iName.iterator();
                     if(e.hasNext()){
                         Debug.print("issueNameEditExists  issueName:" + issueName);
                        // IssueMasterLocal objIssueLocalRemote = (IssueMasterLocal)e.next();
                         String issueNameRs = (String)e.next();
                         if(issueNameRs!=null){
                             //this.issueName = issueName;
                             result = false;
                             Debug.print("issueNameEditExists Issue Name alreay exists result:" + result);
                          //   break;
                         }
                     }
                  } catch (Exception ex) {
                       result = false;
                       Debug.print("Exception:" + ex.getMessage());
                  }
            /*  }
              else{
                   Debug.print("issueNameEditExists  else Part:" + issueName);
                   result = false;
              }
              */
              Debug.print("Edit Issues Name Outer Most" + result);
              return result;
          }
    /**
     * @Method Name    :deleteIssue.
     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
     * @param          :String issueId.
     * @return         :boolean value.
     * @throws         :RemoteException, FinderException.
     */
       public boolean deleteIssue(String issueId) throws RemoteException,FinderException{
           Debug.print("AdvertiseSessionBean deleteIssue");
           Debug.print("Issue ID:" + issueId);
           boolean result = false;
           if (issueId == null) {
               throw new EJBException("Issue ID can't be empty");
           }
           if (issueExists(issueId) == false) {
               throw new EJBException("Issue ID does not  Exists" + issueId);
           }
           try {
        	   result = db.deleteIssueRow(issueId);
           } catch (Exception ex) {
                 throw new EJBException("deleteIssue: " + ex.getMessage());
           }
           finally{
               return result;
           }   
       }
    /**
     * @Method Name    :getIssueByMedia.
     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
     * @param          :String mediaId.
     * @return         :Vector value.
     * @throws         :RemoteException, FinderException.
     */
       public Vector getIssueByMedia(String mediaId) throws RemoteException,FinderException{
           Debug.print("AdvertiseSessionBean getIssueByMedia");
           Vector issueList = new Vector();
           Collection result = db.findByMediaId(mediaId);
           Iterator e = result.iterator();
           while(e.hasNext()){
               String issueDet [] = (String [])e.next();
               Debug.print("AdvertiseSessionBean getIssueByMedia");
               String issueId =  issueDet[0];
               String issueName =  issueDet[1];
               String mediaIdVal = issueDet[2];
               String issueStatus = issueDet[3];
               String issue [] = {issueId,issueName,mediaIdVal,issueStatus};
               issueList.addElement(issue);
           }
           return issueList;
        }
       /**
        * @Method Name    :getIssueDetails.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :String issueId.
        * @return         :String[] value.
        * @throws         :RemoteException, FinderException.
        */
          public String[] getIssueDetails(String issueId) throws RemoteException,FinderException {
              Debug.print("AdvertiseSessionBean getIssueDetails");
              String issueInAction [] = null;
              if (issueExists(issueId) == false) {
                  throw new EJBException("Issue ID doesnot Exists" + issueId);
              }
              Collection result = db.getIssueFrmDb(issueId);
              Iterator e = result.iterator();
              while(e.hasNext()){
                  String issueDet [] = (String [])e.next();
             String issueIdFrmDb =  issueDet[0];
             String issueNa =  issueDet[1];
             String mediaId = issueDet[2];
             String issueStatus =issueDet[3];
             String issue [] = {issueIdFrmDb,issueNa,mediaId,issueStatus};
             issueInAction = issue;
              }
              return issueInAction;

          }
          /**
           * @Method Name    :issueExists.
           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
           * @param          :String issueId.
           * @return         :boolean value.
           * @throws         :Null.
           */
             private boolean issueExists(String issueId) {
                 Debug.print("AdvertiseSessionBean issueExists");
               //  if (issueId != this.issueId) {
                     try {
                         String issueIdFrmDb = db.findIssueByPrimaryKey(issueId);
                         //this.issueId = issueId;
                     } catch (Exception ex) {
                         return false;
                     }
              //   }
                 Debug.print("Issue Id :" + issueId);
                 return true;
             }

    
    /*===================================Media Master =============================================*/
    /**
     * @Method Name    :createDisplaySubType.
     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
     * @param          :String displaySubTypeName , String displayTypeId, String displaySubTypeDescription.
     * @return         :boolean value.
     * @throws         :RemoteException.
     */
       public boolean createDisplaySubType(String displaySubTypeName , String displayTypeId, String displaySubTypeDescription) throws RemoteException{  
           Debug.print("AdvertiseSessionBean createDisplaySubType");
           boolean result = false;
           try{
               if (displaySubTypeNameExists(displaySubTypeName) == false) {
                   Debug.print("This name is already Exists");
                   result = false;
               }
               else{
            	   result = db.dispSubTypeCreate(displaySubTypeName , displayTypeId, displaySubTypeDescription);
                   Debug.print("After Insertion");
               }
           }
           catch(Exception exp){
               Debug.print("Exception in createDisplaySubType:" + exp.getMessage());
               exp.printStackTrace();
           }
           finally{
               return result;
           }   
        }
       /**
        * @Method Name    :deleteDisplaySubType.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :Null.
        * @return         :boolean value.
        * @throws         :RemoteException, FinderException.
      */
          public boolean deleteDisplaySubType(String displaySubTypeId) throws RemoteException,FinderException{
              Debug.print("AdvertiseSessionBean deleteDisplaySubType");
              Debug.print("Display Sub Type ID:" + displaySubTypeId);
              boolean result = false;
              if (displaySubTypeId == null) {
                  throw new EJBException("Diplay Sub Type ID can't be empty");
              }
              if (displaySubTypeExists(displaySubTypeId) == false) {
                  //throw new EJBException("Diplay Type ID does not  Exists" + displayTypeId);
                  result = false;
              }
              else{
                  try {
                	  result = db.dispSubdeleteRow(displaySubTypeId);
                  } catch (Exception ex) {
                        result = false;
                        throw new EJBException("deleteDisplaySubType: " + ex.getMessage());
                  }
                  finally{
                      return result;
                  }
              }
              return result;
          }
          /**
           * @Method Name    :editDisplaySubType.
           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
           * @param          :String displaySubTypeId, String displaySubTypeName , String displayTypeId, String displaySubTypeDescription.
           * @return         :boolean value.
           * @throws         :RemoteException.
           */
             public boolean editDisplaySubType(String displaySubTypeId, String displaySubTypeName , String displayTypeId, String displaySubTypeDescription) throws RemoteException{
                 Debug.print("AdvertiseSessionBean editDisplaySubType");
                 boolean result = false;
                 try{
                     if (displaySubTypeId == null ) {
                         throw new EJBException("Display Sub Type ID can't be empty");
                     }
                     if (displaySubTypeEditNameExists(displaySubTypeId,displaySubTypeName) == false) {
                         Debug.print("AdvertiseSessionBean editDisplaySubType This name is already Exists");
                         result = false;
                        // throw new EJBException("PlanName Already Exist" + planName);
                     }
                     else{
                         if (displaySubTypeExists(displaySubTypeId) == false) {
                            // throw new EJBException("Display Sub Type ID does not Exists" + displaySubTypeId);
                             result = false;
                         }
                         else{
                        	 result = db.editDisplaySubType(displaySubTypeId, displaySubTypeName, displayTypeId, displaySubTypeDescription);
                         }
                     }
                 }
                 catch(Exception exp){
                     exp.printStackTrace();
                 }
                 finally{
                     return result;
                 }
             }
             /**
              * @Method Name    :displaySubTypeEditNameExists.
              * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
              * @param          :String displaySubTypeId, String displaySubTypeName.
              * @return         :boolean value.
              * @throws         :Null.
            */
                private boolean displaySubTypeEditNameExists(String displaySubTypeId, String displaySubTypeName) {
                    Debug.print("AdvertiseSessionBean displaySubTypeEditNameExists");
                    boolean result = true;
                  //  if (!(displaySubTypeName.equalsIgnoreCase(this.displaySubTypeName))) {
                        try {
                           String  dstName = (String) db.findByDisplaySubEditTypeName(displaySubTypeId,displaySubTypeName);
                         /*  Iterator e = dstName.iterator();
                           while(e.hasNext()){
                               HLCDisplaySubTypeMasterLocal objSubTypeLocalRemote = (HLCDisplaySubTypeMasterLocal)e.next();
                               String SubTypeNameRs = objSubTypeLocalRemote.getDisplaySubTypeName();
                               */
                               if(dstName!=null){
                                   //this.displaySubTypeName = displaySubTypeName;
                                   result = false;
                                   Debug.print("displaySubTypeEditNameExists Name alreay exists:" + displaySubTypeName);
                                  // break;
                               }
                         //  }
                        } catch (Exception ex) {
                             result = false;
                             Debug.print("Exception:" + ex.getMessage());
                        }
                /*    }
                    else{
                         result = false;
                    }
                    */
                    Debug.print("Edit Display Sub Type Name Outer Most Loop:" + result);
                    return result;
                }
       /**
        * @Method Name    :getDisplayTypeFromSubType.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :String displaySubTypeId.
        * @return         :Vector value.
        * @throws         :RemoteException, FinderException.
      */
          public Vector getDisplayTypeFromSubType(String displayTypeId) throws RemoteException,FinderException{
              Debug.print("AdvertiseSessionBean getDisplayTypeFromSubType");
              Vector typeList = new Vector();
              ArrayList result = (ArrayList) db.findByDisplayTypeId(displayTypeId);
              Iterator e = result.iterator();
              while(e.hasNext()){
                 String dispType[] = (String []) e.next();
                 Debug.print("AdvertiseSessionBean getDisplayTypeFromSubType");
                 String dispSubTypeId =  dispType[0];
                 String displaySubTypeName = dispType[1];
                 String dispTypeId =  dispType[2];
            	 String displaySubTypeDescription  = dispType[3];
                 String dispStatus = dispType[4];
                 String disSubType [] = {dispSubTypeId,displaySubTypeName,dispTypeId,displaySubTypeDescription, dispStatus};
                 typeList.addElement(disSubType);
              }
              return typeList;
          }
       /**
        * @Method Name    :displaySubTypeNameExists.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :String displaySubTypeName.
        * @return         :boolean value.
        * @throws         :Null.
      */
          private boolean displaySubTypeNameExists(String displaySubTypeName) {
              Debug.print("AdvertiseSessionBean displaySubTypeNameExists");
              boolean result = true;
             // if (!(displaySubTypeName.equalsIgnoreCase(this.displaySubTypeName))) {
                  try {
                     String  dstName = (String) db.findByDisplaySubTypeName(displaySubTypeName);
                  /*   Iterator e = dstName.iterator();
                     while(e.hasNext()){
                         HLCDisplaySubTypeMasterLocal objSubTypeLocalRemote = (HLCDisplaySubTypeMasterLocal)e.next();
                         String SubTypeNameRs = objSubTypeLocalRemote.getDisplaySubTypeName();
                         */
                         if(dstName!=null){
                             //this.displaySubTypeName = displaySubTypeName;
                             result = false;
                             Debug.print("Display Sub Type Name alreay exists:" + displaySubTypeName);
                             //break;
                         }
                   //  }
                  } catch (Exception ex) {
                       result = false;
                       Debug.print("Exception:" + ex.getMessage());
                  }
             /* }
              else{
                   result = false;
              }
              */
              Debug.print("Display Sub Type Name Outer Most Loop:" + result);
              return result;
              }
          /**
           * @Method Name    :getDisplaySubTypeDetails.
           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
           * @param          :String displaySubTypeId.
           * @return         :String[] value.
           * @throws         :RemoteException, FinderException.
         */
             public String[] getDisplaySubTypeDetails(String displaySubTypeId) throws RemoteException,FinderException, SQLException {
                 Debug.print("AdvertiseSessionBean getDisplayTypeDetails");
                 String dispSubType[] = null;
                if (displaySubTypeExists(displaySubTypeId) == false) {
                     throw new EJBException("Display ID doesnot Exists" + displaySubTypeId);
                }
                ArrayList dispSubTypeDetails = db.getDisplaySubTypeDetails(displaySubTypeId);
                Iterator eById = dispSubTypeDetails.iterator();
                while(eById.hasNext()){
             	 String [] dispSubDet = (String [])eById.next();
                String dispSubTypeId =  dispSubDet[0];
                String displaySubTypeName = dispSubDet[1];
                String displayTypeId =  dispSubDet[2];
           	 String displaySubTypeDescription  = dispSubDet[3];
                String dispStatus = dispSubDet[4];
                String disSubType [] = {dispSubTypeId,displaySubTypeName,displayTypeId,displaySubTypeDescription, dispStatus};
                dispSubType = disSubType;
                }
                return dispSubType;

             }
             /**
              * @Method Name    :displaySubTypeExists.
              * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
              * @param          :String displaySubTypeId.
              * @return         :boolean value.
              * @throws         :Null.
            */
                private boolean displaySubTypeExists(String displaySubTypeId) {
                    Debug.print("AdvertiseSessionBean displayTypeExists");
                    //if (displaySubTypeId != this.displaySubTypeId) {
                        try {
                            String  displaySubTypeIdFrmDb= db.findDispSubTypeByPrimaryKey(displaySubTypeId);
                             Debug.print("AdvertiseSessionBean displayTypeExists" + displaySubTypeIdFrmDb );
                            //this.displaySubTypeId = displaySubTypeId;
                        } catch (Exception ex) {
                            return false;
                        }
                  //  }
                    Debug.print("Display Sub Type Id :" + displaySubTypeId);
                    return true;
                }
                
             
          /**
           * @Method Name    :getMediaDisplayTypeDetails.
           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
           * @param          :String mediaId.
           * @return         :Vector value.
           * @throws         :RemoteException, FinderException.
           */
             public Vector getMediaDisplayTypeDetailsForSub(String mediaId) throws RemoteException,FinderException{
                 Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
                 Vector typeList = new Vector();
                 Collection result = db.findDispTypeByMedia(mediaId);
                 Iterator e = result.iterator();
                 while(e.hasNext()){
                	 String display_type_id = (String)e.next();
                     Debug.print("AdvertiseSessionBean getAllMediaDetails");
                     if(display_type_id.isEmpty()){
                  	   System.out.println("display_type_id is empty");
                     } else{
                  	   System.out.println("display_type_id is Not empty");
                         ArrayList resultById = db.getDispTypeDetails(display_type_id);
                         Iterator eById = resultById.iterator();
                         while(eById.hasNext()){
                      	 String [] dispDet = (String [])eById.next();
                         String displayTypeId =  dispDet[0];
                         String displayTypeName =  dispDet[1];
                    	 String mediaIdVal  = dispDet[2];
                         String displayTypeDescription=dispDet[3];
                         String dispStatus = dispDet[4];
                         String dispType [] = {displayTypeId,displayTypeName,mediaIdVal,displayTypeDescription, dispStatus};
                         typeList.add(dispType);
                         }
                     }
                 }
                 return typeList;
             }
          
    /**
      * @Method Name    :createMedia.
      * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
      * @param          :String mediaName , String mediaDescription.
      * @return         :boolean  value.
      * @throws         :RemoteException.
      */
        public boolean createMedia(String mediaName , String mediaDescription) throws RemoteException{
            Debug.print("AdvertiseSessionBean createMedia");
            boolean result = false;
            try{
                if (mediaNameExists(mediaName) == false) {
                    Debug.print("This name is already Exists");
                    result = false;
                    // throw new EJBException("PlanName Already Exist" + planName);
                }
                else{
                	result = db.createMediaDb(mediaName,mediaDescription);
                    //result =  true;
                }
            }
            catch(Exception exp){
                //throw new EJBException("createMedia Details: " + exp.getMessage());
                exp.printStackTrace();
            }
            finally{
                return result;
            }   
        }
        
        /**
         * @Method Name    :mediaNameExists.
         * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
         * @param          :String mediaName.
         * @return         :boolean value.
         * @throws         :Null.
         */
           private boolean mediaNameExists(String mediaName) {
               Debug.print("AdvertiseSessionBean mediaNameExists");
               boolean result = true;
              // if (!(mediaName.equalsIgnoreCase(this.mediaName))) {
                   try {
                      String  mName = (String) db.findByMediaName(mediaName);
                      //Iterator e = mName.iterator();
                     // while(e.hasNext()){
                         // HLCMediaMasterLocal objMediaLocalRemote = (HLCMediaMasterLocal)e.next();
                          //String meName = (String)e.next();
                          if(mName != null){
                              //this.mediaName = mediaName;
                              result = false;
                              Debug.print("Inside  mediaNameExists:" + mediaName);
                              //break;
                          }
                      //}
                   } catch (Exception ex) {
                        result = false;
                        Debug.print("Exception:" + ex.getMessage());
                   }
          /*     }
               else{
                    result = false;
               }
               */
               Debug.print("Media Name Outer Most" + result);
               return result;
           }
    
    /**
     * @Method Name    :getAllMediaDetails.
     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
     * @param          :Null.
     * @return         :Vector value.
     * @throws         :RemoteException, FinderException.
     */
       public Vector getAllMediaDetails( ) throws RemoteException,FinderException{
           Debug.print("AdvertiseSessionBean getAllMediaDetails");
           Vector <String []> mediaList = new Vector();
           Collection result = db.findByAll();
           Iterator e = result.iterator();
           while(e.hasNext()){
               String mediaID = (String)e.next();
               Debug.print("AdvertiseSessionBean getAllMediaDetails");
               if(mediaID.isEmpty()){
            	   System.out.println("media ID is empty");
               } else{
            	   System.out.println("media ID is Not empty");
                   ArrayList resultById = db.getMediaDetails(mediaID);
                   Iterator eById = resultById.iterator();
                   while(eById.hasNext()){
                	   String [] mediaDet = (String [])eById.next();
            	   String mediaIdVal  = mediaID;
                   String mediaName =  mediaDet[0];
                   String mediaDesc =  mediaDet[1];
                   String mediaStatus = mediaDet[2];
                   String media [] = {mediaIdVal,mediaName,mediaDesc,mediaStatus};
                   mediaList.add(media);
                   }
               }
               
           }
           return mediaList;
       }
       
       /**
        * @Method Name    :getAllDisplayTypeDetails.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :Null.
        * @return         :Vector value.
        * @throws         :RemoteException, FinderException.
        */
          public Vector getAllDisplayTypeDetails( ) throws RemoteException,FinderException {
              Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
              Vector displayTypeList = new Vector();
              Collection result = db.FindByAllDispId();
              Iterator e = result.iterator();
              while(e.hasNext()){
            	  String displayId = (String)e.next();
            	  if(displayId.isEmpty()){
               	   System.out.println("display ID is empty");
                  } else{
               	   System.out.println("display ID is Not empty");
                      ArrayList resultById = db.getAllDisplayDetails(displayId);
                      Iterator eById = resultById.iterator();
                      while(eById.hasNext()){
                   	   String [] displayDet = (String [])eById.next();
               	   String displayIdVal  = displayId;
                      String displayName =  displayDet[0];
                      String displayDesc =  displayDet[1];
                      String displayStatus = displayDet[2];
                      String display [] = {displayIdVal,displayName,displayDesc,displayStatus};
                      displayTypeList.add(display);
                      }
                  }
               
              }
              return displayTypeList;
          }
          
          /**
           * @Method Name    :getMediaDisplayTypeDetails.
           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
           * @param          :String mediaId.
           * @return         :Vector value.
           * @throws         :RemoteException, FinderException.
           */
             public Vector getMediaDisplayTypeDetails(String mediaId) throws RemoteException,FinderException{
                 Debug.print("AdvertiseSessionBean getAllDisplayTypeDetails");
                 Vector <String []> typeListByMidId = new Vector();
                 Collection result = db.FindByMedia(mediaId);
                 Iterator e = result.iterator();
                 while(e.hasNext()){
                	 String displayId = (String)e.next();
               	  if(displayId.isEmpty()){
                  	   System.out.println("display ID is empty");
                     } else{
                    	 ArrayList resultById = db.getAllDisplayDetails(displayId);
                         Iterator eById = resultById.iterator();
                         while(eById.hasNext()){
                      	   String [] displayDet = (String [])eById.next();
                  	   String displayIdVal  = displayId;
                         String displayName =  displayDet[0];
                         String mediaIdVal = displayDet[1];;
                         String displayDesc =  displayDet[2];
                         String displayStatus = displayDet[3];
                         String display [] = {displayIdVal,displayName, mediaIdVal, displayDesc,displayStatus};
                         typeListByMidId.add(display);
                     }
                     }
                               
                 }
                 return typeListByMidId;
 }
/**
* @Method Name    :getAllDimensionDetails.
* @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
* @param          :Null.
* @return         :Vector value.
* @throws         :RemoteException, FinderException.
*/         
   public Vector getAllDimensionDetails( ) throws RemoteException,FinderException {
	   Debug.print("AdvertiseSessionBean getAllDimensionDetails");
	   Vector <String []> dimList = new Vector();
	   Collection result = db.FindDimIdByAll();
	   Iterator e = result.iterator();
	   while(e.hasNext()){
		   Debug.print("AdvertiseSessionBean getAllDimensionDetails");
		   String dimId = (String)e.next();
        	  if(dimId.isEmpty()){
           	   System.out.println("Dim ID is empty");
              } else{
             	 ArrayList resultById = db.getAllDimDetailsByDisId(dimId);
                  Iterator eById = resultById.iterator();
                  while(eById.hasNext()){
               	   String [] dimDetails = (String [])eById.next();
                  String dimensionTypeId =  dimDetails[0];
                  String dimensionTypeName = dimDetails[1];;
                  String dimStatus =  dimDetails[2];
                  String dimension [] = {dimensionTypeId,dimensionTypeName, dimStatus};
                  dimList.add(dimension);
                  }
              }
		   }
	   return dimList;
	   }
   /**
    * @Method Name    :editMedia.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :String mediaId , String mediaName, String mediaDescription.
    * @return         :boolean  value.
    * @throws         :RemoteException.
    */
      
      public boolean editMedia(String mediaId, String mediaName , String mediaDescription, boolean mediaStatus) throws RemoteException{
          Debug.print("AdvertiseSessionBean editMedia");
          boolean result = false;
          try{
              if (mediaId == null ) {
                  throw new EJBException("Media ID can't be empty");
              }
              if (mediaNameEditExists(mediaId,mediaName) == false) {
                  Debug.print("AdvertiseSessionBean editMedia This name is already Exists");
                  result = false;
                 // throw new EJBException("PlanName Already Exist" + planName);
              }
              else{
                  if (mediaExists(mediaId) == false) {
                      Debug.print("Media ID does not Exists" + mediaId);
                      //throw new EJBException("Media ID does not Exists" + mediaId);
                      result = false;
                  }
                  else{
                	  result = db.editMedia(mediaId, mediaName, mediaDescription, mediaStatus);
                  }
              }
          }
          catch(Exception exp){
              exp.printStackTrace();
          }
          finally{
              return result;
          }
      }
      
      /**
       * @Method Name    :mediaNameEditExists.
       * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
       * @param          :String mediaId, String mediaName.
       * @return         :boolean value.
       * @throws         :Null.
       */   
         private boolean mediaNameEditExists(String mediaId, String mediaName) {
             Debug.print("AdvertiseSessionBean mediaNameEditExists");
             boolean result = true;
            // if (!(mediaName.equalsIgnoreCase(this.mediaName))) {
                 try {
                    String  mName = (String) db.findByEditMediaName(mediaId,mediaName);
                    /*Iterator e = mName.iterator();
                    while(e.hasNext()){
                        HLCMediaMasterLocal objMediaLocalRemote = (HLCMediaMasterLocal)e.next();
                        */
                       // String meName = objMediaLocalRemote.getMediaName();
                        if(mName!=null){
                            //this.mediaName = mediaName;
                            result = false;
                            Debug.print("Inside  mediaNameExists:" + mediaName);
                           // break;
                        }
                   // }
                 } catch (Exception ex) {
                      result = false;
                      Debug.print("Exception:" + ex.getMessage());
                 }
        /*     }
             else{
       
                  result = false;
         //    }
          */
             Debug.print("Edit Media Name Outer Most:" + result);
             return result;
         }
         /**
          * @Method Name    :mediaExists.
          * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
          * @param          :String mediaId.
          * @return         :boolean value.
          * @throws         :Null.
          */
            private boolean mediaExists(String mediaId) {
                Debug.print("AdvertiseSessionBean mediaExists");
              //  if (mediaId != this.mediaId) {
                    try {
                        String mediaExistId = db.findByPrimaryKey(mediaId);
                        //this.mediaId = mediaId;
                    } catch (Exception ex) {
                        return false;
                    }
              //  }
                Debug.print("Media Id :" + mediaId);
                return true;
            }
            /**
             * @Method Name    :deleteMedia.
             * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
             * @param          :String mediaId.
             * @return         :boolean value.
             * @throws         :RemoteException, FinderException.
             */
               public boolean deleteMedia(String mediaId) throws RemoteException,FinderException{
                   Debug.print("AdvertiseSessionBean deleteMedia");
                   Debug.print("Plan ID:" + mediaId);
                   boolean result = false;
                   if (mediaId == null) {
                       throw new EJBException("Media ID can't be empty");
                   }
                   if (mediaExists(mediaId) == false) {
                       throw new EJBException("Media ID Not Exists" + mediaId);
                   }
                   try {
                	   result = db.deleteMedia(mediaId);
                   } catch (Exception ex) {
                         throw new EJBException("deleteMedia: " + ex.getMessage());
                   }
                   finally{
                       return result;
                   }   
               }
               /**
                * @Method Name    :createDisplayType.
                * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                * @param          :String displayTypeName , String mediaId, String displayTypeDescription.
                * @return         :boolean value.
                * @throws         :RemoteException.
                */
                  public boolean createDisplayType(String displayTypeName , String mediaId, String displayTypeDescription) throws RemoteException {
                      Debug.print("AdvertiseSessionBean createDisplayType");
                      boolean result = false;
                      try{
                          if (displayTypeNameExists(displayTypeName) == false) {
                              Debug.print("This name is already Exists");
                              result = false;
                          }
                          else{
                              result = db.createDisplayType(displayTypeName, mediaId, displayTypeDescription );
                              Debug.print("After Insertion");
                              //result =  true;
                          }
                      }
                      catch(Exception exp){
                          Debug.print("Exception in createDisplay:" + exp.getMessage());
                          exp.printStackTrace();
                      }
                      finally{
                          return result;
                      }   
                   }
                  /**
                   * @Method Name    :displayTypeNameExists.
                   * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                   * @param          :String displayTypeName.
                   * @return         :boolean value.
                   * @throws         :Null.
                   */
                     private boolean displayTypeNameExists(String displayTypeName) {
                         Debug.print("AdvertiseSessionBean displayTypeNameExists");
                         boolean result = true;
                       //  if (!(displayTypeName.equalsIgnoreCase(this.displayTypeName))) {
                             try {
                                String  dtName = (String) db.findByDisplayTypeName(displayTypeName);
                               /* Iterator e = dtName.iterator();
                                while(e.hasNext()){
                                    HLCDisplayTypeMasterLocal objTypeLocalRemote = (HLCDisplayTypeMasterLocal)e.next();
                                    String TypeNameRs = objTypeLocalRemote.getDisplayTypeName();
                                    */
                                    if(dtName!=null){
                                        //this.displayTypeName = displayTypeName;
                                        result = false;
                                        Debug.print("Display Name alreay exists:" + displayTypeName);
                                        //break;
                                    }
                               // }
                             } catch (Exception ex) {
                                  result = false;
                                  Debug.print("Exception:" + ex.getMessage());
                             }
                      /*   }
                         else{
                              result = false;
                         }
                         */
                         Debug.print("Display Name Outer Most Loop:" + result);
                         return result;
                     }
                     /**
                      * @Method Name    :editDisplayType.
                      * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                      * @param          :String displayTypeId, String displayTypeName , String mediaId, String displayTypeDescription.
                      * @return         :boolean value.
                      * @throws         :RemoteException.
                      */
                        public boolean editDisplayType(String displayTypeId, String displayTypeName , String mediaId, String displayTypeDescription) throws RemoteException{
                            Debug.print("AdvertiseSessionBean editDisplayType");
                            boolean result = false;
                            try{
                                if (displayTypeId == null ) {
                                    throw new EJBException("Display ID can't be empty");
                                }
                                
                                if (displayTypeEditNameExists(displayTypeId,displayTypeName) == false) {
                                    Debug.print("AdvertiseSessionBean displayTypeEditNameExists This name is already Exists");
                                    result = false;
                                   // throw new EJBException("PlanName Already Exist" + planName);
                                }
                                else{
                                if (displayTypeExists(displayTypeId) == false) {
                                        //throw new EJBException("Display ID does not Exists" + displayTypeId);
                                        Debug.print("Display ID does not Exists" + displayTypeId);
                                        result = false;
                                    }
                                    else{
                                    	result = db.editDisplayType(displayTypeId, displayTypeName, mediaId, displayTypeDescription);
                                    }
                                }
                            }
                            catch(Exception exp){
                                exp.printStackTrace();
                            }
                            finally{
                                return result;
                            }
                        }
                        /**
                         * @Method Name    :displayTypeEditNameExists.
                         * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                         * @param          :String displayTypeId, String displayTypeName.
                         * @return         :boolean value.
                         * @throws         :Null.
                         */
                           private boolean displayTypeEditNameExists(String displayTypeId, String displayTypeName) {
                               Debug.print("AdvertiseSessionBean displayTypeEditNameExists");
                               boolean result = true;
                              // if (!(displayTypeName.equalsIgnoreCase(this.displayTypeName))) {
                                   try {
                                      String  dtName = (String) db.findByDisplayTypeEditName(displayTypeId, displayTypeName);
                                   /*   Iterator e = dtName.iterator();
                                      while(e.hasNext()){
                                          HLCDisplayTypeMasterLocal objTypeLocalRemote = (HLCDisplayTypeMasterLocal)e.next();
                                          String TypeNameRs = objTypeLocalRemote.getDisplayTypeName();
                                          */
                                          if(dtName!=null){
                                              //this.displayTypeName = displayTypeName;
                                              result = false;
                                              Debug.print("displayTypeEditNameExists  Display Name alreay exists:" + displayTypeName);
                                              //break;
                                          }
                                   //   }
                                   } catch (Exception ex) {
                                        result = false;
                                        Debug.print("Exception:" + ex.getMessage());
                                   }
                               /*}
                               else{
                                    result = false;
                               }
                               */
                               Debug.print("Edit Display Name Outer Most Loop:" + result);
                               return result;
                               }
/**
 * @Method Name    :displayTypeExists.
 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
 * @param          :String displayTypeId.
 * @return         :boolean value.
 * @throws         :Null.
 */
     private boolean displayTypeExists(String displayTypeId) {
    	 Debug.print("AdvertiseSessionBean displayTypeExists");
    	 //if (displayTypeId != this.displayTypeId) {
    	 try {
    		 String dispId = db.findDispIdByPrimaryKey(displayTypeId);
    		 Debug.print("AdvertiseSessionBean displayTypeExists" + displayTypeId );
    		 //this.displayTypeId = displayTypeId;
    		 } catch (Exception ex) {
    			 return false;
    			 }
    	 // }
    	 Debug.print("Display Id :" + displayTypeId);
    	 return true;
    	 }
     /**
      * @Method Name    :deleteDisplayType.
      * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
      * @param          :String displayTypeId.
      * @return         :boolean value.
      * @throws         :RemoteException, FinderException.
      */
        public boolean deleteDisplayType(String displayTypeId) throws RemoteException,FinderException{
            Debug.print("AdvertiseSessionBean deleteDisplayType");
            //Debug.print("Issue ID:" + issueId);
            boolean result = false;
            if (displayTypeId == null) {
                throw new EJBException("Diplay Type ID can't be empty");
            }
            if (displayTypeExists(displayTypeId) == false) {
                //throw new EJBException("Diplay Type ID does not  Exists" + displayTypeId);
                result = false;
            }
            else{
                try {
                	result = db.displayDeleteRow(displayTypeId);
                } catch (Exception ex) {
                      result = false;
                      throw new EJBException("deleteDisplayType: " + ex.getMessage());
                }
                finally{
                    return result;
                }
            }
            return result;
            }
        /**
         * @Method Name    :createDimension.
         * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
         * @param          :String dimensionTypeName.
         * @return         :boolean value.
         * @throws         :RemoteException.
         */   
           public boolean createDimension(String dimensionTypeName ) throws RemoteException{
               Debug.print("AdvertiseSessionBean createDimension");
               boolean result = false;
               try{
                   if (dimNameExists(dimensionTypeName) == false) {
                       Debug.print("This name is already Exists");
                       result = false;
                       // throw new EJBException("PlanName Already Exist" + planName);
                   }
                   else{
                       result = db.createDim(dimensionTypeName);
                   }
               }
               catch(Exception exp){
                   //throw new EJBException("createMedia Details: " + exp.getMessage());
                   exp.printStackTrace();
               }
               finally{
                   return result;
               }   
               }
           /**
            * @Method Name    :dimNameExists.
            * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
            * @param          :String dimensionTypeName.
            * @return         :boolean value.
            * @throws         :Null.
            */  
              private boolean dimNameExists(String dimensionTypeName) {
                  Debug.print("AdvertiseSessionBean dimNameExists");
                  boolean result = true;
                 // if (!(dimensionTypeName.equalsIgnoreCase(this.dimensionTypeName))) {
                      try {
                         String  dName = (String) db.findByDimensionTypeName(dimensionTypeName);
                    /*     Iterator e = dName.iterator();
                         while(e.hasNext()){
                             HLCDimensionLocal objDimLocalRemote = (HLCDimensionLocal)e.next();
                             String dimName = objDimLocalRemote.getDimensionTypeName();
                             */
                             if(dName!=null){
                                 //this.dimensionTypeName = dimensionTypeName;
                                 result = false;
                                 Debug.print("Inside  dimNameExists:" + dimensionTypeName);
                                 //break;
                             }
                       //  }
                      } catch (Exception ex) {
                           result = false;
                           Debug.print("Exception:" + ex.getMessage());
                      }
                /*  }
                  else{
                       result = false;
                  }
                  */
                  Debug.print("Dimension Name Outer Most" + result);
                  return result;
                  }
              /**
               * @Method Name    :editDimension.
               * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
               * @param          :String dimensionTypeId, String dimensionTypeName.
               * @return         :boolean value.
               * @throws         :RemoteException.
               */   
                 public boolean editDimension(String dimensionTypeId, String dimensionTypeName) throws RemoteException{
                     Debug.print("AdvertiseSessionBean editDimension");
                     boolean result = false;
                     try{
                         if (dimensionTypeId == null ) {
                             throw new EJBException("Dimension ID can't be empty");
                         }
                         
                         if (dimNameEditExists(dimensionTypeId,dimensionTypeName) == false) {
                             Debug.print("AdvertiseSessionBean editMedia This name is already Exists");
                             result = false;
                            // throw new EJBException("PlanName Already Exist" + planName);
                         }
                         else{
                             if (dimensionExists(dimensionTypeId) == false) {
                                 Debug.print("Dimension ID does not Exists" + dimensionTypeId);
                                 //throw new EJBException("Dimension ID does not Exists" + dimensionTypeId);
                                 result = false;
                             }
                             else{
                            	 result = db.editDimensionDetails(dimensionTypeId, dimensionTypeName);
                             }
                         }
                     }
                     catch(Exception exp){
                         exp.printStackTrace();
                     }
                     finally{
                         return result;
                     }
                     }
                 /**
                  * @Method Name    :dimNameEditExists.
                  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                  * @param          :String dimensionTypeId, String dimensionTypeName.
                  * @return         :boolean value.
                  * @throws         :Null.
                  */  
                    private boolean dimNameEditExists(String dimensionTypeId, String dimensionTypeName) {
                        Debug.print("AdvertiseSessionBean dimNameEditExists");
                        boolean result = true;
                       // if (!(dimensionTypeName.equalsIgnoreCase(this.dimensionTypeName))) {
                            try {
                            	String  dName = (String) db.findByDimensionEditTypeName(dimensionTypeId,dimensionTypeName);
                             /*  Iterator e = dName.iterator();
                               while(e.hasNext()){
                                   HLCDimensionLocal objDimLocalRemote = (HLCDimensionLocal)e.next();
                                   String dimName = objDimLocalRemote.getDimensionTypeName();
                                   */
                                   if(dName!=null){
                                      // this.dimensionTypeName = dimensionTypeName;
                                       result = false;
                                       Debug.print("Inside  dimNameEditExists:" + dimensionTypeName);
                                       //break;
                                   }
                               //}
                            } catch (Exception ex) {
                                 result = false;
                                 Debug.print("Exception:" + ex.getMessage());
                            }
                       /* }
                        else{
                             result = false;
                        }
                        */
                        Debug.print("EditDimension Name Outer Most" + result);
                        return result;
                    }
                    /**
                     * @Method Name    :dimensionExists.
                     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                     * @param          :String dimensionTypeId.
                     * @return         :boolean value.
                     * @throws         :Null.
                     */  
                       private boolean dimensionExists(String dimensionTypeId) {
                           Debug.print("AdvertiseSessionBean dimensionExists");
                           //if (dimensionTypeId != this.dimensionTypeId) {
                               try {
                                   String dimExitId = db.findDimExistByPrimaryKey(dimensionTypeId);
                                   //this.dimensionTypeId = dimensionTypeId;
                               } catch (Exception ex) {
                                   return false;
                               }
                           //}
                           Debug.print("Dimension Id :" + dimensionTypeId);
                           return true;
                       }
                       /**
                        * @Method Name    :deleteDimension.
                        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                        * @param          :String dimensionTypeId.
                        * @return         :boolean value.
                        * @throws         :RemoteException, FinderException.
                        */   
                          public boolean deleteDimension(String dimensionTypeId) throws RemoteException,FinderException{
                              Debug.print("AdvertiseSessionBean deleteDimension");
                              Debug.print("Dimesion ID:" + dimensionTypeId);
                              boolean result = false;
                              if (dimensionTypeId == null) {
                                  throw new EJBException("Dimension ID can't be empty");
                              }
                              if (dimensionExists(dimensionTypeId) == false) {
                                  throw new EJBException("Dimension ID does not  Exists" + dimensionTypeId);
                              }
                              try {
                            	  result = db.deleteDimRow(dimensionTypeId);
                              } catch (Exception ex) {
                                    throw new EJBException("deleteDimension: " + ex.getMessage());
                              }
                              finally{
                                  return result;
                              }   
                          }
                 
              
                        
                     

            
   
             
             
             
             
             
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {

            try {
            	 
                 HLCAdvertiseSessionBean advBean=new HLCAdvertiseSessionBean(); 
                 HttpSession session = request.getSession(false);
/*
 * redirects to home advertisement home page.............
 */
                String advProcess = request.getParameter("advProcess");
                if(advProcess.equals(HOME)){
                    Debug.print("Home page is caliing.......");
                    return new ModelAndView("frmAdvHome");
                }
 /*
 * redirects to media page frmAdvMediaAdd.jsp..................
 */                
                else if(advProcess.equals(NEWMEDIA)){
                    try{
                    	return new ModelAndView("frmAdvMediaAdd");
                    }
                    catch(Exception advNewMedia){
                        Debug.print("Exception in Action Advertisement Media Redirection:::::::"+ advNewMedia);
                    }
                }
/*
 *media values insertion..................
 */
                 else if(advProcess.equals(INSERTMEDIA)){
                    try{
                     
                     String mediaName = request.getParameter("mediaName");
                     String mediaDesc = request.getParameter("mediaDescription");
                      if(mediaName!=null){
                            mediaName = mediaName.trim();
                       }
                     boolean resultInsert = this.createMedia(mediaName,mediaDesc); 
                        if(resultInsert==true){
                            return new ModelAndView("frmAdvMediaConfirmation"); 
                            }
                         else{
                                request.setAttribute("err","status");
                                return new ModelAndView("frmAdvMediaAdd");
                         }
                         
                     }
                    catch(Exception eInsertMedia){
                        Debug.print("Exception in Action Advertisement Media Insertion:::::::" + eInsertMedia);
                        
                    }
                }
/*
 *update the edited media informations..........
 */
            else if(advProcess.equals(EDITMEDIA)){
                String mediaId = request.getParameter("mediaId");
                String mediaName = request.getParameter("mediaName");
                String mediaDesc = request.getParameter("mediaDescription");
                boolean mediaStatus = db.getMediaStatus(mediaId);
               if(mediaName!=null){
                      mediaName = mediaName.trim();
              }
                boolean resultEdit =  this.editMedia(mediaId, mediaName, mediaDesc, mediaStatus);
                Debug.print("Result:" + resultEdit);
                        if(resultEdit==true){
                        	Vector <String []> mediaAllList = new Vector();
                        	 ArrayList mediaAllDet = (ArrayList)db.getAllMediaDetails();
                        	 Iterator eById = mediaAllDet.iterator();
                             while(eById.hasNext()){
                          	   String [] mediaDet = (String [])eById.next();
                      	   String media_IdVal  = mediaDet[0];
                             String media_Name =  mediaDet[1];
                             String media_Desc =  mediaDet[2];
                             String media_Status = mediaDet[3];
                             String media [] = {media_IdVal,media_Name,media_Desc,media_Status};
                             mediaAllList.add(media);
                             }
                             session.setAttribute("objSesAdvLstMedia" ,null);
                             session.setAttribute("objSesAdvLstMedia" ,mediaAllList); 	
                              return new ModelAndView("frmAdvMediaList"); 
                            }
                        else{
                                request.setAttribute("err","st");
                                return new ModelAndView("frmAdvMediaEdit");
                         }
                
             }       
                
/*
 *getting the media id values  and redirects to frmAdvMediaEdit.jsp......................
 */
            else if(advProcess.equals(EDITDELETEMEDIA)){
             try{
                String advButValue = request.getParameter("advButValue");
                String mediaId = request.getParameter("mediaId");
                Debug.print("mediaId" + mediaId);
               
                
               // HttpSession hsAdv = request.getSession(true);
                 session.setAttribute("objSesAdvEditMedia",null);
                        if(advButValue.equals("Edit")){
                            
                        	 ArrayList resultById = db.getMediaDetails(mediaId);
                             Iterator eById = resultById.iterator();
                             while(eById.hasNext()){
                          	   String [] mediaDet = (String [])eById.next();
                      	   String mediaIdVal  = mediaId;
                             String mediaName =  mediaDet[0];
                             String mediaDesc =  mediaDet[1];
                             String mediaStatus = mediaDet[2];
                             String media [] = {mediaIdVal,mediaName,mediaDesc,mediaStatus};
                             session.setAttribute("objSesAdvEditMedia",null);                       
                             session.setAttribute("objSesAdvEditMedia",media);
                             //mediaList.add(media);
                             }
                           
                            
                            return new ModelAndView("frmAdvMediaEdit");
                           
                      }
            
/*
 *getting the media id values  and redirects to frmAdvMediaDelete.jsp......................
 */
               
                     else if(advButValue.equals("Delete")){
                          
                            ArrayList sDelete = db.getMediaDetails(mediaId);
                            Iterator eById = sDelete.iterator();
                            while(eById.hasNext()){
                         	   String [] mediaDet = (String [])eById.next();
                     	   String mediaIdVal  = mediaId;
                            String mediaName =  mediaDet[0];
                            String mediaDesc =  mediaDet[1];
                            String mediaStatus = mediaDet[2];
                            String media [] = {mediaIdVal,mediaName,mediaDesc,mediaStatus};
                            session.setAttribute("objSesAdvDeleteMedia" ,null);
                            session.setAttribute("objSesAdvDeleteMedia" ,media);
                            }
                            
                            return new ModelAndView("frmAdvMediaDelete"); 
                    
                        }
                }
               
                   
               
             catch(Exception eAdvMaupEditDelete){
                 Debug.print("Exception in Action Advertisement Media Edit & Delete:::::::" + eAdvMaupEditDelete);
              }
            }
                
/*
 *getting the media id values frmAdvMediaDelete.jsp for confirmation......................
 */
             else if(advProcess.equals(CONFIRMDELETEMEDIA)){
             try{
                    String advButton = request.getParameter("advButton");
                    String mediaId = request.getParameter("mediaId");
                    System.out.println("media id inside conf delete::::::::::"+mediaId);
                        
                        if(advButton.equals("Confirm Delete")){
                       
                            boolean resultDelete = this.deleteMedia(mediaId);
                            System.out.println("media delete status :::::::::::::::"+resultDelete);
                            if(resultDelete == true){
                            	Vector v = this.getAllMediaDetails();
                                session.setAttribute("objSesAdvLstMedia" ,null);
                                session.setAttribute("objSesAdvLstMedia" ,v);
                                 return new ModelAndView("frmAdvMediaList"); 
                            }
                            else{
                                request.setAttribute("errStat","eConfirmDelete");
                                return new ModelAndView("frmAdvMediaList"); 
                            }
                      }
            
/*
 * cancelling the delete request for media.........................................
 */
                            else if(advButton.equals("Cancel")){
                                return new ModelAndView("frmAdvMediaList"); 
                         }
                  }
             catch(Exception eConfirmDelete){
                   Debug.print("Exception in Action Advertisement Media Edit & Delete:::::::" + eConfirmDelete);
                }
             
             }
 
/*
 * view all media detials and redirects to frmAdvMediaList.jsp.....................
 */
            else if(advProcess.equals(LISTMEDIA)){
              try{
                Vector v = (Vector)this.getAllMediaDetails();
                session.setAttribute("objSesAdvLstMedia" ,null);
                session.setAttribute("objSesAdvLstMedia" ,v);
                return new ModelAndView("frmAdvMediaList"); 
            }
              catch(Exception eLstMedia){
                  Debug.print("Exception in Action Advertisement Media List:::::::" + eLstMedia);
              }
            }
/*
 * redirects to frmAdvDimensionAdd.jsp......................
 */
            else if(advProcess.equals(NEWDIMENSION)){
                    return new ModelAndView("frmAdvDimensionAdd");
                    
            }
/*
 * creates the dimension details.........
 */
                 else if(advProcess.equals(INSERTDIMENSION)){
                    try{
                    String dimensionName = request.getParameter("txtDimensionName");
                     if(dimensionName!=null){
                            dimensionName = dimensionName.trim();
                       }
                     boolean resultInsDim = this.createDimension(dimensionName);
                        if(resultInsDim==true){
                          return new ModelAndView("frmAdvDimensionConfirmation");
                       }
                        else
                        {
                        request.setAttribute("err","st");
                        return new ModelAndView("frmAdvDimensionAdd");
                        }
                    }
                    catch(Exception eDimenInsert){
                        Debug.print("Exception occurs while inserting dimension value" +eDimenInsert);
                    }
                 }
/*
 *update the edited dimension details............................
 */
                else if(advProcess.equals(EDITDIMENSION)){
                try{
                String dimensionId = request.getParameter("dimensionId");
                String dimensionName = request.getParameter("txtDimensionEditName");
                 if(dimensionName!=null){
                            dimensionName = dimensionName.trim();
                  }
                boolean resultEDUP =  this.editDimension(dimensionId, dimensionName);
                Debug.print("resultEDUP:" + resultEDUP);
                     if(resultEDUP==true){
                            Vector v = (Vector)this.getAllDimensionDetails();
                            session.setAttribute("objSesAdvDimLst" ,v);
                            return new ModelAndView("frmAdvDimensionList"); 
                  }
                         else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmAdvDimensionEdit");
                     }
                     
               }
               catch(Exception eEditDim){
                   Debug.print("While editing the dimension :::;" + eEditDim);
               }
           }
/*
 * getting the dimension id form frmAdvDimensionLst.jsp for edit .....
 */
            else if(advProcess.equals(EDITDELETEDIMENSION)){
                 try{
                    String advDimButton = request.getParameter("advDimButton");
                    String dimensionId = request.getParameter("dimensionId");
 
                        session.setAttribute("objSesAdvEditDim",null);
                             if(advDimButton.equals("Edit")){
                                ArrayList dimDet = (ArrayList)db.getAllDimDetailsByDisId(dimensionId);
                                Iterator eById = dimDet.iterator();
                                while(eById.hasNext()){
                             	   String [] dimenDet = (String [])eById.next();
                                String dimId =  dimenDet[0];
                                String dimName =  dimenDet[1];
                                String dimStatus = dimenDet[2];
                                String dimDetails [] = {dimId,dimName,dimStatus};
                                //session.setAttribute("objSesAdvEditDim",null);                       
                                session.setAttribute("objSesAdvEditDim",dimDetails);
                                }
                                return new ModelAndView("frmAdvDimensionEdit");
                          }

/*
 * getting the dimension id form frmAdvDimensionLst.jsp for delete .....
 */
                     else if(advDimButton.equals("Delete")){
                    	 ArrayList dimDet = (ArrayList)db.getAllDimDetailsByDisId(dimensionId);
                         Iterator eById = dimDet.iterator();
                         while(eById.hasNext()){
                      	   String [] dimenDet = (String [])eById.next();
                         String dimId =  dimenDet[0];
                         String dimName =  dimenDet[1];
                         String dimStatus = dimenDet[2];
                         String sDimDel [] = {dimId,dimName,dimStatus};
                           session.setAttribute("objSesAdvDimDelete" ,sDimDel);
                        }
                         return new ModelAndView("frmAdvDimensionDelete"); 
                     }

                  }
             catch(Exception eAdvMaupEditDelete){
                 Debug.print("Exception in Action Advertisement Media Edit & Delete:::::::" + eAdvMaupEditDelete);
              }
         }
/*
 * getting dimension id from frmAdvDimensiondelete.jsp for confirmation.....
 */
             else if(advProcess.equals(CONFIRMDELETEDIM)){
             try{
                    String advButtonDim = request.getParameter("advButtonDim");
                     String dimensionId = request.getParameter("dimensionId");
                        
                        if(advButtonDim.equals("Confirm Delete")){
                       
                            boolean resultDelete = this.deleteDimension(dimensionId);
                            if(resultDelete == true){
                            Vector v = (Vector)this.getAllDimensionDetails();
                            session.setAttribute("objSesAdvDimLst" ,v);
                            return new ModelAndView("frmAdvDimensionList"); 
                            }
                            else{
                                request.setAttribute("errStat","eConfirmDelete");
                                return new ModelAndView("frmAdvDimensionList"); 
                            }
                            
                        }
            
/*
 * cancelling the delete request............
 */
                            else if(advButtonDim.equals("Cancel")){
                                return new ModelAndView("frmAdvDimensionList"); 
                         }
                  }
             catch(Exception eConfirmDelete){
                   Debug.print("Exception in Action Advertisement Media Edit & Delete:::::::" + eConfirmDelete);
                }
             
             }
                 
 /*
  * show all dimension details......
  */
            else if(advProcess.equals(LISTDIMENSION)){
                    Vector vDim = (Vector)this.getAllDimensionDetails();
                    session.setAttribute("objSesAdvDimLst",vDim);
                    return new ModelAndView("frmAdvDimensionList");
                    }                    
 
/*
 * redirects to issue add page.........................
 */
            else if(advProcess.equals(NEWISSUE)){
                    try{
                        Vector vIssue = (Vector)this.getAllMediaDetails();
                        session.setAttribute("objSesAdvIssueLst" ,null);
                        session.setAttribute("objSesAdvAddIssue" ,null);
                        session.setAttribute("objSesAdvAddIssue" ,vIssue);
                        return new ModelAndView("frmAdvIssueAdd");
                    }
                    catch(Exception eIssue){
                        Debug.print("while redirecting new issue page" + eIssue);
                        
                    }
            } 
            
/*
 * show all media details in issue list page......................
 *
 */
             else if(advProcess.equals(LISTISSUE)){
                   try {
                        
                        Vector vIssue = (Vector)this.getAllMediaDetails();
                        session.setAttribute("objSesAdvIssueLst" ,null);
                        session.setAttribute("objSesAdvMediaIssue" ,vIssue);
                        return new ModelAndView("frmAdvIssueList");
                      }
                   
                   catch(Exception eLstIssue){
                       Debug.print("while listing the isuuess...." + eLstIssue);
                       
                   }
                     
            }
  /*
   * based on media id show issue details..................
   *
   */              
            else if(advProcess.equals("advIssueTypeShow")){
                    
                String mid = request.getParameter("mid");
                
                Vector vIssue = (Vector)this.getAllMediaDetails();
                session.setAttribute("objSesAdvMediaIssue" ,vIssue);
                        
                Vector vIs = (Vector)this.getIssueByMedia(mid);
                session.setAttribute("objSesAdvIssueLst",null);
                session.setAttribute("objSesAdvIssueLst",vIs);
                request.setAttribute("mid",mid);
                return new ModelAndView("frmAdvIssueList");
            }   
       
           
/*
 * create issue details..................
 */
                 else if(advProcess.equals(INSERTISSUE)){
                    try{
                     String mediaId = request.getParameter("mediaId");
                     String issueName = request.getParameter("txtIsssueName");
                      if(issueName!=null){
                            issueName = issueName.trim();
                       }
                     boolean resultIssue = this.createIssue(issueName,mediaId);
                         if(resultIssue==true){
                             return new ModelAndView("frmAdvIssueConfirmation");
                            }
                         else{
                             request.setAttribute("err","st");
                             return new ModelAndView("frmAdvIssueAdd");
                         }
                         
                     }
                    catch(Exception eInsertIssue){
                        Debug.print("Exception in Action Advertisement Issue Insertion:::::::" + eInsertIssue);
                        
                    }
                }
/*
 * update the edited issue details.....................
 */
             else if(advProcess.equals(EDITDELETEISSUE)){
                 try{
                    String advIssueButton = request.getParameter("advIssueButton");
                    String issue_id = request.getParameter("issue_id");
                    Debug.print("Servlet IssueId in issue section"  + issue_id);

                    HttpSession hsEdit = request.getSession(true);
                    hsEdit.setAttribute("objSesAdvEditIssue",null);
                        if(advIssueButton.equals("Edit")){
                                Vector vIssue = (Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvDelIssueMedia",null);
                                session.setAttribute("objSesAdvDelIssue",null);
                                session.setAttribute("objSesAdvEditIssueMedia" ,vIssue);
                                String[] s = this.getIssueDetails(issue_id); 
                                session.setAttribute("objSesAdvEditIssue",s);
                                return new ModelAndView("frmAdvIssueEdit");
                          }

/*
 * getting issue id for delete issue details.....
 */
                         else if(advIssueButton.equals("Delete")){
                                    Vector vIssue = (Vector)this.getAllMediaDetails();
                                    session.setAttribute("objSesAdvDelIssueMedia",null);
                                    session.setAttribute("objSesAdvDelIssue",null);
                                    session.setAttribute("objSesAdvDelIssueMedia" ,vIssue);
                                    String[] s = this.getIssueDetails(issue_id); 
                                    session.setAttribute("objSesAdvDelIssue",s);
                                    return new ModelAndView("frmAdvIssueDelete"); 
                           }
                   }
             catch(Exception eAdvIssueEditDelete){
                 Debug.print("Exception in Action Advertisement Issue Edit & Delete:::::::" + eAdvIssueEditDelete);
              }
         }
                
 /*
  * for issue details confirmation........
  */
             else if(advProcess.equals(CONFIRMDELETEISS)){
             try{
                     String advIssueButton = request.getParameter("advIssueButton");
                     String issueId = request.getParameter("issueId");
                     String mid = request.getParameter("mediaNewid");   
           
                     if(advIssueButton.equals("Confirm Delete")){
                       
                            boolean resultDelete = this.deleteIssue(issueId);
                            if(resultDelete == true){
                                Vector v = (Vector)this.getIssueByMedia(mid);
                                session.setAttribute("objSesAdvIssueLst",null);
                                session.setAttribute("objSesAdvIssueLst",v);
                                request.setAttribute("mid",mid);
                                Debug.print("mid true part servlet" + mid);
                                
                                Vector vIssue = (Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvIssueLst" ,null);
                                session.setAttribute("objSesAdvMediaIssue" ,vIssue);
                                return new ModelAndView("frmAdvIssueList");
                            }
                            else{
                            
                                Vector v = (Vector)this.getIssueByMedia(mid);
                                HttpSession hsIssue = request.getSession(true);
                                hsIssue.setAttribute("objSesAdvIssueLst",v);
                                request.setAttribute("mid",mid);
                                Debug.print("mid false part servlet" + mid);
                                request.setAttribute("errStat","eConfirmDelete");
                                
                                Vector vIssue = (Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvIssueLst" ,null);
                                session.setAttribute("objSesAdvMediaIssue" ,vIssue);
                                return new ModelAndView("frmAdvIssueList");
                            }
                            
                        }
 /*
  * cancelling the delete request....
  */
                         else if(advIssueButton.equals("Cancel")){
                                Vector v = (Vector)this.getIssueByMedia(mid);
                                HttpSession hsIssue = request.getSession(true);
                                hsIssue.setAttribute("objSesAdvIssueLst",v);
                                return new ModelAndView("frmAdvIssueList");
                             }
                  }
             catch(Exception eConfirmDelete){
                   Debug.print("Exception in Action Advertisement Issue Edit & Delete:::::::" + eConfirmDelete);
                }
             
             }
 
/*
 * update edited issue information details.........
 */
            else if(advProcess.equals(EDITISSUE)){
                try{
                String issueId = request.getParameter("issueId");
                Debug.print("ActionissueId" + issueId );
                String issueName = request.getParameter("txtIssueName");
                 Debug.print("ActionissueName" + issueName );
                String mediaId = request.getParameter("mediaNewid");
                Debug.print("ActionmediaId" + mediaId );
                 if(issueName!=null){
                            issueName = issueName.trim();
                 }
                boolean result =  this.editIssue(issueId,issueName,mediaId);
                Debug.print("resultEDUP:" + result);
                     if(result==true){
                            Vector v = (Vector)this.getIssueByMedia(mediaId);
                            HttpSession hsIssue = request.getSession(true);
                            hsIssue.setAttribute("objSesAdvIssueLst",null);
                            hsIssue.setAttribute("objSesAdvIssueLst",v);
                            request.setAttribute("mid",mediaId);
                            return new ModelAndView("frmAdvIssueList");
                        }
                     else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmAdvIssueEdit");
                     }
               }
               catch(Exception eEditIssue){
                   Debug.print("While editing the issue :::;" + eEditIssue);
               }
           }  
/*
 * redirects to new display type page..........
 */
            else if(advProcess.equals( NEWDISPTYPE)){
                    try{
                        Vector vIssue = (Vector)this.getAllMediaDetails();
                        HttpSession hs = request.getSession(true);
                        hs.setAttribute("objSesAdvAddDisp" ,null);
                        hs.setAttribute("objSesAdvAddDisp" ,vIssue);
                        return new ModelAndView("frmAdvDisplayTypeAdd");
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting new display type page" + eDisp);
                        
                    }
            } 
/*
 * creates the display type details.....
 */
                 else if(advProcess.equals(INSERTDISPTYPE)){
                    try{
                        String mediaDispId = request.getParameter("mediaDispId");
                        String txtDisplayType = request.getParameter("txtDisplayType");
                        if(txtDisplayType!=null){
                            txtDisplayType = txtDisplayType.trim();
                       }
                        String txtareaDisplayTypeDesc = request.getParameter("txtareaDisplayTypeDesc");
                        boolean resultDisp = this.createDisplayType(txtDisplayType,mediaDispId,txtareaDisplayTypeDesc);
                        if(resultDisp==true){
                             return new ModelAndView("frmAdvDispTypeConfirmation");
                            }
                         else{
                            request.setAttribute("err","st");
                             return new ModelAndView("frmAdvDisplayTypeAdd");
                            
                         }
                         
                     }
                    catch(Exception eInsertDispType){
                        Debug.print("Exception in Action Advertisement Disp Type Insertion:::::::" + eInsertDispType);
                        
                    }
                }
 /*
  * initially load all media detials in display list page............
  */
            else if(advProcess.equals(LISTDISPTYPE)){
                   try {
                        session.setAttribute("objSesAdvDispType",null);
                        session.setAttribute("objSesAdvDispTypeMedia" ,null);
                        Vector vMedia = (Vector)this.getAllMediaDetails();                   
                        session.setAttribute("objSesAdvDispTypeMedia" ,vMedia);
                        return new ModelAndView("frmAdvDisplayTypeList");
                   }
                   catch(Exception eLstDisp){
                       Debug.print("while listing the isuuess...." + eLstDisp);
                      }
            }
/*
 * based on media id show advertisement type details......
 */
            else if(advProcess.equals("advDispTypeLstShow")){
               try{
                String mid = request.getParameter("mid");
               
                Vector vMedia = (Vector)this.getAllMediaDetails();  
                session.setAttribute("objSesAdvDispTypeMedia" ,vMedia);
                
                Vector displayType = (Vector)this.getMediaDisplayTypeDetails(mid);
                session.setAttribute("objSesAdvDispType",null);
                session.setAttribute("objSesAdvDispType" ,displayType);
                request.setAttribute("mid",mid);
                return new ModelAndView("frmAdvDisplayTypeList");
               }
               catch(Exception showDisp){
                   Debug.print("Exception in display page" + showDisp);
               }
             }    
 /*
  * getting display id for editing the ad type details....
  */
             else if(advProcess.equals(EDITDELETEDISPTYPE)){
                 try{
                    String advButtonDisp = request.getParameter("advButtonDisp");
                    String display_id = request.getParameter("display_id");
                    
                    Debug.print("display_id Servlet in display type edit" + display_id);
                  
                    session.setAttribute("objSesAdvEditDisp",null);
                        if(advButtonDisp.equals("Edit")){
                        
                                Vector vIssue = (Vector)this.getAllMediaDetails();
                                
                                session.setAttribute("objSesAdvEditDispMedia" ,null);
                                session.setAttribute("objSesAdvEditDispMedia" ,vIssue);
                                
                                ArrayList dispList = db.getAllDisplayDetails(display_id);
                                Iterator eById = dispList.iterator();
                                while(eById.hasNext()){
                             	   String [] displayDet = (String [])eById.next();
                         	   String display_IdVal  = display_id;
                                String display_Name =  displayDet[0];
                                String midIdinDisp = displayDet[1];
                                String display_Desc =  displayDet[2];
                                String display_Status = displayDet[3];
                                String sDisp [] = {display_IdVal, display_Name, midIdinDisp, display_Desc, display_Status};
                                session.setAttribute("objSesAdvEditDisp",null);                       
                                session.setAttribute("objSesAdvEditDisp",sDisp);
                                }
                                
                                return new ModelAndView("frmAdvDisplayTypeEdit");
                          }
/*
  * getting display id for deleting the ad type details....
  */               
                     else if(advButtonDisp.equals("Delete")){
                                                        
                                Vector vMedia =(Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvMediaDispType",vMedia);
                                ArrayList DeleteList = db.getAllDisplayDetails(display_id);
                                Iterator eById = DeleteList.iterator();
                                while(eById.hasNext()){
                             	   String [] deleteDis = (String [])eById.next();
                         	   String display_IdVal  = display_id;
                                String display_Name =  deleteDis[0];
                                String midIdinDisp = deleteDis[1];
                                String display_Desc =  deleteDis[2];
                                String display_Status = deleteDis[3];
                                String sDisp [] = {display_IdVal, display_Name, midIdinDisp, display_Desc, display_Status};
                                session.setAttribute("objSesAdvDispTypeDelete",null);
                                session.setAttribute("objSesAdvDispTypeDelete",sDisp);
                                }
                                return new ModelAndView("frmAdvDisplayTypeDelete");
                                
                        }
                                }
             catch(Exception eAdvDispEditDelete){
                 Debug.print("Exception in Action Advertisement Display type Edit & Delete:::::::" + eAdvDispEditDelete);
              }
         }
/*
  * update edited  display details.......
  */
            else if(advProcess.equals(EDITDISPTYPE)){
                try{
                String displayId = request.getParameter("displayId");
                String txtDisplayType = request.getParameter("txtDisplayType");
                String mediaDispId = request.getParameter("mediaDispId");
                String txtareaDisplayTypeDesc = request.getParameter("txtareaDisplayTypeDesc");
                if(txtDisplayType!=null){
                            txtDisplayType = txtDisplayType.trim();
                }
                boolean result =  this.editDisplayType(displayId,txtDisplayType,mediaDispId,txtareaDisplayTypeDesc);
                Debug.print("resultEDUP:" + result);
                     if(result==true){
                                Vector vDisp = (Vector)this.getMediaDisplayTypeDetails(mediaDispId);
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispTypeMedia" ,null);
                                Vector vMedia = (Vector)this.getAllMediaDetails();                   
                                session.setAttribute("objSesAdvDispTypeMedia" ,vMedia);
                                
                                return new ModelAndView("frmAdvDisplayTypeList");
                      }
                     else{
                            request.setAttribute("err","st");
                            return new ModelAndView("frmAdvDisplayTypeEdit");
                          }
                 }
               catch(Exception eEditDisp){
                   Debug.print("While editing the eEditDispType :::;" + eEditDisp);
               }
           } 
/*
 * confirmation delete page for display type....
 */
             else if(advProcess.equals(CONFIRMDELETEDISPTYPE)){
             try{
                     String advButtonDisp = request.getParameter("advButtonDisp");
                     String displayId = request.getParameter("displayId");
                     String mid = request.getParameter("mediaId");   
                     Debug.print("mid value from servlet in display type is.......", mid);
                     if(advButtonDisp.equals("Confirm Delete")){
                       
                           boolean resultDelete = this.deleteDisplayType(displayId);
                           
                            if(resultDelete == true){
                               // Vector vDisp = (Vector)advBean.getMediaDisplayTypeDetails(mid);
                               // session.setAttribute("objSesAdvDispType",null);
                              //  session.setAttribute("objSesAdvDispType",vDisp);
                              //  Debug.print("mid true part servlet" + mid);
                            	session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispTypeMedia" ,null);
                                Vector vMedia = (Vector)this.getAllMediaDetails();                   
                                session.setAttribute("objSesAdvDispTypeMedia" ,vMedia);
                                return new ModelAndView("frmAdvDisplayTypeList");
                            }
                            else{
                            
                                //Vector vDisp = (Vector)advBean.getMediaDisplayTypeDetails(mid);
                               // session.setAttribute("objSesAdvDispType",null);
                               // session.setAttribute("objSesAdvDispType",vDisp);
                               // Debug.print("mid false part servlet" + mid);
                                request.setAttribute("errStat","eConfirmDelete");
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispTypeMedia" ,null);
                                Vector vMedia = (Vector)this.getAllMediaDetails();                   
                                session.setAttribute("objSesAdvDispTypeMedia" ,vMedia);
                                return new ModelAndView("frmAdvDisplayTypeList");
                            }
                            
                        }
 /*
  * cancelling the delete request for display type details....
  */
                         else if(advButtonDisp.equals("Cancel")){
                                Vector vDisp = (Vector)this.getMediaDisplayTypeDetails(mid);
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispType",vDisp);
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispTypeMedia" ,null);
                                Vector vMedia = (Vector)this.getAllMediaDetails();                   
                                session.setAttribute("objSesAdvDispTypeMedia" ,vMedia);
                                
                                return new ModelAndView("frmAdvDisplayTypeList");
                             }
                  }
             catch(Exception eConfirmDelete){
                   Debug.print("Exception in Action Advertisement Issue Edit & Delete:::::::" + eConfirmDelete);
                }
             
             }
  /*
   * initialliy load all media details into display sub type page.......
   */
          else if(advProcess.equals(NEWDISPSUBTYPE)){
                    try{
                     
                                Vector dispMediaType = (Vector)this.getAllMediaDetails();
                                 
                                session.setAttribute("objSesAdvMediaType",null);
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                                return new ModelAndView("frmAdvDisplaySubTypeAdd");
                    } 
                    catch(Exception eDispSubType){
                        Debug.print("while redirecting new display sub type page" + eDispSubType);
                        
                    }
            }
/*
 * based on media id show all display details. and getting display details also....
 */
              else if(advProcess.equals(GETTYPEID)){
                    try{
                            String mid = request.getParameter("mid");
                            Debug.print("Servlet mid" + mid);
                                Vector dispMediaType = (Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvMediaType",null);
                                session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
  
                                Vector displayType = (Vector)this.getMediaDisplayTypeDetailsForSub(mid);
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispType" ,displayType);
                                request.setAttribute("mid",mid);
                                return new ModelAndView("frmAdvDisplaySubTypeAdd");
                    } 
                    catch(Exception eDispSubType){
                        Debug.print("while redirecting new display sub type page" + eDispSubType);
                    }
            }
 /*
  * create display sub types details......
  */
         else if(advProcess.equals(INSERTDISPSUBTYPE)){
                    try{
                        String mediaId = request.getParameter("mediaId");
                        String DispId = request.getParameter("DispId");
                        String subTypeName = request.getParameter("txtDisplaySubType");
                        String subTypeDesc = request.getParameter("txtareaDesc");
                        
                        
                        Debug.print("Action mediaId" + mediaId);
                        Debug.print("Action DispIdDispId" +DispId);
                        Debug.print("Action subTypeName" + subTypeName);
                        Debug.print("Action subTypeDesc "+subTypeDesc);
                        
                        if(subTypeName!=null){
                            subTypeName = subTypeName.trim();
                       }
                        boolean resultDispSub = this.createDisplaySubType(subTypeName,DispId,subTypeDesc);
                        if(resultDispSub==true){
                             return new ModelAndView("frmAdvDispSubTypeConfirmation");
                        }
                         else{
                             request.setAttribute("err","st");
                             return new ModelAndView("frmAdvDisplaySubTypeAdd");
                         }
                    } 
                    catch(Exception eInsertDispSubType){
                        Debug.print("Exception in Action Advertisement Disp Type Insertion:::::::" + eInsertDispSubType);
                    }
                }   
/*
 * intially loading all media details.....
 */
             else if(advProcess.equals(LISTDISPSUBTYPE)){    
                try{
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesdispSubType", null);
                                Vector dispMediaType = (Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvMediaType",null);
                               
                                session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                                return new ModelAndView("frmAdvDisplaySubTypeList");
                    } 
                    catch(Exception eDispSubType){
                        Debug.print("while Listing new display sub type page" + eDispSubType);
                        
                    }  
             }
/*
 *based on media id load display details...
 */
              else if(advProcess.equals(GETLISTTYPEID)){
                    try{
                            String mid = request.getParameter("mid");
                            Debug.print("Servlet mid" + mid);
                             
                                session.setAttribute("objSesdispSubType", null);
                                Vector dispMediaType = (Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvMediaType",null);
                                session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                              
                               
                                Vector displayType = (Vector)this.getMediaDisplayTypeDetailsForSub(mid);
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispType" ,displayType);
                                
                                request.setAttribute("mid",mid);
                                return new ModelAndView("frmAdvDisplaySubTypeList");
                    } 
                    catch(Exception eDispSubType){
                        Debug.print("while Listing new display sub type page" + eDispSubType);
                    }
            }   
/*
 * display ad sub type details based on media id and display id....
 */
              else if(advProcess.equals("advDispSubTypeShow")){
                    try{
                            String mid = request.getParameter("mid");
                            Debug.print("Servlet mid" + mid);
                                Vector dispMediaType = (Vector)this.getAllMediaDetails();
                                 
                                session.setAttribute("objSesAdvMediaType",null);
                                session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                               
                                Vector displayType = (Vector)this.getMediaDisplayTypeDetailsForSub(mid);
                                
                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesAdvDispType" ,displayType);
                                request.setAttribute("mid",mid);
                        
                        String dispId = request.getParameter("dispId");
                        Debug.print("Servlet dispId" + dispId);
                        Vector dispSubType = (Vector)this.getDisplayTypeFromSubType(dispId);
                       
                        session.setAttribute("objSesdispSubType", null);
                        session.setAttribute("objSesdispSubType", dispSubType);
                        request.setAttribute("dispId",dispId);
                        return new ModelAndView("frmAdvDisplaySubTypeList");
                    }
                    catch(Exception eDispSubType){
                        Debug.print("eDispSubType::::::::::" + eDispSubType);
                   }
              }
  

  
 /*
  * getting media id and display type id for editing......
  */
             else if(advProcess.equals(EDITDELETEDISPSUBTYPE)){
               try {
                   Debug.print("edit method is calling.........");
                    String advButtonDispSub = request.getParameter("advButtonDispSub");
                    String subTypeId = request.getParameter("subTypeId");
                    Debug.print("subTypeId" + subTypeId );
                   
                    String mediaId = request.getParameter("mediaId");
                    
                    Debug.print("mediaId" + mediaId );
                   
                           if(advButtonDispSub.equals("Edit")){
                                String[] displaySubTypeDetails = this.getDisplaySubTypeDetails(subTypeId);
                              
                                session.setAttribute("DisplaySubTypeDetails", displaySubTypeDetails);
                                Debug.print("Display Sub Type Details" + displaySubTypeDetails);
                                
                                Vector mediaDetails = (Vector)this.getAllMediaDetails();
                                
                                session.setAttribute("DisplayMediaDetails",mediaDetails);
                                Debug.print("media Details vector:" + mediaDetails);
                                Vector dispalyDetails = (Vector)this.getMediaDisplayTypeDetailsForSub(mediaId);
                                session.setAttribute("DisplayTypeDetails",dispalyDetails);
                                Debug.print("Display details vector:" + dispalyDetails);
                                                            
                                request.setAttribute("mid",mediaId);
                                return new ModelAndView("frmAdvDisplaySubTypeEdit");
                        }
 

 /*
  * based on media id and display id redirects to delete page...
  */
                     else if(advButtonDispSub.equals("Delete")){
                                
                                String[] deleteSubTypeDetails = this.getDisplaySubTypeDetails(subTypeId);
                                session.setAttribute("deleteSubTypeDetails", deleteSubTypeDetails);
                                                               
                                Vector dispalyDetails = (Vector)this.getMediaDisplayTypeDetailsForSub(mediaId);
                                session.setAttribute("DisplayTypeDetails",dispalyDetails);
                                Debug.print("Display details vector:" + dispalyDetails);
                                
                                Vector mediaDetails = (Vector)this.getAllMediaDetails();
                                session.setAttribute("DisplayMediaDetails",mediaDetails);
                                Debug.print("media Details vector:" + mediaDetails);
                                
                                request.setAttribute("mid",mediaId);
                                return new ModelAndView("frmAdvDisplaySubTypeDelete");
                        }
                                }
             catch(Exception eAdvDispSubTypeEditDelete){
                 Debug.print("Exception in Action Advertisement Display type Edit & Delete:::::::" + eAdvDispSubTypeEditDelete);
              }
         }

  /*
   * update the edited display details....
   *
   */                     
            else if(advProcess.equals(EDITDISPSUBTYPE)){
                try{
                String mediaType = request.getParameter("mediaType");
                String displayType = request.getParameter("displayType");
                String dispSubTypeId = request.getParameter("dispSubTypeId");
                String txtDisplaySubType = request.getParameter("txtDisplaySubType");
                String txtAreaDesc = request.getParameter("txtAreaDesc");
                 if(txtDisplaySubType!=null){
                            txtDisplaySubType = txtDisplaySubType.trim();
                 }
                if(dispSubTypeId!=null){
                boolean resultEdit =  this.editDisplaySubType(dispSubTypeId,txtDisplaySubType,displayType,txtAreaDesc);
                Debug.print("resultEDUP:" + resultEdit);
                     if(resultEdit==true){
                    	  session.setAttribute("objSesAdvDispType",null);
                          session.setAttribute("objSesdispSubType", null);
                          Vector dispMediaType = (Vector)this.getAllMediaDetails();
                          session.setAttribute("objSesAdvMediaType",null);
                         
                          session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                          
                             return new ModelAndView("frmAdvDisplaySubTypeList");
                      }
                     else{
                            request.setAttribute("err","st");
                            return new ModelAndView("frmAdvDisplaySubTypeEdit");
                            
                         }
                 }
                }
               catch(Exception eEditDispSubType){
                   Debug.print("While editing the eEditDispSubType :::;" + eEditDispSubType);
               }
           } 

 /*
  * confirmation of delete details..
  */    
     else if(advProcess.equals(CONFIRMDELETEDISPSUBTYPE)){
             try{
                     String buttonSubType = request.getParameter("buttonSubType");
                     String dispalySubTypeId = request.getParameter("dispalySubTypeId");
                    
                     if(buttonSubType.equals("Confirm Delete")){
                       
                           boolean resultDelete = this.deleteDisplaySubType(dispalySubTypeId);
                           
                            if(resultDelete == true){
                            	 session.setAttribute("objSesAdvDispType",null);
                                 session.setAttribute("objSesdispSubType", null);
                                 Vector dispMediaType = (Vector)this.getAllMediaDetails();
                                 session.setAttribute("objSesAdvMediaType",null);
                                
                                 session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                               return new ModelAndView("frmAdvDisplaySubTypeList");
                            }
                            else{
                                request.setAttribute("errStat","eConfirmDelete");

                                session.setAttribute("objSesAdvDispType",null);
                                session.setAttribute("objSesdispSubType", null);
                                Vector dispMediaType = (Vector)this.getAllMediaDetails();
                                session.setAttribute("objSesAdvMediaType",null);
                               
                                session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                                return new ModelAndView("frmAdvDisplaySubTypeList");
                            }
                            
                        }
 /*
  *cancelling the display type delete request.
  */            
                         else if(buttonSubType.equals("Cancel")){

                             session.setAttribute("objSesAdvDispType",null);
                             session.setAttribute("objSesdispSubType", null);
                             Vector dispMediaType = (Vector)this.getAllMediaDetails();
                             session.setAttribute("objSesAdvMediaType",null);
                            
                             session.setAttribute("objSesAdvMediaType" ,dispMediaType);  
                                return new ModelAndView("frmAdvDisplaySubTypeList");
                             }
                  }
             catch(Exception DeleteSubType){
                   Debug.print("Display sub type Edit & Delete:::::::" + DeleteSubType);
                }
             
             }

//============================================GLOBAL TRY BLOCK END===================================================================
            }
          
//===============================================GLOBAL CATCH BLOCK================================================================            
            catch(Exception eAdvertise){
                Debug.print("In ActionAdvertise while calling advertise session bean::::::::" + eAdvertise );
            }
//============================================GLOBAL FORWARD METHOD===================================================================            
              return null;
        }       

    }
//=========================================THE END========================================================================================
       
