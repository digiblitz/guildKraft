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
package com.db;

import java.rmi.RemoteException;
import java.security.SecureRandom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.idoox.security.util.Random;

public class GeneralDBAction {
	
	
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
	
    public ArrayList getAllRolesBasedOnUser(String userId){
        Debug.print("GeneralDBAction.getAllRolesBasedOnUser():");
        ArrayList rolesList = null;
       
        makeConnection();
   	try {
            String selectStatement = " SELECT A.user_map_id, A.user_id, A.role_id, B.role_name from tblMapUserPrivilege A, tblRoleMaster B  where A.role_id = B.role_id and A.user_id = ? order by B.role_name" ;
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,userId);
            rs = prepStmt.executeQuery();
            rolesList = new ArrayList();
            while(rs.next()){
                String userMapId = rs.getString(1);
                String userIdVal = rs.getString(2);
                String roleId = rs.getString(3);
                String roleName = rs.getString(4);
                String[] rlList = {userMapId, userIdVal, roleId, roleName};
                rolesList.add(rlList);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
           // Debug.print("RoleManagementDAOImpl.selectAllRolesBasedOnUser():" + rolesList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
        }
        return rolesList;
      }
    
    
    public ArrayList geteveDetails(){
        Debug.print("GeneralDBAction.geteveDetails():");
        ArrayList rolesList = null;
       String status="Pending";
        makeConnection();
   	try {
            String selectStatement = " SELECT event_id,event_title,begin_date,no_of_days,end_date,location from tblOEProvisionalCalendar where area_chair_approval_status = ?" ;
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,status);
            rs = prepStmt.executeQuery();
            rolesList = new ArrayList();
            while(rs.next()){
            	 String event_id = rs.getString(1);
                String tittle = rs.getString(2);
                String begin = rs.getString(3);
                String days = rs.getString(4);
                String end = rs.getString(5);
                String location = rs.getString(6);
                String[] rlList = {event_id,tittle, begin, days, end, location};
                rolesList.add(rlList);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
           // Debug.print("RoleManagementDAOImpl.selectAllRolesBasedOnUser():" + rolesList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
        }
        return rolesList;
      }
    
    //===================================Shamili--Test===================================//
    
    public ArrayList getcaleventDetails(String todaydate){
        Debug.print("GeneralDBAction.geteveDetails():");
        ArrayList eventcallist = null;
      
        makeConnection();
   	try {
            String selectStatement = " SELECT event_id,event_title,begin_date,no_of_days,end_date,location from tblOEProvisionalCalendar where begin_date > ? " ;
            System.out.println("===Query check==="+selectStatement);
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,todaydate);
            rs = prepStmt.executeQuery();
            
            eventcallist = new ArrayList();
            while(rs.next()){
            	 String event_id = rs.getString(1);
                String tittle = rs.getString(2);
                String begin = rs.getString(3);
                String days = rs.getString(4);
                String end = rs.getString(5);
                String location = rs.getString(6);
                String[] eventlist = {event_id,tittle, begin, days, end, location};
                eventcallist.add(eventlist);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
           // Debug.print("RoleManagementDAOImpl.selectAllRolesBasedOnUser():" + rolesList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
        }
        return eventcallist;
      }
    
    public String insertusereventdetails(String event_title, String start_date,
			String end_date, String firstname, String lastname, String email,
			String city, String state, String country) {
    	
    	String status=null;
    	
    	makeConnection();
    	   	try {
    	            String query = " insert into tbleventuserdetail(event_title,start_date,end_date,firstname,lastname,email_id,city,state,country) values(?,?,?,?,?,?,?,?,?) " ;
    	            System.out.println("insert query"+query);
    	            prepStmt = con.prepareStatement(query);
    	            
    	            prepStmt.setString(1,event_title) ;
    	            prepStmt.setString(2,start_date);
    	            prepStmt.setString(3,end_date);
    	            prepStmt.setString(4,firstname);
    	            prepStmt.setString(5,lastname);
    	            prepStmt.setString(6,email);
    	            prepStmt.setString(7,city);
    	            prepStmt.setString(8,state);
    	            prepStmt.setString(9,country);
    	          
    	            int count= prepStmt.executeUpdate();
    	            
    	           if(count>0){
    	        	   
    	        	   status="Event Registered successfully";
    	           }
    	        	prepStmt.close();
    	            releaseConnection();
    	          
    	        } 
    	        catch(SQLException sql){
    	            releaseConnection();
    	            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
    	        }
    	        catch(Exception e){
    	            releaseConnection();
    	            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
    	        }
    	        return status;
    	      
	
	}
    
	public String inserteventpaydetails(String amount, String card_type,
			String card_no, String cvv, String card_name) {
		
		String payment_status="paid";
		String status=null;
		makeConnection();
	   	try {
	            String query1 = " insert into tbleventuserdetail(amount,cardtype,cardno,cvv,cardname,status) values(?,?,?,?,?,?) " ;
	            prepStmt = con.prepareStatement(query1);
	            
	            prepStmt.setString(1,amount) ;
	            prepStmt.setString(2,card_type);
	            prepStmt.setString(3,card_no);
	            prepStmt.setString(4,cvv);
	            prepStmt.setString(5,card_name);
	            prepStmt.setString(6,payment_status);
	          
	            int count= prepStmt.executeUpdate();
	            
	           if(count>0){
	        	   
	        	   status="Payment Successfull";
	           }
	        	prepStmt.close();
	            releaseConnection();
	          
	        } 
	        catch(SQLException sql){
	            releaseConnection();
	            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
	        }
	        catch(Exception e){
	            releaseConnection();
	            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
	        }
	        return status;
		
	}
	
	public String getpaymentstatus(String user_id){
		
		String status=null;
		makeConnection();
		try{
			
			String query= "select status from tbleventuserdetail where userid=? ";
			
			prepStmt=con.prepareStatement("query");
			
			prepStmt.setString(1,user_id);
            rs = prepStmt.executeQuery();
            while(rs.next ()){
            	status=rs.getString(1);
            }
            
            rs.close();
            prepStmt.close();
            releaseConnection();
          
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
        }
		
		return status;
	}

	 public Collection FindByAll() throws FinderException {
	        Debug.print("AdvertiseBean ejbFindAll");
	        Vector adsList = new Vector();
	        makeConnection();
	   	try {
	            String selectStatement = "select advertisement_id from tblAdvertisers order by add_date desc " ;
	            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
	            ResultSet rs = prepStmt.executeQuery();
	            while (rs.next()){
	                adsList.addElement(rs.getString(1));
	                Debug.print("Ads In Find ALL:" + rs.getString(1));
	            }
	            rs.close();
	            prepStmt.close();
	            releaseConnection();
	        } 
	        catch(SQLException sql){
	            releaseConnection();
	            throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
	        }
	        catch(Exception e){
	            releaseConnection();
	            throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
	        }
	        return adsList;
	}
    
    //===========================================shamili Test end==============================//
    
    
    public ArrayList geteveDetails(String eventid){
        Debug.print("GeneralDBAction.geteveDetails():");
        ArrayList rolesList = null;
       
        makeConnection();
   	try {
            String selectStatement = " SELECT event_id,event_title,begin_date,no_of_days,end_date,location from tblOEProvisionalCalendar where event_id = ?" ;
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,eventid);
            rs = prepStmt.executeQuery();
            rolesList = new ArrayList();
            while(rs.next()){
            	 String event_id = rs.getString(1);
                String tittle = rs.getString(2);
                String begin = rs.getString(3);
                String days = rs.getString(4);
                String end = rs.getString(5);
                String location = rs.getString(6);
                String[] rlList = {event_id,tittle, begin, days, end, location};
                rolesList.add(rlList);
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
          
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
        }
        return rolesList;
      }
    
    public ArrayList getMappingDetailsForRoleAndPrivileges(String roleId){
        Debug.print("GeneralDBAction.getMappingDetailsForRoleAndPrivileges():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
            String selectStatement=" SELECT a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name,c.entity_access_url from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c " +
                    " where a.entity_id = c.entity_id and a.role_id = b.role_id and a.role_id = ? order by c.entity_name";
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);
                String roleName = rs.getString(4);
                String entityName = rs.getString(5);
                String entityUrl = rs.getString(6);
                String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl};
                roleEntityMapList.add(entMapList);
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
    
 
    public String [] getRole(String roleId) {
        Debug.print("GeneralDBAction.getRole():");
       
        String[] strRoleList = {};
        makeConnection();
   	try {

            String selectStatement=" select case when role_id in(select role_id from tblMapEntity union all select role_id from tblMapUserPrivilege"+
                                   " union all select role_id from tblMapRole) then '0' else '1' end flag, "+
                                   " role_id, role_name,role_desc,active_status from tblRoleMaster where role_id = ? ";

            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            rs = prepStmt.executeQuery();
            if(rs.next()){
                String roleIdVal = rs.getString(2);
                String roleName = rs.getString(3);

                String roledesc = rs.getString("role_desc");
                String status = rs.getString("active_status");
                String flag = rs.getString("flag");

                String tempStrRoleList[] = {roleIdVal, roleName,roledesc,status,flag};
                strRoleList = tempStrRoleList;
            }
  
            rs.close();
            prepStmt.close();
            releaseConnection();
            Debug.print("GeneralDBAction.getRole():" + strRoleList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getRole():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getRole():" + e.getMessage());
        }
        return strRoleList;
    }   
    
    public ArrayList getMappingDetailsForRlEntPrivPerm(String roleId, String entId){
        Debug.print("GeneralDBAction.getMappingDetailsForRlEntPriv():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
            String selectStatement="SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, " +
            		"c.entity_name, c.entity_access_url, d.privilege_name, " +
            		"e.privilege_id, f.access_name,f.access_url " +
            		"from tblMapEntity a , tblRoleMaster b , tblEntityMaster c, " +
            		"tblPrivilegeMaster d, tblMapRole e, tblMapPermission f " +
            		"where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"f.permission_id=e.permission_id and f.privilege_id=e.privilege_id and " +
            		"d.privilege_id=e.privilege_id and d.privilege_id=f.privilege_id " +
            		"and a.entity_id=c.entity_id and a.entity_id=e.entity_id " +
            		"and c.entity_id=e.entity_id and a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? and e.entity_id=? order by c.entity_name";
            
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            prepStmt.setString(2,entId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
              String privName= rs.getString(7);
               String priviId = rs.getString(8);
              String accessName = rs.getString(9);
              String accessUrl = rs.getString(10);
            
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl,privName,priviId,accessName,accessUrl};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForRole():" + roleEntityMapList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRlEntPriv():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRlEntPriv():" + e.getMessage());
        }
        return roleEntityMapList;
    }   
    
    
    public ArrayList getMappingDetailsForRlEnt(String roleId){
        Debug.print("GeneralDBAction.getMappingDetailsForRlEnt():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
          /*String selectStatement=" SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
            		"c.entity_access_url, d.privilege_name, e.privilege_id from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c, tblPrivilegeMaster d, " +
            		"tblMapRole e where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"d.privilege_id=e.privilege_id and a.entity_id=c.entity_id and " +
            		"a.entity_id=e.entity_id and c.entity_id=e.entity_id and " +
            		"a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? and e.entity_id=? order by c.entity_name";*/
   		
   	String selectStatement="SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
        		"c.entity_access_url from tblMapEntity a, tblRoleMaster b , tblEntityMaster " +
        		"c where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
        		"a.entity_id=c.entity_id and a.role_id =? order by c.entity_name";
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
           
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
            // String privName= rs.getString(7);
          // String priviId = rs.getString(8);
             
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
          
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRlEnt():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRlEnt():" + e.getMessage());
        }
        return roleEntityMapList;
    }  
    
    
    public ArrayList getMappingDetailsForRlEntPriv(String roleId, String entId){
        Debug.print("GeneralDBAction.getMappingDetailsForRlEntPriv():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
          String selectStatement=" SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
            		"c.entity_access_url, d.privilege_name, e.privilege_id from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c, tblPrivilegeMaster d, " +
            		"tblMapRole e where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"d.privilege_id=e.privilege_id and a.entity_id=c.entity_id and " +
            		"a.entity_id=e.entity_id and c.entity_id=e.entity_id and " +
            		"a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? and e.entity_id=? order by c.entity_name";
   		
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            prepStmt.setString(2,entId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
            String privName= rs.getString(7);
          String priviId = rs.getString(8);
             
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl,privName,priviId};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
          
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForRlEntPriv():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForRlEntPriv():" + e.getMessage());
        }
        return roleEntityMapList;
    }   
    
    
  
    
    
    public ArrayList getMappingDetailsForPrivPerm(String roleId){
        Debug.print("GeneralDBAction.getMappingDetailsForPrivPerm():");
        ArrayList roleEntityMapList = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        makeConnection();
   	try {
          String selectStatement=" SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
            		"c.entity_access_url, d.privilege_name, e.privilege_id from tblMapEntity a , " +
            		"tblRoleMaster b , tblEntityMaster c, tblPrivilegeMaster d, " +
            		"tblMapRole e where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
            		"d.privilege_id=e.privilege_id and a.entity_id=c.entity_id and " +
            		"a.entity_id=e.entity_id and c.entity_id=e.entity_id and " +
            		"a.role_id = e.role_id and b.role_id = e.role_id " +
            		"and e.role_id =? order by c.entity_name";   		
   	   /*String selectStatement="SELECT distinct a.map_entity_id , a.role_id ,a.entity_id, b.role_name, c.entity_name, " +
        		"c.entity_access_url from tblMapEntity a, tblRoleMaster b , tblEntityMaster " +
        		"c where a.entity_id = c.entity_id and a.role_id = b.role_id and " +
        		"a.entity_id=c.entity_id and a.role_id =? order by c.entity_name";*/
         
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,roleId);
            Debug.print(selectStatement);
            rs = prepStmt.executeQuery();
            roleEntityMapList = new ArrayList();
            while(rs.next()){
                String mapEntityId = rs.getString(1);
                String roleIdVal = rs.getString(2);
                String entityId = rs.getString(3);      
               String roleName = rs.getString(4);
               String entityName = rs.getString(5);
               String entityUrl = rs.getString(6);
              String privName= rs.getString(7);
             String priviId = rs.getString(8);
             
               String[] entMapList = {mapEntityId, roleIdVal, entityId, roleName, entityName,entityUrl,privName,priviId};
               roleEntityMapList.add(entMapList);    
      
            }
            rs.close();
            prepStmt.close();
            releaseConnection();
            //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForRole():" + roleEntityMapList);
        } 
        catch(SQLException sql){
            releaseConnection();
            Debug.print("SQL Exception in GeneralDBAction.getMappingDetailsForPrivPerm():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection();
            Debug.print("General Exception  in GeneralDBAction.getMappingDetailsForPrivPerm():" + e.getMessage());
        }
        return roleEntityMapList;
    }  
  
//====================Edit User Details=====================================================
    private static String userId;
    private String contactTypeId = null;
    public void editUserDetails(HLCUserMaster objUserMaster, HLCContactDetails objContact) throws RemoteException{
        System.out.print("Email ID In Kavery Session Bean : "+objUserMaster.getEmailId());
        boolean bol = false;
        String commAddrId="";
        
        HLCMemberUpdateDAO objDAO = new HLCMemberUpdateDAO();
        if (objUserMaster == null && (objUserMaster.getEmailId()).equals("") ) {
            throw new EJBException("Email ID can't be empty");
        }
        
        makeConnection();
        Debug.print(" USer Id in Kavery Session Bean : "+objUserMaster.getUserId());
        if (objUserMaster.getUserId() == null) {
            try {
                userId = DBHelper.getUserId(con, objUserMaster.getEmailId());
                Debug.print(" User Id Based on email Id in Kavery Session Bean : "+userId);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else {
            this.userId = objUserMaster.getUserId();
        }
        
        if (objContact.getContactType() != null) {
            try {
                contactTypeId = DBHelper.getContacttypeId(con,objContact.getContactType());
                commAddrId = DBHelper.getContacttypeId(con,objUserMaster.getCommunicationAddress());
                Debug.print("commAddrId for comm name - "+objUserMaster.getCommunicationAddress()+" :" +commAddrId);
                objUserMaster.setCommunicationAddress(commAddrId);
                Debug.print("parasu contact type ::: "+objContact.getContactType()+"contact type id::::"+contactTypeId);
                bol = objDAO.isContactTypeExist(contactTypeId,userId);
                Debug.print(" contact type Exist in Kavery Session Bean: "+bol);
                Debug.print(" Contact Details Received From JSP: \n"+objContact);
                
                if (bol == false){
                    objContact.setContactTypeId(contactTypeId);
                    insertRowContactDetails(objUserMaster,objContact,contactTypeId);
                    Debug.print(" New Record added to the contact Details");
                    Debug.print(" Contact Details Received From JSP After insertion: \n"+objContact);
                    releaseConnection();
                    return;
                    
                }else if (bol == true){
                	objContact.setContactTypeId(contactTypeId);
                	boolean users = updateuser(objUserMaster);
                	boolean contacts = updatecontact(objUserMaster,objContact);
                }
                
            }
           
            catch (Exception e){
                releaseConnection();
                e.printStackTrace();
            }
        }
        
        releaseConnection();
        
       
        
        if (memberExists(userId,objUserMaster.getEmailId()) == false) {
            throw new EJBException("Email ID Not Exists : " + userId);
        }
        
        Debug.print("objUserMaster.getLoginName() :"+objUserMaster.getLoginName());
        Debug.print("objUserMaster.getEmailId() :"+objUserMaster.getEmailId());
        
      
    }
    
   
    /**====================Insert for Contact Details==============================*/
    private void insertRowContactDetails(HLCUserMaster objUserMaster, HLCContactDetails objContact, String contactTypeId) throws SQLException {
        Debug.print("ArabianSeaEntityBean insertRowContactDetails");
        Debug.print("nivetha");
        makeConnection();
        
        if (objUserMaster.getLoginName()!= null){
            try {
                userId = DBHelper.getUserId(con, objUserMaster.getLoginName());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        System.out.print("User Id is from insertRowContactDetails: "+userId);
        String insertStatement = "insert into tblContactDetails (contact_type_id,user_id,suite,address1,"+
            "address2,city,state,country,zip,phone_no, mobile_no, fax_no)" +
                " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?) ";
        prepStmt = con.prepareStatement(insertStatement);
        System.out.println("Inside the Contact Details ....\n\n ");
        prepStmt.setString(1, contactTypeId);
        System.out.print("contactTypeId: "+contactTypeId);
        prepStmt.setString(2, userId);
        System.out.print("userId: "+userId);
        prepStmt.setString(3, objContact.getSuite());
        System.out.print("suite: "+objContact.getSuite());
        prepStmt.setString(4, objContact.getAddress1());
        prepStmt.setString(5, objContact.getAddress2());
        prepStmt.setString(6, objContact.getCity());
        prepStmt.setString(7, objContact.getState());
        prepStmt.setString(8, objContact.getCountry());
        prepStmt.setString(9, objContact.getZip());
        prepStmt.setString(10, objContact.getPhoneNo());
        System.out.print("phoneNo: "+objContact.getPhoneNo());
        prepStmt.setString(11, objContact.getMobileNo());
        System.out.print("mobileNo: "+objContact.getMobileNo());
        prepStmt.setString(12, objContact.getFaxNo());
        System.out.print("faxNo: "+objContact.getFaxNo());
        int cnt = prepStmt.executeUpdate();
        System.out.print("Record Inserted succefully  "+cnt);
        Debug.print(" Insert Contact Detail Data : \n"+objContact);
        prepStmt.close();
        releaseConnection();
    }
    
    
    String mailId;
    private boolean memberExists(String userId, String emailId) {
        Debug.print("Kavery Session Bean memberExists");
        
        // if ( !(userId.equals(this.userId)) ) {
        try {
            boolean res = (boolean)selectByPrimaryKey(userId);
            mailId = emailId;
        } catch (Exception ex) {
            return false;
        }
        // }
        return true;
    } 
    
    private boolean selectByPrimaryKey(String userId) throws SQLException {
        Debug.print("ArabianSeaEntityBean selectByPrimaryKey");

        makeConnection();
        String selectStatement = "SELECT user_id from tblUserMaster WHERE user_id = ?";
        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1, userId);
        ResultSet rs = prepStmt.executeQuery();
        System.out.println("selectByPrimaryKey : Working ");
        boolean result = rs.next();
        prepStmt.close();
        releaseConnection();
        return true;
    }  
    
    
    
    public boolean changePasword(String userId,String pass) throws Exception {
        Debug.print("GeneralDBAction changePasword");
        int cnt = 0;
        String encryptPassword=null;
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword("sa");
        try {
            makeConnection();
            
            if (  (pass != null && pass.trim().length() > 0) &&
                    ( userId != null && userId.trim().length() > 0 )) {
            	
            	
            	encryptPassword=textEncryptor.encrypt(pass);	
            	
                String str = "update  tblUserMaster set password = ?  WHERE user_id = ?";
                PreparedStatement prepStmt = con.prepareStatement(str);
                prepStmt.setString(1, encryptPassword);
                prepStmt.setString(2, userId);
             
                cnt = prepStmt.executeUpdate();
              
                Debug.print("Successfully Password Changed......"+cnt);
                prepStmt.close();
            }
        }catch (Exception e){
           
            releaseConnection();
            Debug.print("Error while change password  : "+e.getMessage());
        }finally {
            releaseConnection();
        }
        if (cnt >0)
            return true;
        else
            return false;
    }
    
    
    public String addUserRegistration(HLCUserMaster objUserMaster,String usrcompanyname) throws RemoteException{
       
        String contactTypeId = null;
        String usrId = null;
        System.out.println("objUserMaster.getCommunicationAddress() inside the addUserRegistration"+objUserMaster.getCommunicationAddress());
        try{
             contactTypeId = (String)getDetFrmContyId(objUserMaster.getCommunicationAddress());
            
            objUserMaster.setContactTypeId(contactTypeId);
            Debug.print("Contant Of objUserMaster : "+objUserMaster);
            
            Debug.print("user Registration getNextUserId");
            makeConnection();
            
            try{
                String selectStatement = "select newid() as userId";
                Debug.print("GeneralDBAction getNextUserId:" + selectStatement);
                PreparedStatement prepSelect = con.prepareStatement(selectStatement);
                ResultSet rs = prepSelect.executeQuery();
                rs.next();
                usrId = rs.getString(1);
                rs.close();
                prepSelect.close();
                releaseConnection();
            } catch(SQLException sql){
                releaseConnection();
                Debug.print("SQL Exception in getNextUserId:" + sql.getMessage());
            }
            Debug.print("getNextUserId :" + usrId);
            
            objUserMaster.setUserId(usrId);
            insertRowUserMaster(objUserMaster,usrcompanyname);
        } catch(Exception exp){
        	exp.printStackTrace();
        }
        
        return usrId;
    }
    
    
    
   
    
    
    private void insertRowUserMaster(HLCUserMaster objUserMaster,String usrcompanyname) throws SQLException {
        Debug.print("ArabianSeaEntityBean insertRowUserMaster");
        java.sql.Date dt = null;
       String userTypeId="";
     if(objUserMaster.getDob()!=null)
        {
            dt = java.sql.Date.valueOf(objUserMaster.getDob());
        }
        Debug.print("After converting DOB");
       
        
         makeConnection();
        Debug.print("USer code : "+objUserMaster.getUserCode());
        String str = "SELECT user_type_id FROM tblUserTypeMaster where user_type_name = ?";
        prepStmt = con.prepareStatement(str);
        prepStmt.setString(1, "Human".trim());
        rs = prepStmt.executeQuery();
        if (rs.next()) {
            userTypeId = rs.getString(1);
        } 
        
        rs.close();
        
        if (objUserMaster.getUserTypeName()!= null){
            str = "SELECT user_type_id FROM tblUserTypeMaster where user_type_name = ?";
            prepStmt = con.prepareStatement(str);
            prepStmt.setString(1, objUserMaster.getUserTypeName());
            rs = prepStmt.executeQuery();
            if (rs.next()) {
            	userTypeId = rs.getString(1);
            } 
            rs.close();
        }
        
        
        if (objUserMaster.getUserTypeName().startsWith("USEA Staff")){
            String password = HLCPassword.getPassword();
        }
        
        //=============================Checking for apostopies in the string and removing==========================
        
        String secQes=objUserMaster.getSecretQuestion();
        String s1 = secQes;
        String s2 = "'";
        String s3 = "";
        String str1 = null;
        Debug.print(" Replace String : "+s1);
        if (s1 != null && s1.trim().length() > 0) {
            str1 = DBHelper.replace(s1,s2,s3);
            Debug.print(" Replace String : "+str1);
            int index = s1.indexOf("'");    
            if (index >= 0){
            	secQes = str1;
            }
        }
        Debug.print(" Final String : "+secQes);  
        
        
        
        String insertStatement = "insert into tblusermaster (contact_type_id,user_type_id,prefix,first_name,middle_name,"+
                "last_name,sufix,dob,gender,email_id, password, secret_question, secret_answer,user_code,login_name,non_usea_mailing_status,non_usea_email_status,user_id,company_name)" +
                    " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?,?,?,?,?,?,?) ";

        prepStmt = con.prepareStatement(insertStatement);
        System.out.println("Inside the User Master ....\n\n ");
       // prepStmt.setString(1, membershipTypeId);
       //System.out.println("membershipTypeId : "+membershipTypeId);
        
        prepStmt.setString(1, objUserMaster.getContactTypeId());
        System.out.println("contactTypeId :  "+contactTypeId);
        prepStmt.setString(2, userTypeId);
        System.out.println("userTypeId :  "+userTypeId);
        prepStmt.setString(3, objUserMaster.getPrefix());
         System.out.println("prefix :  "+objUserMaster.getPrefix());
        prepStmt.setString(4, objUserMaster.getFirstName());
         System.out.println("firstName :  "+objUserMaster.getFirstName());
        prepStmt.setString(5, objUserMaster.getMiddleName());
        prepStmt.setString(6, objUserMaster.getLastName());
        prepStmt.setString(7, objUserMaster.getSufix());
       prepStmt.setDate(8, dt);
	   
         System.out.println("Date :  "+dt);
        prepStmt.setString(9, objUserMaster.getGender());
        prepStmt.setString(10, objUserMaster.getEmailId());
        System.out.println("emailId :  "+objUserMaster.getEmailId());
        prepStmt.setString(11, objUserMaster.getPassword());
        prepStmt.setString(12, secQes);
        System.out.println("secretQuestion :  "+secQes);
        prepStmt.setString(13, objUserMaster.getSecretAnswer());
        System.out.println("secretAnswer :  "+objUserMaster.getSecretAnswer());
        prepStmt.setString(14, objUserMaster.getUserCode());
        System.out.println("userCode :  "+objUserMaster.getUserCode());
        prepStmt.setString(15, objUserMaster.getLoginName());
        System.out.println("loginName :  "+objUserMaster.getLoginName());
        prepStmt.setBoolean(16, objUserMaster.nonUseaMailingStatus);
        System.out.println("nonUseaMailingStatus :  "+objUserMaster.nonUseaMailingStatus);
        prepStmt.setBoolean(17, objUserMaster.nonUseaEmailStatus);
        System.out.println("nonUseaEmailStatus :  "+objUserMaster.nonUseaEmailStatus);
        prepStmt.setString(18, objUserMaster.getUserId());
        System.out.println("userId :  "+userId);
        prepStmt.setString(19, usrcompanyname);
        System.out.println("Company Name :  "+usrcompanyname);
        
        int cnt = prepStmt.executeUpdate();
      
        prepStmt.close();
        releaseConnection();
        System.out.println("Succefully inserted :  "+cnt);
       
        }

    
    public void addContactDetails(HLCContactDetails objContact, String logName) throws RemoteException {
       
        String contactTypeId = null;;
       
        try{
        	contactTypeId = (String)getDetFrmContyId(objContact.getContactType());
           
            objContact.setContactTypeId(contactTypeId);
            objContact.setUserId(objContact.getUserId());
            insertRowContactDetails(objContact,logName);
        } catch(Exception exp){
            throw new EJBException("addContactDetails: " + exp.getMessage());
        }
    }
    
    private void insertRowContactDetails(HLCContactDetails objContact, String logName) throws SQLException {
        Debug.print("GeneralDBAction insertRowContactDetails");

        makeConnection();
        if (logName != null){
            try {
                userId = DBHelper.getUserId(con, logName);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        System.out.print("User Id is from insertRowContactDetails: "+userId);
        String insertStatement = "insert into tblContactDetails (contact_type_id,user_id,suite,address1,"+
            "address2,city,state,country,zip,phone_no, mobile_no, fax_no)" +
                " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?, ?) ";
        prepStmt = con.prepareStatement(insertStatement);
        System.out.println("Inside the Contact Details ....\n\n ");
        prepStmt.setString(1, objContact.getContactTypeId());
        System.out.print("contactTypeId: "+objContact.getContactTypeId());
        prepStmt.setString(2, objContact.getUserId());
        System.out.print("userId: "+objContact.getUserId());
        prepStmt.setString(3, objContact.getSuite());
        System.out.print("suite: "+objContact.getSuite());
        prepStmt.setString(4, objContact.getAddress1());
        prepStmt.setString(5, objContact.getAddress2());
        prepStmt.setString(6, objContact.getCity());
        prepStmt.setString(7, objContact.getState());
        prepStmt.setString(8, objContact.getCountry());
        prepStmt.setString(9, objContact.getZip());
        prepStmt.setString(10, objContact.getPhoneNo());
        System.out.print("phoneNo: "+objContact.getPhoneNo());
        prepStmt.setString(11, objContact.getMobileNo());
        System.out.print("mobileNo: "+objContact.getMobileNo());
        prepStmt.setString(12, objContact.getFaxNo());
        System.out.print("faxNo: "+objContact.getFaxNo());
        int cnt = prepStmt.executeUpdate();
        System.out.print("Record Inserted succefully  "+cnt);
        Debug.print(" Insert Contact Detail Data : \n"+objContact);
        prepStmt.close();
        releaseConnection();
    }

    
 public String getDetFrmContyId(String contactType){
        
        ArrayList array = new ArrayList();
        String contYId=null;
        try {
            makeConnection();
            String selectStatement = "SELECT contact_type_id FROM tblContactTypeMaster WHERE contact_type_name = ?";
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1, contactType.trim());
            rs = prepStmt.executeQuery();
            if (rs.next()) {
                contYId=rs.getString(1);
            } 
             prepStmt.close();
             releaseConnection();
        } catch (SQLException sqe) {
            throw new EJBException(sqe);
            //sqe.printStackTrace();
        } finally {releaseConnection(); }
        
        return contYId;
    }
 
 
 
 public ArrayList getAllRoles() throws RemoteException { 
     Debug.print("GeneralDBAction getAllRole");
     ArrayList results =(ArrayList)selectAllRole();
     return results;
  }
 
 public ArrayList selectAllRole(){
     Debug.print("GeneralDBAction.selectAllRole():");
     ArrayList rolesList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {

             String selectStatement=" select case when role_id in(select role_id from tblMapEntity union all select role_id from tblMapUserPrivilege "+
                                    " union all select role_id from tblMapRole) then '0' else '1' end flag, "+
                                    " role_id, role_name,role_desc,active_status,role_path from tblRoleMaster order by role_name";

         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         rolesList = new ArrayList();
         while(rs.next()){
             String roleId = rs.getString(2);
             String roleName = rs.getString(3);

             String roledesc = rs.getString("role_desc");
             String status = rs.getString("active_status");
             String flag = rs.getString("flag");
             String rolePath = rs.getString(6);

             String[] rlList = {roleId, roleName,roledesc,status,flag,rolePath};
             rolesList.add(rlList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
       
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllRole():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllRole():" + e.getMessage());
     }
     return rolesList;
 }    
 
 public ArrayList getAllViews() throws RemoteException { 
     System.out.println("GeneralDBAction getAllViews()");
     ArrayList results = (ArrayList)selectAllViews();
     return results;
  }
 
 public ArrayList selectAllViews(){
 	  System.out.println("GeneralDBAction: selectAllViews()");
       ArrayList viewList = new ArrayList();
       PreparedStatement prepStmt = null;
       ResultSet rs = null;
       makeConnection();
  	try {

 String selectStatement = " SELECT view_point_id, view_point_name from tblviewpointmaster order by view_point_name";
            
 
 prepStmt = con.prepareStatement(selectStatement);

 rs = prepStmt.executeQuery();
          
           while(rs.next()){
               String viewId = rs.getString(1);
               String viewName = rs.getString(2);
               String[] viList = {viewId, viewName};
               viewList.add(viList);
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
          
       } 
       catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in GeneralDBAction.selectAllViews():" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           e.printStackTrace();
       }
       return viewList;
   }
 
 
 //==============================Mapping  User  with Role ==========================================================
 public boolean createMappingUserWithRoles(String userId, ArrayList roleList) throws RemoteException{
     Debug.print("GeneralDBAction createMappingUserWithRoles UserId:" + userId);
     boolean result = false;
     boolean flag = false;
     if(userId!=null && userId.trim().length()!=0){
         flag =(boolean)deleteRow("user_id", userId,  "tblMapUserPrivilege","");
     }
     Debug.print("GeneralDBAction createMappingUserWithRoles():: deleteRow Deleted Enities Result:" + flag);
     if(flag){
         Iterator itRoleIds = roleList.iterator();
         while(itRoleIds.hasNext()){
             String roleId = (String)itRoleIds.next();
             if(roleId!=null){
                result =(boolean)insertUserWithRoleMapping(userId, roleId);
             }
         }
     }
     return result;
 }
 
 
//=============================================Delete Mapping Records with fieldValue details========================================= 
 public boolean deleteRow(String fieldName, String fieldValue, String tableName,String deptId) {
    Debug.print("GeneralDBAction.deleteRow()" +deptId);
    boolean result = false;
    makeConnection();
    try{
    	
    	
    	  String deleteStatement = "delete from " + tableName + "  where " + fieldName  + " = ? ";
          Debug.print("GeneralDBAction.deleteRow():" + "\n" + deleteStatement + ":" +  fieldValue);
          PreparedStatement prepStmt = con.prepareStatement(deleteStatement);
          prepStmt.setString(1, fieldValue);
          prepStmt.executeUpdate();
          prepStmt.close();
          releaseConnection();
          result = true;
    }
    catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in GeneralDBAction deleteRow:" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in  GeneralDBAction deleteRow:" + e.getMessage());
    }        
    return result;
}
 
 
//=============================================  User Map with Roles details=========================================      
 public boolean insertUserWithRoleMapping(String userId, String roleId) {
   Debug.print("GeneralDBAction.insertUserWithRoleMapping():");
   PreparedStatement prepStmt = null;
   boolean result = false;
   makeConnection();
   try {
       String insertStatement = "insert into tblMapUserPrivilege (user_id , role_id) " +
               " values( ? , ? )";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, userId);
       prepStmt.setString(2, roleId);
       prepStmt.executeUpdate();
       prepStmt.close();
       releaseConnection();
       result = true;
   } 
   catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in GeneralDBAction.insertUserWithRoleMapping():" + sql.getMessage());
   }
   catch(Exception e){
       releaseConnection();
       Debug.print("General Exception  in GeneralDBAction.insertUserWithRoleMapping():" + e.getMessage());
   }
   return result;
} 
 
 
 public ArrayList getMappingDetailsForEnitityAndPrivileges(String  entityId)  throws RemoteException {
     Debug.print("GeneralDBAction getMappingDetailsForEnitityAndPrivileges");
     ArrayList results =(ArrayList)selectAllMappingDetailsForEntity(entityId); 
     return results;
 }
 
 
//=============================================Getting Mapping permission with privilege details=========================================      
 public ArrayList selectAllMappingDetailsForEntity(String entityId){
     Debug.print("GeneralDBAction.selectAllMappingDetailsForEntity():");
     ArrayList entityMapList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT a.map_privilege_id , a.entity_id ,a.privilege_id, b.entity_name, c.privilege_name from tblMapPrivilege " +
         		"a , tblEntityMaster b , tblPrivilegeMaster c " +
                 " where a.privilege_id = c.privilege_id and a.entity_id = b.entity_id and a.entity_id =? order by b.entity_name";
         
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityId);
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         entityMapList = new ArrayList();
         while(rs.next()){
             String mapPrivilegeId = rs.getString(1);
             String entityIdVal = rs.getString(2);
             String privilegeId = rs.getString(3);
             String entityName = rs.getString(4);
             String privilegeName = rs.getString(5);
             
             String[] entMapList = {mapPrivilegeId, entityIdVal, privilegeId, entityName, privilegeName};
             entityMapList.add(entMapList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
         //Debug.print("RoleManagementDAOImpl.selectAllMappingDetailsForEntity():" + entityMapList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMappingDetailsForEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMappingDetailsForEntity():" + e.getMessage());
     }
     return entityMapList;
 }
 
 public ArrayList getPermissionBasedOnEntityRole(String  roleId, String entityId)  throws RemoteException{
     Debug.print("GeneralDBAction getPermissionBasedOnEntityRole");
     ArrayList results =(ArrayList)selectPermissionBasedRoleEntity(roleId, entityId);
     return results;
 } 
 
 //============================================= Get Permissions based on Role, Entity  =========================================      
 public ArrayList selectPermissionBasedRoleEntity(String roleId, String entityId){
     Debug.print("GeneralDBAction.selectPermissionBasedRoleEntity():");
     ArrayList roleEntityMapList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement="SELECT A.role_name, B.entity_name, C.privilege_name, D.permission_name, E.privilege_id, E.permission_id  from " +
         		"tblRoleMaster A, tblEntityMaster B, tblPrivilegeMaster C, tblPermissionMaster D, tblMapRole E " +
                 " WHERE E.role_id = A.role_id and E.entity_id = B.entity_id and  " +
                 " E.privilege_id = C.privilege_id and E.permission_id = D.permission_id and " +
                 " E.role_id = ? and E.entity_id = ? order by C.privilege_name" ;

         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,roleId);
         prepStmt.setString(2,entityId);
         
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         roleEntityMapList = new ArrayList();
         while(rs.next()){
             String roleName = rs.getString(1);
             String entityName = rs.getString(2);
             String privilegeName = rs.getString(3);
             String permissionName = rs.getString(4);
             String privilegeIdVal = rs.getString(5);
             String permissionId = rs.getString(6);
             String[] entMapList = {roleName, entityName, privilegeName, permissionName, privilegeIdVal, permissionId};
             roleEntityMapList.add(entMapList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
         //Debug.print("RoleManagementDAOImpl.selectPermissionBasedRoleEntity():" + roleEntityMapList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectPermissionBasedRoleEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectPermissionBasedRoleEntity():" + e.getMessage());
     }
     return roleEntityMapList;
 }

 public ArrayList getMappingDetailsForRoleSubPerm()  throws RemoteException{
     Debug.print("GeneralDBAction getPermissionBasedOnEntityRole");
     ArrayList results =(ArrayList)selectAllSubPermission();
     return results;
 }
 
 public ArrayList getcusdetails(String email) {
     Debug.print("GeneralDBAction.getAllPermission():");
     ArrayList cusList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         
         String selectStatement="SELECT subscription_id,order_id,customer_id from tblSignUpDetails where e_mail=?";
        
         Debug.print(" selectStatement "+selectStatement);
       
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1, email);
         rs = prepStmt.executeQuery();
         cusList = new ArrayList();
         while(rs.next()){

             String permissionId = rs.getString(1);
             String subPermissionId = rs.getString(2);
             String status = rs.getString(3);
               
             String[] perList = {permissionId, subPermissionId,status};
             cusList.add(perList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
      
     }
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
     }
     return cusList;
 }
 
 
 
 public ArrayList selectAllSubPermission() {
     Debug.print("GeneralDBAction.getAllPermission():");
     ArrayList permissionList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         
         String selectStatement="SELECT permission_id,sub_permission_name,active_status from tblSubMenuList";
        
         Debug.print(" selectStatement "+selectStatement);
       
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         permissionList = new ArrayList();
         while(rs.next()){

             String permissionId = rs.getString(1);
             String subPermissionId = rs.getString(2);
             String status = rs.getString(3);
               
             String[] perList = {permissionId, subPermissionId,status};
             permissionList.add(perList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
      
     }
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
     }
     return permissionList;
 }

 public ArrayList getAllPermission() throws RemoteException {
     Debug.print("GeneralDBAction getAllPermission");
     ArrayList results =(ArrayList)selectAllPermission();
     return results;
  }
 
 
//=============================================Getting All Permission details=========================================      
 public ArrayList selectAllPermission() {
     Debug.print("GeneralDBAction.getAllPermission():");
     ArrayList permissionList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     
     makeConnection();
	try {
       
         String selectStatement=" SELECT permission_id, permission_name from tblPermissionMaster order by permission_name" ;
     
         Debug.print(" selectStatement "+selectStatement);
      
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         permissionList = new ArrayList();
         while(rs.next()){
             
             String privilegeId = rs.getString(1);
             String permissionId = rs.getString(2);
            
             String[] perList = {privilegeId,permissionId};
             permissionList.add(perList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
     }
     return permissionList;
 }
 
 
 public ArrayList getAllMapPrivilege(String roleId, String entityId) throws RemoteException {
     Debug.print("GeneralDBAction getAllMapPrivilege");
     ArrayList results =(ArrayList)selectAllMapPrivilege(roleId, entityId);
     return results;
  }

 
 //=============================================Getting All Privilege details=========================================
 public ArrayList selectAllMapPrivilege(String roleId, String entityId){
     Debug.print("GeneralDBAction.getAllPrivilege():");
     ArrayList privilegeList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
        
     String selectStatement="select 'Map' chk, privilege_id , privilege_name from tblPrivilegeMaster where privilege_id in( select privilege_id from tblMapRole where role_id=? and entity_id=? ) "
             +" union "
             +" select 'All' chk, privilege_id , privilege_name from tblPrivilegeMaster where privilege_id not in( select privilege_id from tblMapRole where role_id=? and entity_id=? ) "
             +" and privilege_id in(select a.privilege_id from tblMapPermission a where a.access_name != '') order by privilege_name";


         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1, roleId);
         prepStmt.setString(2, entityId);
         prepStmt.setString(3, roleId);
         prepStmt.setString(4, entityId);

         rs = prepStmt.executeQuery();

         privilegeList = new ArrayList();
         while(rs.next()){
             String chk = rs.getString(1);
              String privilegeId = rs.getString(2);
             String privilegeName = rs.getString(3);

             String[] priList = {chk, privilegeId, privilegeName};
             privilegeList.add(priList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
         //Debug.print("RoleManagementDAOImpl.getAllPrivilege():" + privilegeList);
     }
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMapPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMapPrivilege():" + e.getMessage());
     }
     return privilegeList;
 }
 
 
 public ArrayList getAllMapPermission(String roleId, String entityId) throws RemoteException {
     Debug.print("GeneralDBAction getAllMapPrivilege");
     ArrayList results =(ArrayList)selectAllMapPermission(roleId, entityId);
     return results;
  }
 public ArrayList selectAllMapPermission(String roleId, String entityId){
     Debug.print("GeneralDBAction.getAllPermission():");
     ArrayList permissionList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
       
       

         String selectStatement="select distinct 'Map' chk, a.privilege_id, a.permission_id , a.access_name from tblMapPermission a, tblMapRole b where a.privilege_id = b.privilege_id and a.permission_id = b.permission_id and b.role_id =? and b.entity_id =? and a.access_name ! = '' "
                 +"union"
                 +" select distinct 'All' chk, b.privilege_id, a.permission_id , b.access_name from tblPermissionMaster a, tblMapPermission b where a.permission_id = b.permission_id and b.access_name !='' "
                 +" and a.permission_id not in(select permission_id from tblMapRole where privilege_id = b.privilege_id and role_id =? and entity_id =?) order by a.access_name " ;


         Debug.print(" selectStatement "+selectStatement);
        
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1, roleId);
         prepStmt.setString(2, entityId);
         prepStmt.setString(3, roleId);
         prepStmt.setString(4, entityId);
        
         rs = prepStmt.executeQuery();
         permissionList = new ArrayList();
         while(rs.next()){

             String chk = rs.getString(1);
             String privilegeId = rs.getString(2);
             String permissionId = rs.getString(3);
               String accessName = rs.getString(4);
             String[] perList = {chk, privilegeId,permissionId, accessName};
             permissionList.add(perList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
       
     }
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPermission():" + e.getMessage());
     }
     return permissionList;
 }
 
 
 //==============================Mapping  Role  with Entities and Privilege==========================================================
 
 public boolean generateMappingRoleWithEntitiesAndPrivileges(String roleId, String entityId, ArrayList priPerList) throws RemoteException {
     Debug.print("GeneralDBAction generateMappingRoleWithEntitiesAndPrivileges() : " + roleId + ": Entity :" + entityId);
     boolean result =false;
     boolean flag = false;
     if(roleId!=null && roleId.trim().length()!=0 && entityId!=null && entityId.trim().length()!=0){
         flag =(boolean)deleteRow("role_id", roleId, "entity_id" , entityId , "tblMapRole");
     }
     
     Debug.print("GeneralDBAction generateMappingRoleWithEntities(): Deleted Enities Result:" + flag);
     if(flag){
         Iterator itPriPerList = priPerList.iterator();
         while(itPriPerList.hasNext()){
             String []  strPriPerList = (String [])itPriPerList.next();
             String privilegeId = strPriPerList[0];
             String permissionId = strPriPerList[1];
             if(privilegeId!=null && permissionId!=null && privilegeId.trim().length()!=0 && permissionId.trim().length()!=0){
            	 result=(boolean)insertRoleEntityPrivilegeMapping(roleId, entityId, privilegeId, permissionId);
             }
         }
         result = true;
     }
      return result;
  } 
 
 
//=============================================Delete Mapping Records with fieldValue details========================================= 
 public boolean deleteRow(String fieldName1, String fieldValue1, String fieldName2, String fieldValue2, String tableName) {
    Debug.print("GeneralDBAction.deleteRow()");
    boolean result = false;
    makeConnection();
    try{
        String deleteStatement = "delete from " + tableName + "  where " + fieldName1  + " = ? and " + fieldName2 + " = ?" ;
        PreparedStatement prepStmt = con.prepareStatement(deleteStatement);
        prepStmt.setString(1, fieldValue1);
        prepStmt.setString(2, fieldValue2);
        prepStmt.executeUpdate();
        prepStmt.close();
        releaseConnection();
        result = true;
    }
    catch(SQLException sql){
       releaseConnection();
       Debug.print("SQL Exception in GeneralDBAction deleteRow:" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in GeneralDBAction deleteRow:" + e.getMessage());
    }        
    return result;
}
 
//=============================================  Mapping Entites with privilege details=========================================      
 public boolean insertRoleEntityPrivilegeMapping(String roleId, String entityId, String privilegeId, String permissionId) {
    Debug.print("GeneralDBAction.insertRoleEntityPrivilegeMapping():");
    PreparedStatement prepStmt = null;
    makeConnection();
    try {
        String insertStatement = "insert into tblMapRole (role_id , entity_id, privilege_id, permission_id) " +
                " values( ? , ? , ? , ?)";
        prepStmt = con.prepareStatement(insertStatement);
        prepStmt.setString(1, roleId);
        prepStmt.setString(2, entityId);
        prepStmt.setString(3, privilegeId);
        prepStmt.setString(4, permissionId);
        prepStmt.executeUpdate();
        prepStmt.close();
        releaseConnection();
    } 
    catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.insertRoleEntityPrivilegeMapping():" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in GeneralDBAction.insertRoleEntityPrivilegeMapping():" + e.getMessage());
    }
    return true;
} 
 
 public ArrayList getAllEntity() throws RemoteException { 
     Debug.print("GeneralDBAction getAllEntity");
     ArrayList results =(ArrayList)selectAllEntity();
     return results;    
  }
 
//=============================================Getting All Enities details=========================================      
 public ArrayList selectAllEntity(){
     Debug.print("GeneralDBAction.selectAllEntity():");
     ArrayList entitiesList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement = " SELECT entity_id, entity_name from tblEntityMaster order by entity_name";
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         entitiesList = new ArrayList();
         while(rs.next()){
             String entityId = rs.getString(1);
             String entityName = rs.getString(2);
             String[] entList = {entityId, entityName};
             entitiesList.add(entList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        // Debug.print("RoleManagementDAOImpl.selectAllEntity():" + entitiesList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllEntity():" + e.getMessage());
     }
     return entitiesList;
 }  
 
 public boolean generateMappingRoleWithEntities(String roleId, ArrayList entitesList) throws RemoteException {
     Debug.print("GeneralDBAction generateMappingRoleWithEntities()" + roleId);
     boolean result =false;
     Iterator itEntityList = entitesList.iterator();
     boolean flag =(boolean)deleteRow("role_id", roleId, "tblMapEntity","");
     Debug.print("GeneralDBAction generateMappingRoleWithEntities(): Deleted Enities Result:" + flag);
     if(flag){
         if(entitesList!=null && entitesList.size()!=0){
             while(itEntityList.hasNext()){
                 String entityId = (String)itEntityList.next();
                 if(entityId!=null && entityId.trim().length()!=0){
                	 result=insertRoleEntityMapping(roleId, entityId);
                 }
             }
         }
         result = true;
     }
      return result;
  }
 
 
//=============================================  Mapping Entites with privilege details=========================================      
 public boolean insertRoleEntityMapping(String roleId, String entityId) {
     Debug.print("GeneralDBAction.insertRoleEntityMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblMapEntity (role_id , entity_id) " +
                 " values( ? , ? )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, roleId);
         prepStmt.setString(2, entityId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertRoleEntityMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertRoleEntityMapping():" + e.getMessage());
     }
     return true;
 }
 
 
 
 public boolean createRole(String roleName, String roledesc, String status) throws RemoteException{
	
	        Debug.print("GeneralDBAction createRole");
	        boolean result = false;
	        if(roleName!=null && roleName.trim().length()!=0 && isRoleNameExist(roleName)){
	
	            result = (boolean)insertRole(roleName,roledesc,status);
	
	        }
	        Debug.print("GeneralDBAction createRole");
	        return result;
	    } 
 
 
 public boolean isRoleNameExist(String roleName) {
     Debug.print("GeneralDBAction.isRoleNameExist():" + roleName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select role_id from tblRoleMaster where role_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,roleName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction:: Could not find any from roleName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isRoleNameExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isRoleNameExist():" + result);
     return result;
 }  
 
 public boolean insertRole(String roleName,String roledesc,String status) {
	
	            Debug.print("GeneralDBAction.insertRole():");
	            PreparedStatement prepStmt = null;
	            makeConnection();
	            try {
		
	                String insertStatement = "insert into tblRoleMaster (role_name,role_desc,active_status) " +
	                        " values( ?,?,?  )";
		
	                prepStmt = con.prepareStatement(insertStatement);
	                prepStmt.setString(1, roleName);
	
	                 prepStmt.setString(2, roledesc);
	                  prepStmt.setString(3, status);
	
	                prepStmt.executeUpdate();
	                prepStmt.close();
	                releaseConnection();
	            } 
	            catch(SQLException sql){
	                releaseConnection();
	                Debug.print("SQL Exception in GeneralDBAction.insertRole():" + sql.getMessage());
	            }
	            catch(Exception e){
	                releaseConnection();
	                Debug.print("General Exception  in GeneralDBAction.insertRole():" + e.getMessage());
	            }
	            return true;
	        } 
 
 
 public boolean editRole(String roleId, String roleName,String roledesc,String status) throws RemoteException{
	    
	        Debug.print("GeneralDBAction editRole");
	        boolean result = false;

	       
	        if(roleId!=null&& roleId.trim().length()!=0 && roleName!=null && roleName.trim().length()!=0){
	            boolean chkResult =isRoleNameEditExist(roleId, roleName);
	        
	            Debug.print("GeneralDBAction editRole chkResult:" + chkResult);
	            if(chkResult==true){
	
	                result =updateRole(roleId, roleName,roledesc,status);
	
	            }
	        }
	        Debug.print("GeneralDBAction editRole Result:" + result);
	        return result;
	    }
 
 public boolean isRoleNameEditExist(String roleId, String roleName) {
	    
	        Debug.print("GeneralDBAction.isRoleNameEditExist():" + roleName);
	        boolean result = true;
	        makeConnection();
	   	try {
	            String selectStatement = "select role_id from tblRoleMaster where role_name = ? and role_id != ? " ;
	            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
	            prepStmt.setString(1,roleName);
	            prepStmt.setString(2,roleId);
	            
	            ResultSet rs = prepStmt.executeQuery();
	            if (rs.next()){
	                result = false;
	            }
	            
	            rs.close();
	            prepStmt.close();
	            releaseConnection();
	            Debug.print("GeneralDBAction isRoleNameEditExist result:" + result);  
	        } 
	        catch (SQLException e) {
	            releaseConnection();
	            Debug.print("GeneralDBAction Could not find any from isRoleNameEditExist" + e.getMessage());
	        }
	        catch(Exception e){
	            releaseConnection();
	            Debug.print("General Exception  in GeneralDBAction isRoleNameEditExist:" + e.getMessage());
	        }
	        Debug.print("GeneralDBAction isRoleNameEditExist():" + result);
	        return result;
	    } 
 
 public boolean updateRole(String roleId, String roleName,String roledesc,String status) {
	    
	        Debug.print("GeneralDBAction.updateRole():");
	        PreparedStatement prepStmt = null;
	        makeConnection();
	        try {
	            String insertStatement = "update tblRoleMaster set role_name = ?,role_desc =? " +
		
	                    " ,active_status = ? where role_id = ?";
		
	                prepStmt = con.prepareStatement(insertStatement);
	                prepStmt.setString(1, roleName);
	               
	                 prepStmt.setString(2, roledesc);
	                prepStmt.setString(3, status);
	                 prepStmt.setString(4, roleId);
	             
	                prepStmt.executeUpdate();
	                prepStmt.close();
	       

	            releaseConnection();
	        }
	        
	        catch(SQLException sql){
	            releaseConnection();
	            Debug.print("SQL Exception in GeneralDBAction.updateRole():" + sql.getMessage());
	        }
	        catch(Exception e){
	            releaseConnection();
	            Debug.print("General Exception  in GeneralDBAction.updateRole():" + e.getMessage());
	        }
	        return true;
	    }
 
 public boolean createEntity(String entityName) throws RemoteException{
     Debug.print("GeneralDBAction createEntity");
     boolean result = false;
     if(entityName!=null && entityName.trim().length()!=0){
         if(isEntityNameExist(entityName)){
             result =insertEntity(entityName);
         }
     }
     Debug.print("GeneralDBAction createEntity");
     return result;
 }
 
 
 public boolean isEntityNameExist(String entityName) {
     Debug.print("GeneralDBAction.isEntityNameExist():" + entityName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select entity_id from tblEntityMaster where entity_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from entityName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isEntityNameExist:" + e.getMessage());
     }
     Debug.print("isEntityNameExist():" + result);
     return result;
 }
 
 public boolean insertEntity(String entityName) {
     Debug.print("GeneralDBAction.insertEntity():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblEntityMaster (entity_name) " +
                 " values(?)";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, entityName);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertEntity():" + e.getMessage());
     }
     return true;
 } 
 
 public String [] getEntity(String entityId){
     Debug.print("GeneralDBAction.selectEntity():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String[] entList = {};
     makeConnection();
	try {
         String selectStatement=" SELECT entity_id, entity_name from tblEntityMaster where entity_id = ? " ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityId);
         rs = prepStmt.executeQuery();
         if(rs.next()){
             String entityIdVal = rs.getString(1);
             String entityName = rs.getString(2);
             String[] tempEntList = {entityIdVal, entityName};
             entList = tempEntList;
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectEntity():" + e.getMessage());
     }
     return entList;
 }
 
 public boolean editEntity(String entityId, String entityName) throws RemoteException{
     Debug.print("GeneralDBAction editEntity");
     boolean result = false;
     if(entityId!=null && entityId.trim().length()!=0 && entityName!=null && entityName.trim().length()!=0){
         boolean chkResult =isEntityNameEditExist(entityId, entityName);
         Debug.print("GeneralDBAction editEntity chkResult:" + chkResult);
         if(chkResult==true){
             result =updateEntity(entityId, entityName);
         }
     }
     Debug.print("GeneralDBAction editEntity Result:" + result);
     return result;
 } 
 
 public boolean isEntityNameEditExist(String entityId, String entityName) {
     Debug.print("GeneralDBAction.isEntityNameEditExist():" + entityName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select entity_id from tblEntityMaster where entity_name = ? and entity_id != ?" ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,entityName);
         prepStmt.setString(2,entityId);
         
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from isEntityNameEditExist" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isEntityNameEditExist:" + e.getMessage());
     }
     Debug.print("isEntityNameEditExist():" + result);
     return result;
 }   
 
 public boolean updateuser(HLCUserMaster objUserMaster) {
     Debug.print("GeneralDBAction.updateuser():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "update tblUserMaster set first_name = ?, middle_name = ?, last_name = ?, email_id = ?, " +
                 " secret_question = ?, secret_answer = ? where user_id = ? ";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, objUserMaster.getFirstName());
         prepStmt.setString(2, objUserMaster.getMiddleName());
         prepStmt.setString(3, objUserMaster.getLastName());
         prepStmt.setString(4, objUserMaster.getEmailId());
         prepStmt.setString(5, objUserMaster.getSecretQuestion());
         prepStmt.setString(6, objUserMaster.getSecretAnswer());
         prepStmt.setString(7, objUserMaster.getUserId());
         
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updateEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updateEntity():" + e.getMessage());
     }
     return true;
 }  
 
 
 public boolean updatecontact(HLCUserMaster objUserMaster,HLCContactDetails objContact ) {
     Debug.print("GeneralDBAction.updatecntact():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "update tblContactDetails set address1 = ?, address2 = ?, city = ?, state = ?, " +
                 " country = ?, zip = ?, phone_no = ?, mobile_no = ? where user_id = ? and contact_type_id = ? ";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, objContact.getAddress1());
         prepStmt.setString(2, objContact.getAddress2());
         prepStmt.setString(3, objContact.getCity());
         prepStmt.setString(4, objContact.getState());
         prepStmt.setString(5, objContact.getCountry());
         prepStmt.setString(6, objContact.getZip());
         prepStmt.setString(7, objContact.getPhoneNo());
         prepStmt.setString(8, objContact.getMobileNo());
         prepStmt.setString(9, objUserMaster.getUserId());
         prepStmt.setString(10, objContact.getContactTypeId());
         
         Debug.print("address 1 "+objContact.getAddress1());
         Debug.print("address 2 "+objContact.getAddress2());
         Debug.print("city "+objContact.getCity());
         Debug.print("state "+objContact.getState());
         Debug.print("country "+objContact.getCountry());
         Debug.print("zip "+objContact.getZip());
         Debug.print("phone "+objContact.getPhoneNo());
         Debug.print("mobile "+objContact.getMobileNo());
         Debug.print("user "+objUserMaster.getUserId());
         Debug.print("type id "+objContact.getContactTypeId());
         
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
         Debug.print("Successfully updated ");
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updateEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updateEntity():" + e.getMessage());
     }
     return true;
 }  
 
 
 public boolean updateEntity(String entityId, String entityName) {
     Debug.print("GeneralDBAction.updateEntity():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "update tblEntityMaster set entity_name = ? " +
                 " where entity_id = ? ";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, entityName);
         prepStmt.setString(2, entityId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updateEntity():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updateEntity():" + e.getMessage());
     }
     return true;
 }  
 
 
 public boolean createPermission(String permissionName) throws RemoteException{
     Debug.print("GeneralDBAction createPermission");
     boolean result = false;
     if(isPermissionNameExist(permissionName)){
         result =insertPermission(permissionName);
     }
     Debug.print("GeneralDBAction createPermission");
     return result;
 }
 
 public boolean isPermissionNameExist(String permissionName) {
     Debug.print("GeneralDBAction.isPermissionNameExist():" + permissionName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select permission_id from tblPermissionMaster where permission_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,permissionName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from permissionName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isPermissionNameExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isPermissionNameExist():" + result);
     return result;
 }

 public boolean insertPermission(String permissionName){
     Debug.print("GeneralDBAction.insertPermission():");
     PreparedStatement prepStmt = null;
     boolean result = false;
     makeConnection();
     try {
         String insertStatement = "insert into tblPermissionMaster (permission_name) " +
                 " values(?)";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, permissionName);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
         result = true;
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertPermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertPermission():" + e.getMessage());
     }
     return result;
 }
 
 
 public String [] getPermission(String permissionId){
     Debug.print("GeneralDBAction.selectPrivilege():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String[] perList = {};
     makeConnection();
	try {
         String selectStatement=" SELECT permission_id, permission_name from tblPermissionMaster where permission_id = ? " ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,permissionId);
         rs = prepStmt.executeQuery();
         if(rs.next()){
             String permissionIdVal = rs.getString(1);
             String permissionName = rs.getString(2);
             String[] tempPerList = {permissionIdVal, permissionName};
             perList = tempPerList;
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
        // Debug.print("RoleManagementDAOImpl.selectPrivilege():" + perList);
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectPrivilege():" + e.getMessage());
     }
     return perList;
 }   
 
 
 public boolean editPermission(String permissionId, String permissionName) throws RemoteException{
     Debug.print("GeneralDBAction editPermission");
     boolean result = false;
     boolean chkResult =isPermissionNameEditExist(permissionId, permissionName);
     Debug.print("GeneralDBAction editPermission chkResult:" + chkResult);
     if(chkResult==true){
         result =updatePermission(permissionId, permissionName);
     }
     Debug.print("GeneralDBAction editPermission Result:" + result);
     return result;
 }
 
 public boolean isPermissionNameEditExist(String permissionId, String permissionName){
     Debug.print("GeneralDBAction.isPermissionNameEditExist():" + permissionName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select permission_id from tblPermissionMaster where permission_name = ? and permission_id != ?" ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,permissionName);
         prepStmt.setString(2,permissionId);
         
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from isPermissionNameEditExist" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isPermissionNameEditExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isPrivilegeNameExist():" + result);
     return result;
 } 
 
 public boolean updatePermission(String permissionId, String permissionName) {
     Debug.print("GeneralDBAction.updatePermission():");
     PreparedStatement prepStmt = null;
     boolean result = false;
     makeConnection();
     try {
         String insertStatement = "update tblPermissionMaster set permission_name = ? " +
                 " where permission_id = ?";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, permissionName);
         prepStmt.setString(2, permissionId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
         result = true;
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updatePermission():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updatePermission():" + e.getMessage());
     }
     return result;
 }    
 
 public boolean createPrivilege(String privilegeName) throws RemoteException{
     Debug.print("GeneralDBAction createPrivilege");
     boolean result = false;
     if(privilegeName!=null && privilegeName.trim().length()!=0){
         if(isPrivilegeNameExist(privilegeName)){
             result =insertPrivilege(privilegeName);
         }
     }
     return result;
 }
 
 public boolean isPrivilegeNameExist(String privilegeName) {
     Debug.print("GeneralDBAction.isPrivilegeNameExist():" + privilegeName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select privilege_id from tblPrivilegeMaster where privilege_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from privilegeName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isPrivilegeNameExist:" + e.getMessage());
     }
     Debug.print("isPrivilegeNameExist():" + result);
     return result;
 }
 
 public boolean insertPrivilege(String privilegeName) {
     Debug.print("GeneralDBAction.insertPrivilege():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblPrivilegeMaster (privilege_name) " +
                 " values( ?  )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, privilegeName);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertPrivilege():" + e.getMessage());
     }
     return true;
 } 
 
 public ArrayList getAllPrivilege(){
     Debug.print("GeneralDBAction.getAllPrivilege():");
     ArrayList privilegeList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT privilege_id, privilege_name, privilege_path from tblPrivilegeMaster order by privilege_name";
         prepStmt = con.prepareStatement(selectStatement);
         rs = prepStmt.executeQuery();
         privilegeList = new ArrayList();
         while(rs.next()){
             String privilegeId = rs.getString(1);
             String privilegeName = rs.getString(2);
             String privilegePath = rs.getString(3);
             String[] priList = {privilegeId, privilegeName, privilegePath};
             privilegeList.add(priList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getAllPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getAllPrivilege():" + e.getMessage());
     }
     return privilegeList;
 }

 public String [] getPrivilege(String privilegeId){
     Debug.print("GeneralDBAction.selectPrivilege():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String[] priList = {};
     makeConnection();
	try {
         String selectStatement=" SELECT privilege_id, privilege_name, privilege_path from tblPrivilegeMaster where privilege_id = ? " ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeId);
         rs = prepStmt.executeQuery();
         if(rs.next()){
             String privilegeIdVal = rs.getString(1);
             String privilegeName = rs.getString(2);
             String privilegePath = rs.getString(3);
             String tempPriList[] = {privilegeIdVal, privilegeName, privilegePath};
             priList = tempPriList;
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
      
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectPrivilege():" + e.getMessage());
     }
     return priList;
 } 
 
 public boolean editPrivilege(String privilegeId, String privilegeName) throws RemoteException{
     Debug.print("GeneralDBAction editPrivilege");
     boolean result = false;
     if(privilegeId!=null && privilegeId.trim().length()!=0){
         boolean chkResult =isPrivilegeNameEditExist(privilegeId, privilegeName);
         Debug.print("GeneralDBAction editPrivilege chkResult:" + chkResult);
         if(chkResult==true){
             result =updatePrivilege(privilegeId, privilegeName);
         }
     }
     Debug.print("GeneralDBAction editPrivilege Result:" + result);
     return result;
 }
 
 public boolean isPrivilegeNameEditExist(String privilegeId, String privilegeName) {
     Debug.print("GeneralDBAction.isPrivilegeNameEditExist():" + privilegeName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select privilege_id from tblPrivilegeMaster where privilege_name = ? and privilege_id != ?" ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeName);
         prepStmt.setString(2,privilegeId);
         
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("Could not find any from isPrivilegeNameEditExist" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in isPrivilegeNameEditExist:" + e.getMessage());
     }
     Debug.print("isPrivilegeNameExist():" + result);
     return result;
 }  
 
 
 public boolean updatePrivilege(String privilegeId, String privilegeName){
     Debug.print("GeneralDBAction.updatePrivilege():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "update tblPrivilegeMaster set privilege_name = ? " +
                 " where privilege_id = ?";
         
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, privilegeName);
         prepStmt.setString(2, privilegeId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updatePrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updatePrivilege():" + e.getMessage());
     }
     return true;
 }  
 
 public ArrayList getMappingDetailsForPermissionAndPrivilege(String privilegeId){
     Debug.print("GeneralDBAction.selectAllMappingDetailsForPrivilege():");
     ArrayList permissionMapList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT a.map_permission_id , b.permission_name ,a.access_name, a.access_url " +
         		"from tblMapPermission a , tblPermissionMaster b where a.permission_id = b.permission_id and a.privilege_id = ? ";
         
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,privilegeId);
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         permissionMapList = new ArrayList();
         while(rs.next()){
             String mapPermissionId = rs.getString(1);
             String permissionName = rs.getString(2);
             String accessName = rs.getString(3);
             String accessUrl = rs.getString(4);
             String[] priMapList = {mapPermissionId, permissionName, accessName, accessUrl};
             permissionMapList.add(priMapList);
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
       
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + e.getMessage());
     }
     return permissionMapList;
 }
 
 public boolean generateMappingEnitityWithPrivileges(String entityId, ArrayList privilegeList) throws RemoteException {
     Debug.print("GeneralDBAction generateMappingEnitityWithPrivileges()" + entityId);
     boolean result =false;
     boolean flag = deleteRow("entity_id", entityId, "tblMapPrivilege","");
     Debug.print("GeneralDBAction generateMappingEnitityWithPrivileges(): Deleted Enities Result:" + flag);
     if(flag){
         if(privilegeList!=null && privilegeList.size()!=0){
             Iterator itPrivilege = privilegeList.iterator();
             while(itPrivilege.hasNext()){
                 String privilegeId = (String)itPrivilege.next();
                 if(privilegeId!=null && privilegeId.trim().length()!=0){
                     insertEntityPrivilegeMapping(entityId, privilegeId);
                 }
             }
         }
         result = true;
     }
      return result;
  }
 
 
 public boolean insertEntityPrivilegeMapping(String entityId, String privilegeId) {
     Debug.print("GeneralDBAction.insertEntityPrivilegeMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblMapPrivilege (entity_id , privilege_id) " +
                 " values( ? , ? )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, entityId);
         prepStmt.setString(2, privilegeId);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertEntityPrivilegeMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertEntityPrivilegeMapping():" + e.getMessage());
     }
     return true;
 }
 
 
 public void editMappingPermissionToPrivilege(ArrayList mapPriPerList,String privId) throws RemoteException{
     Debug.print("GeneralDBAction.editMappingPermissionToPrivilege()");
     Iterator itMapPriPer = mapPriPerList.iterator();
     while(itMapPriPer.hasNext()){
         String priList[] = (String [])itMapPriPer.next();
         String mapPermissionId = priList[0];
         String accessName = priList[1];
         String accessUrl = priList[2];
         
         if(accessName!=null && accessName.trim().length()!=0 ){
             Debug.print("GeneralDBAction.editMappingPermissionToPrivilege() accessName not empty");
             if(isAccessNameExistinEdit(mapPermissionId,accessName,"","")){
                 updatePermissionPrivilegeMapping( mapPermissionId, accessName, accessUrl,privId);
             }
             else{
             	insertPermissionPrivilegeMapping(privId, mapPermissionId, accessName, accessUrl);
             }
         }
         else{
         	if(isAccessNameExistinEdit("","",privId,mapPermissionId)){
         		Debug.print("GeneralDBAction.editMappingPermissionToPrivilege() empty accessName");
         		updatePermissionPrivilegeMapping( mapPermissionId, accessName, accessUrl,privId);
         	}
         	else {
         		insertPermissionPrivilegeMapping(privId, mapPermissionId, accessName, accessUrl);
         	}
         }
     }
 }
 
 
 public boolean isAccessNameExistinEdit(String mapPermissionId, String accessName,String privId, String permissionId) {
     Debug.print("GeneralDBAction.isAccessNameExistinEdit():" + accessName);
     boolean result = true;
     String selectStatement=null;
     PreparedStatement prepStmt=null;
     ResultSet rs=null;
     makeConnection();
	try {
		 	
		if(!mapPermissionId.equals("") && !accessName.equals("")) {
			
			selectStatement = "select map_permission_id from tblMapPermission where access_name = ? and map_permission_id != ?" ;
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,accessName);
         prepStmt.setString(2,mapPermissionId);
         rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
		}
         
         if(!privId.equals("") && !permissionId.equals("")) {            	

	            selectStatement = "select count(1) from tblMapPermission where privilege_id = ?" ;
	       		prepStmt = con.prepareStatement(selectStatement);
	       		prepStmt.setString(1,privId);
	       		
	       		rs = prepStmt.executeQuery();
	       		
	            if (rs.next()){
	                int recCnt = rs.getInt(1);
	                    if(recCnt==12){
	                    Debug.print("If Inside recCnt==="+recCnt);
	                    result=true;
	                }
	                else {
	                	 Debug.print("else Inside recCnt==="+recCnt);
	                	result = false;
	                }
	            }
         }
         
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from accessName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isAccessNameExistinEdit:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isAccessNameExistinEdit():" + result);
     return result;
 } 
 
 
 public boolean updatePermissionPrivilegeMapping(String mapPermissionId, String accessName, String accessUrl,String privId){
     Debug.print("GeneralDBAction.updatePermissionPrivilegeMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     String statementQuery="";
     try {
     	
     		statementQuery = "update tblMapPermission set access_name = ? , access_url = ? " +
     				" where map_permission_id = ?";   		
     
                 
         
         prepStmt = con.prepareStatement(statementQuery);
         prepStmt.setString(1, accessName);
         prepStmt.setString(2, accessUrl);
         
        
         prepStmt.setString(3, mapPermissionId);
       
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     }
     
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.updatePermissionPrivilegeMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.updatePermissionPrivilegeMapping():" + e.getMessage());
     }
     return true;
 }
 
 
 public boolean insertPermissionPrivilegeMapping(String privilegeId, String permissionId, String accessName, String accessUrl){
     Debug.print("GeneralDBAction.insertPermissionPrivilegeMapping():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String insertStatement = "insert into tblMapPermission (privilege_id , permission_id, access_name, access_url) " +
                 " values( ? , ? , ? , ? )";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, privilegeId);
         prepStmt.setString(2, permissionId);
         prepStmt.setString(3, accessName);
         prepStmt.setString(4, accessUrl);
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.insertPermissionPrivilegeMapping():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.insertPermissionPrivilegeMapping():" + e.getMessage());
     }
     return true;
 }
 
 public void createMappingPermissionToPrivilege(String privilegeId, ArrayList mapPriPerList) throws RemoteException{
     Debug.print("GeneralDBAction getAllPermission");
     Iterator itMapPriPer = mapPriPerList.iterator();
     while(itMapPriPer.hasNext()){
         String priList[] = (String [])itMapPriPer.next();
         String permissionId = priList[0];
         String accessName = priList[1];
         String accessUrl = priList[2];
         if(accessName.trim().length()!=0 && accessName !=null){
             if(isAccessNameExist(accessName)){
                 insertPermissionPrivilegeMapping(privilegeId, permissionId, accessName, accessUrl);
             }
             else{
                  insertPermissionPrivilegeMapping(privilegeId, permissionId, "", accessUrl);
             }
         }
         else{
             insertPermissionPrivilegeMapping(privilegeId, permissionId, accessName, accessUrl);
         }
     }
 }
 
 public boolean isAccessNameExist(String accessName) {
     Debug.print("GeneralDBAction.isAccessNameExist():" + accessName);
     boolean result = true;
     makeConnection();
	try {
         String selectStatement = "select map_permission_id from tblMapPermission where access_name = ? " ;
         PreparedStatement prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,accessName);
         ResultSet rs = prepStmt.executeQuery();
         if (rs.next()){
             result = false;
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
     } 
     catch (SQLException e) {
         releaseConnection();
         Debug.print("GeneralDBAction Could not find any from accessName" + e.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction isAccessNameExist:" + e.getMessage());
     }
     Debug.print("GeneralDBAction isAccessNameExist():" + result);
     return result;
 }
 
 public boolean deleteRole(String chkRoleIdArr[]) throws RemoteException{
     Debug.print("GeneralDBAction deleteRole");
     boolean result = false;


     if(chkRoleIdArr!=null){

         //boolean chkResult =dao.isRoleNameExist(roleId);
         boolean chkResult =isRoleNameExist(chkRoleIdArr[0]);

         Debug.print("GeneralDBAction deleteRole chkResult:" + chkResult);
         if(chkResult==true){
             //result = dao.deleteRole(roleId);
             result =deleteRoleDet(chkRoleIdArr);
         }
     }
     Debug.print("GeneralDBAction deleteRole Result:" + result);
     return result;
 }
 
 public boolean deleteRoleDet(String chkRoleIdArr[]) {
     Debug.print("GeneralDBAction.deleteRole():");
     PreparedStatement prepStmt = null;
     makeConnection();
     try {
         String deleteStatement = "delete from tblRoleMaster where role_id = ?";
                 
         for(int i=0;i<chkRoleIdArr.length;i++)
         {
             prepStmt = con.prepareStatement(deleteStatement);
             //prepStmt.setString(1, roleId);
             prepStmt.setString(1, chkRoleIdArr[i]);

             Debug.print("GeneralDBAction.deleteRole():"+deleteStatement+"=="+chkRoleIdArr[i]);
             prepStmt.executeUpdate();
             prepStmt.close();
         }

         releaseConnection();
     }

     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.deleteRole:" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.deleteRole:" + e.getMessage());
     }
     return true;
 }
 
 public String getExternalAppURL(String perName)
 {
     Debug.print("GeneralDBAction.getExternalAppURL():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
     String perUrl = "";
     try
     {
         String sqlQuery = "select access_url from tblmappermission where access_name=?";
         prepStmt = con.prepareStatement(sqlQuery);
         prepStmt.setString(1, perName);
         rs = prepStmt.executeQuery();
         rs.next();
         perUrl = rs.getString(1);
         rs.close();
         prepStmt.close();
         releaseConnection();
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getExternalAppURL():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getExternalAppURL():").append(e.getMessage()).toString());
     }
     return perUrl;
 }
 
 
 
 public boolean isLifecycleDBExist(String lifecycleName)
 {  
 	boolean result=false;
 	String name="";
 	makeConnection();
       try {
    	   if(lifecycleName!=null){
     	  String selectStmt="select lifecycleProName from tblLifecycleprocessinsert where lifecycleProName = ?";          	  
           
         
           prepStmt = con.prepareStatement(selectStmt);
           prepStmt.setString(1, lifecycleName);
           rs=prepStmt.executeQuery();
           if(rs.next())
           {
         	
         	   result = true;
           }
          
          
           
           System.out.println("GeneralDBAction isLifecycleDBExist() Name :" + name);
           prepStmt.close();
           releaseConnection();}
    	   else{
    		   result = false;   
    	   }
       } catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in GeneralDBAction.isLifecycleDBExist():" + sql.getMessage());
       } catch(Exception e){
           releaseConnection();
           System.out.println("General Exception  in GeneralDBAction.isLifecycleExist():" + e.getMessage());
       }
 	
 	
 	return result;
 }    
 
 
 public String adddocumentfromcustomer(String userId,String fileename,String saveFile)
 {
 	 
 	String allow_date=null;
		    
		    	  
		        try {
		        	makeConnection();
		        	 String str="insert into tblProcessDetails(user_id,file_name,file_path) values (?,?,?)";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,userId);
			            prepStmt.setString(2,fileename);
			            prepStmt.setString(3,saveFile);
			            
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

 
 public void getProcessList(ArrayList<String> firstNameList,ArrayList<String> lastNameList,ArrayList<String> fileNameList,ArrayList<String> filePathList){
     Debug.print("GeneralDBAction.selectAll Process Details For Developer():");
     ArrayList<String> processList = null;
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {
         String selectStatement=" SELECT a.first_name , a.last_name ,b.file_name, b.file_path " +
         		"from tblUserMaster a , tblProcessDetails b where a.user_id = b.user_id";
         
         prepStmt = con.prepareStatement(selectStatement);
         Debug.print(selectStatement);
         rs = prepStmt.executeQuery();
         processList = new ArrayList<String>();
         while(rs.next()){
             firstNameList.add(rs.getString("first_name"));
             lastNameList.add(rs.getString("last_name"));
             fileNameList.add(rs.getString("file_name"));
             filePathList.add(rs.getString("file_path"));
         }

         rs.close();
         prepStmt.close();
         releaseConnection();
       
     } 
     catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.selectAllMappingDetailsForPrivilege():" + e.getMessage());
     }
 }
 
 
 public String getPasswordByLoginId(String userid)
 {
     Debug.print("GeneralDBAction.getPasswordByLoginId():");
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
     String password = "";
     try
     {
         String sqlQuery = "select password from tblUserMaster where user_id=?";
         prepStmt = con.prepareStatement(sqlQuery);
         prepStmt.setString(1, userid);
         rs = prepStmt.executeQuery();
         rs.next();
         password = rs.getString(1);
         rs.close();
         prepStmt.close();
         releaseConnection();
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getExternalAppURL():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getExternalAppURL():").append(e.getMessage()).toString());
     }
     return password;
 }
 
 public String getEmailIdByPassword(String userId){
	 Debug.print("GeneralDBAction.getEmailIdByPassword():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String emailid = "";
	 try{
		 String sqlQuery = "Select email_id from tblUserMaster where user_id=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, userId);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 emailid = rs.getString(1);
		 rs.close();
		 prepstmt.close();
		 releaseConnection();
	 }
	 catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in GeneralDBAction.getEmailIdByPassword():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in GeneralDBAction.getEmailIdByPassword():").append(e.getMessage()).toString());
     }
	 
	 return emailid;
	 
 }
 
 
 public String getRoleNameByRoleId(String roleId){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String roleName = "";
	 try{
		 String sqlQuery = "Select role_name from tblRoleMaster where role_id=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, roleId);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 roleName = rs.getString(1);
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
	 
	 return roleName;
	 
 }
 //===================profile pic starts here====================
 
 public String getuserid(String usrname){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String userid = "";
	 try{
		 String sqlQuery = "Select user_id from tblUserMaster where login_name=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, usrname);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 userid = rs.getString(1);
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
	 
	 return userid;
	 
 }
 public String getemail_id(String userId){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String emailId = "";
	 try{
		 String sqlQuery = "Select email_id from tblUserMaster where user_id=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, userId);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 emailId = rs.getString(1);
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
	 
	 return emailId;
	 
 }
 
 public String getuser_status(String login){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String userid = "";
	 try{
		 String sqlQuery = "Select user_id from tblUserMaster where login_name=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, login);
		
		 rs = prepstmt.executeQuery();
		 rs.next();
		 userid = rs.getString(1);
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
	 
	 return userid;
	 
 }
 
 public String getpicture_path(String user_id){
	 Debug.print("GeneralDBAction.getRoleNameByRoleId():");
	 PreparedStatement prepstmt = null;
	 ResultSet rs = null;
	 makeConnection();
	 String filepath = "";
	 try{
		 String sqlQuery = "Select picture_path from tbluserpictures where user_id=?";
		 prepstmt = con.prepareStatement(sqlQuery);
		 prepstmt.setString(1, user_id);
		 rs = prepstmt.executeQuery();
		 rs.next();
		 filepath = rs.getString(1);
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
	 
	 return filepath;
	 
 }
 public String adduserpicture(String user_id,String fileLocation)
 {
 	 
 	String status=null;
		    
		    	  
		        try {
		        	makeConnection();
		        	 String str="insert into tbluserpictures(user_id,picture_path) values (?,?)";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,user_id);
			            prepStmt.setString(2,fileLocation);
			            
			            
			            prepStmt.executeUpdate();
                        status="Insert Successfully";
			 	       prepStmt.close();
			       
			       releaseConnection(); 
			    } 
		        catch (Exception ex) {
			        	ex.printStackTrace();
			             //Debug.print("Exception:" + ex.getMessage());
			        }finally {
			            releaseConnection();
			        }
		       
		    return status;
 }
 //======================================Artifact Management===============================================
 
 public ArrayList getCount(){
     int cnt = 0;
     ArrayList cntRecord = new ArrayList();
     PreparedStatement prepStmt = null;
     String selectStatement="";
     makeConnection();
     System.out.println("GeneralDBAction: getCount()");
     try {
   
              selectStatement = "select count(*) from tblFrameworkMaster";
             
             prepStmt = con.prepareStatement(selectStatement);
            
             ResultSet rs = prepStmt.executeQuery();
             if(rs.next()){
                 cnt = rs.getInt(1);
                 
                  selectStatement = "select A.layer_value_id, A.layer_value, B.master_name, B.master_id from " +
                 		"tblframeworklayermap A, tblframeworkmaster B where " +
                 		"A.master_id=B.master_id and master_sequence=?";
                  
                  prepStmt = con.prepareStatement(selectStatement);
                  prepStmt.setInt(1, cnt);
                  rs = prepStmt.executeQuery();
                  
                  while(rs.next()){
                 	 
                 	 String layerValId = rs.getString(1);
                      String layerValName = rs.getString(2);
                      String masterId = rs.getString(3);
                      String masterName = rs.getString(4);
                      String[] cntList = {layerValId, layerValName,masterId,masterName,String.valueOf(cnt)};
                      cntRecord.add(cntList);	 
                 	 
                  }
             }
             rs.close();
             prepStmt.close();
        
         releaseConnection();
         
     } catch(SQLException sql){
         releaseConnection();
         Debug.print("SQL Exception in GeneralDBAction.getCount():" + sql.getMessage());
     } catch(Exception e){
         releaseConnection();
         Debug.print("General Exception  in GeneralDBAction.getCount():" + e.getMessage());
     }
     return cntRecord;
 }
 
 public boolean insertArtifactMapDetails(HLCMenuListVO objArti)
 {
     Debug.print("RoleManagementDAOImpl.insertArtifactMapDetails():");
     Debug.print("RoleManagementDAOImpl.insertArtifactMapDetails():"+objArti);
     
     Debug.print("RoleManagementDAOImpl.objArti.getGroupsId()():"+objArti.getGroupsId());
     Debug.print("RoleManagementDAOImpl.objArti.getProcessDomainId()():"+objArti.getProcessDomainId());
     
     PreparedStatement prepStmt = null;
     boolean result = false;
     
  
     makeConnection();
     try
     {
     	

     	
   if(objArti.getViewPtId()!=null && objArti.getLobLayerId()==null && objArti.getViewId()==null &&  objArti.getGroupsId()==null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
     	
         String insertStatement = "insert into tblMapArtifact (view_point_value_id, artifact_id, artifact_description) values( ?,?,?)";
         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, objArti.getViewPtId());         
         prepStmt.setString(2, objArti.getArtifactId());                     
         prepStmt.setString(3, objArti.getArtifactDesc());
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()==null && objArti.getGroupsId()==null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, artifact_id, artifact_description) values( ?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());       
       prepStmt.setString(3, objArti.getArtifactId());                     
       prepStmt.setString(4, objArti.getArtifactDesc());  
 	  
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()!=null && objArti.getGroupsId()==null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, view_value_id, artifact_id, artifact_description) values( ?,?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());     
       prepStmt.setString(3, objArti.getViewId());
       prepStmt.setString(4, objArti.getArtifactId());                     
       prepStmt.setString(5, objArti.getArtifactDesc());  
 	  
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()!=null && objArti.getGroupsId()!=null && objArti.getProcessDomainId()==null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, view_value_id, group_value_id, artifact_id, artifact_description) values( ?,?,?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());     
       prepStmt.setString(3, objArti.getViewId());
       prepStmt.setString(4, objArti.getGroupsId());
       prepStmt.setString(5, objArti.getArtifactId());                     
       prepStmt.setString(6, objArti.getArtifactDesc());  
 	  
   }else if(objArti.getViewPtId()!=null && objArti.getLobLayerId()!=null && objArti.getViewId()!=null && objArti.getGroupsId()!=null && objArti.getProcessDomainId()!=null && objArti.getArtifactId()!=null && objArti.getArtifactDesc()!=null){
 	  
 	  String insertStatement = "insert into tblMapArtifact (view_point_value_id, lob_value_id, view_value_id, group_value_id, process_domain_value_id, artifact_id, artifact_description) values( ?,?,?,?,?,?,?)";
       prepStmt = con.prepareStatement(insertStatement);
       prepStmt.setString(1, objArti.getViewPtId());
       prepStmt.setString(2, objArti.getLobLayerId());
       prepStmt.setString(3, objArti.getViewId());  
       prepStmt.setString(4, objArti.getGroupsId());  
       prepStmt.setString(5, objArti.getProcessDomainId());  
       prepStmt.setString(6, objArti.getArtifactId());                     
       prepStmt.setString(7, objArti.getArtifactDesc());  
 	  
   }
   
        
         prepStmt.executeUpdate();
         prepStmt.close();
         releaseConnection();
         result = true;
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.insertArtifactMapDetails():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.insertArtifactMapDetails():").append(e.getMessage()).toString());
     }
     
     Debug.print("RoleManagementDAOImpl.insertArtifactMapDetails():"+result);
     return result;
 }
 
 public ArrayList getAllGroup(){
 	  System.out.println("GeneralDBAction: getAllGroup()");
       ArrayList groupList = new ArrayList();
       PreparedStatement prepStmt = null;
       ResultSet rs = null;
       makeConnection();
  	try {

 String selectStatement = "select master_id, master_name, master_sequence from tblframeworkmaster " +
 		"where active_status='1' and show_master='1' order by master_sequence";
               
 prepStmt = con.prepareStatement(selectStatement);
 rs = prepStmt.executeQuery();
          
           while(rs.next()){
               String masterId = rs.getString(1);
               String masterName = rs.getString(2);
               String masterSeq = rs.getString(3);
               
               String[] grpList = {masterId, masterName,masterSeq};
               groupList.add(grpList);
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
          
       } 
       catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in GeneralDBAction.getAllGroup():" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           e.printStackTrace();
       }
       return groupList;
   }
 
 public String getmember_typeid(String membershipTypeId) throws FinderException {
	    boolean result = false;
	    String membershipTypeID=null;
	    try {
	       makeConnection();
	       String selectStatement = "SELECT membership_type_id FROM tblMembershipTypeMaster " +
	       		"WHERE membership_type_name = ? and membership_year='2016'";

	       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
	       prepStmt.setString(1, membershipTypeId.trim());
	       ResultSet rs = prepStmt.executeQuery();
	       if( rs.next()) {
	    	   membershipTypeID = rs.getString(1);
	       }
	       prepStmt.close();
	    }catch (Exception e){
	        e.printStackTrace();
	    }finally {
	        releaseConnection();
	    }
	    return membershipTypeID;
	}
 
 public ArrayList getGrpDetails(){
	  System.out.println("RoleManagementDAOImpl: getGrpDetails()");
     ArrayList groupList = new ArrayList();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {

String selectStatement = "select b.master_id, b.master_name,a.layer_value,a.layer_value_id, b.master_sequence from tblframeworklayermap a, " +
		"tblframeworkmaster b where a.master_id = b.master_id " +
		"and b.active_status='1' and b.show_master='1' order by b.master_sequence";
             
prepStmt = con.prepareStatement(selectStatement);

rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String masterId = rs.getString(1);
             String masterName = rs.getString(2);
             String layerVal = rs.getString(3);
             String layerValId = rs.getString(4);
             Integer seq = rs.getInt(5);
       
             String[] grpList = {masterId,masterName,layerVal, layerValId,String.valueOf(seq)};
             groupList.add(grpList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.getGrpDetails():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         e.printStackTrace();
     }
     return groupList;
 }
 
 
 public ArrayList getAllViewMapList(String viewPointId){
 	  System.out.println("RoleManagementDAOImpl: getAllViewMapList()");
       ArrayList viewPointList = new ArrayList();
       PreparedStatement prepStmt = null;
       ResultSet rs = null;
       makeConnection();
  	try {

 String selectStatement = "select (select view_point_name from tblviewpointmaster where view_point_id = a.view_point_value_id ) as View_Point, " +
 		" (select layer_value from tblframeworklayermap where layer_value_id = a.lob_value_id) as LOB,(select layer_value from tblframeworklayermap " +
 		" where layer_value_id =a.view_id) as Views,(select layer_value from tblframeworklayermap where layer_value_id = a.group_value_id) " +
 		" as GroupId,(select layer_value from tblframeworklayermap where layer_value_id = a.process_domain_value_id)  as Process_Domain_Id " +
 		" from tblframeworkmapping a,tblviewpointmaster b where a.view_point_value_id = b.view_point_id and a.view_point_value_id = ?";                
 prepStmt = con.prepareStatement(selectStatement);
 prepStmt.setString(1, viewPointId);

 rs = prepStmt.executeQuery();
          
           while(rs.next()){
               String View_Point = rs.getString(1);
               String LOB = rs.getString(2);
               String Views = rs.getString(3);
               String Groups = rs.getString(4);
               String Process_Domain = rs.getString(5);
         
               String[] viewPoint = {View_Point,LOB,Views, Groups,Process_Domain};
               viewPointList.add(viewPoint);
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
          
       } 
       catch(SQLException sql){
           releaseConnection();
           System.out.println("SQL Exception in RoleManagementDAOImpl.getAllViewMapList():" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           e.printStackTrace();
       }
       return viewPointList;
   }
 
 /*
  * 
  * Dhivya Here: View Point Mapping Existence
  * 
  */
 
 public boolean viewPointMapExists(String viewPntId, String lobId, String viewId, String grpId, String domProcId)
 {
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() View Pnt:"+viewPntId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() LOB:"+lobId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() View:"+viewId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() Grp:"+grpId);
     Debug.print("RoleManagementDAOImpl.viewPointMapExists() ProDom:"+domProcId);
    
     
     
     
     PreparedStatement prepStmt = null;
     boolean result = false;
     int cnt=0;
     
   
     makeConnection();
     try
     {
     	
         String selectStatement = "select count(*) from tblframeworkmapping where view_point_value_id=? and " +
         		"lob_value_id=? and view_id=? and group_value_id=? and process_domain_value_id=?";
         
         prepStmt = con.prepareStatement(selectStatement);
  		prepStmt.setString(1, viewPntId);  			
		prepStmt.setString(2, lobId);
		prepStmt.setString(3,viewId);  			
		prepStmt.setString(4, grpId);
		prepStmt.setString(5, domProcId);
		
                     
	   ResultSet rs = prepStmt.executeQuery();
    if(rs.next()){
         cnt = rs.getInt(1);
        if(cnt>0){
     	   result=true;   
        }
    }
           rs.close();
         prepStmt.close();
         releaseConnection();
         
     }
     catch(SQLException sql)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.viewPointMapExists():").append(sql.getMessage()).toString());
     }
     catch(Exception e)
     {
         releaseConnection();
         Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.viewPointMapExists():").append(e.getMessage()).toString());
     }
     
     Debug.print("RoleManagementDAOImpl.viewPointMapExists():"+result);
     return result;
 }
 
//==========================Dhivya Ends Here:=================================================  
 public Vector getLOBs(String viewPntId){
	  System.out.println("RoleManagementDAOImpl: selectLOBs()");
	Vector lobsLst = new Vector();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection();
	try {

String selectStatement = " select A.lob_value_id, B.layer_value from tblframeworkmapping A, tblFrameworkLayerMap B where " +
		"A.lob_value_id=B.layer_value_id and A.view_point_value_id=?";
          

prepStmt = con.prepareStatement(selectStatement);
prepStmt.setString(1, viewPntId);
rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String lobValueId=rs.getString(1);
             String lobValueName= rs.getString(2);
                           
             String[] lobList = {lobValueId, lobValueName};
             lobsLst.add(lobList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.selectLOBs():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         System.out.println("General Exception  in RoleManagementDAOImpl.selectLOBs():" + e.getMessage());
     }
     return lobsLst;
 }

 
 public Vector getViews(String viewPntId, String lobId){
	  System.out.println("RoleManagementDAOImpl: selectViews()");
	  Vector viewObj = new Vector();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String selectStatement="";
     makeConnection();
	try {

		
		selectStatement = "select A.view_id, B.layer_value from tblframeworkmapping A," +
				" tblFrameworkLayerMap B where A.view_id=B.layer_value_id and " +
				"A.view_point_value_id=? and " +
				"A.lob_value_id=?";
		
		 prepStmt = con.prepareStatement(selectStatement);
		 prepStmt.setString(1, viewPntId);
		 prepStmt.setString(2, lobId);

rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String viewId = rs.getString(1);
             String viewName = rs.getString(2);
             String[] viewList = {viewId, viewName};
             viewObj.add(viewList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.selectViews():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         System.out.println("General Exception  in RoleManagementDAOImpl.selectViews():" + e.getMessage());
     }
     return viewObj;
 }

public Vector getGroups(String viewPntId, String lobId){
	  System.out.println("RoleManagementDAOImpl: selectGroups()");
	  Vector grpObj = new Vector();
   PreparedStatement prepStmt = null;
   ResultSet rs = null;
   String selectStatement="";
   makeConnection();
	try {

		
		selectStatement = "select A.group_value_id, B.layer_value from tblframeworkmapping A, tblFrameworkLayerMap B where " +
				"A.group_value_id=B.layer_value_id and A.view_point_value_id=? and " +
				"A.lob_value_id=?";
		
		 prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, viewPntId);
	 prepStmt.setString(2, lobId);

rs = prepStmt.executeQuery();
      
       while(rs.next()){
           String grpId = rs.getString(1);
           String grpName = rs.getString(2);
           String[] grpList = {grpId, grpName};
           grpObj.add(grpList);
       }
       rs.close();
       prepStmt.close();
       releaseConnection();
      
   } 
   catch(SQLException sql){
       releaseConnection();
       System.out.println("SQL Exception in RoleManagementDAOImpl.selectGroups():" + sql.getMessage());
   }
   catch(Exception e){
       releaseConnection();
       System.out.println("General Exception  in RoleManagementDAOImpl.selectGroups():" + e.getMessage());
   }
   return grpObj;
}

public Vector getProcessDomain(String viewPntId, String lobId, String grpId){
	  System.out.println("RoleManagementDAOImpl: selectProcessDomain()");
	  Vector proDomObj = new Vector();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     String selectStatement="";
     makeConnection();
	try {

		
		selectStatement = "select A.process_domain_value_id, B.layer_value from tblframeworkmapping A, tblFrameworkLayerMap B where " +
				"A.process_domain_value_id=B.layer_value_id and A.view_point_value_id=? and " +
				"A.lob_value_id=? and A.group_value_id=?";
		
		 prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setString(1, viewPntId);
		 prepStmt.setString(2, lobId);
		prepStmt.setString(3, grpId);

rs = prepStmt.executeQuery();
        
         while(rs.next()){
             String proDomId = rs.getString(1);
             String proDomName= rs.getString(2);
             String[] proDomList = {proDomId, proDomName};
             proDomObj.add(proDomList);
         }
         rs.close();
         prepStmt.close();
         releaseConnection();
        
     } 
     catch(SQLException sql){
         releaseConnection();
         System.out.println("SQL Exception in RoleManagementDAOImpl.selectProcessDomain():" + sql.getMessage());
     }
     catch(Exception e){
         releaseConnection();
         System.out.println("General Exception  in RoleManagementDAOImpl.selectProcessDomain():" + e.getMessage());
     }
     return proDomObj;
 }


public boolean artifactMapExists(String viewPntId, String lobId, String viewId, String grpId, String domProcId, String artifactId)
{
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+viewPntId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+lobId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+viewId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+grpId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+domProcId);
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+artifactId); 
    
    
    PreparedStatement prepStmt = null;
    boolean result = false;
    int cnt=0;
    
    
    if(lobId.equals("")){
    	lobId=null;
    	
    }
    if(viewId.equals("")){
    	viewId=null;
    	
    }
    if(grpId.equals("")){
    	grpId=null;
    	
    }
    
    if(domProcId.equals("")){
    	
    	domProcId=null;
    }
    makeConnection();
    try
    {
    	if(viewPntId!=null && lobId==null && viewId==null && grpId==null && domProcId==null && artifactId!=null){
    	
        String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and artifact_id=?";
        
        prepStmt = con.prepareStatement(selectStatement);
 		prepStmt.setString(1, viewPntId);  			
		prepStmt.setString(2, artifactId);
    	}else if(viewPntId!=null && lobId!=null && viewId==null && grpId==null && domProcId==null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		prepStmt.setString(3, artifactId);
   		
    	}
    	else if(viewPntId!=null && lobId!=null && viewId!=null && grpId==null && domProcId==null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and view_value_id=? and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		 prepStmt.setString(3, viewId);
   		prepStmt.setString(4, artifactId);
   		
    	}
    	else if(viewPntId!=null && lobId!=null && viewId!=null && grpId!=null && domProcId==null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and view_value_id=? and group_value_id=? and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		 prepStmt.setString(3, viewId);
   		prepStmt.setString(4, grpId);
   		prepStmt.setString(5, artifactId);
   		
    	}else if(viewPntId!=null && lobId!=null && viewId!=null && grpId!=null && domProcId!=null && artifactId!=null){
    		String selectStatement = "select count(*) from tblMapArtifact where view_point_value_id=? and lob_value_id=? " +
    				"and view_value_id=? and group_value_id=? and process_domain_value_id=? and artifact_id=?";	
    	
    		 prepStmt = con.prepareStatement(selectStatement);
      		prepStmt.setString(1, viewPntId);
   		 prepStmt.setString(2, lobId);
   		prepStmt.setString(3, viewId);
   		prepStmt.setString(4, grpId);
   		prepStmt.setString(5, domProcId);
   		prepStmt.setString(6, artifactId);
    	}
       
       
       
	   ResultSet rs = prepStmt.executeQuery();
   if(rs.next()){
        cnt = rs.getInt(1);
       if(cnt>0){
    	   result=true;   
       }
   }
          rs.close();
        prepStmt.close();
        releaseConnection();
        
    }
    catch(SQLException sql)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.artifactMapExists():").append(sql.getMessage()).toString());
    }
    catch(Exception e)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.artifactMapExists():").append(e.getMessage()).toString());
    }
    
    Debug.print("RoleManagementDAOImpl.artifactMapExists():"+result);
    return result;
}

public ArrayList getAllViewsBasedOnViewPoint(String viewPointId){
	  System.out.println("RoleManagementDAOImpl: getAllViewsBasedOnViewPoint()");
    ArrayList viewList = new ArrayList();
    PreparedStatement prepStmt = null;
    ResultSet rs = null;
    makeConnection();
	try {

String selectStatement = "select a.layer_value_id,a.layer_value from tblframeworklayermap a,tblviewpointmaster b where a.view_point_id=b.view_point_id and a.view_point_id = ?";
         

prepStmt = con.prepareStatement(selectStatement);
prepStmt.setString(1, viewPointId);

rs = prepStmt.executeQuery();
       
        while(rs.next()){
            String layerId = rs.getString(1);
            String layerName = rs.getString(2);
            String[] viList = {layerId, layerName};
            viewList.add(viList);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
       
    } 
    catch(SQLException sql){
        releaseConnection();
        System.out.println("SQL Exception in RoleManagementDAOImpl.getAllViewsBasedOnViewPoint():" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        e.printStackTrace();
    }
    return viewList;
}


public boolean insertFrameworkMapDetails(String viewPointId,HLCMenuListVO objMap, HLCMenuListVO objArti)
{
    Debug.print("RoleManagementDAOImpl.insertFrameworkMapDetails():");
    Debug.print("RoleManagementDAOImpl.insertFrameworkMapDetails():"+viewPointId);
    
    PreparedStatement prepStmt = null;
    boolean result = false;
    makeConnection();
    try
    {
        String insertStatement = "insert into tblframeworkmapping (view_point_value_id, lob_value_id, view_id, group_value_id, process_domain_value_id) values( ?,?,?,?,?)";
        prepStmt = con.prepareStatement(insertStatement);
        prepStmt.setString(1, viewPointId);
        prepStmt.setString(2, objMap.getLobLayerId());
        prepStmt.setString(3, objMap.getViewPtId());
        prepStmt.setString(4, objMap.getGroupsId());
        prepStmt.setString(5, objMap.getProcessDomainId());
      
        prepStmt.executeUpdate();
        prepStmt.close();
        releaseConnection();
        result = true;
    }
    catch(SQLException sql)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("SQL Exception in RoleManagementDAOImpl.insertFrameworkMapDetails():").append(sql.getMessage()).toString());
    }
    catch(Exception e)
    {
        releaseConnection();
        Debug.print((new StringBuilder()).append("General Exception  in RoleManagementDAOImpl.insertFrameworkMapDetails():").append(e.getMessage()).toString());
    }
    
    Debug.print("RoleManagementDAOImpl.insertFrameworkMapDetails():"+result);
    return result;
}


// Membership action dB start here-----------------------------------------------------------------------------------


public ArrayList getAllDonationDetails(){
    Debug.print("DonationDAO.getAllDonationDetails():");
    ArrayList donationList = new ArrayList();
    PreparedStatement prepStmt = null;
    makeConnection();
    try {
         String selectStatement = "select donation_id, donation_name, active_status, donation_price,precheck_status from tblDonationDetails " +
         		"WHERE active_status = ? order by priority_value ";
                
        prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setBoolean(1, true);
        ResultSet rs = prepStmt.executeQuery();
        while(rs.next()){
            HLCDonationVO objDonVO = new HLCDonationVO();
            String donationId = rs.getString(1);
            String donationName = rs.getString(2);
            boolean status = rs.getBoolean(3);
            String donationPrice = rs.getString(4);
            boolean precheckStatus = rs.getBoolean(5);
            
            objDonVO.setDonationId(donationId);
            objDonVO.setDonationName(donationName);
            objDonVO.setDonationPrice(donationPrice);
            objDonVO.setActiveStatus(status);
            objDonVO.setPrecheckStatus(precheckStatus);
            donationList.add(objDonVO);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
    }
catch(SQLException sql){
    releaseConnection();
    Debug.print("SQL Exception in DonationDAO.getAllDonationDetails():" + sql.getMessage());
}
catch(Exception e){
    releaseConnection();
    Debug.print("General Exception  in DonationDAO.getAllDonationDetails():" + e.getMessage());
}
return donationList;
}

public ArrayList getAllPublicationDetails(){
    Debug.print("PublicationDAO.getAllPublicationDetails():");
    ArrayList publicationList = new ArrayList();
    PreparedStatement prepStmt = null;
    makeConnection();
    try {
         String selectStatement = "select publication_id, publication_name from tblMemberSubscription";
                   
        Debug.print("Result Query:"+ selectStatement);        
        prepStmt = con.prepareStatement(selectStatement);
        ResultSet rs = prepStmt.executeQuery();
        while(rs.next()){
            
            HLCPublicationVO objDonVO = new HLCPublicationVO();
            String publicationId = rs.getString(1);
            String publicationName = rs.getString(2);
           
            Debug.print("publicationId:"+ publicationId);       
            Debug.print("publicationName:"+ publicationName);       
            objDonVO.setPublicationId(publicationId);
            objDonVO.setPublicationName(publicationName);
             
            publicationList.add(objDonVO);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
    }
catch(SQLException sql){
    releaseConnection();
    Debug.print("SQL Exception in PublicationDAO.getAllPublicationDetails():" + sql.getMessage());
}
catch(Exception e){
    releaseConnection();
    Debug.print("General Exception  in PublicationDAO.getAllPublicationDetails():" + e.getMessage());
}
return publicationList;
}

//Membership action dB End here----------------------------------------------------------------------------------- 


public boolean addMembershipTypeMaster(HLCMembershipTypeMaster objMemberType) throws RemoteException {
    Debug.print("objMemberType:" + objMemberType.getUserTypeId());
    boolean result = false;
   
    result = isMembershipTypeExist(objMemberType.getUserTypeId(),objMemberType.getMembershipTypeId(),objMemberType.getMembershipTypeName(), objMemberType.getMembership_year());
   
    if (result) {
        return false;
    } else {
        try {
            boolean res = insertMemberType(objMemberType);
            if(res==true){
            	result=res;	
            }else{
            	result=false;	
            }
        } catch (Exception exp) {
            throw new EJBException("createMembershipTypeMaster : " + exp.getMessage());
        }
    }
    return true;
}
/**
 * Name         :isMembershipTypeExist
 * Description  :This method will check Membership Type Existance
 * @ param      :None
 * @return      :member Identification number
 * @throws      :RemoteException, FinderException
 */

public boolean isMembershipTypeExist(String userTypeId,String membershipTypeId,String membershipTypeName, int membership_year) {
     Debug.print("isMembershipTypeExist userTypeId :" +userTypeId );
     Debug.print("isMembershipTypeExist membershipTypeId :" + membershipTypeId);
    
    Debug.print("isMembershipTypeExist membershipTypeName :" + membershipTypeName);
    Debug.print("isMembershipTypeExist membership_year :" + membership_year);
    boolean status = false;
    try {
        makeConnection();
       
            Debug.print("if");
        String selectStatement = "SELECT a.membership_type_id FROM tblMembershipTypeMaster " +
        		"a where a.user_type_id= ? and a.membership_type_name = ? and membership_year = datepart(year,getdate())";
        Debug.print("selectStatement :" + selectStatement);
        prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1, userTypeId);
        prepStmt.setString(2, membershipTypeName);
   
        rs = prepStmt.executeQuery();
        if (rs.next()) {
            status = true;
        }
        Debug.print("record existance status :" + status);
        rs.close();
        prepStmt.close();
    } catch (SQLException sqe) {
        Debug.print("SQLException in isMembershipTypeExist :");
        sqe.printStackTrace();
    } catch (Exception e) {
        Debug.print("Exception in isMembershipTypeExist :" + e);
    } finally {
        releaseConnection();
    }
    return status;
}
public boolean insertMemberType(HLCMembershipTypeMaster objMemTypeMaster) throws CreateException {

    Debug.print("insertMemberType::");
    boolean res=false;
    if(objMemTypeMaster==null){
            throw new EJBException("ejbCreate: objMemTypeMaster argument is null or empty");
    }
    String membershipAmount=objMemTypeMaster.getMembershipAmount();
    double amt = Double.parseDouble(membershipAmount);
    //for bug ends
     makeConnection();
    try {
       
        String insertStatement = "insert into tblMembershipTypeMaster ( membership_type_name, membership_amount, user_type_id, priority_value, transaction_type_id,active_status, membership_year,duration ) values ( ? , ? , ? , ? , ? , ?, datepart(year,getdate()),?)";
         Debug.print("Query Log :"+insertStatement);

         prepStmt = con.prepareStatement(insertStatement);
         prepStmt.setString(1, objMemTypeMaster.getMembershipTypeName());
         prepStmt.setDouble(2, amt);
         prepStmt.setString(3, objMemTypeMaster.getUserTypeId());
         prepStmt.setString(4, objMemTypeMaster.getPeriodValue());
         prepStmt.setString(5, objMemTypeMaster.getTransaction_type_id());
         prepStmt.setInt(6,objMemTypeMaster.getActive_Status());
        // prepStmt.setInt(7, objMemTypeMaster.getMembership_year());
         prepStmt.setString(7, objMemTypeMaster.getDuration());
         int cnt = prepStmt.executeUpdate();
         System.out.println("successfully inserted into MembershipTypeMaster  : "+cnt);
         if(cnt>=1){
        	 res=true; 
         }
         prepStmt.close();
         releaseConnection();
    } catch (Exception ex) {
        throw new EJBException("ejbCreate: MembershipTypeMaster  --- " + ex.getMessage());
    }
    return res;
}

public boolean editHumanMembershipTypeMaster(HLCMembershipTypeMaster objMemberType) throws RemoteException, FinderException {
    System.out.print("GeneralDBAction MembershipType ID : " + objMemberType.getMembershipTypeId());
    boolean result = false;

    if (objMemberType == null || objMemberType.getMembershipTypeId() == null || objMemberType.getMembershipTypeId().trim().length() == 0) {
        result = false;
        throw new EJBException("MembershipType ID can't be empty");
    }
   
    else {
        if (memberTypeIdExists(objMemberType.getMembershipTypeId()) == false) {
           
            result = false;
        } else {
        	
        	try {
                System.out.println("GenerealDBAction: Edit MembershipType");
                String membershipAmount=objMemberType.getMembershipAmount();
                double amt = Double.parseDouble(membershipAmount);
                
                makeConnection();
                String updateStatement = "update tblMembershipTypeMaster " +
                		"set membership_type_name = ?, membership_amount = ?, duration = ?, active_status = ? , priority_value = ? , transaction_type_id = ? , membership_year = ?  where membership_type_id = ?";
                Debug.print("Query Log :"+updateStatement);

                PreparedStatement prepStmt = con.prepareStatement(updateStatement);
               
                prepStmt.setString(1, objMemberType.getMembershipTypeName());
                Debug.print("objMemberType.getMembershipTypeName() in DBAction:: "+objMemberType.getMembershipTypeName());
                prepStmt.setDouble(2, amt);
                Debug.print(membershipAmount);
                prepStmt.setString(3, objMemberType.getDuration());
                Debug.print("duration"+objMemberType.getDuration());
                prepStmt.setInt(4, objMemberType.getActive_Status());
                System.out.print(objMemberType.getActive_Status());

             //   prepStmt.setString(5, userTypeId);
             //   Debug.print("set usertypeID "+userTypeId);
                prepStmt.setString(5, objMemberType.getPeriodValue());
                Debug.print(objMemberType.getPeriodValue());
                prepStmt.setString(6, objMemberType.getTransaction_type_id());
                  Debug.print(objMemberType.getTransaction_type_id());
                prepStmt.setInt(7, objMemberType.getMembership_year());
                prepStmt.setString(8, objMemberType.getMembershipTypeId());
                Debug.print("set membership type id"+objMemberType.getMembershipTypeId());
                int rowCount = prepStmt.executeUpdate();
                Debug.print("ejbStore Sucessfully Updated." + rowCount);
                if(rowCount>=1){
                	result = true;	
                }
                prepStmt.close();
            } catch (Exception ex) {
               throw new EJBException("ejbStore: " + ex.getMessage());
               // ex.printStackTrace();
            }finally {
                releaseConnection();
            }
                
        }
    }
    return result;
}

/**
 * Name         :memberExists
 * Description  :This method will check for the existing of memberId and call the findByPrimaryKey method
 * @ param      :None
 * @return      :boolean value
 * @throws      :none
 */
private boolean memberTypeIdExists(String membershipTypeId) {
    boolean result = false;
//Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
    if (membershipTypeId != null) {
        try {
            //  Debug.print("Kavery Session Bean contactTypeIdExists in side loop: "+contactTypeId);
            String memeTypId = selectMembId(membershipTypeId);
           if(memeTypId!=null){
        	   result = true;   
           }
           
        } catch (Exception ex) {
          //  result = true;
            System.out.println("Exception:" + ex);
        }
    }
    Debug.print("Kavery Session Bean memberTypeIdExists  " + result);
    return result;
}

public String selectMembId(String membershipTypeId) throws FinderException {
    boolean result = false;
    String membershipTypeID=null;
    try {
       makeConnection();
       String selectStatement = "SELECT membership_type_id FROM tblMembershipTypeMaster " +
       		"WHERE membership_type_id = ? order by priority_value";

       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
       prepStmt.setString(1, membershipTypeId.trim());
       ResultSet rs = prepStmt.executeQuery();
       if( rs.next()) {
    	   membershipTypeID = rs.getString(1);
       }
       prepStmt.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        releaseConnection();
    }
    return membershipTypeID;
}

//==============================Dhivya Here:MemberId based on UserId==================================
public String selectMembIdBasedonUserId(String usrId) throws FinderException {
	
    boolean result = false;
    String memberId=null;
    try {
       makeConnection();
       String selectStatement = "SELECT member_id FROM tblMemberDetails " +
       		"WHERE user_id = ?";

       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
       prepStmt.setString(1, usrId);
       ResultSet rs = prepStmt.executeQuery();
       if( rs.next()) {
    	   memberId = rs.getString(1);
       }
       if(memberId==null){
    	   
    	  memberId=selectPreMembIdBasedonUserId(usrId);  
       }
       Debug.print("membId selectMembIdBasedonUserId :"+memberId); 
       prepStmt.close();
       releaseConnection();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        releaseConnection();
    }
    return memberId;
}

public String selectPreMembIdBasedonUserId(String usrId) throws FinderException {
    boolean result = false;
    String memberId=null;
    try {
       makeConnection();
       String selectStatement = "SELECT member_id FROM tblPreMemberDetails " +
       		"WHERE user_id = ?";

       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
       prepStmt.setString(1, usrId);
       ResultSet rs = prepStmt.executeQuery();
       if( rs.next()) {
    	   memberId = rs.getString(1);
       }
     
       prepStmt.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        releaseConnection();
    }
    return memberId;
}

//======================Dhivya Ends Here:=========================================================================

public String getlastlogin_id(String usrId) {
   // boolean result = false;
    String loginId=null;
    try {
       makeConnection();
       String selectStatement = "SELECT login_id FROM tblLastloginDetails " +
       		"WHERE user_id = ?";

       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
       prepStmt.setString(1, usrId);
       ResultSet rs = prepStmt.executeQuery();
       if( rs.next()) {
    	   loginId = rs.getString(1);
       }
     
       prepStmt.close();
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        releaseConnection();
    }
    return loginId;
}

public String getLoginDetails(String usrId){
	   // boolean result = false;
	    String loginId=null;
	    try {
	       makeConnection();
	       String selectStatement = "SELECT lastlogin_time FROM tblLastloginDetails " +
	       		"WHERE user_id = ?";

	       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
	       prepStmt.setString(1, usrId);
	       ResultSet rs = prepStmt.executeQuery();
	       if( rs.next()) {
	    	   loginId = rs.getString(1);
	       }
	     
	       prepStmt.close();
	    }catch (Exception e){
	        e.printStackTrace();
	    }finally {
	        releaseConnection();
	    }
	    return loginId;
	}
public void updatelastlogin(String lastloginid, String userid) {
    Debug.print("GeneralDBAction.updatePermission():");
    PreparedStatement prepStmt = null;
   // boolean result = false;
    makeConnection();
    try {
        String insertStatement = "update tblLastloginDetails set user_id = ? " +
                " where login_id = ?";
        
        prepStmt = con.prepareStatement(insertStatement);
        prepStmt.setString(1, userid);
        prepStmt.setString(2, lastloginid);
        prepStmt.executeUpdate();
        prepStmt.close();
        releaseConnection();
        //result = true;
    }
    
    catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.updatePermission():" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in GeneralDBAction.updatePermission():" + e.getMessage());
    }
    //return result;
}   

public ArrayList getCustomerList(){
    Debug.print("GeneralDBAction.getAllRolesBasedOnUser():");
    ArrayList rolesList = null;
   
    makeConnection();
	try {
        String selectStatement = " select a.first_name,a.middle_name,a.last_name,a.email_id,b.payment_id,b.cc_name,b.cc_type,b.cc_number,b.cc_exp_month,b.cc_exp_year,b.bank_name,b.check_date,b.check_number,b.check_name,b.amount,b.payment_date,b.payment_status,b.check_amount,b.pending_amount,b.invoice_id,b.payment_type,c.address1,c.address2,c.city,c.state,c.country,c.zip,c.phone_no,c.mobile_no,c.fax_no,d.transaction_id,d.account_type,d.account_no,d.payment_mode, d.description,d.class,d.amount,d.transaction_mode,d.transaction_date,d.user_id from tblUserMaster a, tblUserPaymentDetails b, tblContactDetails c, tblAccTransactionDetails d where a.user_id=d.user_id and b.user_id=d.user_id and c.user_id=d.user_id and d.qb_status='0'" ;
        prepStmt = con.prepareStatement(selectStatement);
        
        rs = prepStmt.executeQuery();
        rolesList = new ArrayList();
        while(rs.next()){
            String first_name = rs.getString(1);
            String middle_name = rs.getString(2);
            String last_name = rs.getString(3);
            String email_id = rs.getString(4);
            
            String payment_id = rs.getString(5);
            String cc_name = rs.getString(6);
            String cc_type = rs.getString(7);
            String cc_number = rs.getString(8);
            String cc_exp_month = rs.getString(9);
            String cc_exp_year = rs.getString(10);
            String bank_name = rs.getString(11);
            String check_date = rs.getString(12);
            String check_number = rs.getString(13);
            String check_name = rs.getString(14);
            String amount = rs.getString(15);
            String payment_date = rs.getString(16);
            String payment_status = rs.getString(17);
            String check_amount = rs.getString(18);
            String pending_amount = rs.getString(19);
            String invoice_id = rs.getString(20);
            String payment_type = rs.getString(21);
            
            String address1 = rs.getString(22);
            String address2 = rs.getString(23);
            String city = rs.getString(24);
            String state = rs.getString(25);
            String country = rs.getString(26);
            String zip = rs.getString(27);
            String phone_no = rs.getString(28);
            String mobile_no = rs.getString(29);
            String fax_no = rs.getString(30);
            
            String transaction_id = rs.getString(31);
            String account_type = rs.getString(32);
            String account_no = rs.getString(33);
            String payment_mode = rs.getString(34);
            String description = rs.getString(35);
            String classs = rs.getString(36);
            String accamount = rs.getString(37);
            String transaction_mode = rs.getString(38);
            String transaction_date = rs.getString(39);
            String user_id = rs.getString(40);
            
            String[] rlList = {first_name, middle_name, last_name, email_id, payment_id, cc_name, cc_type, cc_number, cc_exp_month, cc_exp_year, bank_name, check_date,check_number, check_name, amount, payment_date, payment_status, check_amount, pending_amount, invoice_id, payment_type, address1, address2, city, state, country, zip, phone_no, mobile_no, fax_no, transaction_id, account_type, account_no, payment_mode, description, classs, accamount, transaction_mode, transaction_date, user_id};
            rolesList.add(rlList);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
       // Debug.print("RoleManagementDAOImpl.selectAllRolesBasedOnUser():" + rolesList);
    } 
    catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.getAllRolesBasedOnUser():" + sql.getMessage());
    }
    catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in GeneralDBAction.getAllRolesBasedOnUser():" + e.getMessage());
    }
    return rolesList;
  }

public boolean updateQBStatus(String userId) throws Exception {
    Debug.print("GeneralDBAction changePasword");
    int cnt = 0;
     
    try {
        makeConnection();
        
        if ( ( userId != null && userId.trim().length() > 0 )) {
        	           	
            String str = "update  tblAccTransactionDetails set qb_status = '1'  WHERE user_id = ?";
            PreparedStatement prepStmt = con.prepareStatement(str);
            
            prepStmt.setString(1, userId);
         
            cnt = prepStmt.executeUpdate();
          
            Debug.print("Successfully QB status Updated......"+cnt);
            prepStmt.close();
        }
    }catch (Exception e){
       
        releaseConnection();
        Debug.print("Error while updating QB status  : "+e.getMessage());
    }finally {
        releaseConnection();
    }
    if (cnt >0)
        return true;
    else
        return false;
}

public void insertuserid_lastlogin(String userid) throws RemoteException
{
String status=null;   


try{


makeConnection(); 
String insertStmt=  "Insert into tblLastloginDetails(user_id) values (?)";
  

  prepStmt = con.prepareStatement(insertStmt);
  
  prepStmt.setString(1,userid);
 
  int cnt= prepStmt.executeUpdate();
  if(cnt>0){
      
   status="Sucessfully signed up";  
    }
   prepStmt.close();
   System.out.println("status" + status);

} 
catch (SQLException sqe) {
  releaseConnection();
 sqe.printStackTrace();       
} finally {
  releaseConnection();
}
//return status;

}


//---------------------parasu start here------------------------
public String selectMemberId()  throws RemoteException {
    Debug.print("kaverystatelessBean.selectMemberId():");
    //String memberId = "";;
    String memberId = null;
    PreparedStatement prepSelect = null;
    makeConnection();
    try {
        String selectStatement = "SELECT max(cast(member_id as int)) from tblMemberDetails ";
        
        prepSelect = con.prepareStatement(selectStatement);
        
        ResultSet rs = prepSelect.executeQuery();
        while (rs.next()) {
            memberId = rs.getString(1);
        }
        if (memberId == null)
            memberId = "0";
        
        long nextId = Long.valueOf(memberId).longValue();
        
        if(nextId==0){
            nextId = 10000;
        } else{
            nextId = nextId+1;
        }
        rs.close();
        prepSelect.close();
        memberId = Long.toString(nextId);
        Debug.print("kaverystatelessBean selectMemberId() Status memberId:" + memberId);
        //prepStmt.close();
        releaseConnection();
        Debug.print("kaverystatelessBean selectMemberId() Status memberId:" + memberId);
    } catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in kaverystatelessBean.selectMemberId():" + sql.getMessage());
    } catch(Exception e){
        releaseConnection();
        Debug.print("General Exception  in kaverystatelessBean.selectMemberId():" + e.getMessage());
    }
    Debug.print("kaverystatelessBean selectMemberId() Status Final MemberId memberId:" + memberId);
    return memberId;
}



public boolean insertPreMemRegi(String membId, String usrId, String MembTypeId)
{
	 
	boolean res=false;
	 
	 String statusId="118756d9-fb79-4304-8647-36f0d7579b45";
		    	  
		        try {
		        	makeConnection();
		        	 String str="insert into tblMemberDetails (member_id,user_id,membership_type_id,status_id) values ( ? , ? , ? , ?)";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,membId);
			            prepStmt.setString(2,usrId);
			            prepStmt.setString(3,MembTypeId);
			            prepStmt.setString(4,statusId);
			            
			            int count = prepStmt.executeUpdate();
			            System.out.println("Sucessfully inserted into tblPreMemberDetails : ");
			            if(count>=1){
			           	 res=true; 
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
		       
		    return res;
}

public boolean updateusercode(String membId, String usrId)
{
	 
	boolean res=false;
	 
	 		    	  
		        try {
		        	makeConnection();
		        	 String str="update tblUserMaster set user_code = ? where user_id = ?";
				     				     
				        prepStmt = con.prepareStatement(str);
			            prepStmt.setString(1,membId);
			            prepStmt.setString(2,usrId);
			           
			            
			            int count = prepStmt.executeUpdate();
			            System.out.println("Sucessfully updated");
			            if(count>=1){
			           	 res=true; 
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
		       
		    return res;
}


//-------------------------parasu end here-------------------------

//=================================Dhivya Starts Here:RowCnt==================================================

public int freeMemberRowCount(String membershipTypeId, String statusId) throws RemoteException {
    Debug.print("GeneralDBAction.freeMemberRowCount()  MemberShip Type Id:" + membershipTypeId);
    Debug.print("GeneralDBAction.freeMemberRowCount()  MemberShip Status Id:" + statusId);
    int rowCnt = 0;
    try {
        makeConnection();

        String selectStr = "SELECT count(*) FROM tblMemberDetails A, " + DBHelper.USEA_MMS_USERMASTER + " B, " + DBHelper.USEA_STATUS_MASTER + " C "
                + " WHERE A.user_id = B.user_id and A.status_id = C.status_id and A.membership_type_id = ? and A.status_id = ?";
       
       // String selectStr = "SELECT count(*) FROM tblPreMemberDetails A, " + DBHelper.USEA_MMS_USERMASTER + " B, " + DBHelper.USEA_STATUS_MASTER + " C "
               // + " WHERE A.user_id = B.user_id and A.status_id = C.status_id and A.membership_type_id = ? and A.status_id = ?";
       
        prepStmt = con.prepareStatement(selectStr);
        prepStmt.setString(1, membershipTypeId);
        prepStmt.setString(2, statusId);
        rs = prepStmt.executeQuery();
        if (rs.next()) {
            rowCnt = rs.getInt(1);
        }
        rs.close();
        prepStmt.close();
    } catch (SQLException sqe) {
        throw new EJBException(sqe);
        //sqe.printStackTrace();
    } finally {
        releaseConnection();
    }
    Debug.print("GeneralDBAction.freeMemberRowCount() - Record Size of Member:" + rowCnt);
    return rowCnt;
}


public Vector displayFreeMembershipDetailByMemberID(String membershipTypeId, String statusId, int rCnt) throws RemoteException, FinderException {
    Debug.print("GeneralDBAction.displayFreeMembershipDetailByMemberID()  MemberShip Type Id:" + membershipTypeId);
    Debug.print("GeneralDBAction.displayFreeMembershipDetailByMemberID()  MemberShip Status Id:" + statusId);
    Vector vObj = new Vector();
    String command = "{call sp_get_registeredfreemembers(?,?,?)}";
    try {
        makeConnection();
      
        CallableStatement cstmt = con.prepareCall(command);
        cstmt.setInt(1, rCnt);
        cstmt.setString(2, membershipTypeId);
        cstmt.setString(3, statusId);
        rs = cstmt.executeQuery();
        while (rs.next()) {
            String addDate = rs.getString(1);
            String memberId = rs.getString(2);
            String firstName = rs.getString(3);
            String lastName = rs.getString(4);
            String statusName = rs.getString(5);
            String userId = rs.getString(6);
            String paymentId = rs.getString(7);
            String memberTypeDet[] = {addDate, memberId, firstName, lastName, statusName, userId, paymentId};
            vObj.add(memberTypeDet);
        }
        rs.close();
        cstmt.close();
    } catch (SQLException sqe) {
        throw new EJBException(sqe);
        //sqe.printStackTrace();
    } finally {
        releaseConnection();
    }
    Debug.print("GeneralDBAction.displayFreeMembershipDetailByMemberID() - Record Size of Member:" + vObj.size());
    return vObj;
}

public boolean isMemberIdExist(String memberId)throws RemoteException {
    boolean flag = true;
    
    String memId=memberId.trim();
    Debug.print("memberId in isMemberIdExist :"+memId);
    try {
        makeConnection();
        String selectStatement = "SELECT member_id FROM  " +DBHelper.USEA_MMS_MEMBERDETAIL + "  WHERE member_id = ?";
        prepStmt = con.prepareStatement(selectStatement);
        prepStmt.setString(1, memId);
        
        rs = prepStmt.executeQuery();
        flag = rs.next();
        prepStmt.close();
        
        releaseConnection();
    }catch (Exception e){
        releaseConnection();
        Debug.print("Error in GeneralDBAction:isMemberIdExist()");
    }
    return flag;
}

public ArrayList selectFreeMemberDetailsByMemberId(String memberId){  
    Debug.print("GeneralDBAction selectFreeMemberDetailsByMemberId() " + memberId);
     ArrayList memberDetails = new ArrayList();
     PreparedStatement prepStmt = null;
     ResultSet rs = null;
     makeConnection(); 
    
	try {
      String selectStatement = "select A.first_name, A.last_name, A.login_name, " +
              " A.password, B.member_id , A.email_id, A.user_id, E.membership_type_name, D.status_name, C.state from tblUserMaster A, " +
              "tblPreMemberDetails B, tblContactDetails C, tblMembershipStatusMaster D, tblMembershipTypeMaster E" +
              " where A.user_id = C.user_id AND A.contact_type_id = C.contact_type_id and A.user_id = B.user_id and" +
              " B.status_id = D.status_id and B.membership_type_id = E.membership_type_id and B.member_id = ? ";

         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,memberId.trim());
          Debug.print("GeneralDBAction selectFreeMemberDetailsByMemberId() Query: " + selectStatement);
         rs = prepStmt.executeQuery();
        while(rs.next()){
            String firstName1 =  rs.getString(1);
            String lastName1 = rs.getString(2);
            String loginName = rs.getString(3);
            String password = rs.getString(4);
            String tempMemberId = rs.getString(5);
            String emailId = rs.getString(6);
            String userId1 = rs.getString(7);
            String membershipTypeName1 = rs.getString(8);
            String statusName1 = rs.getString(9);
            String state = rs.getString(10);
            
            HLCUserSearchResultVO objUserSearch = new HLCUserSearchResultVO();
            
            objUserSearch.setFirstName(firstName1);
            objUserSearch.setLastName(lastName1);
            objUserSearch.setLoginName(loginName);
            objUserSearch.setPassword(password);
            objUserSearch.setMemberId(tempMemberId);
            objUserSearch.setEmailId(emailId);
            objUserSearch.setUserId(userId1);
            objUserSearch.setMembershipTypeName(membershipTypeName1);
            objUserSearch.setStatusName(statusName1);
            objUserSearch.setState(state);
            memberDetails.add(objUserSearch);
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
    } 
   catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.selectFreeMemberDetailsByMemberId():" + sql.getMessage());
    }
    catch(Exception e){
         releaseConnection();
        Debug.print("General Exception  in GeneralDBAction.selectFreeMemberDetailsByMemberId():" + e.getMessage());
    }
    return memberDetails;
}

public ArrayList selectFreeMemberDetailsByGeneralSearch(String fName, String lName, String email, String zip, Date fromDate, Date toDate, String roleId, String radName){
    Debug.print("GeneralDBAction selectFreeMemberDetailsByGeneralSearch() " + fName);
     ArrayList memberDetails = new ArrayList();
     PreparedStatement prepStmt = null;
     PreparedStatement prepStmt1 = null;
     ResultSet rs = null;
     ResultSet rs1 = null;
     String selectStatement="";
     makeConnection();
	try {
       
      if(radName!=null && radName.equalsIgnoreCase("members")){

     selectStatement = "select A.first_name, A.last_name, A.login_name, A.password, B.member_id , " +
              " A.email_id, A.user_id, E.membership_type_name, D.status_name, C.state, F.role_id, G.role_name " +
              " from tblUserMaster A, tblPreMemberDetails B, tblContactDetails C, tblMembershipStatusMaster D, tblMembershipTypeMaster E, " +
              "tblMapUserPrivilege F, tblRoleMaster G where A.user_id = B.user_id and A.user_id = C.user_id and B.status_id = D.status_id " +
              "and B.membership_type_id = E.membership_type_id and A.user_id = F.user_id and A.contact_type_id = C.contact_type_id and F.role_id = G.role_id";
        }
      else if(radName!=null && radName.equalsIgnoreCase("nonMembers")){
selectStatement = "select A.first_name, A.last_name, A.login_name, A.password, " +
              " A.email_id, A.user_id, C.state " +
              " from tblUserMaster A LEFT OUTER JOIN tblPreMemberDetails B ON A.user_id = B.user_id, tblContactDetails C " +
              " where A.user_id = C.user_id and " +
              " A.contact_type_id = C.contact_type_id and B.user_id IS NULL";

        }
            if(fName!=null && fName.trim().length()!=0){
                fName = fName.replaceAll("'","''");
                selectStatement = selectStatement + " and A.first_name like '" + fName.trim() + "%' ";
            }
     
            if(lName!=null && lName.trim().length()!=0){
                lName = lName.replaceAll("'","''");
                selectStatement = selectStatement + " and A.last_name like '" + lName.trim() + "%' ";
            }
            
            if(email!=null && email.trim().length()!=0){
                selectStatement = selectStatement + " and A.email_id = '" + email.trim() + "' " ;
            }

            if(zip!=null && zip.trim().length()!=0){
                 selectStatement = selectStatement + " and C.zip = '" + zip.trim() + "' " ;
            }

        if(fromDate!=null && toDate!=null){
                 selectStatement = selectStatement + " and A.register_date Between '" + DBHelper.toSQLDate(fromDate) + "' and '" + DBHelper.toSQLDate(toDate) + "' " ;
            }
if(radName!=null && radName.equalsIgnoreCase("members")){
        if(roleId!=null && roleId.trim().length()!=0){
                 selectStatement = selectStatement + " and F.role_id = '" + roleId.trim() + "' " ;
            }
        }
         selectStatement = selectStatement +" ORDER BY A.last_name,A.first_name ASC" ;
         Debug.print("Query : " + selectStatement);

         prepStmt = con.prepareStatement(selectStatement);
         Debug.print("GeneralDBAction selectFreeMemberDetailsByGeneralSearch() Query: " + selectStatement);
         rs = prepStmt.executeQuery();

            String firstName2 =  "";
            String lastName2 = "";
            String loginName1 = "";
            String password ="";
            String emailId ="";
            String userId2 ="";
            String state ="";

        while(rs.next()){
HLCUserSearchResultVO objUserSearch = new HLCUserSearchResultVO();
   if(radName!=null && radName.equalsIgnoreCase("members")){
             firstName2 =  rs.getString(1);
             lastName2 = rs.getString(2);
             loginName1 = rs.getString(3);
             password = rs.getString(4);
            String tempMemberId = rs.getString(5);
             emailId = rs.getString(6);
             userId2 = rs.getString(7);
            String membershipTypeName2 =  rs.getString(8);
            String statusName2 =  rs.getString(9);
             state = rs.getString(10);
            String rolId = rs.getString(11);
            String rolName = rs.getString(12);

            //Debug.print("tempMemberId in DAO"+tempMemberId);
           
            
            objUserSearch.setFirstName(firstName2);
            objUserSearch.setLastName(lastName2);
            objUserSearch.setLoginName(loginName1);
            objUserSearch.setPassword(password);
   
            objUserSearch.setMemberId(tempMemberId);
            objUserSearch.setMembershipTypeName(membershipTypeName2);
            objUserSearch.setStatusName(statusName2);
           
            objUserSearch.setEmailId(emailId);
            objUserSearch.setUserId(userId2);
           
            objUserSearch.setState(state);
            objUserSearch.setRoleId(rolId);
            objUserSearch.setRoleName(rolName);
        }else if(radName!=null && radName.equalsIgnoreCase("nonMembers")){

             firstName2 =  rs.getString(1);
             lastName2 = rs.getString(2);
             loginName1 = rs.getString(3);
             password = rs.getString(4);
             emailId = rs.getString(5);               
             userId2 = rs.getString(6);
             state = rs.getString(7);
             
objUserSearch.setFirstName(firstName2);
            objUserSearch.setLastName(lastName2);
            objUserSearch.setLoginName(loginName1);
            objUserSearch.setPassword(password);

            objUserSearch.setEmailId(emailId);
            objUserSearch.setUserId(userId2);

            objUserSearch.setState(state);

        }

            memberDetails.add(objUserSearch);

          //  Debug.print("memberDetails in the DAO"+memberDetails.size());
        }
        rs.close();
        prepStmt.close();
        releaseConnection();
    }
    catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.selectFreeMemberDetailsByGeneralSearch():" + sql.getMessage());
    }
    catch(Exception e){
        e.printStackTrace();
         releaseConnection();
        Debug.print("General Exception  in GeneralDBAction.selectFreeMemberDetailsByGeneralSearch():" + e.getMessage());
    }       
    return memberDetails;
}


public ArrayList selectFreeMemberDetailsByLoginName(String loginName, String radName){
    Debug.print("GeneralDBAction selectFreeMemberDetailsByLoginName() " + loginName);
    ArrayList memberDetails = new ArrayList();
  
    String selectStatement="";
   HLCUserSearchResultVO objUserSearch = new HLCUserSearchResultVO();
    makeConnection();
	try {
       
 if(radName!=null && radName.equalsIgnoreCase("members")){
selectStatement = " select A.first_name, A.last_name, A.login_name, " +
              " A.password, A.email_id, A.user_id, B.state, C.member_id, E.membership_type_name, D.status_name "
              + "from tblUserMaster A, tblContactDetails B, tblPreMemberDetails C, tblMembershipStatusMaster D, tblMembershipTypeMaster E "
              + "where A.user_id = B.user_id AND A.contact_type_id = B.contact_type_id and C.status_id = D.status_id and "
              + "C.membership_type_id = E.membership_type_id "
              + "and A.user_id=C.user_id and A.login_name = '" + loginName.trim() + "'";

prepStmt = con.prepareStatement(selectStatement);
         //prepStmt.setString(1,loginName.trim());
         Debug.print("GeneralDBAction selectFreeMemberDetailsByLoginName() 1st Query: " + selectStatement);
         rs = prepStmt.executeQuery();

        while(rs.next()){
            String firstName3 =  rs.getString(1);
            String lastName3 = rs.getString(2);
            String loginName1 = rs.getString(3);
            String password = rs.getString(4);
            String emailId = rs.getString(5);
            String userId3 = rs.getString(6);
            String state = rs.getString(7);

            String tempMemberId =rs.getString(8);


            String membershipTypeName3 =rs.getString(9);
            String statusName3 =rs.getString(10);

            objUserSearch.setFirstName(firstName3);
            objUserSearch.setLastName(lastName3);
            objUserSearch.setLoginName(loginName1);
            objUserSearch.setPassword(password);
            objUserSearch.setEmailId(emailId);
            objUserSearch.setUserId(userId3);
            objUserSearch.setState(state);
            objUserSearch.setMemberId(tempMemberId);
            objUserSearch.setMembershipTypeName(membershipTypeName3);
            objUserSearch.setStatusName(statusName3);


memberDetails.add(objUserSearch);
        }
        

        }

if(radName!=null && radName.equalsIgnoreCase("nonMembers")){


selectStatement = "select A.first_name, A.last_name, A.login_name, A.password, " +
              " A.email_id, A.user_id, C.state " +
              " from tblUserMaster A LEFT OUTER JOIN tblPreMemberDetails B ON A.user_id = B.user_id, tblContactDetails C " +
              " where A.user_id = C.user_id and " +
              " A.contact_type_id = C.contact_type_id and B.user_id IS NULL and A.login_name = '" + loginName.trim() + "'";

prepStmt = con.prepareStatement(selectStatement);
        
         Debug.print("GeneralDBAction selectFreeMemberDetailsByLoginName() 2nd Query: " + selectStatement);
         rs = prepStmt.executeQuery();


String firstName2 =  "";
            String lastName2 = "";
            String loginName1 = "";
            String password ="";
            String emailId ="";
            String userId2 ="";
            String state ="";

   while(rs.next()){
          firstName2 =  rs.getString(1);
             lastName2 = rs.getString(2);
             loginName1 = rs.getString(3);
             password = rs.getString(4);
             emailId = rs.getString(5);
             userId2 = rs.getString(6);
             state = rs.getString(7);

objUserSearch.setFirstName(firstName2);
            objUserSearch.setLastName(lastName2);
            objUserSearch.setLoginName(loginName1);
            objUserSearch.setPassword(password);

            objUserSearch.setEmailId(emailId);
            objUserSearch.setUserId(userId2);

            objUserSearch.setState(state);
            
            memberDetails.add(objUserSearch);
}
}

        rs.close();
       prepStmt.close();
        releaseConnection();
        
    }
     catch(SQLException sql){
        releaseConnection();
        Debug.print("SQL Exception in GeneralDBAction.selectFreeMemberDetailsByLoginName():" + sql.getMessage());
    }
    catch(Exception e){     
         releaseConnection();
         e.printStackTrace();
      
    }

    return memberDetails;
}
/**
 * @Method Name    :ejbFindByDisplaySubTypeName.
 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
 * @param          :String displaySubTypeName.
 * @return         :Collection value.
 * @throws         :FinderException.
 */
   public String findByDisplaySubTypeName(String displaySubTypeName) throws FinderException{
       Debug.print("DisplaySubTypeMasterBean findByDisplaySubTypeName:" + displaySubTypeName);
       makeConnection();
       String subTypeList = null;
  	try {
           String selectStatement = "select display_sub_type_id from tblAdvDisplaySubTypes where display_sub_type_name = ? order by display_sub_type_name" ;
           PreparedStatement prepStmt = con.prepareStatement(selectStatement);
           Debug.print("DisplaySubTypeMasterBean findByDisplaySubTypeName:" + selectStatement);
           prepStmt.setString(1,displaySubTypeName);
           ResultSet rs = prepStmt.executeQuery();
           while (rs.next()){
               subTypeList = (rs.getString(1));
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
           Debug.print("DisplaySubTypeMasterBean in findByDisplaySubTypeName:" + subTypeList);
       } 
       catch(SQLException sql){
           releaseConnection();
           throw new EJBException("SQL Exception in findByDisplaySubTypeName:" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           throw new EJBException("General Exception  in findByDisplaySubTypeName:" + e.getMessage());
       }
       return subTypeList;
   }
   public boolean dispSubTypeCreate(String displaySubTypeName , String displayTypeId, String displaySubTypeDescription) throws CreateException{
       Debug.print("DisplaySubTypeMasterBean ejbCreate");   
       //this.displaySubTypeName = displaySubTypeName;
       //this.displayTypeId = displayTypeId;
       //this.displaySubTypeDescription = displaySubTypeDescription;
       boolean dispSubTypeStatus = false;
       try {
    	   dispSubTypeStatus = insertRowDisplaySubType(displaySubTypeName, displayTypeId, displaySubTypeDescription);
       } catch (Exception ex) {
           throw new EJBException("ejbCreate: " + ex.getMessage());
       }
       Debug.print("Primary Key: After Insertion" + dispSubTypeStatus);
       return  dispSubTypeStatus;
   }
   /**
    * @Method Name    :insertRowDisplaySubType.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :NUll.
    * @return         :void value.
    * @throws         :SQLException, MissingPrimaryKeyException.
    */ 
      private boolean insertRowDisplaySubType(String displaySubTypeName, String displayTypeId, String displaySubTypeDescription) throws SQLException {
          Debug.print("DisplaySubTypeMasterBean insertRowMedia");
          
          String displaySubTypeId = getNextId();
          boolean insertDipSubTypeStatus = false;
          
          makeConnection();
          try{
              String insertStatement =
                  "insert into tblAdvDisplaySubTypes(display_sub_type_id, display_sub_type_name, display_type_id, display_sub_type_description) " +
                   " values ( ? , ? , ? , ?)";
              PreparedStatement prepStmt = con.prepareStatement(insertStatement);
              prepStmt.setString(1, displaySubTypeId);
              prepStmt.setString(2, displaySubTypeName);
              prepStmt.setString(3, displayTypeId);
              prepStmt.setString(4, displaySubTypeDescription);
              prepStmt.executeUpdate();
              insertDipSubTypeStatus = true;
              prepStmt.close();
              releaseConnection();
          }
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in insertRowMedia:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in insertRowMedia:" + e.getMessage());
          } 
          return insertDipSubTypeStatus;
      }
      /**
       * @Method Name    :ejbFindByMedia.
       * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
       * @param          :String mediaId.
       * @return         :Collection  value.
       * @throws         :FinderException.
       */
         public Collection findDispTypeByMedia(String mediaId) throws FinderException{
             Debug.print("DisplayTypeMasterBean ejbFindByMedia:" + mediaId);
             makeConnection();
             ArrayList displayList = new ArrayList();
        	try {
                 String selectStatement = "select display_type_id from tblAdvDisplayTypeMaster where media_id = ?  order by display_type_name" ;
                 PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                 Debug.print("DisplayTypeMasterBean findByDisplayTypeName:" + selectStatement);
                 prepStmt.setString(1,mediaId);
                 ResultSet rs = prepStmt.executeQuery();
                 while (rs.next()){
                     displayList.add(rs.getString(1));
                 }
                 rs.close();
                 prepStmt.close();
                 releaseConnection();
                 Debug.print("DisplayTypeMasterBean in ejbFindByMedia:" + displayList);
             } 
             catch(SQLException sql){
                 releaseConnection();
                 throw new EJBException("SQL Exception in ejbFindByMedia:" + sql.getMessage());
             }
             catch(Exception e){
                 releaseConnection();
                 throw new EJBException("General Exception  in ejbFindByMedia:" + e.getMessage());
             }
             return displayList;
     }
         
         public ArrayList getprofile_details(String emailId)
 	    {
 		 ArrayList prof_det= new ArrayList(); 
 	    	String username=null;
 	    	String password=null;
 	    	String institution_name=null;
 	    	String e_mail=null;
 	    	String customer_id=null;
 	       try {
 			        	makeConnection();
 			        	 String str="SELECT username,password,institution_name,e_mail,customer_id FROM tblSignUpDetails WHERE e_mail=?";
 					     				     
 					        prepStmt = con.prepareStatement(str);
 				            prepStmt.setString(1,emailId);
 				            
 				            
 				            rs = prepStmt.executeQuery();
 				            while (rs.next()){
 				            	username = rs.getString(1);
 				            	password = rs.getString(2);
 				            	institution_name=rs.getString(3);
 				            	e_mail=rs.getString(4);
 				            	customer_id=rs.getString(5);
 				            	String[] temp={username,password,institution_name,e_mail,customer_id};
 				            	prof_det.add(temp);
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
 			       
 			    return prof_det;
 	    }
         
         //===========================product package starts here=========================================
         public ArrayList getproduct_package(String emailId)
  	    {
  		 ArrayList prod_package= new ArrayList(); 
  	    	String Productplan=null;
  	    	String subscription_plan=null;
  	    	String amount=null;
  	    
  	       try {
  			        	makeConnection();
  			        	 String str="SELECT Productplan,Subscription_plan,amount FROM tblSignUpDetails WHERE e_mail=?";
  					     				     
  					        prepStmt = con.prepareStatement(str);
  				            prepStmt.setString(1,emailId);
  				            
  				            
  				            rs = prepStmt.executeQuery();
  				            while (rs.next()){
  				            	Productplan = rs.getString(1);
  				            	subscription_plan = rs.getString(2);
  				            	amount=rs.getString(3);
  				                String[] temp={Productplan,subscription_plan,amount};
  				            	prod_package.add(temp);
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
  			       
  			    return prod_package;
  	    }
       //===========================product package end here=========================================
         
         
       //===========================security starts here=========================================
         public ArrayList getsecurity_details(String emailId)
  	    {
  		 ArrayList security_det= new ArrayList(); 
  	    	String Productplan=null;
  	    	String subscription_plan=null;
  	    	String amount=null;
  	    
  	       try {
  			        	makeConnection();
  			        	 String str="SELECT username,password,institution_name,e_mail,customer_id FROM tblSignUpDetails WHERE e_mail=?";
  					     				     
  					        prepStmt = con.prepareStatement(str);
  				            prepStmt.setString(1,emailId);
  				            
  				            
  				            rs = prepStmt.executeQuery();
  				            while (rs.next()){
  				            	Productplan = rs.getString(1);
  				            	subscription_plan = rs.getString(2);
  				            	amount=rs.getString(3);
  				                String[] temp={Productplan,subscription_plan,amount};
  				                security_det.add(temp);
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
  			       
  			    return security_det;
  	    }
       //===========================security end here=========================================

         /**
          * @Method Name    :ejbFindByDisplayTypeId.
          * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
          * @param          :String displayTypeId.
          * @return         :Collection value.
          * @throws         :FinderException.
          */
                public ArrayList getDispTypeDetails(String displayTypeId) throws FinderException{
                Debug.print("DisplaySubTypeMasterBean ejbFindByDisplayTypeId:" + displayTypeId);
                makeConnection();
                ArrayList subTypeList = new ArrayList();
           	try {
                    String selectStatement = "select display_type_id, display_type_name, media_id, display_type_description, active_status from tblAdvDisplayTypeMaster where display_type_id = ? order by display_type_name" ;
                    PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                    Debug.print("DisplaySubTypeMasterBean ejbFindByDisplayTypeId:" + selectStatement);
                    prepStmt.setString(1,displayTypeId);
                    ResultSet rs = prepStmt.executeQuery();
                    while (rs.next()){
                    	 String displayTypeIdInSub =  rs.getString(1);
                         String displayTypeName =  rs.getString(2);
                    	 String mediaIdVal  = rs.getString(3);
                         String displayTypeDescription = rs.getString(4);
                         String dispStatus = rs.getString(5);
                         String dispType [] = {displayTypeId,displayTypeName,mediaIdVal,displayTypeDescription, dispStatus};
                        subTypeList.add(dispType);
                    }
                    rs.close();
                    prepStmt.close();
                    releaseConnection();
                    Debug.print("DisplaySubTypeMasterBean in ejbFindByDisplayTypeId:" + subTypeList);
                } 
                catch(SQLException sql){
                    releaseConnection();
                    throw new EJBException("SQL Exception in ejbFindByDisplayTypeId:" + sql.getMessage());
                }
                catch(Exception e){
                    releaseConnection();
                    throw new EJBException("General Exception  in ejbFindByDisplayTypeId:" + e.getMessage());
                }
                return subTypeList;
                }
                public String findDispSubTypeByPrimaryKey(String displaySubTypeId) throws FinderException {
                    Debug.print("DisplaySubTypeMasterBean ejbFindByPrimaryKey");

                    boolean result;

                    try {
                        result = selectDispSubTypeByPrimaryKey(displaySubTypeId);
                    } catch (Exception ex) {
                        throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
                    }

                    if (result) {
                        return displaySubTypeId;
                    } else {
                        throw new ObjectNotFoundException("Row for id " + displaySubTypeId + " not found.");
                    }
                }
                /**
                 * @Method Name    :selectByPrimaryKey.
                 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                 * @param          :String displaySubTypeId.
                 * @return         :boolean value.
                 * @throws         :SQLException.
                 */
                   private boolean selectDispSubTypeByPrimaryKey(String displaySubTypeId) throws SQLException {
                       Debug.print("DisplaySubTypeMasterBean selectByPrimaryKey:" + displaySubTypeId);
                       boolean result = false;          
                       makeConnection();
                       try {
                           String selectStatement = "SELECT display_sub_type_id from tblAdvDisplaySubTypes WHERE display_sub_type_id = ?";
                           PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                           prepStmt.setString(1, displaySubTypeId);

                           ResultSet rs = prepStmt.executeQuery();
                           result = rs.next();
                           prepStmt.close();
                           releaseConnection();
                           Debug.print("DisplaySubTypeMasterBean selectByPrimaryKey" + result);
                       }
                       catch(SQLException sql){
                           releaseConnection();
                           throw new EJBException("SQL Exception in selectByPrimaryKey:" + sql.getMessage());
                       }
                       catch(Exception e){
                           releaseConnection();
                           throw new EJBException("General Exception  in selectByPrimaryKey:" + e.getMessage());
                       }
                        return result;
                   }
                   /**
                    * @Method Name    :loadDisplaySubTypeDetails.
                    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                    * @param          :Null.
                    * @return         :void value.
                    * @throws         :SQLException.
                    */ 
                      public ArrayList getDisplaySubTypeDetails(String displaySubTypeId) throws SQLException {
                          Debug.print("DisplaySubTypeMasterBean loadDisplayDetails");
                         // displaySubTypeId = (String)context.getPrimaryKey();
                           ArrayList dispSubTypeDetails = new ArrayList();

                          Debug.print("DisplaySubTypeMasterBean loadDisplayDetails Primary Key:" + displaySubTypeId );
                          makeConnection();
                          try{
                              String selectStatement =
                                  "select  display_sub_type_id, display_sub_type_name, display_type_id, display_sub_type_description, active_status from tblAdvDisplaySubTypes where display_sub_type_id = ?  order by add_date";
                              PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                              prepStmt.setString(1, displaySubTypeId);
                              ResultSet rs = prepStmt.executeQuery();
                              while (rs.next()){
                            	  String dispSubTypeId = rs.getString(1);
                                  String displaySubTypeName = rs.getString(2);
                                  String displayTypeId = rs.getString(3);
                                  String displaySubTypeDescription = rs.getString(4);
                                  String activeStatus = rs.getString(5);
                                  String dispSubType[] ={dispSubTypeId, displaySubTypeName, displayTypeId, displaySubTypeDescription, activeStatus};
                                  dispSubTypeDetails.add(dispSubType);
                              }
                              rs.close();
                              prepStmt.close();
                              releaseConnection();
                          }
                          catch(SQLException sql){
                              releaseConnection();
                              throw new EJBException("SQL Exception in loadDisplayDetails:" + sql.getMessage());
                          }
                          catch(Exception e){
                              releaseConnection();
                              throw new EJBException("General Exception  in loadMediaDetails:" + e.getMessage());
                          }
                          return dispSubTypeDetails;
                      }
                


/**
 * @Method Name    :ejbFindByAll.
 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
 * @param          :Null.
 * @return         :Collection value.
 * @throws         :FinderException.
 */    
  public Collection findByAll() throws FinderException{
       Debug.print("MediaMasterBean ejbFindAll");
       Vector mediaList = new Vector();
       makeConnection();
  	try {
           String selectStatement = "select media_id from tblAdvMediaMaster order by add_date";
           PreparedStatement prepStmt = con.prepareStatement(selectStatement);
           ResultSet rs = prepStmt.executeQuery();
           while (rs.next()){
               mediaList.addElement(rs.getString(1));
               Debug.print("Media ID In Find ALL:" + rs.getString(1));
           }
           rs.close();
           prepStmt.close();
           releaseConnection();
       } 
       catch(SQLException sql){
           releaseConnection();
           throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
       }
       return mediaList;
}
  
  public String findIssueByPrimaryKey(String issueId) throws FinderException {
      Debug.print("IssueMasterBean ejbFindByPrimaryKey");

      boolean result;

      try {
          result = selectByPrimaryKey(issueId);
      } catch (Exception ex) {
          throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
      }

      if (result) {
          return issueId;
      } else {
          throw new ObjectNotFoundException("Row for id " + issueId + " not found.");
      }
  }
  /**
   * @Method Name    :selectByPrimaryKey.
   * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
   * @param          :String issueId.
   * @return         :boolean  value.
   * @throws         :SQLException.
   */
   private boolean selectIssueByPrimaryKey(String issueId) throws SQLException {
         Debug.print("IssueMasterBean selectByPrimaryKey:" + issueId);
         boolean result = false;          
         makeConnection();
         try {
             String selectStatement = "SELECT issue_id from tblAdvIssueMaster WHERE issue_id = ?";
             PreparedStatement prepStmt = con.prepareStatement(selectStatement);
             prepStmt.setString(1, issueId);

             ResultSet rs = prepStmt.executeQuery();
             result = rs.next();
             prepStmt.close();
             releaseConnection();
             Debug.print("IssueMasterBean selectByPrimaryKey" + result);
         }
         catch(SQLException sql){
             releaseConnection();
             throw new EJBException("SQL Exception in selectByPrimaryKey:" + sql.getMessage());
         }
         catch(Exception e){
             releaseConnection();
             throw new EJBException("General Exception  in selectByPrimaryKey:" + e.getMessage());
         }
          return result;
     }
   /**
    * @Method Name    :insertRowIssue.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :Null.
    * @return         :void value.
    * @throws         :SQLException, MissingPrimaryKeyException.
    */
      public boolean createRowIssue(String issueName,String mediaId) throws SQLException {
          Debug.print("IssueMasterBean insertRowIssue");
          
          String issueId = getNextId();
          boolean createRowIssue = false;
          makeConnection();
          try{
              String insertStatement =
                  "insert into tblAdvIssueMaster(issue_id, issue_name, media_id) " +
                   " values ( ? , ? ,  ?)";
              PreparedStatement prepStmt = con.prepareStatement(insertStatement);
              prepStmt.setString(1, issueId);
              prepStmt.setString(2, issueName);
              prepStmt.setString(3, mediaId);
              prepStmt.executeUpdate();
              createRowIssue = true;
              prepStmt.close();
              releaseConnection();
          }
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in insertRowIssue:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in insertRowIssue:" + e.getMessage());
          }
          return createRowIssue;
      }
   /**
    * @Method Name    :ejbFindByIssueName.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :String issueName.
    * @return         :Collection  value.
    * @throws         :FinderException.
    */
      public Collection findByIssueName(String issueName) throws FinderException{
          Debug.print("IssueMasterBean ejbFindByIssueName:" + issueName);
          makeConnection();
          ArrayList issueList = new ArrayList();
     	try {
              String selectStatement = "select issue_id from tblAdvIssueMaster where issue_name = ? order by issue_name";
              PreparedStatement prepStmt = con.prepareStatement(selectStatement);
              Debug.print("IssueMasterBean ejbFindByIssueName:" + selectStatement);
              prepStmt.setString(1,issueName);
              ResultSet rs = prepStmt.executeQuery();
              while (rs.next()){
                  issueList.add(rs.getString(1));
              }
              rs.close();
              prepStmt.close();
              releaseConnection();
              Debug.print("IssueMasterBean in ejbFindByIssueName:" + issueList);
          } 
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in ejbFindByIssueName:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in ejbFindByIssueName:" + e.getMessage());
          }
          return issueList;
  }
   /**
    * @Method Name    :storeIssueDetails.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :Null.
    * @return         :void value.
    * @throws         :SQLException.
    */
      public boolean editIssueDetails(String issueId, String issueName,String mediaId) throws SQLException, FinderException {
          Debug.print("IssueMasterBean storeIssueDetails");
          boolean editIssueDetails = false;
          boolean activeStatus = getIssueStatus(issueId);
          makeConnection();
          try{
              String updateStatement =
                      "update tblAdvIssueMaster set issue_name = ? , media_id = ? , active_status = ? " + 
                      " where issue_id = ? ";

              PreparedStatement prepStmt = con.prepareStatement(updateStatement);

              prepStmt.setString(1, issueName);
              prepStmt.setString(2, mediaId);
              prepStmt.setBoolean(3, activeStatus);
              prepStmt.setString(4, issueId);
              int rowCount = prepStmt.executeUpdate();
              Debug.print("Sucessfully Updated." + rowCount);
              editIssueDetails = true;
              prepStmt.close();
              releaseConnection();
          }
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in storeIssueDetails:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in storeIssueDetails:" + e.getMessage());
          }
          return editIssueDetails;
      }
      /**
       * @Method Name    :getMediaDetails.
       * @Description    :This method will retrieve media details.
       * @param          :mediaID.
       * @return         :ArrayList value.
       * @throws         :FinderException.
       */    
        public boolean getIssueStatus(String issueId) throws FinderException{
             Debug.print("MediaMasterBean ejbFindAll");
             boolean mediaStatus = false;
             makeConnection();
        	try {
                 String selectStatement = "select active_status from tblAdvIssueMaster where issue_id = ?";
                 PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                 prepStmt.setString(1, issueId);
                 ResultSet rs = prepStmt.executeQuery();
                 while(rs.next()){
                 	mediaStatus = rs.getBoolean(1);
                     
                 }
                 rs.close();
                 prepStmt.close();
                 releaseConnection();
             } 
             catch(SQLException sql){
                 releaseConnection();
                 throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
             }
             catch(Exception e){
                 releaseConnection();
                 throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
             }
             return mediaStatus;
      }
   /**
    * @Method Name    :ejbFindByIssueEditName.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :String issueId, String issueName.
    * @return         :Collection  value.
    * @throws         :FinderException.
    */
      public Collection findByIssueEditName(String issueId,String issueName) throws FinderException{
          Debug.print("IssueMasterBean ejbFindByIssueEditName:" + issueName);
          makeConnection();
          ArrayList issueList = new ArrayList();
     	try {
              String selectStatement = "select issue_id from tblAdvIssueMaster where issue_name = ? and issue_id != ? order by issue_name";
              PreparedStatement prepStmt = con.prepareStatement(selectStatement);
              prepStmt.setString(1,issueName);
              prepStmt.setString(2,issueId);
              ResultSet rs = prepStmt.executeQuery();
              while (rs.next()){
                  issueList.add(rs.getString(1));
                  Debug.print("IssueMasterBean in ejbFindByIssueEditName:" + rs.getString(1));
              }
              rs.close();
              prepStmt.close();
              releaseConnection();
          } 
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in ejbFindByIssueEditName:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in ejbFindByIssueEditName:" + e.getMessage());
          }
          return issueList;
      }
   /**
    * @Method Name    :deleteRow.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :String issueId.
    * @return         :void value.
    * @throws         :SQLException.
    */
      public boolean deleteIssueRow(String issueId) throws SQLException {
    	  boolean deleteIssueRowStatus = false;
          Debug.print("IssueMasterBean deleteRow");
          makeConnection();
          try{
              String deleteStatement = "delete from tblAdvIssueMaster  where issue_id = ? ";
              PreparedStatement prepStmt = con.prepareStatement(deleteStatement);

              prepStmt.setString(1, issueId);
              prepStmt.executeUpdate();
              deleteIssueRowStatus = true;
              prepStmt.close();
              releaseConnection();
          }
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in deleteRow:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in deleteRow:" + e.getMessage());
          }
          return deleteIssueRowStatus;

      }
   /**
    * @Method Name    :getIssue.
    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
    * @param          :Null.
    * @return         :Collection  value.
    * @throws         :Null.
    */
     public Collection getIssueFrmDb(String issueId){
          Debug.print("IssueMasterBean getIssue");
          Vector mediaList = new Vector();
          makeConnection();
     	try {
              String selectStatement = "select issue_id, issue_name, media_id, active_status from tblAdvIssueMaster where issue_id = ?";
              PreparedStatement prepStmt = con.prepareStatement(selectStatement);
              prepStmt.setString(1,issueId);
              ResultSet rs = prepStmt.executeQuery();
              while (rs.next()){
            	  String issue_id = rs.getString(1);
             	 String issue_name = rs.getString(2);
             	 String media_id = rs.getString(3);
             	 String active_status = rs.getString(4);
             	 String issueDetails[] = {issue_id, issue_name, media_id, active_status};
                  mediaList.addElement(issueDetails);
              }
              rs.close();
              prepStmt.close();
              releaseConnection();
          } 
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in getIssue:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in getMedia:" + e.getMessage());
          }
          return mediaList;
  }
    
  /**
   * @Method Name    :ejbFindByMediaId.
   * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
   * @param          :String mediaId.
   * @return         :Collection  value.
   * @throws         :FinderException.
   */
        public Collection findByMediaId(String mediaId) throws FinderException{
         Debug.print("IssueMasterBean ejbFindByMediaId:" + mediaId);
         makeConnection();
         ArrayList issueList = new ArrayList();
    	try {
             String selectStatement = "select issue_id, issue_name, media_id, active_status from tblAdvIssueMaster where media_id = ? order by issue_name";
             PreparedStatement prepStmt = con.prepareStatement(selectStatement);
             Debug.print("IssueMasterBean ejbFindByMediaId:" + selectStatement);
             prepStmt.setString(1,mediaId);
             ResultSet rs = prepStmt.executeQuery();
             while (rs.next()){
            	 String issue_id = rs.getString(1);
            	 String issue_name = rs.getString(2);
            	 String media_id = rs.getString(3);
            	 String active_status = rs.getString(4);
            	 String issueDetails[] = {issue_id, issue_name, media_id, active_status};
                 issueList.add(issueDetails);
             }
             rs.close();
             prepStmt.close();
             releaseConnection();
             Debug.print("IssueMasterBean in ejbFindByMediaId:" + issueList);
         } 
         catch(SQLException sql){
             releaseConnection();
             throw new EJBException("SQL Exception in ejbFindByMediaId:" + sql.getMessage());
         }
         catch(Exception e){
             releaseConnection();
             throw new EJBException("General Exception  in ejbFindByMediaId:" + e.getMessage());
         }
         return issueList;
         }
        
        
    

  /**
   * @Method Name    :getMediaDetails.
   * @Description    :This method will retrieve media details.
   * @param          :mediaID.
   * @return         :ArrayList value.
   * @throws         :FinderException.
   */    
    public ArrayList getAllMediaDetails() throws FinderException{
         Debug.print("MediaMasterBean getAllMediaDetails");
         ArrayList mediaListById = new ArrayList();
         makeConnection();
    	try {
             String selectStatement = "select media_id, media_name, media_description, active_status from tblAdvMediaMaster";
             PreparedStatement prepStmt = con.prepareStatement(selectStatement);
            
             ResultSet rs = prepStmt.executeQuery();
             while(rs.next()){
                 String mediaId = rs.getString(1);
                 String mediaName = rs.getString(2);
                 String mediaDescription = rs.getString(3);
                 String activeStatus = rs.getString(4);
                 String[] mediaList = {mediaId, mediaName, mediaDescription, activeStatus};
                 mediaListById.add(mediaList);
             }
             rs.close();
             prepStmt.close();
             releaseConnection();
         } 
         catch(SQLException sql){
             releaseConnection();
             throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
         }
         catch(Exception e){
             releaseConnection();
             throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
         }
         return mediaListById;
  }

    /**
     * @Method Name    :createMedia.
     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
     * @param          :mediaName, mediaDesc.
     * @return         :boolean value.
     * @throws         :SQLException
     */    
    
       public boolean createMediaDb(String mediaName, String mediaDesc) throws SQLException {
           Debug.print("MediaMasterBean insertRowMedia");
           
           String mediaId = getNextId();
           boolean createStatus =false;
           makeConnection();
           try{
               String insertStatement =
                   "insert into tblAdvMediaMaster (media_id, media_name, media_description) " +
                    " values ( ? , ? , ?)";
               PreparedStatement prepStmt = con.prepareStatement(insertStatement);
               prepStmt.setString(1, mediaId);
               prepStmt.setString(2, mediaName);
               prepStmt.setString(3, mediaDesc);
               prepStmt.executeUpdate();
               createStatus = true;
               prepStmt.close();
               releaseConnection();
           }
           catch(SQLException sql){
               releaseConnection();
               throw new EJBException("SQL Exception in insertRowMedia:" + sql.getMessage());
           }
           catch(Exception e){
               releaseConnection();
               throw new EJBException("General Exception  in insertRowMedia:" + e.getMessage());
           }     
           return createStatus;
       }
       
       /**
        * @Method Name    :getNextId.
        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
        * @param          :Null.
        * @return         :String value.
        * @throws         :SQLException ,MissingPrimaryKeyException.
        */     
          private String getNextId() throws SQLException {
              Debug.print("MediaMasterBean getNextId");
              makeConnection();
              String nextId = null;
              try{
                  String selectStatement = "select newid() as planId";
                  Debug.print("MediaMasterBean getNextId:" + selectStatement);
                  PreparedStatement prepSelect = con.prepareStatement(selectStatement);
                  ResultSet rs = prepSelect.executeQuery();
                  rs.next();
                  nextId = rs.getString(1);
                  rs.close();
                  prepSelect.close();
                  releaseConnection();
              }
              catch(SQLException sql){
                  releaseConnection();
                  throw new EJBException("SQL Exception in getNextId:" + sql.getMessage());
              }
              catch(Exception e){
                  releaseConnection();
                  throw new EJBException("General Exception  in getNextId:" + e.getMessage());
              }        
              return nextId;
          }

          /**
           * @Method Name    :storeMediaDetails.
           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
           * @param          :Null.
           * @return         :void value.
           * @throws         :SQLException.
           */        
             public boolean editMedia(String mediaId, String mediaName, String mediaDesc, boolean mediaStatus) throws SQLException {
                 Debug.print("MediaMasterBean storeMediaDetails");
                 boolean editMediaStatus = false;
                 makeConnection();
                 try{
                     String updateStatement =
                             "update tblAdvMediaMaster set media_name = ? , media_description = ? , active_status = ? " + 
                             " where media_id = ? ";

                     PreparedStatement prepStmt = con.prepareStatement(updateStatement);

                     prepStmt.setString(1, mediaName);
                     prepStmt.setString(2, mediaDesc);
                     prepStmt.setBoolean(3, mediaStatus);
                     prepStmt.setString(4, mediaId);
                     int rowCount = prepStmt.executeUpdate();
                     Debug.print("Sucessfully Updated." + rowCount);
                     editMediaStatus = true;
                     prepStmt.close();
                     releaseConnection();
                 }
                 catch(SQLException sql){
                     releaseConnection();
                     throw new EJBException("SQL Exception in storeMediaDetails:" + sql.getMessage());
                 }
                 catch(Exception e){
                     releaseConnection();
                     throw new EJBException("General Exception  in storeMediaDetails:" + e.getMessage());
                 }  
                 return editMediaStatus;
             }
             
             /**
              * @Method Name    :getMediaDetails.
              * @Description    :This method will retrieve media details.
              * @param          :mediaID.
              * @return         :ArrayList value.
              * @throws         :FinderException.
              */    
               public boolean getMediaStatus( String mediaID) throws FinderException{
                    Debug.print("MediaMasterBean ejbFindAll");
                    boolean mediaStatus = false;
                    makeConnection();
               	try {
                        String selectStatement = "select active_status from tblAdvMediaMaster where media_id = ?";
                        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                        prepStmt.setString(1, mediaID);
                        ResultSet rs = prepStmt.executeQuery();
                        while(rs.next()){
                        	mediaStatus = rs.getBoolean(1);
                            
                        }
                        rs.close();
                        prepStmt.close();
                        releaseConnection();
                    } 
                    catch(SQLException sql){
                        releaseConnection();
                        throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
                    }
                    catch(Exception e){
                        releaseConnection();
                        throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
                    }
                    return mediaStatus;
             }
  
               /**
                * @Method Name    :getMediaDetails.
                * @Description    :This method will retrieve media details.
                * @param          :mediaID.
                * @return         :ArrayList value.
                * @throws         :FinderException.
                */    
                 public ArrayList getMediaDetails( String mediaID) throws FinderException{
                      Debug.print("MediaMasterBean ejbFindAll");
                      ArrayList mediaListById = new ArrayList();
                      makeConnection();
                 	try {
                          String selectStatement = "select media_name, media_description, active_status from tblAdvMediaMaster where media_id = ?";
                          PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                          prepStmt.setString(1, mediaID);
                          ResultSet rs = prepStmt.executeQuery();
                          while(rs.next()){
                              String mediaName = rs.getString(1);
                              String mediaDescription = rs.getString(2);
                              String activeStatus = rs.getString(2);
                              String[] mediaList = {mediaName, mediaDescription, activeStatus};
                              mediaListById.add(mediaList);
                          }
                          rs.close();
                          prepStmt.close();
                          releaseConnection();
                      } 
                      catch(SQLException sql){
                          releaseConnection();
                          throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
                      }
                      catch(Exception e){
                          releaseConnection();
                          throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
                      }
                      return mediaListById;
               }          
 
                 /**
                  * @Method Name    :deleteRow.
                  * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                  * @param          :String mediaId.
                  * @return         :void value.
                  * @throws         :SQLException.
                  */     
                    public boolean deleteMedia(String mediaId) throws SQLException {
                         Debug.print("MediaMasterBean deleteRow");
                         boolean deleteMediaStatus = false;

                        makeConnection();
                        try{
                            String deleteStatement = "delete from tblAdvMediaMaster where media_id = ?";
                            PreparedStatement prepStmt = con.prepareStatement(deleteStatement);

                            prepStmt.setString(1, mediaId);
                            prepStmt.executeUpdate();
                            deleteMediaStatus = true;
                            prepStmt.close();
                            releaseConnection();
                        }
                        catch(SQLException sql){
                            releaseConnection();
                            throw new EJBException("SQL Exception in deleteRow:" + sql.getMessage());
                        }
                        catch(Exception e){
                            releaseConnection();
                            throw new EJBException("General Exception  in deleteRow:" + e.getMessage());
                        }   
                        return deleteMediaStatus;

                    }     
                
                    /**
                     * @Method Name    :insertRowDisplay.
                     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                     * @param          :Null.
                     * @return         :void  value.
                     * @throws         :SQLException ,MissingPrimaryKeyException.
                     */
                       public boolean createDisplayType(String txtDisplayType, String mediaDispId, String txtareaDisplayTypeDesc) throws SQLException{
                           Debug.print("DisplayTypeMasterBean insertRowMedia");
                           boolean createDisplayTypeStatus = false;
                           String displayTypeId = getNextDisplayId();
                           
                           makeConnection();
                           try{
                               String insertStatement =
                                   "insert into tblAdvDisplayTypeMaster (display_type_id, display_type_name, media_id, display_type_description) " +
                                    " values ( ? , ? , ? , ?)";
                               PreparedStatement prepStmt = con.prepareStatement(insertStatement);
                               prepStmt.setString(1, displayTypeId);
                               prepStmt.setString(2, txtDisplayType);
                               prepStmt.setString(3, mediaDispId);
                               prepStmt.setString(4, txtareaDisplayTypeDesc);
                               prepStmt.executeUpdate();
                               createDisplayTypeStatus = true;
                               prepStmt.close();
                               releaseConnection();
                           }
                           catch(SQLException sql){
                               releaseConnection();
                               throw new EJBException("SQL Exception in insertRowMedia:" + sql.getMessage());
                           }
                           catch(Exception e){
                               releaseConnection();
                               throw new EJBException("General Exception  in insertRowMedia:" + e.getMessage());
                           }   
                           return createDisplayTypeStatus;
                       }
                       
                       /**
                        * @Method Name    :getNextDisplayId.
                        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                        * @param          :String mediaId.
                        * @return         :String  value.
                        * @throws         :SQLException ,MissingPrimaryKeyException.
                        */
                          private String getNextDisplayId() throws SQLException {
                              Debug.print("DisplayTypeMasterBean getNextId");
                              makeConnection();
                              String nextId = null;
                              try{
                                  String selectStatement = "select newid() as planId";
                                  Debug.print("DisplayTypeMasterBean getNextId:" + selectStatement);
                                  PreparedStatement prepSelect = con.prepareStatement(selectStatement);
                                  ResultSet rs = prepSelect.executeQuery();
                                  rs.next();
                                  nextId = rs.getString(1);
                                  rs.close();
                                  prepSelect.close();
                                  releaseConnection();
                              }
                              catch(SQLException sql){
                                  releaseConnection();
                                  throw new EJBException("SQL Exception in getNextId:" + sql.getMessage());
                              }
                              catch(Exception e){
                                  releaseConnection();
                                  throw new EJBException("General Exception  in getNextId:" + e.getMessage());
                              }        
                              return nextId;
                          }

                          /**
                           * @Method Name    :ejbFindByAll.
                           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                           * @param          :Null.
                           * @return         :Collection  value.
                           * @throws         :FinderException.
                           */
                             public Collection FindByAllDispId() throws FinderException {
                                 Debug.print("DisplayTypeMasterBean ejbFindAll");
                                 Vector displayList = new Vector();
                                 makeConnection();
                            	try {
                                     String selectStatement = "select display_type_id from tblAdvDisplayTypeMaster order by add_date";
                                     PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                     ResultSet rs = prepStmt.executeQuery();
                                     while (rs.next()){
                                         displayList.addElement(rs.getString(1));
                                         Debug.print("Display Type ID In Find ALL:" + rs.getString(1));
                                     }
                                     rs.close();
                                     prepStmt.close();
                                     releaseConnection();
                                 } 
                                 catch(SQLException sql){
                                     releaseConnection();
                                     throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
                                 }
                                 catch(Exception e){
                                     releaseConnection();
                                     throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
                                 }
                                 return displayList;
                         }
/**
* @Method Name    :ejbFindByAll.
* @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
* * @param          :Null.
* @return         :Collection  value.
* @throws         :FinderException.
                              */
                                public ArrayList getAllDisplayDetails(String displayId) throws FinderException {
                                    Debug.print("DisplayTypeMasterBean ejbFindAll");
                                    ArrayList displayList = new ArrayList();
                                    makeConnection();
                               	try {
                                        String selectStatement = "select display_type_name, media_id, display_type_description, active_status from tblAdvDisplayTypeMaster where display_type_id=?";
                                        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                        prepStmt.setString(1, displayId);
                                        ResultSet rs = prepStmt.executeQuery();
                                        while (rs.next()){
                                        	String displayTypeName = rs.getString(1);
                                        	String mediaIdInDis = rs.getString(2);
                                            String displayTypeDescription = rs.getString(3);
                                            String activeStatus = rs.getString(4);
                                            String[] mediaList = {displayTypeName, mediaIdInDis, displayTypeDescription, activeStatus};
                                            displayList.add(mediaList);
                                            Debug.print("Display Type ID In Find ALL:" + rs.getString(1));
                                        }
                                        rs.close();
                                        prepStmt.close();
                                        releaseConnection();
                                    } 
                                    catch(SQLException sql){
                                        releaseConnection();
                                        throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
                                    }
                                    catch(Exception e){
                                        releaseConnection();
                                        throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
                                    }
                                    return displayList;
         }
                                /**
                                 * @Method Name    :ejbFindByMedia.
                                 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                                 * @param          :String mediaId.
                                 * @return         :Collection  value.
                                 * @throws         :FinderException.
                                 */
                                   public Collection FindByMedia(String mediaId) throws FinderException{
                                       Debug.print("DisplayTypeMasterBean ejbFindByMedia:" + mediaId);
                                       makeConnection();
                                       ArrayList displayList = new ArrayList();
                                  	try {
                                           String selectStatement = "select display_type_id from tblAdvDisplayTypeMaster where media_id = ?  order by display_type_name" ;
                                           PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                           Debug.print("DisplayTypeMasterBean findByDisplayTypeName:" + selectStatement);
                                           prepStmt.setString(1,mediaId);
                                           ResultSet rs = prepStmt.executeQuery();
                                           while (rs.next()){
                                               displayList.add(rs.getString(1));
                                           }
                                           rs.close();
                                           prepStmt.close();
                                           releaseConnection();
                                           Debug.print("DisplayTypeMasterBean in ejbFindByMedia:" + displayList);
                                       } 
                                       catch(SQLException sql){
                                           releaseConnection();
                                           throw new EJBException("SQL Exception in ejbFindByMedia:" + sql.getMessage());
                                       }
                                       catch(Exception e){
                                           releaseConnection();
                                           throw new EJBException("General Exception  in ejbFindByMedia:" + e.getMessage());
                                       }
                                       return displayList;
                               }
                                   
/**
* @Method Name    :deleteRow.
* * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
* @param          :String displayTypeId.
* * @return         :void  value.
* @throws         :SQLException.
*/
                                      
public boolean displayDeleteRow(String displayTypeId) throws SQLException {
	Debug.print("DisplayTypeMasterBean deleteRow");
	boolean dispDelStatus = false;
	makeConnection();
	try{
		String deleteStatement = "delete from tblAdvDisplayTypeMaster where display_type_id = ? ";
		PreparedStatement prepStmt = con.prepareStatement(deleteStatement);
		prepStmt.setString(1, displayTypeId);
		prepStmt.executeUpdate();
		dispDelStatus = true;
		prepStmt.close();
		releaseConnection();
		}
	catch(SQLException sql){
		releaseConnection();
		throw new EJBException("SQL Exception in deleteRow:" + sql.getMessage());
		}
	catch(Exception e){
		releaseConnection();
		throw new EJBException("General Exception  in deleteRow:" + e.getMessage());
		}     
	return dispDelStatus;
	}
/**
 * @Method Name    :storeDisplayDetails.
 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
 * @param          :Null.
 * @return         :void  value.
 * @throws         :SQLException.
 */
   public boolean editDisplayType(String displayId, String txtDisplayType, String mediaDispId, String txtareaDisplayTypeDesc) throws SQLException, FinderException {
       Debug.print("DisplayTypeMasterBean storeDisplayDetails");
       boolean dispStatus = this.getDisplayStatus(displayId);
       boolean editDispStatus = false;
       makeConnection();
       try{
           String updateStatement =
                   "update tblAdvDisplayTypeMaster set display_type_name = ? , media_id = ? , display_type_description = ? , active_status = ? " + 
                   " where display_type_id = ? ";

           PreparedStatement prepStmt = con.prepareStatement(updateStatement);

           prepStmt.setString(1, txtDisplayType);
           prepStmt.setString(2, mediaDispId);
           prepStmt.setString(3, txtareaDisplayTypeDesc);
           prepStmt.setBoolean(4, dispStatus);
           prepStmt.setString(5, displayId);
           int rowCount = prepStmt.executeUpdate();
           Debug.print("Sucessfully Updated." + rowCount);
           editDispStatus = true;
           prepStmt.close();
           releaseConnection();
       }
       catch(SQLException sql){
           releaseConnection();
           throw new EJBException("SQL Exception in storeDisplayDetails:" + sql.getMessage());
       }
       catch(Exception e){
           releaseConnection();
           throw new EJBException("General Exception  in storeDisplayDetails:" + e.getMessage());
       }  
       return editDispStatus;
   }
   
   /**
    * @Method Name    :getMediaDetails.
    * @Description    :This method will retrieve media details.
    * @param          :mediaID.
    * @return         :ArrayList value.
    * @throws         :FinderException.
    */    
     public boolean getDisplayStatus( String dispId) throws FinderException{
          Debug.print("MediaMasterBean ejbFindAll");
          boolean mediaStatus = false;
          makeConnection();
     	try {
              String selectStatement = "select active_status from tblAdvDisplayTypeMaster where display_type_id = ?";
              PreparedStatement prepStmt = con.prepareStatement(selectStatement);
              prepStmt.setString(1, dispId);
              ResultSet rs = prepStmt.executeQuery();
              while(rs.next()){
              	mediaStatus = rs.getBoolean(1);
                  
              }
              rs.close();
              prepStmt.close();
              releaseConnection();
          } 
          catch(SQLException sql){
              releaseConnection();
              throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
          }
          catch(Exception e){
              releaseConnection();
              throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
          }
          return mediaStatus;
   }
     /**
      * @Method Name    :ejbFindByAll.
      * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
      * @param          :Null.
      * @return         :Collection value.
      * @throws         :FinderException.
      */
        public Collection FindDimIdByAll() throws FinderException {
            Debug.print("DimensionDetailBean ejbFindAll");
            Vector dimList = new Vector();
            makeConnection();
       	try {
                String selectStatement = "select dimension_type_id from tblAdvDimensionTypeMaster";
                PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                ResultSet rs = prepStmt.executeQuery();
                while (rs.next()){
                    dimList.addElement(rs.getString(1));
                    Debug.print("Map Price In Find ALL:" + rs.getString(1));
                }
                rs.close();
                prepStmt.close();
                releaseConnection();
            } 
            catch(SQLException sql){
                releaseConnection();
                throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
            }
            catch(Exception e){
                releaseConnection();
                throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
            }
            return dimList;
    }
        public ArrayList getAllDimDetailsByDisId(String dimId) throws FinderException {
            Debug.print("DisplayTypeMasterBean ejbFindAll");
            ArrayList dimList = new ArrayList();
            makeConnection();
       	try {
                String selectStatement = "select dimension_type_id, dimension_type_name, active_status from tblAdvDimensionTypeMaster where dimension_type_id=?";
                PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                prepStmt.setString(1, dimId);
                ResultSet rs = prepStmt.executeQuery();
                while (rs.next()){
                	String dimensionTypeId = rs.getString(1);
                	String dimensionTypeName = rs.getString(2);
                    String dimStatus = rs.getString(3);
                    String[] dimension = {dimensionTypeId, dimensionTypeName, dimStatus};
                    dimList.add(dimension);
                    Debug.print("Display Type ID In Find ALL:" + rs.getString(1));
                }
                rs.close();
                prepStmt.close();
                releaseConnection();
            } 
            catch(SQLException sql){
                releaseConnection();
                throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
            }
            catch(Exception e){
                releaseConnection();
                throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
            }
       	return dimList;
       	}
        /**
         * @Method Name    :storeDimensionDetails.
         * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
         * @param          :Null.
         * @return         :void value.
         * @throws         :SQLException.
         */
           public boolean editDimensionDetails(String dimensionTypeId, String dimensionTypeName) throws SQLException, FinderException{
               Debug.print("DimensionBean storeDimensionDetails");
               boolean editDimStatus = false;
               boolean dimStatus = getDimStatus(dimensionTypeId);
               makeConnection();
               try{
                   String updateStatement =
                           "update tblAdvDimensionTypeMaster set dimension_type_name = ? , active_status = ? " + 
                           " where dimension_type_id = ? ";

                   PreparedStatement prepStmt = con.prepareStatement(updateStatement);

                   prepStmt.setString(1, dimensionTypeName);
                   prepStmt.setBoolean(2, dimStatus);
                   prepStmt.setString(3, dimensionTypeId);
                   int rowCount = prepStmt.executeUpdate();
                   Debug.print("Sucessfully Updated." + rowCount);
                   editDimStatus = true;
                   prepStmt.close();
                   releaseConnection();
               }
               catch(SQLException sql){
                   releaseConnection();
                   throw new EJBException("SQL Exception in storeDimensionDetails:" + sql.getMessage());
               }
               catch(Exception e){
                   releaseConnection();
                   throw new EJBException("General Exception  in storeDimensionDetails:" + e.getMessage());
               }  
               return editDimStatus;
           }
        
        /**
         * @Method Name    :ejbFindByMediaName.
         * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
         * @param          :String mediaName.
         * @return         :Collection value.
         * @throws         :FinderException.
         */     
           public String findByMediaName(String mediaName) throws FinderException{
               Debug.print("MediaMasterBean ejbFindByMediaName:" + mediaName);
               makeConnection();
               String mediaList = null;
          	try {
                   String selectStatement = "select media_id from tblAdvMediaMaster where media_name = ? " ;
                   PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                   Debug.print("MediaMasterBean ejbFindByMediaName:" + selectStatement);
                   prepStmt.setString(1,mediaName);
                   ResultSet rs = prepStmt.executeQuery();
                   while (rs.next()){
                       mediaList = rs.getString(1);
                   }
                   rs.close();
                   prepStmt.close();
                   releaseConnection();
                   Debug.print("MediaMasterBean in ejbFindByMediaName:" + mediaList);
               } 
               catch(SQLException sql){
                   releaseConnection();
                   throw new EJBException("SQL Exception in ejbFindByMediaName:" + sql.getMessage());
               }
               catch(Exception e){
                   releaseConnection();
                   throw new EJBException("General Exception  in ejbFindByMediaName:" + e.getMessage());
               }
               return mediaList;
               }
           
           
           /**
            * @Method Name    :ejbFindByEditMediaName.
            * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
            * @param          :String mediaId, String mediaName.
            * @return         :Collection value.
            * @throws         :FinderException.
            */     
               public String findByEditMediaName(String mediaId, String mediaName) throws FinderException{
                  Debug.print("MediaMasterBean ejbFindByEditMediaName:" + mediaName);
                  makeConnection();
                  String mediaList = null;
             	try {
                      String selectStatement = "select media_id from tblAdvMediaMaster where media_name = ? and media_id !=?" ;
                      PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                      Debug.print("MediaMasterBean ejbFindByEditMediaName:" + selectStatement);
                      prepStmt.setString(1,mediaName);
                      prepStmt.setString(2,mediaId);
                      ResultSet rs = prepStmt.executeQuery();
                      while (rs.next()){
                          mediaList = (rs.getString(1));
                      }
                      rs.close();
                      prepStmt.close();
                      releaseConnection();
                      Debug.print("MediaMasterBean in ejbFindByEditMediaName:" + mediaList);
                  } 
                  catch(SQLException sql){
                      releaseConnection();
                      throw new EJBException("SQL Exception in ejbFindByEditMediaName:" + sql.getMessage());
                  }
                  catch(Exception e){
                      releaseConnection();
                      throw new EJBException("General Exception  in ejbFindByEditMediaName:" + e.getMessage());
                  }
                  return mediaList;
          }
               public String findByPrimaryKey(String mediaId) throws FinderException {
                   Debug.print("MediaMasterBean ejbFindByPrimaryKey");

                   boolean result;

                   try {
                       result = selectMediaIdByPrimaryKey(mediaId);
                   } catch (Exception ex) {
                       throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
                   }

                   if (result) {
                       return mediaId;
                   } else {
                       throw new ObjectNotFoundException("Row for id " + mediaId + " not found.");
                   }
               }
                   
               /*********************** Database Routines *************************/
           /**
             * @Method Name    :selectByPrimaryKey.
             * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
             * @param          :String mediaId.
             * @return         :boolean value.
             * @throws         :SQLException.
             */
             private boolean selectMediaIdByPrimaryKey(String mediaId) throws SQLException {
                   Debug.print("MediaMasterBean selectByPrimaryKey:" + mediaId);
                   boolean result = false;          
                   makeConnection();
                   try {
                       String selectStatement = "SELECT media_id from tblAdvMediaMaster WHERE media_id = ?";
                       PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                       prepStmt.setString(1, mediaId);

                       ResultSet rs = prepStmt.executeQuery();
                       result = rs.next();
                       prepStmt.close();
                       releaseConnection();
                       Debug.print("MediaMasterBean selectByPrimaryKey" + result);
                   }
                   catch(SQLException sql){
                       releaseConnection();
                       throw new EJBException("SQL Exception in selectByPrimaryKey:" + sql.getMessage());
                   }
                   catch(Exception e){
                       releaseConnection();
                       throw new EJBException("General Exception  in selectByPrimaryKey:" + e.getMessage());
                   }
                    return result;
               }
             /**
              * @Method Name    :ejbFindByDisplayTypeName.
              * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
              * @param          :String displayTypeName.
              * @return         :Collection  value.
              * @throws         :FinderException.
              */
                public String findByDisplayTypeName(String displayTypeName) throws FinderException{
                    Debug.print("DisplayTypeMasterBean findByDisplayTypeName:" + displayTypeName);
                    makeConnection();
                    String displayList = null;
               	try {
                        String selectStatement = "select display_type_id from tblAdvDisplayTypeMaster where display_type_name = ?  order by display_type_name" ;
                        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                        Debug.print("DisplayTypeMasterBean findByDisplayTypeName:" + selectStatement);
                        prepStmt.setString(1,displayTypeName);
                        ResultSet rs = prepStmt.executeQuery();
                        while (rs.next()){
                            displayList = (rs.getString(1));
                        }
                        rs.close();
                        prepStmt.close();
                        releaseConnection();
                        Debug.print("DisplayTypeMasterBean in findByDisplayTypeName:" + displayList);
                    } 
                    catch(SQLException sql){
                        releaseConnection();
                        throw new EJBException("SQL Exception in findByDisplayTypeName:" + sql.getMessage());
                    }
                    catch(Exception e){
                        releaseConnection();
                        throw new EJBException("General Exception  in findByDisplayTypeName:" + e.getMessage());
                    }
                    return displayList;
                    }
                /**
                 * @Method Name    :ejbFindByDisplayTypeEditName.
                 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                 * @param          :String displayTypeId, String displayTypeName.
                 * @return         :Collection  value.
                 * @throws         :FinderException.
                 */
                    public String findByDisplayTypeEditName(String displayTypeId, String displayTypeName) throws FinderException{
                       Debug.print("DisplayTypeMasterBean ejbFindByDisplayTypeEditName:" + displayTypeName);
                       makeConnection();
                       String displayList = null;
                  	try {
                           String selectStatement = "select display_type_id from tblAdvDisplayTypeMaster where display_type_name = ?  and display_type_id !=? order by display_type_name" ;
                           PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                           Debug.print("DisplayTypeMasterBean findByDisplayTypeName:" + selectStatement);
                           prepStmt.setString(1,displayTypeName);
                           prepStmt.setString(2,displayTypeId);
                           ResultSet rs = prepStmt.executeQuery();
                           while (rs.next()){
                               displayList = (rs.getString(1));
                               Debug.print("DisplayTypeMasterBean in findByDisplayTypeName:" + displayList);
                           }
                           rs.close();
                           prepStmt.close();
                           releaseConnection();
                       } 
                       catch(SQLException sql){
                           releaseConnection();
                           throw new EJBException("SQL Exception in findByDisplayTypeName:" + sql.getMessage());
                       }
                       catch(Exception e){
                           releaseConnection();
                           throw new EJBException("General Exception  in findByDisplayTypeName:" + e.getMessage());
                       }
                       return displayList;
                       }
                    public String findDispIdByPrimaryKey(String displayTypeId) throws FinderException {
                        Debug.print("DisplayTypeMasterBean ejbFindByPrimaryKey");

                        boolean result;

                        try {
                            result = selectDispIdByPrimaryKey(displayTypeId);
                        } catch (Exception ex) {
                            throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
                        }

                        if (result) {
                            return displayTypeId;
                        } else {
                            throw new ObjectNotFoundException("Row for id " + displayTypeId + " not found.");
                        }
                        }
                    /**
                     * @Method Name    :selectByPrimaryKey.
                     * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                     * @param          :String displayTypeId.
                     * @return         :boolean  value.
                     * @throws         :SQLException.
                     */
                       private boolean selectDispIdByPrimaryKey(String displayTypeId) throws SQLException {
                           Debug.print("DisplayTypeMasterBean selectByPrimaryKey:" + displayTypeId);
                           boolean result = false;          
                           makeConnection();
                           try {
                               String selectStatement = "SELECT display_type_id from tblAdvDisplayTypeMaster WHERE display_type_id = ?";
                               PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                               prepStmt.setString(1, displayTypeId);

                               ResultSet rs = prepStmt.executeQuery();
                               result = rs.next();
                               prepStmt.close();
                               releaseConnection();
                               Debug.print("DisplayTypeMasterBean selectByPrimaryKey" + result);
                           }
                           catch(SQLException sql){
                               releaseConnection();
                               throw new EJBException("SQL Exception in selectByPrimaryKey:" + sql.getMessage());
                           }
                           catch(Exception e){
                               releaseConnection();
                               throw new EJBException("General Exception  in selectByPrimaryKey:" + e.getMessage());
                           }
                            return result;
                            }
                       /**
                        * @Method Name    :ejbFindByDimensionTypeName.
                        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                        * @param          :String dimensionTypeName.
                        * @return         :Collection value.
                        * @throws         :FinderException.
                        */
                          public String findByDimensionTypeName(String dimensionTypeName) throws FinderException{
                              Debug.print("DimensionBean ejbFindByDimensionTypeName:" + dimensionTypeName);
                              makeConnection();
                              String dimList = null;
                         	try {
                                  String selectStatement = "select dimension_type_id from tblAdvDimensionTypeMaster where dimension_type_name = ? order by dimension_type_name" ;
                                  PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                  Debug.print("DimensionBean ejbFindByDimensionTypeName:" + selectStatement);
                                  prepStmt.setString(1,dimensionTypeName);
                                  ResultSet rs = prepStmt.executeQuery();
                                  while (rs.next()){
                                      dimList = (rs.getString(1));
                                  }
                                  rs.close();
                                  prepStmt.close();
                                  releaseConnection();
                                  Debug.print("DimensionBean in ejbFindByDimensionTypeName:" + dimList);
                              } 
                              catch(SQLException sql){
                                  releaseConnection();
                                  throw new EJBException("SQL Exception in ejbFindByDimensionTypeName:" + sql.getMessage());
                              }
                              catch(Exception e){
                                  releaseConnection();
                                  throw new EJBException("General Exception  in ejbFindByDimensionTypeName:" + e.getMessage());
                              }
                         	return dimList;
                         	}
                          
                          /**
                           * @Method Name    :insertRowDimension.
                           * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                           * @param          :Null.
                           * @return         :void value.
                           * @throws         :SQLException, MissingPrimaryKeyException.
                           */
                             public boolean createDim(String dimensionTypeName) throws SQLException {
                                 Debug.print("DimensionBean insertRowDimension");
                                 boolean createDimStatus = false;
                                 String dimensionTypeId = getNextId();
                                 
                                 makeConnection();
                                 try{
                                     String insertStatement =
                                         "insert into tblAdvDimensionTypeMaster(dimension_type_id, dimension_type_name) " +
                                          " values ( ? , ?)";
                                     PreparedStatement prepStmt = con.prepareStatement(insertStatement);
                                     prepStmt.setString(1, dimensionTypeId);
                                     prepStmt.setString(2, dimensionTypeName);
                                     prepStmt.executeUpdate();
                                     createDimStatus = true;
                                     prepStmt.close();
                                     releaseConnection();
                                 }
                                 catch(SQLException sql){
                                     releaseConnection();
                                     throw new EJBException("SQL Exception in insertRowDimension:" + sql.getMessage());
                                 }
                                 catch(Exception e){
                                     releaseConnection();
                                     throw new EJBException("General Exception  in insertRowDimension:" + e.getMessage());
                                 }
                                 return createDimStatus;
                                 }
                             /**
                              * @Method Name    :ejbFindByDimensionEditTypeName.
                              * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                              * @param          :String dimensionTypeId,String dimensionTypeName.
                              * @return         :Collection value.
                              * @throws         :FinderException.
                              */
                                public String findByDimensionEditTypeName(String dimensionTypeId,String dimensionTypeName) throws FinderException{
                                    Debug.print("DimensionBean ejbFindByDimensionEditTypeName:" + dimensionTypeName);
                                    makeConnection();
                                    String dimList = null;
                               	try {
                                        String selectStatement = "select dimension_type_id from tblAdvDimensionTypeMaster where dimension_type_name = ? and dimension_type_id!= ? order by dimension_type_name " ;
                                        PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                        prepStmt.setString(1,dimensionTypeName);
                                        prepStmt.setString(2,dimensionTypeId);
                                        ResultSet rs = prepStmt.executeQuery();
                                        while (rs.next()){
                                            dimList = (rs.getString(1));
                                            Debug.print("DimensionBean ejbFindByDimensionEditTypeName already name exist:" + rs.getString(1));
                                        }
                                        rs.close();
                                        prepStmt.close();
                                        releaseConnection();
                                        Debug.print("DimensionBean in ejbFindByDimensionEditTypeName:" + dimList);
                                    } 
                                    catch(SQLException sql){
                                        releaseConnection();
                                        throw new EJBException("SQL Exception in ejbFindByDimensionEditTypeName:" + sql.getMessage());
                                    }
                                    catch(Exception e){
                                        releaseConnection();
                                        throw new EJBException("General Exception  in ejbFindByDimensionEditTypeName:" + e.getMessage());
                                    }
                                    return dimList;
                                    }
                                public String findDimExistByPrimaryKey(String dimensionTypeId) throws FinderException {
                                    Debug.print("DimensionBean ejbFindByPrimaryKey");

                                    boolean result;

                                    try {
                                        result = selectDimExistByPrimaryKey(dimensionTypeId);
                                    } catch (Exception ex) {
                                        throw new EJBException("ejbFindByPrimaryKey: " + ex.getMessage());
                                    }

                                    if (result) {
                                        return dimensionTypeId;
                                    } else {
                                        throw new ObjectNotFoundException("Row for id " + dimensionTypeId + " not found.");
                                    }
                                }
                                /**
                                 * @Method Name    :selectByPrimaryKey.
                                 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                                 * @param          :String dimensionTypeId.
                                 * @return         :boolean value.
                                 * @throws         :SQLException.
                                 */
                                 private boolean selectDimExistByPrimaryKey(String dimensionTypeId) throws SQLException {
                                       Debug.print("DimensionBean selectByPrimaryKey:" + dimensionTypeId);
                                       boolean result = false;          
                                       makeConnection();
                                       try {
                                           String selectStatement = "SELECT dimension_type_id from tblAdvDimensionTypeMaster WHERE dimension_type_id = ?";
                                           PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                           prepStmt.setString(1, dimensionTypeId);

                                           ResultSet rs = prepStmt.executeQuery();
                                           result = rs.next();
                                           prepStmt.close();
                                           releaseConnection();
                                           Debug.print("DimensionBean selectByPrimaryKey" + result);
                                       }
                                       catch(SQLException sql){
                                           releaseConnection();
                                           throw new EJBException("SQL Exception in selectByPrimaryKey:" + sql.getMessage());
                                       }
                                       catch(Exception e){
                                           releaseConnection();
                                           throw new EJBException("General Exception  in selectByPrimaryKey:" + e.getMessage());
                                       }
                                        return result;
                                   }
                                 /**
                                  * @Method Name    :getMediaDetails.
                                  * @Description    :This method will retrieve media details.
                                  * @param          :mediaID.
                                  * @return         :ArrayList value.
                                  * @throws         :FinderException.
                                  */    
                                   public boolean getDimStatus( String dimId) throws FinderException{
                                        Debug.print("MediaMasterBean ejbFindAll");
                                        boolean mediaStatus = false;
                                        makeConnection();
                                   	try {
                                            String selectStatement = "select active_status from tblAdvDimensionTypeMaster where dimension_type_id = ?";
                                            PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                            prepStmt.setString(1, dimId);
                                            ResultSet rs = prepStmt.executeQuery();
                                            while(rs.next()){
                                            	mediaStatus = rs.getBoolean(1);
                                                
                                            }
                                            rs.close();
                                            prepStmt.close();
                                            releaseConnection();
                                        } 
                                        catch(SQLException sql){
                                            releaseConnection();
                                            throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
                                        }
                                        catch(Exception e){
                                            releaseConnection();
                                            throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
                                        }
                                        return mediaStatus;
                                        }
                                   /**
                                    * @Method Name    :deleteRow.
                                    * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                                    * @param          :String dimensionTypeId.
                                    * @return         :void value.
                                    * @throws         :SQLException.
                                    */
                                      public boolean deleteDimRow(String dimensionTypeId) throws SQLException {
                                           Debug.print("DimensionBean deleteRow");
                                           boolean deleteDimRowStatus = false;

                                          makeConnection();
                                          try{
                                              String deleteStatement = "delete from tblAdvDimensionTypeMaster  where dimension_type_id = ? ";
                                              PreparedStatement prepStmt = con.prepareStatement(deleteStatement);

                                              prepStmt.setString(1, dimensionTypeId);
                                              prepStmt.executeUpdate();
                                              deleteDimRowStatus = true;
                                              prepStmt.close();
                                              releaseConnection();
                                          }
                                          catch(SQLException sql){
                                              releaseConnection();
                                              throw new EJBException("SQL Exception in deleteRow:" + sql.getMessage());
                                          }
                                          catch(Exception e){
                                              releaseConnection();
                                              throw new EJBException("General Exception  in deleteRow:" + e.getMessage());
                                          } 
                                          return deleteDimRowStatus;

}
                                      /**
                                       * @Method Name    :ejbFindByDisplayTypeId.
                                       * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                                       * @param          :String displayTypeId.
                                       * @return         :Collection value.
                                       * @throws         :FinderException.
                                       */
                                             public Collection findByDisplayTypeId(String displayTypeId) throws FinderException{
                                             Debug.print("DisplaySubTypeMasterBean ejbFindByDisplayTypeId:" + displayTypeId);
                                             makeConnection();
                                             ArrayList subTypeList = new ArrayList();
                                        	try {
                                                 String selectStatement = "select display_sub_type_id, display_sub_type_name, display_type_id, display_sub_type_description, active_status from tblAdvDisplaySubTypes where display_type_id = ? order by display_sub_type_name" ;
                                                 PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                                 Debug.print("DisplaySubTypeMasterBean ejbFindByDisplayTypeId:" + selectStatement);
                                                 prepStmt.setString(1,displayTypeId);
                                                 ResultSet rs = prepStmt.executeQuery();
                                                 while (rs.next()){
                                                	 String display_sub_type_id = rs.getString(1);
                                                 	String display_sub_type_name = rs.getString(2);
                                                     String display_type_id = rs.getString(3);
                                                     String display_sub_type_description = rs.getString(4);
                                                     String active_status = rs.getString(5);
                                                     String[] disTypes = {display_sub_type_id, display_sub_type_name, display_type_id, display_sub_type_description, active_status};
                                                     subTypeList.add(disTypes);
                                                 }
                                                 rs.close();
                                                 prepStmt.close();
                                                 releaseConnection();
                                                 Debug.print("DisplaySubTypeMasterBean in ejbFindByDisplayTypeId:" + subTypeList);
                                             } 
                                             catch(SQLException sql){
                                                 releaseConnection();
                                                 throw new EJBException("SQL Exception in ejbFindByDisplayTypeId:" + sql.getMessage());
                                             }
                                             catch(Exception e){
                                                 releaseConnection();
                                                 throw new EJBException("General Exception  in ejbFindByDisplayTypeId:" + e.getMessage());
                                             }
                                             return subTypeList;
                                     }
                                             /**
                                              * @Method Name    :deleteRow.
                                              * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                                              * @param          :String displaySubTypeId.
                                              * @return         :void value.
                                              * @throws         :SQLException.
                                              */ 
                                                public boolean dispSubdeleteRow(String displaySubTypeId) throws SQLException {
                                                     Debug.print("DisplaySubTypeMasterBean deleteRow");
                                                     boolean dispSubdeleteStatus = false;

                                                    makeConnection();
                                                    try{
                                                        String deleteStatement = "delete from tblAdvDisplaySubTypes  where display_sub_type_id = ? ";
                                                        PreparedStatement prepStmt = con.prepareStatement(deleteStatement);

                                                        prepStmt.setString(1, displaySubTypeId);
                                                        prepStmt.executeUpdate();
                                                        dispSubdeleteStatus = true;
                                                        prepStmt.close();
                                                        releaseConnection();
                                                    }
                                                    catch(SQLException sql){
                                                        releaseConnection();
                                                        throw new EJBException("SQL Exception in deleteRow:" + sql.getMessage());
                                                    }
                                                    catch(Exception e){
                                                        releaseConnection();
                                                        throw new EJBException("General Exception  in deleteRow:" + e.getMessage());
                                                    } 
                                                    return dispSubdeleteStatus;

                                                }
                                                /**
                                                 * @Method Name    :ejbFindByDisplaySubEditTypeName.
                                                 * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                                                 * @param          :String displaySubTypeId, String displaySubTypeName.
                                                 * @return         :Collection value.
                                                 * @throws         :FinderException.
                                                 */
                                                       public String findByDisplaySubEditTypeName(String displaySubTypeId, String displaySubTypeName) throws FinderException{
                                                           Debug.print("DisplaySubTypeMasterBean ejbFindByDisplaySubEditTypeName:" + displaySubTypeName);
                                                           makeConnection();
                                                           String subTypeList = null;
                                                           try {
                                                               String selectStatement = "select display_sub_type_id from tblAdvDisplaySubTypes where display_sub_type_name = ? and display_sub_type_id != ? order by display_sub_type_name" ;
                                                               PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                                               Debug.print("DisplaySubTypeMasterBean findByDisplaySubTypeName:" + selectStatement);
                                                               prepStmt.setString(1,displaySubTypeName);
                                                               prepStmt.setString(2,displaySubTypeId);
                                                               ResultSet rs = prepStmt.executeQuery();
                                                               while (rs.next()){
                                                                   subTypeList = rs.getString(1);
                                                               }
                                                               rs.close();
                                                               prepStmt.close();
                                                               releaseConnection();
                                                               Debug.print("DisplaySubTypeMasterBean in findByDisplaySubTypeName:" + subTypeList);
                                                           } 
                                                           catch(SQLException sql){
                                                               releaseConnection();
                                                               throw new EJBException("SQL Exception in findByDisplaySubTypeName:" + sql.getMessage());
                                                           }
                                                           catch(Exception e){
                                                               releaseConnection();
                                                               throw new EJBException("General Exception  in findByDisplaySubTypeName:" + e.getMessage());
                                                           }
                                                           return subTypeList;
                                                       }
                                                       /**
                                                        * @Method Name    :storeDisplaySubTypeDetails.
                                                        * @Description    :This method will create new privilege. If the Privilege Name already exist it will return.
                                                        * @param          :Null.
                                                        * @return         :void value.
                                                        * @throws         :SQLException.
                                                        */ 
                                                          public boolean editDisplaySubType(String displaySubTypeId, String displaySubTypeName , String displayTypeId, String displaySubTypeDescription) throws SQLException, FinderException {
                                                              Debug.print("DisplaySubTypeMasterBean storeDisplayDetails");
                                                              boolean activeStatus = getDispSubTypeStatus(displaySubTypeId);
                                                              boolean editDispStatus = false;
                                                              makeConnection();
                                                              try{
                                                                  String updateStatement =
                                                                          "update tblAdvDisplaySubTypes set display_sub_type_name = ? , display_type_id = ? , display_sub_type_description = ? , active_status = ? " + 
                                                                          " where display_sub_type_id = ? ";

                                                                  PreparedStatement prepStmt = con.prepareStatement(updateStatement);

                                                                  prepStmt.setString(1, displaySubTypeName);
                                                                  prepStmt.setString(2, displayTypeId);
                                                                  prepStmt.setString(3, displaySubTypeDescription);
                                                                  prepStmt.setBoolean(4, activeStatus);
                                                                  prepStmt.setString(5, displaySubTypeId);
                                                                  int rowCount = prepStmt.executeUpdate();
                                                                  Debug.print("Sucessfully Updated." + rowCount);
                                                                  editDispStatus = true;
                                                                  prepStmt.close();
                                                                  releaseConnection();
                                                              }
                                                              catch(SQLException sql){
                                                                  releaseConnection();
                                                                  throw new EJBException("SQL Exception in storeDisplayDetails:" + sql.getMessage());
                                                              }
                                                              catch(Exception e){
                                                                  releaseConnection();
                                                                  throw new EJBException("General Exception  in storeDisplayDetails:" + e.getMessage());
                                                              } 
                                                              return editDispStatus;
                                                          }
                                                          /**
                                                           * @Method Name    :getMediaDetails.
                                                           * @Description    :This method will retrieve media details.
                                                           * @param          :mediaID.
                                                           * @return         :ArrayList value.
                                                           * @throws         :FinderException.
                                                           */    
                                                            public boolean getDispSubTypeStatus( String displaySubTypeId) throws FinderException{
                                                                 Debug.print("MediaMasterBean ejbFindAll");
                                                                 boolean mediaStatus = false;
                                                                 makeConnection();
                                                            	try {
                                                                     String selectStatement = "select active_status from tblAdvDisplaySubTypes where display_sub_type_id = ?";
                                                                     PreparedStatement prepStmt = con.prepareStatement(selectStatement);
                                                                     prepStmt.setString(1, displaySubTypeId);
                                                                     ResultSet rs = prepStmt.executeQuery();
                                                                     while(rs.next()){
                                                                     	mediaStatus = rs.getBoolean(1);
                                                                         
                                                                     }
                                                                     rs.close();
                                                                     prepStmt.close();
                                                                     releaseConnection();
                                                                 } 
                                                                 catch(SQLException sql){
                                                                     releaseConnection();
                                                                     throw new EJBException("SQL Exception in ejbFindByAll:" + sql.getMessage());
                                                                 }
                                                                 catch(Exception e){
                                                                     releaseConnection();
                                                                     throw new EJBException("General Exception  in ejbFindByAll:" + e.getMessage());
                                                                 }
                                                                 return mediaStatus;
                                                                 }

                                   
 //=========================ICP======================================================
                                                            
public boolean addInstructorDetails(HLCInstructorDetails objInstDetail, HLCPaymentDetails objPayment) throws RemoteException{
 
boolean output=false;
boolean res1=false;
try{
	
	boolean res=insertRowInstructorDetails(objInstDetail);
	if (objPayment.getUserId() != null && (objPayment.getUserId().trim()).length() > 0){
		 res1= insertRowPayment(objPayment);
  }
	if(res==true && res1==true){
		output=true;
	}
} catch(Exception exp){
    throw new EJBException("create Instructor Details: " + exp.getMessage());
                 }
       return output;
     }                                                        
    
 
public boolean insertRowInstructorDetails(HLCInstructorDetails objInstDetail) throws SQLException {
    Debug.print("GeneralDBAction insertRowInstructorDetails");
    //java.sql.Date dt = java.sql.Date.valueOf(dob);
    long icp_ID = 0;
    makeConnection();
    try {
        icp_ID =getNextICPMeetingId();
       // this.useaAreaId = DBHelper.getAreaId(con,this.areaName);
    }catch (Exception e){
        e.printStackTrace();
    }
    String insertStatement = 
      "insert into tblMeeInstructorDetails (icp_meeting_id, assesment_level, assesment_date,usea_area_id,"+
      "location, instructor_id, host_member_id, shipping_type_id,assessor, facilities, land_owner_name, land_owner_business_name,"+
      "land_owner_address, land_owner_city,land_owner_state, land_owner_zip, land_owner_phone, land_owner_fax,land_owner_email,"+
      "approved_by, approved_date, posting_type, land_owner_country,no_of_days,payment_id)"+
            " values ( ? , ? , ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?) ";
    prepStmt = con.prepareStatement(insertStatement);
    Debug.print("Inside the Instructor Details ....\n\n ");
    prepStmt.setLong(1, icp_ID);
    Debug.print("icp_ID :  "+icp_ID);
    prepStmt.setString(2, objInstDetail.getAssesmentLevel());
    Debug.print("assesmentLevel :  "+objInstDetail.getAssesmentLevel());
    prepStmt.setDate(3, java.sql.Date.valueOf(objInstDetail.getAssesmentDate())); 
     Debug.print("assesment_date :  "+java.sql.Date.valueOf(objInstDetail.getAssesmentDate()));
    prepStmt.setString(4, objInstDetail.getUseaAreaId());
     Debug.print("useaAreaId :  "+objInstDetail.getUseaAreaId());
    prepStmt.setString(5, objInstDetail.getLocation());
    //Debug.print("location :  "+location);
    prepStmt.setString(6, objInstDetail.getInstructorId());
   // Debug.print("instructorId :  "+instructorId);
    prepStmt.setString(7, objInstDetail.getHostMemberId());
   // Debug.print("hostMemberId :  "+hostMemberId);
    prepStmt.setString(8, objInstDetail.getShippingTypeId());
   // Debug.print("shippingTypeId :  "+shippingTypeId);
    prepStmt.setString(9, objInstDetail.getAssessor());
   // Debug.print("assessor :  "+assessor);
    prepStmt.setString(10, objInstDetail.getFacilities());
    //Debug.print("facilities :  "+facilities);
    prepStmt.setString(11, objInstDetail.getLandOwnerName());
    // Debug.print("landOwnerName :  "+landOwnerName);
    prepStmt.setString(12, objInstDetail.getLandOwnerBusinessName());
   //  Debug.print("landOwnerBusinessName :  "+landOwnerBusinessName);
     prepStmt.setString(13, objInstDetail.getLandOwnerAddress());
    //  Debug.print("landOwnerAddress :  "+landOwnerAddress);
    prepStmt.setString(14, objInstDetail.getLandOwnerCity());
   // Debug.print("landOwnerCity :  "+landOwnerCity);
    prepStmt.setString(15, objInstDetail.getLandOwnerState());
   // Debug.print("landOwnerState :  "+landOwnerState);
    prepStmt.setString(16, objInstDetail.getLandOwnerZip());
  //  Debug.print("landOwnerZip :  "+landOwnerZip);
    prepStmt.setString(17, objInstDetail.getLandOwnerPhone());
   // Debug.print("landOwnerPhone :  "+landOwnerPhone);
     prepStmt.setString(18, objInstDetail.getLandOwnerFax());
     prepStmt.setString(19, objInstDetail.getLandOwnerEmail());
    prepStmt.setString(20, objInstDetail.getApprovedBy());
    if ( objInstDetail.getApprovedDate() != null){
        prepStmt.setDate(21, java.sql.Date.valueOf(objInstDetail.getApprovedDate()));
    }else {
        prepStmt.setDate(21, null);
    }
    Debug.print("approvedDate :  "+objInstDetail.getApprovedDate());
    prepStmt.setString(22, objInstDetail.getPostingType());
     prepStmt.setString(23, objInstDetail.getLandOwnerCountry());
     
    prepStmt.setInt(24, Integer.parseInt(objInstDetail.getNoOfDays()));
    Debug.print("noOfDays :  "+objInstDetail.getNoOfDays());
    prepStmt.setString(25,objInstDetail.getPaymentId());
    Debug.print("Payment Id : "+objInstDetail.getPaymentId());

    int cnt = prepStmt.executeUpdate();
    prepStmt.close();
    releaseConnection();
    System.out.println("Succefully inserted :  "+cnt);
	return true;
   
    }


public boolean insertRowPayment(HLCPaymentDetails objPayment) throws SQLException {
    Debug.print("GeneralDBAction insertRowPayment");

    makeConnection();
    String insertStatement = "insert into tblUserPaymentDetails (user_id,cc_name,cc_type, cc_number, cc_exp_month ," +
            " cc_exp_year, cc_cvvid, bank_name, check_date, check_number, amount, payment_date, payment_status,payment_id, check_name)" +
              " values ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?,?,? )";
    prepStmt = con.prepareStatement(insertStatement);

    prepStmt.setString(1, objPayment.getUserId());
    Debug.print(" User ID : "+objPayment.getUserId());
    prepStmt.setString(2, objPayment.getCcName());
    Debug.print(" getCcName : "+objPayment.getCcName());
    prepStmt.setString(3, objPayment.getCcType());
    Debug.print(" getCcType : "+objPayment.getCcName());
    prepStmt.setString(4, objPayment.getCcNumber());
     Debug.print(" getCcNumber : "+objPayment.getCcNumber());
    prepStmt.setInt(5, objPayment.getCcExpMonth());
    Debug.print(" getCcExpMonth : "+objPayment.getCcExpMonth());
    prepStmt.setInt(6, objPayment.getCcExpYear());
    Debug.print(" getCcExpYear : "+objPayment.getCcExpYear());
    prepStmt.setInt(7, objPayment.getCcCvvid());
    Debug.print(" getCcCvvid : "+objPayment.getCcCvvid());
    prepStmt.setString(8, objPayment.getBankName());
    Debug.print(" getBankName : "+objPayment.getBankName());
    Debug.print(" getCheckDate : "+objPayment.getCheckDate());
    String chdate = null;
    if (objPayment.getCheckDate() != null ){
        prepStmt.setDate(9, DBHelper.toSQLDate(objPayment.getCheckDate()));
    } else {
        prepStmt.setDate(9, null);
    }
    Debug.print(" getCheckDate : "+objPayment.getCheckDate());
    prepStmt.setString(10, objPayment.getCheckNumber());
     Debug.print(" getCheckNumber : "+objPayment.getCheckNumber());
    prepStmt.setDouble(11, objPayment.getAmount());
    Debug.print(" getAmount : "+objPayment.getAmount());
    prepStmt.setDate(12, DBHelper.toSQLDate(objPayment.getPaymentDate()));
    Debug.print(" getPaymentDate : "+objPayment.getPaymentDate());
    prepStmt.setString(13, objPayment.getPaymentStatus());
     Debug.print(" getPaymentStatus : "+objPayment.getPaymentStatus());
    prepStmt.setString(14,objPayment.getPaymentId());
    Debug.print("Payment Id : "+objPayment.getPaymentId());
    
    prepStmt.setString(15,objPayment.getCheckName());
    Debug.print("Payment getCheckName : "+objPayment.getCheckName());        
    
    int cnt = prepStmt.executeUpdate();
    prepStmt.close();
    releaseConnection();
    Debug.print("Successfully Inserted into HLCPaymentDetails......:"+cnt+"  USer ID: "+objPayment.getUserId());
	return true;
    }


public long getNextICPMeetingId() throws SQLException{
    Debug.print("DBHelper getNextICPMeetingId");
    return getNextICPId(con,"tblMeeInstructorDetails");
 }


public long getNextICPId(Connection con,String table)  throws SQLException {
    Debug.print("DBHelper getNextICPId");
    String selectStatement = "SELECT icp_meeting_id from " + table + " order by icp_meeting_id ASC ";
    PreparedStatement prepSelect = con.prepareStatement(selectStatement);
    ResultSet rs = prepSelect.executeQuery();
    long nextId = 0;
    while (rs.next()) {
         nextId = rs.getInt(1);
    }
    //long nextId = Long.valueOf(meetingId).longValue();
    if(nextId==0 ){
        nextId = 10000;
    }
    else{
        nextId = nextId+1;
    }
    rs.close();
    prepSelect.close();
    //meetingId = Long.toString(nextId);
    return nextId;
}

/*----------------------------------user sign up action-----------------------------------------------*/
public String insertsignup(String firstname,String lastname,String e_mail,String mobileno,String institution_name, String country, String state, String city, String credit_card_type, String credit_card_no, String cvv_no,String name_on_card, String expiry_date, String productPrice,String monthYear, String Productplan,String plan,String fee,String addrline1,String addrline2,String total_amount,String offer, String transactionId) throws RemoteException
{
String status=null;   
String comp_id=selectcompany_id();
String subscription_id=selectsubscription_id();
String order_id=selectorder_id();
String c=selectcustomer_id();
String customer_id=monthYear+c;

String username=null;

	if(firstname.length()>=4){
		username=firstname.substring(0, 4);						
	}
	else if(firstname.length()<4 && firstname.length()==3){
		username=firstname+'W';						
	}				

int countcmid=comp_id.length()-4;
username=username+"GK"+comp_id.substring(countcmid);
System.out.println("username---------------------------->" + username);
final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	java.util.Random  random=new java.util.Random();
	int len=8;							
	StringBuilder sb = new StringBuilder( len );
	   for( int i = 0; i < len; i++ ) {
	     		sb.append(AB.charAt(random.nextInt(AB.length())));	
	   }							  
String password=sb.toString();
System.out.println("password--------------->" + password);



try{


makeConnection(); 
String insertStmt=  "Insert into tblSignUpDetails(first_name,last_name,e_mail,mobile,institution_name,country,state,city,credit_card_type,credit_card_no,cvv_no,name_on_card,expiry_date,registration_id, product_price,subscription_id,order_id,customer_id,count,username,password,Productplan,subscription_plan,amount,addrline1,addrline2,total_amount,offer,transaction_id) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
  

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
  prepStmt.setString(14,comp_id);
  prepStmt.setString(15,productPrice);
  prepStmt.setString(16, subscription_id);
  prepStmt.setString(17, order_id);
  prepStmt.setString(18, customer_id);
  prepStmt.setString(19, c);
  prepStmt.setString(20, username);
  prepStmt.setString(21, password);
  prepStmt.setString(22, Productplan);
  prepStmt.setString(23, plan);
  prepStmt.setString(24, fee);
  prepStmt.setString(25, addrline1);
  prepStmt.setString(26, addrline2);
  prepStmt.setString(27, total_amount);
  prepStmt.setString(28, offer);
  prepStmt.setString(29, transactionId);
  
  
  int cnt= prepStmt.executeUpdate();
  if(cnt>0){
      
   status="Sucessfully signed up";  
    }
   prepStmt.close();
   System.out.println("status" + status);

} 
catch (SQLException sqe) {
  releaseConnection();
 sqe.printStackTrace();       
} finally {
  releaseConnection();
}
return status;

}

public String insertcontact(String name,String email,String phone,String message) throws RemoteException
{
String status=null;   



try{


makeConnection(); 
String insertStmt=  "Insert into tblContactUs(name,e_mail,phone,message) values (?,?,?,?)";
  

  prepStmt = con.prepareStatement(insertStmt);
  
  prepStmt.setString(1,name);
  prepStmt.setString(2,email);
  prepStmt.setString(3,phone);
  prepStmt.setString(4,message);
  
  
  int cnt= prepStmt.executeUpdate();
  if(cnt>0){
      
   status="Sucessfully inserted";  
    }
   prepStmt.close();
   System.out.println("status" + status);

} 
catch (SQLException sqe) {
  releaseConnection();
 sqe.printStackTrace();       
} finally {
  releaseConnection();
}
return status;

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

public String updateusersignup(String firstname,String lastname,String e_mail,String mobileno,String institutionName,String country,String state,String city,String credit_card_type,String credit_card_no,String  cvv_no,String  name_on_card,String  expiry_date,String  productPrice,String  monthYear,String Productplan,String plan,String fee,String addrline1,String addrline2,String total_amount,String offer,String transactionid) throws RemoteException
{
	String status=null;   
	String comp_id=selectcompany_id();
	String subscription_id=selectsubscription_id();
	String order_id=selectorder_id();
	String c=selectcustomer_id();
	String customer_id=monthYear+c;

	String username=null;

		if(firstname.length()>=4){
			username=firstname.substring(0, 4);						
		}
		else if(firstname.length()<4 && firstname.length()==3){
			username=firstname+'W';						
		}				

	int countcmid=comp_id.length()-4;
	username=username+"GK"+comp_id.substring(countcmid);
	System.out.println("username---------------------------->" + username);
	final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		java.util.Random  random=new java.util.Random();
		int len=8;							
		StringBuilder sb = new StringBuilder( len );
		   for( int i = 0; i < len; i++ ) {
		     		sb.append(AB.charAt(random.nextInt(AB.length())));	
		   }							  
	String password=sb.toString();
	System.out.println("password--------------->" + password);

  

try{

makeConnection(); 

String insertStmt=  "update tblSignUpDetails SET first_name = ?, last_name = ?, e_mail = ?, mobile = ?, institution_name = ?, country = ?, state = ?, city = ?, credit_card_type = ?, credit_card_no = ?, cvv_no = ?, name_on_card = ?, expiry_date = ?, registration_id = ?, product_price = ?, " +
		"subscription_id = ?,order_id = ?,customer_id = ?,count = ?,username = ?,password = ?,Productplan = ?,subscription_plan = ?,amount = ?,addrline1 = ?,addrline2 = ?,total_amount = ?,offer = ?,transaction_id = ? where e_mail = ? ";

  prepStmt = con.prepareStatement(insertStmt);
   
  prepStmt.setString(1,firstname);
  prepStmt.setString(2,lastname);
  prepStmt.setString(3, e_mail);
  prepStmt.setString(4,mobileno);
  prepStmt.setString(5,institutionName);
  prepStmt.setString(6,country);
  prepStmt.setString(7,state);
  prepStmt.setString(8,city);
  prepStmt.setString(9,credit_card_type);
  prepStmt.setString(10,credit_card_no);
  prepStmt.setString(11,cvv_no);
  prepStmt.setString(12, name_on_card);
  prepStmt.setString(13, expiry_date);
  prepStmt.setString(14,comp_id);
  prepStmt.setString(15,productPrice);
  prepStmt.setString(16, subscription_id);
  prepStmt.setString(17, order_id);
  prepStmt.setString(18, customer_id);
  prepStmt.setString(19, c);
  prepStmt.setString(20, username);
  prepStmt.setString(21, password);
  prepStmt.setString(22, Productplan);
  prepStmt.setString(23, plan);
  prepStmt.setString(24, fee);
  prepStmt.setString(25, addrline1);
  prepStmt.setString(26, addrline2);
  prepStmt.setString(27, total_amount);
  prepStmt.setString(28, offer);
  prepStmt.setString(29, transactionid);
  prepStmt.setString(30, e_mail);
 
  
  
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

//================================Shamili1==============================================//


public String getuserandpass(String e_mail)
{
	String user=null;
  
	 try {
		 makeConnection();         
            
         String selectStatement =  "select username, password from tblSignUpDetails where e_mail=?";
         
         prepStmt = con.prepareStatement(selectStatement);
         prepStmt.setString(1,e_mail);
         rs = prepStmt.executeQuery();
	         
	          while(rs.next()) {
	        	 String username = rs.getString(1);
	        	String password = rs.getString(2);
	        	
	        	user=username+"/"+password;	 	        	
	       	 	        	  
	          }
         prepStmt.close();
         rs.close();          
          } 
     catch (SQLException sqe) { releaseConnection(); } 
	 finally { releaseConnection(); }
	
	return user;
}


//===========================================End shamili1======================//
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

	public String updateprofile(String new_email,String username, String password,String e_mail,String institutionname) {
		
		System.out.println(" from inside database");	
	     System.out.println("username:"+username);
	     System.out.println("password:"+password);
	     System.out.println("e_mail:"+e_mail);
	     System.out.println("new_email:"+new_email);
	     String result=null;
	     try{
	      makeConnection(); 
	     String insertStmt=  "update tblSignUpDetails SET username = ?, password = ?, e_mail =?, institution_name=? where e_mail=?";
	      
	     prepStmt = con.prepareStatement(insertStmt);
	       
	        prepStmt.setString(1,username);
	        prepStmt.setString(2,password);
	        prepStmt.setString(3,e_mail);
	        prepStmt.setString(4,institutionname);
	        prepStmt.setString(5,new_email);            
	        
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
public ArrayList getcustomerDetails(String customerid){
    Debug.print("GeneralDBAction.getMappingDetailsForRoleAndPrivileges():");
    ArrayList roleEntityMapList = null;
    PreparedStatement prepStmt = null;
    ResultSet rs = null;
    makeConnection();
	try {
        String selectStatement=" SELECT first_name,last_name,e_mail,mobile,institution_name,country,state,city,credit_card_type,credit_card_no,cvv_no,name_on_card,expiry_date,registration_id,user_id,product_price,subscription_id,order_id,reg_date,Productplan,subscription_plan,amount,customer_id from tblSignUpDetails where customer_id=?";
     
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
            String customer_id=rs.getString(23);
            
            System.out.println("====Db details===="+first_name+country+customer_id);
            String[] customer_profile = {first_name,last_name,e_mail,mobile,institution_name,country,state,city,credit_card_type,credit_card_no,cvv_no,name_on_card,expiry_date,registration_id,user_id,product_price,subscription_id,order_id,reg_date,Productplan,subscription_plan,amount,customer_id};
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
	
	public ArrayList getAreaChairDetails(String status, int year, String memberId) throws SQLException {
        Debug.print("EventsDAO.getAreaChairDetails().. MemberId: " + memberId + "::Year:" + year + "::Status:" + status);
        if(status.equals("Pending")){
        	status="Approved";
        }
        
        PreparedStatement prepStmt = null;
        ArrayList eventRegList = new ArrayList();
        makeConnection();
        try {

            String sql = "select A.event_id, A.event_title,A.begin_date,A.end_date from tblOEProvisionalCalendar A, tblMeeMapAreaChair B where A.area_id = B.area_id " +
                    "and year(A.begin_date) = ? and B.area_chair_id = ? and area_chair_approval_status = ? ";

            prepStmt = con.prepareStatement(sql);
            //prepStmt.setString(1, status);
            prepStmt.setInt(1, year);
            prepStmt.setString(2, memberId);
            prepStmt.setString(3, status);
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
	
	public String getcouponcodedetailbycouponName(String coupon_code)  throws RemoteException
	{
		 
		String couponcode ="";
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
	       } catch(Exception e){
	    	   couponcode = null;
	            	  releaseConnection();
	              }
	   
	    return couponcode;
	}

	 public boolean insertPreMemRegi(String pay_event_title,String pay_userId1,String pay_start_date,String pay_end_date)
	    {
	    	System.out.println("Sucessfully pay_event_title id >----->: "+pay_event_title);
	        System.out.println("Sucessfully pay_userId1 : "+pay_userId1);
	        System.out.println("Sucessfully pay_start_date : "+pay_start_date);
	        System.out.println("Sucessfully pay_end_date : >----->"+pay_end_date);
	       
	    	boolean res=false;
	    	 
	    	// String statusId="118756d9-fb79-4304-8647-36f0d7579b45";
	    		    	  
	    		        try {
	    		        	makeConnection();
	    		        	 String str="insert into tblEventRegistrationDetails (event_title,user_id,start_date,end_date) values (?,?,?,?)";
	    				     				     
	    				        prepStmt = con.prepareStatement(str);
	    			            prepStmt.setString(1,pay_event_title);
	    			            prepStmt.setString(2,pay_userId1);
	    			            prepStmt.setString(3,pay_start_date);
	    			            prepStmt.setString(4,pay_end_date);
	    			           // prepStmt.setString(4,statusId);
	    			            
	    			            int count = prepStmt.executeUpdate();
	    			            
	    			            
	    			            System.out.println("Sucessfully inserted into tblPreMemberDetails : ");
	    			            if(count>=1){
	    			           	 res=true; 
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
	    		       
	    		    return res;
	    }
	 
	 public String getcouponoffer(String coupon)
	    {
	    	 
	    	String off=null;
			    
			    	  
			        try {
			        	makeConnection();
			        	 String str="SELECT coupon_offer FROM tblCouponDetails WHERE coupon_code=? and coupon_status='active'";
					     				     
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
	 
	 public void  updatecouponstatus(String couponcode)
	    {
	    	 
	    	String couponstatus="deactive";
			    
			    	  
			        try {
			        	makeConnection();
			        	 String str="update tblCouponDetails set coupon_status=? WHERE coupon_code=?";
					     				     
					        prepStmt = con.prepareStatement(str);
				            prepStmt.setString(1,couponstatus);
				            prepStmt.setString(2,couponcode);
				            
				            prepStmt.executeUpdate();
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
			       
			    
	    }
	 
	 
	 public ArrayList geteventregdetails() 
		{
			 
			 ArrayList useridlist = new ArrayList();	
				    
				        try {
				        	makeConnection();
				        	 String str="select eventpay_id,event_id,event_name from tblEventregfeeDetails";					     				     
				        	  prepStmt = con.prepareStatement(str);
						       
					            
					            rs = prepStmt.executeQuery();
					            while (rs.next()){
					            	String eventpay_id=rs.getString(1);
					            	String event_id=rs.getString(2);
					            	String event_name = rs.getString(3);
					            	
					            	
					                String userlist[] = {eventpay_id,event_id,event_name};
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
	 
	 public ArrayList geteventditdet(String eventid) 
	 {
	 	 
		 ArrayList useridlist = new ArrayList();	
			    
			        try {
			        	makeConnection();
			        	 String str="select eventpay_id,event_id,event_name from tblEventregfeeDetails where event_id=?";					     				     
			        	  prepStmt = con.prepareStatement(str);
			        	  
  			            prepStmt.setString(1,eventid);
				            
				            rs = prepStmt.executeQuery();
				            while (rs.next()){
				            	String eventpay_id=rs.getString(1);
				            	String event_id = rs.getString(2);
				            	String event_name=rs.getString(3);
				            	
				            	
				                String userlist[] = {eventpay_id,event_id,event_name};
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
	 public boolean getupdateeventdet(String event_id, String event_name,String event_amount) {
		    
	        Debug.print("DbAction.updatecoupondetail():");
	        PreparedStatement prepStmt = null;
	        makeConnection();
	        try {
	            String insertStatement = "update tblEventregfeeDetails set event_fees = ? where event_id = ? and event_name=?";
		
	                prepStmt = con.prepareStatement(insertStatement);
	                prepStmt.setString(1, event_amount);
	               
	                prepStmt.setString(2, event_id);
	                prepStmt.setString(3, event_name);
	                 
	             
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
	 public String geteventamount(String event_id) {
			
			 PreparedStatement prepstmt = null;
			 ResultSet rs = null;
			 makeConnection();
			 String evefees = "";
			 try{
				 String sqlQuery = "Select event_fees from tblEventregfeeDetails where event_id=?";
				 prepstmt = con.prepareStatement(sqlQuery);
				 prepstmt.setString(1, event_id);
				 rs = prepstmt.executeQuery();
				 rs.next();
				 evefees = rs.getString(1);
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
			 
			 return evefees;
			
		}
	 public ArrayList autoSearch(String term){
	  	  Debug.print("LMSBookMaintenanceDAO searchBook() ram ");	
	  	ArrayList auto = new ArrayList();    	
	  	try {
	  		
	          makeConnection();
	            
	          String selStmt="select institution_name from tblSignUpDetails where institution_name LIKE ?";
	          
	          prepStmt = con.prepareStatement(selStmt);
	          prepStmt.setString(1,"%"+term+"%");                         
	          rs = prepStmt.executeQuery();
	          
	          while(rs.next()) {
	          	
	          	String Title = rs.getString(1);
	          	//System.out.println("parasu >------>> "+Title);
	          	auto.add(Title);                  
	          }     
	        
	          rs.close();
	          prepStmt.close();
	        
	      } catch(SQLException sqe){
	      
	          Debug.print("Exception in LMSBookMaintenanceDAO searchBook() result:");
	          sqe.printStackTrace();
	      } finally {
	          releaseConnection();
	      }
	  	
	  	return auto;
	  }

	//------------------shamili------------------------//
		public ArrayList getallcompanyname() {
			ArrayList auto = new ArrayList();
			makeConnection();
		       try {
		    	 
		     	  String selectStmt="select distinct institution_name from tblSignUpDetails ";          	  
		           
		         System.out.println("==================="+selectStmt);
		           prepStmt = con.prepareStatement(selectStmt);
		          
		           rs=prepStmt.executeQuery();
		         
		           while(rs.next()) {
			          	
			          	String Company = rs.getString(1);
			          	System.out.println("getting data >------>> "+Company);
			          	auto.add(Company);                  
			          }     
			        
		           rs.close();
		           prepStmt.close();
		           releaseConnection();
		          
		    	  
		       } catch(SQLException sql){
		           releaseConnection();
		           System.out.println("SQL Exception in GeneralDBAction.getCouponStatusIndb():" + sql.getMessage());
		       } catch(Exception e){
		           releaseConnection();
		           System.out.println("General Exception  in GeneralDBAction.getCouponStatusIndb():" + e.getMessage());
		       }
		 	
			return auto;
		}

		public ArrayList getFullLoginDetailsByEmailId(String emailId) {
		     Debug.print("GeneralDBAction.getFullLoginDetailsByEmailId():");
		     PreparedStatement prepStmt = null;
		     ArrayList loginDet = new ArrayList();
		     makeConnection();
		     try {
		         String selectStatement = "SELECT login_name, first_name, last_name FROM  " + DBHelper.USEA_MMS_USERMASTER +
		                 "  WHERE  email_id = ?";
		         
		         prepStmt = con.prepareStatement(selectStatement);
		         prepStmt.setString(1, emailId);
		         
		         rs = prepStmt.executeQuery();
		         while (rs.next()) {
		             String loginName = rs.getString(1);
		             String firstName = rs.getString(2);
		             String lastName = rs.getString(3);
		             
		             String[] fullList = {loginName,firstName,lastName};
		             loginDet.add(fullList);
		         }
		         rs.close();
		         prepStmt.close();
		         releaseConnection();
		     } catch(SQLException sql){
		         releaseConnection();
		         Debug.print("SQL Exception in GeneralDBAction.getFullLoginDetailsByEmailId():" + sql.getMessage());
		     } catch(Exception e){
		         releaseConnection();
		         Debug.print("General Exception  in GeneralDBAction.getFullLoginDetailsByEmailId():" + e.getMessage());
		     }
		     return loginDet;
		 }
		
		
		/*
		 * Date: 27-09-2017
		Author: Amalesh R
		Purpose: NewsLetter Campaign
		*/
		
		public ArrayList<String> getNewsLetterEmail(){
		 	  System.out.println("GeneralDBAction: getNewsLetterEmail()");
		       ArrayList<String> groupList = new ArrayList();
		       PreparedStatement prepStmt = null;
		       ResultSet rs = null;
		       makeConnection();
		  	try {

		 String selectStatement = "select weekly_newsLetter_email from tblTempNewsLetter";
		               
		 prepStmt = con.prepareStatement(selectStatement);
		 rs = prepStmt.executeQuery();
		          
		           while(rs.next()){
		               String newsLetter_email = rs.getString(1);
		               groupList.add(newsLetter_email);
		           }
		           rs.close();
		           prepStmt.close();
		           releaseConnection();
		          
		       } 
		       catch(SQLException sql){
		           releaseConnection();
		           System.out.println("SQL Exception in GeneralDBAction.getNewsLetterEmail():" + sql.getMessage());
		       }
		       catch(Exception e){
		           releaseConnection();
		           e.printStackTrace();
		       }
		       return groupList;
		   }

		public String getNewsLettreStatus(Date sendDate) {
	        Debug.print("GeneralDBAction.getNewsLettreStatus():");
	        String newsLetterStatus = null;
	     
	        makeConnection();
	        try {
	            String selectStatement = " SELECT weekly_newsLetter_status from tblWeeklyNewsLetter where" +
	            		" date_to_sent = ?";
	            prepStmt = con.prepareStatement(selectStatement);
	            
	            prepStmt.setDate(1, toSQLDate(sendDate));
	            
	            rs = prepStmt.executeQuery();
	            if (rs.next()) {
	                newsLetterStatus = rs.getString(1);
	            }
	            rs.close();
	            prepStmt.close();
	            releaseConnection();
	            Debug.print("GeneralDBAction.getNewsLettreStatus():" + newsLetterStatus);
	        } catch (SQLException sql) {
	            releaseConnection();
	            Debug.print("SQL Exception in GeneralDBAction.getNewsLettreStatus():" + sql.getMessage());
	        } catch (Exception e) {
	            releaseConnection();
	            Debug.print("General Exception  in GeneralDBAction.getNewsLettreStatus():" + e.getMessage());
	        }
	        return newsLetterStatus;
	    }

		public String weeklyNewsLetterSendDate(Date sendDate) {
	    	
	    	String status=null;
	    	
	    	makeConnection();
	    	   	try {
	    	            String query = " insert into tblWeeklyNewsLetterSendDate(weekly_newsLetter_sendDate" +
	    	            		") values(?) " ;
	    	            System.out.println("insert query"+query);
	    	            prepStmt = con.prepareStatement(query);
	    	            
	    	            prepStmt.setDate(1,toSQLDate(sendDate)) ;
	    	          
	    	            int count= prepStmt.executeUpdate();
	    	            
	    	           if(count>0){	    	        	   
	    	        	   status="Weekly news letter date updated successfully";
	    	           }
	    	        	prepStmt.close();
	    	            releaseConnection();
	    	          
	    	        } 
	    	        catch(SQLException sql){
	    	            releaseConnection();
	    	            Debug.print("SQL Exception in GeneralDBAction.weeklyNewsLetterSendDate():" + sql.getMessage());
	    	        }
	    	        catch(Exception e){
	    	            releaseConnection();
	    	            Debug.print("General Exception  in GeneralDBAction.weeklyNewsLetterSendDate():" + e.getMessage());
	    	        }
	    	        return status;
	    	      
		
		}
	    
		public Date getWeeklyNewsLettreSendDate() {
	        Debug.print("GeneralDBAction.getWeeklyNewsLettreSendDate():");
	        Date newsLetterSendDate = null;
	     
	        makeConnection();
	        try {
	            String selectStatement = " SELECT weekly_newsLetter_sendDate from tblWeeklyNewsLetterSendDate";
	            prepStmt = con.prepareStatement(selectStatement);
	            
	            rs = prepStmt.executeQuery();
	            if (rs.next()) {
	                newsLetterSendDate = rs.getDate(1);
	            }
	            rs.close();
	            prepStmt.close();
	            releaseConnection();
	            Debug.print("GeneralDBAction.getWeeklyNewsLettreSendDate():" + newsLetterSendDate);
	        } catch (SQLException sql) {
	            releaseConnection();
	            Debug.print("SQL Exception in GeneralDBAction.getWeeklyNewsLettreSendDate():" + sql.getMessage());
	        } catch (Exception e) {
	            releaseConnection();
	            Debug.print("General Exception  in GeneralDBAction.getNewsLettreStatus():" + e.getMessage());
	        }
	        return newsLetterSendDate;
	    }
		
		public String insertWeeklyNewsLetter(String newsLetterPath, Date sendDate) {
	    	
	    	String status = null;
	    	
	    	makeConnection();
	    	   	try {
	    	            String query = " insert into tblWeeklyNewsLetter(weekly_newsLetter_path, date_to_sent" +
	    	            		") values(?,?) " ;
	    	            
	    	            System.out.println("insert query"+query);
	    	            prepStmt = con.prepareStatement(query);
	    	            
	    	            prepStmt.setString(1, newsLetterPath);
	    	            prepStmt.setDate(2,toSQLDate(sendDate)) ;
	    	          
	    	            int count= prepStmt.executeUpdate();
	    	            
	    	           if(count>0){	    	        	   
	    	        	   status="Weekly news letter inserted successfully";
	    	           }
	    	        	prepStmt.close();
	    	            releaseConnection();
	    	          
	    	        } 
	    	        catch(SQLException sql){
	    	            releaseConnection();
	    	            Debug.print("SQL Exception in GeneralDBAction.weeklyNewsLetterSendDate():" + sql.getMessage());
	    	        }
	    	        catch(Exception e){
	    	            releaseConnection();
	    	            Debug.print("General Exception  in GeneralDBAction.weeklyNewsLetterSendDate():" + e.getMessage());
	    	        }
	    	        return status;
	    	      
		}
	    

		
		public static Date addDays(Date date, int days){
			
			Calendar calendar = null;
			
			try{
				calendar = Calendar.getInstance();
				calendar.setTime(date);
				calendar.add(Calendar.DATE, days);
				date = calendar.getTime();			
			}catch(Exception e){
				e.printStackTrace();
			}		
			return date;
		}
		public static final java.sql.Date toSQLDate(java.util.Date inDate) {
	        return new java.sql.Date(inDate.getTime());
	    }	
		
		}
		


	//---------------shamili end-------------------------//
	  
	

	
	


