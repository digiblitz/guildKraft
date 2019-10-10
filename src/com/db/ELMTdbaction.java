/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
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
package com.db;

import java.rmi.RemoteException;
import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.FinderException;
import javax.ejb.ObjectNotFoundException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.jasypt.util.text.BasicTextEncryptor;

import com.hlccommon.util.HLCMenuListVO;
import com.hlcform.user.HLCArabianSeaEntityUserLocal;
import com.hlcform.util.DBHelper;
import com.hlcform.util.Debug;
import com.hlcform.util.HLCContactDetails;
import com.hlcform.util.HLCMemberUpdateDAO;
import com.hlcform.util.HLCPassword;
import com.hlcform.util.HLCUserMaster;
import com.hlcform.util.HLCUserSearchResultVO;
import com.hlcmeeting.util.HLCInstructorDetails;
import com.hlcmeeting.util.HLCPaymentDetails;
import com.hlcmember.type.util.HLCMembershipTypeMaster;
import com.hlcmrm.util.HLCDonationVO;
import com.hlcmrm.util.HLCPublicationVO;
import com.hlcmro.util.HLCEventRequestVO;
import com.hlcutil.HLCCalendarVO;
import com.hlcutil.HLCEventCalendarDAO;
import com.idoox.security.util.Random;

public class ELMTdbaction {
	
	
	public static final String dbName = "java:/HLCMSSQLDS";
    public Connection con = null;
    public PreparedStatement prepStmt = null;
    public ResultSet rs = null;
	
    HLCArabianSeaEntityUserLocal remote;
    
    public int totalMessageCount(String toUserId) {
        Debug.print("GeneralDBAction.totalMessageCount():" + toUserId);
        int count = 0;
     
        makeConnection();
        try {
            String selectStatement = " SELECT count(*) from tblMessages where view_status = 0 and to_user_id= ? ";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, toUserId);
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            Debug.print("GeneralDBAction.totalMessageCount():" + count);
        } catch (SQLException sql) {
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.totalMessageCount():" + sql.getMessage());
        } catch (Exception e) {
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.totalMessageCount():" + e.getMessage());
        }
        return count;
    }
	
    /*=================================Insert Event Registration Request==========================================*/

    private long getNextId() throws SQLException {
        Debug.print("VaigaiSessionBean getNextId");
        makeConnection();
       //For Debugs Starts Here
       // String selectStatement = "SELECT max(event_id) from " + DBHelper.USEA_MMS_EVENTDETAILS;
        String selectStatement = "select max(event_id) as max_event_id from ((select event_id from tbloeprovisionalcalendar)union (select event_id from tblMeeEventDetails)) as max_query";
        //For Debugs Ends Here

        PreparedStatement prepSelect = con.prepareStatement(selectStatement);

        ResultSet rs = prepSelect.executeQuery();
        rs.next();
        long nextId = rs.getLong(1);
        
        if(nextId==0){
            nextId = 10000;
        }
        else{
            nextId = nextId+1;
        }
        rs.close();
        prepSelect.close();
        releaseConnection();
        return nextId;
    }
    
    
    public String insertEventRequestDetails(HLCEventRequestVO requestVO, String userId) throws SQLException, RemoteException {
        String result = "";
        String eventId="";
        Debug.print("UserId in EventsDAO" + userId);
        //eventId =  getMaxEventId();
        eventId =  String.valueOf(getNextId());
        requestVO.setEvent_id(eventId);
        PreparedStatement prepStmt = null;
        try {
            makeConnection();

            String query = "insert into tblMeeEventDetails(event_id, organizer_id, event_title, event_begin_date, event_end_date, competition_location, competition_city," +
                    "competition_state, competition_country, competition_zip, championship_area, status_id, issue_id, user_id) values " +
                    " (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            prepStmt = con.prepareStatement(query);
            prepStmt.setString(1, requestVO.getEvent_id());
            prepStmt.setString(2, requestVO.getOrganizer_id());
            prepStmt.setString(3, requestVO.getEvent_title());
            prepStmt.setDate(4, DBHelper.toSQLDate(requestVO.getEveBegDate()));
            prepStmt.setDate(5, DBHelper.toSQLDate(requestVO.getEveEndDate()));
            prepStmt.setString(6, requestVO.getCompetition_location());
            prepStmt.setString(7, requestVO.getCompetition_city());
            prepStmt.setString(8, requestVO.getCompetition_state());
            prepStmt.setString(9, requestVO.getCompetition_country());
            prepStmt.setString(10, requestVO.getCompetition_zip());
            prepStmt.setString(11, requestVO.getChampionship_area());
            prepStmt.setString(12, requestVO.getStatus_id());
            prepStmt.setString(13, requestVO.getIssueId());
            prepStmt.setString(14, userId);
            int count = prepStmt.executeUpdate();
            if (count > 0) {
                result = eventId;
            }
            Debug.print("Event Details successfully inserted into MeeEventDetails:" + result);
            prepStmt.close();
            releaseConnection();
        } catch (SQLException sql) {
            releaseConnection();
            Debug.print("SQL Exception in insertEventRequestDetails:" + sql.getMessage());
            sql.printStackTrace();
        } catch (Exception e) {
            releaseConnection();
            Debug.print("General Exception  in insertEventRequestDetails:" + e.getMessage());
            e.printStackTrace();
        } finally {
            releaseConnection();
        }
        return result;
    }


    public String insertEventTypeDetails(String eventId, ArrayList mapping_ids) throws SQLException {
    String result = "fail";
    PreparedStatement prepStmt = null;
    String map_id=null;
    System.out.println("parasu eventId :----->"+eventId);
    makeConnection();
    try {
        if (mapping_ids != null) {
            if (mapping_ids.size() > 0) {
                Iterator itr = mapping_ids.iterator();
                while (itr.hasNext()) {
                    String[] mapss_id = (String[]) itr.next();
                    String typeid = mapss_id[0];
                    String levelid=mapss_id[1];
                    
                    System.out.println("parasu typeid :----->"+typeid);
                    System.out.println("parasu levelid :----->"+levelid);
                    
                    if (typeid != null && levelid != null) {
                        String query = "select map_type_id from tblMeeMapEventLevel where event_type_id = ? and event_level_id = ? ";

                        prepStmt = con.prepareStatement(query);
                        prepStmt.setString(1, typeid);
                        prepStmt.setString(2, levelid);

                        ResultSet rs = prepStmt.executeQuery();

                        while (rs.next()) {
                             map_id = rs.getString(1);
                             System.out.println("parasu next map_id :----->"+map_id);   
                        }
                    }
                    
                    if (map_id != null && eventId != null) {
                        String query = "insert into tblMeeEventTypeDetails(event_id, map_type_id) values (?,?)";

                        prepStmt = con.prepareStatement(query);
                        prepStmt.setString(1, eventId);
                        prepStmt.setString(2, map_id);

                        int count = prepStmt.executeUpdate();
                        if (count > 0) {
                            result = "success";
                        }
                    } else {
                        Debug.print("Null values in event r mapping Id " + map_id + " evntId " + eventId);
                    }
                }
            }
        }
    } catch (SQLException e) {
        Debug.print("SQLException " + e);
        e.printStackTrace();
    } catch (Exception e) {
        Debug.print("General Exception " + e);
        e.printStackTrace();
    } finally {
        releaseConnection();
    }
    return result;
}

    
    
    public ArrayList getAreaChairDetails(String status, int year, String memberId) throws SQLException {
        Debug.print("EventsDAO.getAreaChairDetails().. MemberId: " + memberId + "::Year:" + year + "::Status:" + status);
        PreparedStatement prepStmt = null;
        ArrayList eventRegList = new ArrayList();
        makeConnection();
        try {

            String sql = "select A.event_id, A.event_title,A.event_begin_date,A.event_end_date from tblMeeEventDetails A, tblMeeMapAreaChair B where A.championship_area = B.area_id " +
                    "and A.status_id = ? and year(A.event_begin_date) = ? and B.area_chair_id = ? ";

            prepStmt = con.prepareStatement(sql);
            prepStmt.setString(1, status);
            prepStmt.setInt(2, year);
            prepStmt.setString(3, memberId);
            ResultSet rs = prepStmt.executeQuery();

            while (rs.next()) {
                String event_id = rs.getString(1);
                String event_title = rs.getString(2);
                String event_begin_date = rs.getString(3);
                String event_end_date = rs.getString(4);
                String val[] = {event_id, event_title, event_begin_date, event_end_date};
                eventRegList.add(val);
            }
        } catch (SQLException sql) {
            releaseConnection();
            Debug.print("SQL Exception in getAreaChairDetails:" + sql.getMessage());
        } catch (Exception e) {
            releaseConnection();
            Debug.print("General Exception  in getAreaChairDetails:" + e.getMessage());
        } finally {
            if (prepStmt != null) {
                prepStmt.close();
            }

            releaseConnection();
        }
        return eventRegList;
    }
    
    public int getMaxEventId() throws RemoteException {

        int maxEventId = 0;

        try {
            makeConnection();
            System.out.println("Inside the Loop getAllMapTyLe");
            String sqlMaxEventId = "SELECT max(cast(event_id as int)) from tblMeeEventDetails";
            PreparedStatement prepStmt1 = con.prepareStatement(sqlMaxEventId);
            ResultSet rs1 = prepStmt1.executeQuery();
            System.out.println("max eventId:" + sqlMaxEventId);
            while (rs1.next()) {
                maxEventId = rs1.getInt(1);
            }
            prepStmt1.close();
            releaseConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maxEventId;
    }
    
 
    public boolean insertCalenderDetails(String new_EventId,String orgId,String eventTit,Date beginDat,Date endDat,String areaId,String stateId,int Year,String eventTypeNames,String eventLevelNames,String old_eventId) {
        Debug.print("insertCalenderDetails():");
        boolean result = false;
        PreparedStatement prepStmt = null;
        //Debug.print("UjaniDamEntityBean.insertCalenderDetails()CalendarId:" +calenderId);
        if(new_EventId!=null && new_EventId.trim().length()!=0){
            makeConnection();
            try {
                String insertStatement = "insert into tblOEProvisionalCalendar "+ 
                        " (event_id, organizer_id, event_title, begin_date, end_date, area_id, state_id, competition_year, event_type_id, event_levels, old_event_id)" +
                        " values (? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
                
                Debug.print("Query: "+insertStatement);
                prepStmt = con.prepareStatement(insertStatement);
                //prepStmt.setString(1, calenderId);
                prepStmt.setString(1, new_EventId);
                prepStmt.setString(2, orgId);
                prepStmt.setString(3, eventTit);
                prepStmt.setDate(4, DBHelper.toSQLDate(beginDat));
                prepStmt.setDate(5, DBHelper.toSQLDate(endDat));
                prepStmt.setString(6, areaId);
                prepStmt.setString(7, stateId);
                prepStmt.setInt(8,Year);
                prepStmt.setString(9,eventTypeNames);
                prepStmt.setString(10,eventLevelNames);
                prepStmt.setString(11,old_eventId);
                
                int cnt = prepStmt.executeUpdate();
                Debug.print("Record Inserted succefully into insertCalenderDetails "+cnt);
                if(cnt >=1) result = true;
                Debug.print("UjaniDamEntityBean insertCalenderDetails() Status :" + result);
                prepStmt.close();
                releaseConnection();
            } catch(SQLException sql){
                releaseConnection();
                Debug.print("SQL Exception in UjaniDamEntityBean.insertCalenderDetails():" + sql.getMessage());
            } catch(Exception e){
                releaseConnection();
                Debug.print("General Exception  in UjaniDamEntityBean.insertCalenderDetails():" + e.getMessage());
            }
        }
        return result;
    } 
    
    
    
    public ArrayList selectApprovedEveCalendarDets(String areaId){
        
        
        Debug.print("EventCalendarDAO.selectApprovedEveCalendarDets():");
        ArrayList proCalDet = new ArrayList();
        
        
        makeConnection();
         java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
        String currentDate = String.valueOf(tempDate).substring(5, 7) + "/" + String.valueOf(tempDate).substring(8, 10) + "/" + String.valueOf(tempDate).substring(0, 4);
        try {
            
            String selectStatement ="Select A.pro_calendar_id, A.organizer_id, A.begin_date, A.end_date, A.event_title,E.user_id, E.first_name, E.last_name, B.area_code, B.area_name, C.state_name, A.area_chair_approval_status, A.org_approval_status, A.usea_approval_status, A.event_id, A.old_event_id, A.oe_begin_date, A.oe_end_date from tblOEProvisionalCalendar A, tblMeeAreaMaster B, tblMeeStateMaster C, tblMemberDetails D, tblUserMaster E where A.area_id=B.area_id and A.state_id=C.state_id and D.user_id=E.user_id and A.organizer_id=D.member_id and A.area_chair_approval_status='Approved' and A.org_approval_status='Approved' and A.usea_approval_status='Approved' and A.end_date>='"+currentDate+"' order by A.begin_date asc";
           
            if(areaId!=null && areaId.trim().length()!=0){
            	 selectStatement ="Select A.pro_calendar_id, A.organizer_id, A.begin_date, A.end_date, A.event_title,E.user_id, E.first_name, E.last_name, B.area_code, B.area_name, C.state_name, A.area_chair_approval_status, A.org_approval_status, A.usea_approval_status, A.event_id, A.old_event_id, A.oe_begin_date, A.oe_end_date from tblOEProvisionalCalendar A, tblMeeAreaMaster B, tblMeeStateMaster C, tblMemberDetails D, tblUserMaster E where A.area_id=B.area_id and A.state_id=C.state_id and D.user_id=E.user_id and A.organizer_id=D.member_id and A.area_chair_approval_status='Approved' and A.org_approval_status='Approved' and A.usea_approval_status='Approved' and A.end_date>='"+currentDate+"' and B.area_id='" +areaId+"' order by A.begin_date asc";
            	 Debug.print("selectStatement in if --> "); 
            }
            Debug.print("selectStatement --> "+selectStatement);
            PreparedStatement prepSelect = con.prepareStatement(selectStatement);
            //prepSelect.setInt(1,year);
            ResultSet rs = prepSelect.executeQuery();
            HLCEventCalendarDAO eveCalDAO = new HLCEventCalendarDAO();
            ArrayList objEveLevels =new ArrayList();
            while(rs.next()){
                String proCalId = rs.getString(1);
                
           if(proCalId!=null && proCalId.trim().length()!=0){
               
              objEveLevels=eveCalDAO.selectEveLevTypDets(proCalId);  
           }     
                
                String organizerId = rs.getString(2);
                Date beginDate=rs.getDate(3);
                Date endDate=rs.getDate(4);
                String eventTitle=rs.getString(5);
                String userId=rs.getString(6);
                String firstName=rs.getString(7);
                String lastName=rs.getString(8);
                String areaCode=rs.getString(9);
                String areaName=rs.getString(10);
                String stateName=rs.getString(11);
                String areaChApprovStat=rs.getString(12);
                String orgApprovStat=rs.getString(13);
                String uStaffApprovStat=rs.getString(14);
                String newEveId=rs.getString(15);
                String oldEveId=rs.getString(16);
                Date entryStartDate=rs.getDate(17);
                Date entryCloseDate=rs.getDate(18);
                Debug.print("entryStartDate in selectApprovedEveCalendarDets: "+entryStartDate);
                Debug.print("entryCloseDate in selectApprovedEveCalendarDets: "+entryCloseDate);
                
                HLCCalendarVO objEventDetails = new HLCCalendarVO();
                
                objEventDetails.setCalenderId(proCalId);
                objEventDetails.setOrganizerId(organizerId);
                objEventDetails.setBeginDate(beginDate);
                objEventDetails.setEndDate(endDate);
                objEventDetails.setEventTitle(eventTitle);
                objEventDetails.setUserId(userId);
                objEventDetails.setOrgFName(firstName);
                objEventDetails.setOrgLName(lastName);
                objEventDetails.setAreaCode(areaCode);
                objEventDetails.setAreaName(areaName);
                objEventDetails.setStateName(stateName);
                objEventDetails.setArearChairApproStatus(areaChApprovStat);
                objEventDetails.setOrgApprovalStatus(orgApprovStat);
                objEventDetails.setApprovalStatus(uStaffApprovStat);
                objEventDetails.setEventId(newEveId);
                objEventDetails.setOldEventId(oldEveId);
                objEventDetails.setEntryStrtDate(entryStartDate);
                objEventDetails.setEntryEndDate(entryCloseDate);
                objEventDetails.setEveLevels(objEveLevels);
                proCalDet.add(objEventDetails);
                
            }
            rs.close();
            prepSelect.close();
            releaseConnection();
        } catch(SQLException sql){
            releaseConnection();
            sql.printStackTrace();
        } catch(Exception e){
            releaseConnection();
            e.printStackTrace();
        }
        return proCalDet;
        
    }
    
    
public String getuseridbyemail(String email)
{

String userid=null;

   
    try {
     makeConnection();
      String str="SELECT user_id FROM tblSignUpDetails WHERE e_mail=?";
            
      prepStmt = con.prepareStatement(str);
         prepStmt.setString(1,email);
         
         
         rs = prepStmt.executeQuery();
         if (rs.next()){
          userid = rs.getString(1);
                       }
          
    
         rs.close();
    prepStmt.close();
    
    releaseConnection(); 
 } 
    catch (Exception ex) {
      ex.printStackTrace();
          //Debug.print("Exception:" + ex.getMessage());
     }finally {
         releaseConnection();
     }
   
return userid;
}

public String updateusersignup(String firstname,String lastname,String e_mail,String mobileno,String institution_name, String country, String state, String city, String credit_card_type, String credit_card_no, String cvv_no,String name_on_card, String expiry_date, String productPrice,String addrline1,String addrline2) throws RemoteException
{
String status=null;   

try{

makeConnection(); 

String insertStmt=  "update tblSignUpDetails SET first_name = ?, last_name = ?, e_mail = ?, mobile = ?, institution_name = ?, country = ?, state = ?, city = ?, credit_card_type = ?, credit_card_no = ?, cvv_no = ?, name_on_card = ?, expiry_date = ?, product_price = ?, addrline1=?, addrline2=? where e_mail = ? ";

  prepStmt = con.prepareStatement(insertStmt);
  
  prepStmt.setString(1,firstname);
  prepStmt.setString(2,lastname);
  prepStmt.setString(3, e_mail);
  prepStmt.setString(4,mobileno);
  prepStmt.setString(5,institution_name);
  prepStmt.setString(6,country);
  prepStmt.setString(7,state);
  prepStmt.setString(8,city);
  prepStmt.setString(9,credit_card_type);
  prepStmt.setString(10,credit_card_no);
  prepStmt.setString(11,cvv_no);
  prepStmt.setString(12, name_on_card);
  prepStmt.setString(13, expiry_date);
  prepStmt.setString(14, productPrice);
  prepStmt.setString(15, e_mail);
  prepStmt.setString(16, addrline1);
  prepStmt.setString(17, addrline2);
  
  
  
 
  
  
  int cnt= prepStmt.executeUpdate();
  if(cnt>0){
      
   status="User update successfully";  
    }
   prepStmt.close();

} 
catch (SQLException sqe) {
sqe.printStackTrace();
  releaseConnection();
        
} finally {
  releaseConnection();
}
return status;

}
public String selectInstitutionId(String email)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT registration_id FROM tblSignUpDetails WHERE e_mail=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}
public String selectsubscription_id(String email)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT subscription_id FROM tblSignUpDetails WHERE e_mail=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}
public String selectorder_id(String email)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT order_id FROM tblSignUpDetails WHERE e_mail=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}
public String selectcustomer_id(String email)
{
 String map_id=null;
  
     
      try {
       makeConnection();
        String str="SELECT customer_id FROM tblSignUpDetails WHERE e_mail=?";
              
        prepStmt = con.prepareStatement(str);
           prepStmt.setString(1,email);
          
           rs = prepStmt.executeQuery();
           if (rs.next()){
            map_id = rs.getString(1);
                         }
            
      
           rs.close();
      prepStmt.close();
      
      releaseConnection(); 
   } 
      catch (Exception ex) {
        ex.printStackTrace();
            //Debug.print("Exception:" + ex.getMessage());
       }finally {
           releaseConnection();
       }
     
  return map_id;
}

public String selectcompany_id()  throws RemoteException {
    
    String empid = null;
    PreparedStatement prepSelect = null;
    makeConnection();
    try {
        String selectStatement = "SELECT max(cast(registration_id as int)) from tblSignUpDetails";
        
        prepSelect = con.prepareStatement(selectStatement);
        
        ResultSet rs = prepSelect.executeQuery();
        while (rs.next()) {
         empid = rs.getString(1);
        }
        if (empid == null)
         empid = "0";
        
        long nextId = Long.valueOf(empid).longValue();
        
        if(nextId==0){
            nextId = 10101000;
        } else{
            nextId = nextId+1;
        }
        rs.close();
        prepSelect.close();
        empid = Long.toString(nextId);
       
        //prepStmt.close();
        releaseConnection();
       
    } catch(SQLException sql){
        releaseConnection();
              }
   
    return empid;
}

//============================customer id==============================
public String selectcustomer_id()  throws RemoteException {
	 String count = null;
    String empid = null;
    PreparedStatement prepSelect = null;
   
    makeConnection();
    try {
        String selectStatement = "SELECT max(cast(count as int)) from tblSignUpDetails";
        
        prepSelect = con.prepareStatement(selectStatement);
        
        ResultSet rs = prepSelect.executeQuery();
        while (rs.next()) {
         empid = rs.getString(1);
        }
        if (empid == null)
         empid = "0";
        
        long nextId = Long.valueOf(empid).longValue();
        
        if(nextId==0){
            nextId = 01;
        } else{
            nextId = nextId+1;
            
        }
        rs.close();
        prepSelect.close();
        empid = Long.toString(nextId);
       
        //prepStmt.close();
        releaseConnection();
       
    } catch(SQLException sql){
        releaseConnection();
              }
   
    return empid;
}
//==============================customer id==============================

 public static String randomString(char[] characterSet, int length) {
    java.util.Random random = new SecureRandom();
    char[] result = new char[length];
    for (int i = 0; i < result.length; i++) {
        // picks a random index out of character set > random character
        int randomCharIndex = random.nextInt(characterSet.length);
        result[i] = characterSet[randomCharIndex];
    }
    return new String(result);
}
public String selectsubscription_id()  throws RemoteException {
    
        char[] CHARSET_AZ_09 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
    	//random alphanew=new random();
    	//alphanew.randomString(CHARSET_AZ_09, 20);
    	System.out.println(randomString(CHARSET_AZ_09, 16));
    	String alpha_random=randomString(CHARSET_AZ_09, 16);
      
    return alpha_random;
}
public static String randomalpha(char[] characterSet, int length) {
    java.util.Random random = new SecureRandom();
    char[] result = new char[length];
    for (int i = 0; i < result.length; i++) {
        // picks a random index out of character set > random character
        int randomCharIndex = random.nextInt(characterSet.length);
        result[i] = characterSet[randomCharIndex];
    }
    return new String(result);
}
public String selectorder_id()  throws RemoteException {
    
    char[] CHARSET_AZ_09 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
	//random alphanew=new random();
	//alphanew.randomString(CHARSET_AZ_09, 20);
	System.out.println(randomalpha(CHARSET_AZ_09, 8));
	String alpha_randomid=randomalpha(CHARSET_AZ_09, 8);
  
return alpha_randomid;
}

 public void makeConnection() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            con = ds.getConnection();
            // Debug.print(" Opening a connection...");
        } catch (Exception ex) {
            //Debug.print("Unable to connect to database. " + ex.getMessage());
        }
    }
    
    
    
    
    public void releaseConnection() {
        try {
            //prepStmt.close();
            //rs.close();
            if(!con.isClosed()){
                con.close();
            }
            //Debug.print(" Closing a connection...");
        } catch (SQLException ex) {
            //Debug.print("releaseConnection: " + ex.getMessage());
        }
    
    }

	public String getdate(String emailId) {
		Debug.print("GeneralDBAction.getRoleNameByRoleId():");
		 PreparedStatement prepstmt = null;
		 ResultSet rs = null;
		 makeConnection();
		 String date = "";
		 try{
			 String sqlQuery = "Select date from tblSignUpDetails where e_mail=?";
			 prepstmt = con.prepareStatement(sqlQuery);
			 prepstmt.setString(1, emailId);
			 rs = prepstmt.executeQuery();
			 rs.next();
			 date = rs.getString(1);
			 rs.close();
			 prepstmt.close();
			 releaseConnection();
		 }
		 catch(SQLException sql)
	     {
	         releaseConnection();
	         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getRoleNameByRoleId():").append(sql.getMessage()).toString());
	     }
	     catch(Exception e)
	     {
	         releaseConnection();
	         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getRoleNameByRoleId():").append(e.getMessage()).toString());
	     }
		 
		 return date;
		
	}

	public String updateprofile(String new_email,String username, String password,String e_mail) {
		
		System.out.println(" from inside database");	
	     System.out.println("username:"+username);
	     System.out.println("password:"+password);
	     System.out.println("e_mail:"+e_mail);
	     System.out.println("new_email:"+new_email);
	     String result=null;
	     try{
	      makeConnection(); 
	     String insertStmt=  "update tblSignUpDetails SET username = ?, password = ?, e_mail =? where e_mail=?";
	      
	     prepStmt = con.prepareStatement(insertStmt);
	       
	        prepStmt.setString(1,username);
	        prepStmt.setString(2,password);
	        prepStmt.setString(3,e_mail);
	        prepStmt.setString(4,new_email);            
	        
	      int cnt= prepStmt.executeUpdate();
	       if(cnt>0){        
	        result ="User update successfully";  
	       }
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	        releaseConnection();
	              
	    } finally {
	        releaseConnection();
	    }
	  return result;
	     
	    }
	
public String updatesignupuserdetails(String new_email,String username, String encryptedPWD,String e_mail) {
		
		System.out.println(" from inside database");	
	     System.out.println("username:"+username);
	     System.out.println("password:"+encryptedPWD);
	     System.out.println("e_mail:"+e_mail);
	     System.out.println("new_email:"+new_email);
	     
	     String result=null;
	     try{
	      makeConnection(); 
	     String insertStmt=  "update tblUserMaster SET login_name = ?, password = ?, email_id =? where email_id=?";
	      
	     prepStmt = con.prepareStatement(insertStmt);
	       
	        prepStmt.setString(1,username);
	        prepStmt.setString(2,encryptedPWD);
	        prepStmt.setString(3,e_mail);
	        prepStmt.setString(4,new_email);
	        
	      int cnt= prepStmt.executeUpdate();
	       if(cnt>0){        
	        result ="User update successfully";  
	       }
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	        releaseConnection();
	              
	    } finally {
	        releaseConnection();
	    }
	  return result;
	     
	    }

public String updateapproveareachair(String eventId) {
	
	System.out.println(" from inside database");	
    
	String status="Pending";
     String result=null;
     try{
      makeConnection(); 
     String insertStmt=  "update tblOEProvisionalCalendar SET area_chair_approval_status = ? where event_id=?";
      
     prepStmt = con.prepareStatement(insertStmt);
       
        prepStmt.setString(1,status);
        prepStmt.setString(2,eventId);
        
        
      int cnt= prepStmt.executeUpdate();
       if(cnt>0){        
        result ="Event Approved Successfully";  
       }
       prepStmt.close();
      
    } 
    catch (SQLException sqe) {
    	sqe.printStackTrace();
        releaseConnection();
              
    } finally {
        releaseConnection();
    }
  return result;
     
    }

public String getcouponcodedetailbycouponName(String coupon_code)  throws RemoteException
{
	 
	String couponcode =null;
    PreparedStatement prepSelect = null;
    makeConnection();
    try {
        String selectStatement = "SELECT coupon_code from tblCouponDetails where coupon_code = ?";
        
        prepSelect = con.prepareStatement(selectStatement);
        prepSelect.setString(1,coupon_code);
        ResultSet rs = prepSelect.executeQuery();
        while (rs.next()) {
        	couponcode = rs.getString(1);
        }
        	       
        rs.close();
        prepSelect.close();
        System.out.println("coupon_code inside the dBAction----------------"+couponcode);
       
        //prepStmt.close();
        releaseConnection();
       
    } catch(SQLException sql){
    	couponcode = null;
	        releaseConnection();
       } finally {
       	releaseConnection();
       }
   
    return couponcode;
}

public String getcouponoffer(String coupon)
{
	 
	String off=null;
	    
	    	  
	        try {
	        	makeConnection();
	        	 String str="SELECT coupon_offer FROM tblCouponDetails WHERE coupon_code=? and coupon_status='Active'";
			     				     
			        prepStmt = con.prepareStatement(str);
		            prepStmt.setString(1,coupon);
		            
		            
		            rs = prepStmt.executeQuery();
		            if (rs.next()){
		            	off = rs.getString(1);
		            	System.out.println("offer inside the dBAction----------------"+off);
		                          }
			      rs.close();
		       prepStmt.close();
		       
		       releaseConnection(); 
		    } 
	        catch (Exception ex) {
		        	ex.printStackTrace();
		             //Debug.print("Exception:" + ex.getMessage());
		        }finally {
		        	releaseConnection();
		        }
	       
	    return off;
}


public String insertcoupondet(String coupon_code,String coupon_des,String coupon_offer) 
{
	 
	String allow_date=null;		    
		    	  
		        try {
		        	makeConnection();
		        	 String str="insert into tblCouponDetails(coupon_code,coupon_des,coupon_offer) values (?,?,?)";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,coupon_code);
			            prepStmt.setString(2,coupon_des);
			            prepStmt.setString(3,coupon_offer);
			            
			           
			            
			              prepStmt.executeUpdate();

			 	       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		       
		    return allow_date;
}


public ArrayList getcoupondetails() 
{
	 
	 ArrayList useridlist = new ArrayList();	
		    
		        try {
		        	makeConnection();
		        	 String str="select coupon_id,coupon_code,coupon_des,coupon_offer,coupon_status from tblCouponDetails where coupon_status='Active'";					     				     
		        	  prepStmt = con.prepareStatement(str);
				       
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String coupon_id=rs.getString(1);
			            	String coupon_code = rs.getString(2);
			            	String coupon_des=rs.getString(3);
			            	String coupon_offer=rs.getString(4);
			            	String coupon_status=rs.getString(5);
			            	
			                String userlist[] = {coupon_id,coupon_code,coupon_des,coupon_offer,coupon_status};
			                useridlist.add(userlist);
			             }
			            rs.close();
			       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		      return useridlist;
	}

public ArrayList getcouponeditdet(String couponid) 
{
	 
	 ArrayList useridlist = new ArrayList();	
		    
		        try {
		        	makeConnection();
		        	 String str="select coupon_id,coupon_code,coupon_des,coupon_offer from tblCouponDetails where coupon_id=? and coupon_status='Active'";					     				     
		        	  prepStmt = con.prepareStatement(str);
		        	  
			            prepStmt.setString(1,couponid);
			            
			            rs = prepStmt.executeQuery();
			            while (rs.next()){
			            	String coupon_id=rs.getString(1);
			            	String coupon_code = rs.getString(2);
			            	String coupon_des=rs.getString(3);
			            	String coupon_offer=rs.getString(4);
			            	
			                String userlist[] = {coupon_id,coupon_code,coupon_des,coupon_offer};
			                useridlist.add(userlist);
			             }
			            rs.close();
			       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		      return useridlist;
	}


public boolean getupdatecoupondet(String coupon_id, String coupon_code,String coupon_offer) {
   
   Debug.print("DbAction.updatecoupondetail():");
   PreparedStatement prepStmt = null;
   makeConnection();
   try {
       String insertStatement = "update tblCouponDetails set coupon_offer = ? where coupon_id = ? and coupon_code=?";

           prepStmt = con.prepareStatement(insertStatement);
           prepStmt.setString(1, coupon_offer);
          
           prepStmt.setString(2, coupon_id);
           prepStmt.setString(3, coupon_code);
            
        
           prepStmt.executeUpdate();
           prepStmt.close();
  

       releaseConnection();
   }
   
   catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in DbAction.updateRole():" + sql.getMessage());
   }
   catch(Exception e){
       releaseConnection();
       Debug.print("General Exception  in DbAction.updateRole():" + e.getMessage());
   }
   return true;
}


public boolean getdeactivecode(String coupon_id, String status) {
   
   Debug.print("DbAction.updatecoupondetail():");
   PreparedStatement prepStmt = null;
   makeConnection();
   try {
       String insertStatement = "update tblCouponDetails set coupon_status = ? where coupon_id = ?";

           prepStmt = con.prepareStatement(insertStatement);
           prepStmt.setString(1, status);
          
           prepStmt.setString(2, coupon_id);
          
            
        
           prepStmt.executeUpdate();
           prepStmt.close();
  

       releaseConnection();
   }
   
   catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in DbAction.updateRole():" + sql.getMessage());
   }
   catch(Exception e){
       releaseConnection();
       Debug.print("General Exception  in DbAction.updateRole():" + e.getMessage());
   }
   return true;
}

public ArrayList getcustomerDetails(String customerid){
    Debug.print("GeneralDBAction.getMappingDetailsForRoleAndPrivileges():");
    ArrayList roleEntityMapList = null;
    PreparedStatement prepStmt = null;
    ResultSet rs = null;
    makeConnection();
	try {
        String selectStatement=" SELECT first_name,last_name,e_mail,mobile,institution_name,country,state,city,credit_card_type,credit_card_no,cvv_no,name_on_card,expiry_date,registration_id,user_id,product_price,subscription_id,order_id,reg_date,Productplan,subscription_plan,amount from tblSignUpDetails where customer_id=?";
     
        prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1,customerid);
        Debug.print(selectStatement);
        rs = prepStmt.executeQuery();
        roleEntityMapList = new ArrayList();
        while(rs.next()){
            String first_name = rs.getString(1);
            String last_name = rs.getString(2);
            String e_mail = rs.getString(3);
            String mobile = rs.getString(4);
            String institution_name = rs.getString(5);
            String country = rs.getString(6);
            String state = rs.getString(7);
            String city = rs.getString(8);
            String credit_card_type = rs.getString(9);
            String credit_card_no = rs.getString(10);
            String cvv_no = rs.getString(11);
            String name_on_card = rs.getString(12);
            String expiry_date = rs.getString(13);
            String registration_id = rs.getString(14); 
            String user_id = rs.getString(15);
            String product_price = rs.getString(16);
            String subscription_id = rs.getString(17);
            String order_id = rs.getString(18);
            String reg_date = rs.getString(19);
            String Productplan = rs.getString(20);
            String subscription_plan = rs.getString(21);
            String amount = rs.getString(22);
            String[] customer_profile = {first_name,last_name,e_mail,mobile,institution_name,country,state,city,credit_card_type,credit_card_no,cvv_no,name_on_card,expiry_date,registration_id,user_id,product_price,subscription_id,order_id,reg_date,Productplan,subscription_plan,amount};
            roleEntityMapList.add(customer_profile);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
        //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForRole():" + roleEntityMapList);
    } 
    catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRoleAndPrivileges():" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRoleAndPrivileges():" + e.getMessage());
    }
    return roleEntityMapList;
}

	public String updateproductpackage(String new_email,String plantype,String subscriptiontype, String paymentHistory,String subscriptionExpiry) {
		System.out.println(" from inside databaseuser");	
	     System.out.println("plantype:"+plantype);
	     System.out.println("subscriptiontype:"+subscriptiontype);
	     System.out.println("paymentHistory:"+paymentHistory);
	     System.out.println("subscriptionExpiry:"+subscriptionExpiry);
	     String packageresult="User update Failed";
	     try{
	      makeConnection(); 
	     String insertStmt=  "update tblSignUpDetails SET Productplan = ?, subscription_plan = ?, amount = ? where e_mail=?";
	        
	     prepStmt = con.prepareStatement(insertStmt);
	       
	        prepStmt.setString(1,plantype);
	        prepStmt.setString(2,subscriptiontype);
	        prepStmt.setString(3,paymentHistory);
	        prepStmt.setString(4,new_email);
	        
	         
	       int cnt= prepStmt.executeUpdate();
	       if(cnt>0){        
	        packageresult ="User update successfully";  
	       }
	       prepStmt.close();
	      
	    } 
	    catch (SQLException sqe) {
	    	sqe.printStackTrace();
	        releaseConnection();
	              
	    } finally {
	        releaseConnection();
	    }
	  return packageresult;
	     
	} 
	
	
	public String geteventtitle(String eventId)  throws RemoteException
	{
		 
		String eventtitle =null;
	    PreparedStatement prepSelect = null;
	    makeConnection();
	    try {
	        String selectStatement = "SELECT event_title from tblMeeEventDetails where event_id = ?";
	        
	        prepSelect = con.prepareStatement(selectStatement);
	        prepSelect.setString(1,eventId);
	        ResultSet rs = prepSelect.executeQuery();
	        while (rs.next()) {
	        	eventtitle = rs.getString(1);
	        }
	        	       
	        rs.close();
	        prepSelect.close();
	        System.out.println("eventtitle inside the dBAction----------------"+eventtitle);
	       
	        //prepStmt.close();
	        releaseConnection();
	       
	    } catch(SQLException sql){
	    	eventtitle = null;
		        releaseConnection();
	       } finally {
	       	releaseConnection();
	       }
	   
	    return eventtitle;
	}
	
	public String insertpayeventdetails(String eventId,String eventtitle) 
	{
		 
		String eventfeedetails=null;
			    
			    	  
			        try {
			        	makeConnection();
			        	 String str="insert into tblEventregfeeDetails(event_id,event_name) values (?,?)";
					     				     
					        prepStmt = con.prepareStatement(str);
				            prepStmt.setString(1,eventId);
				            prepStmt.setString(2,eventtitle);
				            
				            
				            int cnt= prepStmt.executeUpdate();
				 	       if(cnt>0){        
				 	    	  eventfeedetails ="Event Details successfully";  
				 	       }

				 	       prepStmt.close();
				       
				       releaseConnection(); 
				    } 
			        catch (Exception ex) {
				        	ex.printStackTrace();
				             //Debug.print("Exception:" + ex.getMessage());
				        }finally {
				            releaseConnection();
				        }
			       
			    return eventfeedetails;
	}
	

	}
	


