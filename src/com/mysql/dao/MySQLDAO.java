/*
 * MySQLDAO.java
 *
 * Created on October 15, 2006, 10:10 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mysql.dao;

import com.hlcform.util.HLCContactDetails;
import com.hlcform.util.HLCUserMaster;
import java.sql.Connection;
import com.hlccommon.util.Debug;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.*;

/**
 *
 * @author suresh
 */
public class MySQLDAO {
    private Connection con;
    public static final String HLC_MYSQL_CUTOMER = "customers ";
    public static final String HLC_MYSQL_ADDRESS_BOOK = "address_book "; 
    public static final String HLC_MYSQL_CUTOMER_INFO = "customers_info";
    public static final String HLC_MYSQL_COUNTRY = "countries"; 
    HLCUserMaster objUserMaster = new HLCUserMaster();
    HLCContactDetails objContact = new HLCContactDetails();
    SimpleDateFormat formatt = new SimpleDateFormat("MM/dd/yyyy");
    
    
    
    //=============================================Insert Customer Details=========================================      
    public boolean insertUserDetailToMqSQL(HLCUserMaster objUserMaster, HLCContactDetails objContact) {
            Debug.print("MySQLDAO.insertUserDetailToMqSQL():");
            boolean result = false;
            try {
                if(isUserExist(objUserMaster.getEmailId())== false){
                    String  cutomerId = insertUserDetails(objUserMaster, objContact);
                    String  addressId = insertContactDetails(cutomerId,objUserMaster, objContact);
                    if(cutomerId!=null && addressId!=null){
                        result = updateAddressId(cutomerId, addressId);
                    }
                }
            } 
            catch(Exception e){
                Debug.print("General Exception  in MySQLDAO.insertUserDetailToMqSQL():" + e.getMessage());
            }
            return result;
        }
 //=============================================Insert Customer Details=========================================      
    public boolean updateUserDetailToMqSQL(HLCUserMaster objUserMaster, HLCContactDetails objContact) {
            Debug.print("MySQLDAO.updateUserDetailToMqSQL():");
            boolean contactResult = false;
            try {
                boolean userResult = updateUserDetails(objUserMaster, objContact);
                if(userResult==true){
                    String cutomerId = selectCutomerId(objUserMaster.getEmailId());
                    Debug.print("MySQLDAO.updateUserDetailToMqSQL() Customer Id from cutomer Table:" + cutomerId);
                    if(cutomerId!=null & cutomerId.trim().length()!=0){
                        Debug.print("MySQLDAO.updateUserDetailToMqSQL(): update Started" + cutomerId);
                        contactResult = updateContactDetails(cutomerId, objUserMaster, objContact);
                    }
                }
            }
            catch(Exception e){
                Debug.print("General Exception  in MySQLDAO.updateUserDetailToMqSQL():" + e.getMessage());
            }
            return contactResult;
    }
    
     //=============================================Insert Customer Details=========================================      
    private boolean isUserExist(String emailId) {
        Debug.print("MySQLDAO.isUserExist():" + emailId);
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        boolean result = false;
        makeConnection();
   	try {
            String selectStatement = " SELECT  customers_id from " + HLC_MYSQL_CUTOMER + " where customers_email_address = ?"; 
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,emailId);
            rs = prepStmt.executeQuery();
            if(rs.next()){
                result =true;
            }
            rs.close();
            prepStmt.close();
            releaseConnection(con);
            Debug.print("MySQLDAO.isUserExist():" + result);
        } 
        catch(SQLException sql){
            releaseConnection(con);
            Debug.print("SQL Exception in MySQLDAO.isUserExist():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection(con);
            Debug.print("General Exception  in MySQLDAO.isUserExist():" + e.getMessage());
        }
        return result;
        }
    
   //=============================================Insert Customer Details=========================================      
    private String insertUserDetails(HLCUserMaster objUserMaster, HLCContactDetails objContact) {
            Debug.print("MySQLDAO.insertUserDetails():");
            PreparedStatement prepStmt = null;
            String cutomerId = "";
            makeConnection();
            try {
                String insertStatement = "insert into " + HLC_MYSQL_CUTOMER + " (customers_gender, customers_firstname , " +
                        "customers_lastname , customers_dob , customers_email_address, customers_default_address_id , " +
                        " customers_telephone , customers_fax , customers_password ) " +
                        " values( ? , ? , ? , ? , ? , ? , ? , ? , ? )";
                prepStmt = con.prepareStatement(insertStatement);
                prepStmt.setString(1, objUserMaster.getGender());
                prepStmt.setString(2, objUserMaster.getFirstName());
                prepStmt.setString(3, objUserMaster.getLastName());
                prepStmt.setString(4, objUserMaster.getDob());
                prepStmt.setString(5, objUserMaster.getEmailId());
                prepStmt.setString(6, "0");
                prepStmt.setString(7, objContact.getPhoneNo());
                prepStmt.setString(8, objContact.getFaxNo());
                prepStmt.setString(9, objUserMaster.getPassword());
                prepStmt.executeUpdate();
                prepStmt.close();
                releaseConnection(con);
            } 
            catch(SQLException sql){
                releaseConnection(con);
                Debug.print("SQL Exception in MySQLDAO.insertUserDetails():" + sql.getMessage());
            }
            catch(Exception e){
                releaseConnection(con);
                Debug.print("General Exception  in MySQLDAO.insertUserDetails():" + e.getMessage());
            }
            cutomerId = selectAutoIncrementId("customers_id", HLC_MYSQL_CUTOMER);
            Debug.print("MySQLDAO.insertUserDetails(): CutomerID:" + cutomerId);
            return cutomerId;
        }
 //=============================================Insert Customer Details=========================================      
    private String insertContactDetails(String cutomerId, HLCUserMaster objUserMaster, HLCContactDetails objContact) {
            Debug.print("MySQLDAO.insertContactDetails() cutomerId:" + cutomerId);
            PreparedStatement prepStmt = null;
            String addressId = "";
            String countryId = "";
            countryId = selectCountryId(objContact.getCountry());
            makeConnection();
            try {
                String insertStatement = "insert into " + HLC_MYSQL_ADDRESS_BOOK + " ( customers_id , entry_gender  , " +
                        " entry_company  , entry_firstname  , entry_lastname , entry_street_address , " +
                        " entry_postcode  , entry_city  , entry_state , entry_country_id ) " +
                        " values( ? , ? , ? , ? , ? , ? , ? , ? , ?, ? )";
                prepStmt = con.prepareStatement(insertStatement);
                prepStmt.setString(1, cutomerId);
                prepStmt.setString(2, objUserMaster.getGender());
                prepStmt.setString(3, objUserMaster.getFirstName() + objUserMaster.getLastName());
                prepStmt.setString(4, objUserMaster.getFirstName());
                prepStmt.setString(5, objUserMaster.getLastName());
                prepStmt.setString(6, objContact.getAddress1() + objContact.getAddress2());
                prepStmt.setString(7, objContact.getZip());
                prepStmt.setString(8, objContact.getCity());
                prepStmt.setString(9, objContact.getState());
                prepStmt.setString(10,countryId);
                prepStmt.executeUpdate();
                prepStmt.close();
                releaseConnection(con);
            } 
            catch(SQLException sql){
                releaseConnection(con);
                Debug.print("SQL Exception in MySQLDAO.insertContactDetails():" + sql.getMessage());
            }
            catch(Exception e){
                releaseConnection(con);
                Debug.print("General Exception  in MySQLDAO.insertContactDetails():" + e.getMessage());
            }
            addressId = selectAutoIncrementId("address_book_id", HLC_MYSQL_ADDRESS_BOOK);
            Debug.print("MySQLDAO.insertContactDetails(): AddressId:" + addressId);
            return addressId ;
        }
//=============================================update Customer Details=========================================      
    private boolean updateUserDetails(HLCUserMaster objUserMaster, HLCContactDetails objContact) {
            Debug.print("MySQLDAO.updateUserDetails():");
            PreparedStatement prepStmt = null;
            boolean result = false;
            if(objUserMaster.getEmailId()!=null){
                makeConnection();
                try {
                    String updateStatement = " update " + HLC_MYSQL_CUTOMER + " set customers_gender = ?, customers_firstname = ?, " +
                            "customers_lastname = ? , customers_dob = ? , " +
                            " customers_telephone = ? , customers_fax = ? where customers_email_address = ?";
                    prepStmt = con.prepareStatement(updateStatement);
                    prepStmt.setString(1, objUserMaster.getGender());
                    prepStmt.setString(2, objUserMaster.getFirstName());
                    prepStmt.setString(3, objUserMaster.getLastName());
                    prepStmt.setString(4, objUserMaster.getDob());
                    prepStmt.setString(5, objContact.getPhoneNo());
                    prepStmt.setString(6, objContact.getFaxNo());
                    prepStmt.setString(7, objUserMaster.getEmailId());
                    prepStmt.executeUpdate();
                    result = true;
                    prepStmt.close();
                    releaseConnection(con);
                } 
                catch(SQLException sql){
                    releaseConnection(con);
                    Debug.print("SQL Exception in MySQLDAO.updateUserDetails():" + sql.getMessage());
                }
                catch(Exception e){
                    releaseConnection(con);
                    Debug.print("General Exception  in MySQLDAO.updateUserDetails():" + e.getMessage());
                }
            }
            return result;
        }
 //=============================================Insert Customer Details=========================================      
    private boolean updateContactDetails(String cutomerId, HLCUserMaster objUserMaster, HLCContactDetails objContact) {
            Debug.print("MySQLDAO.updateContactDetails():");
            PreparedStatement prepStmt = null;
            boolean result = false;
            String countryId= "";
            countryId = selectCountryId(objContact.getCountry());
            makeConnection();
            try {
                String updateStatement = " update " + HLC_MYSQL_ADDRESS_BOOK + " set  entry_gender = ?  , " +
                        " entry_company = ? , entry_firstname = ? , entry_lastname = ? , entry_street_address = ?, " +
                        " entry_postcode =? , entry_city = ?, entry_state = ? , entry_country_id = ?  where  customers_id = ?";

                prepStmt = con.prepareStatement(updateStatement);
                prepStmt.setString(1, objUserMaster.getGender());
                prepStmt.setString(2, objUserMaster.getFirstName() + objUserMaster.getLastName());
                prepStmt.setString(3, objUserMaster.getFirstName());
                prepStmt.setString(4, objUserMaster.getLastName());
                prepStmt.setString(5, objContact.getAddress1() + objContact.getAddress2());
                prepStmt.setString(6, objContact.getZip());
                prepStmt.setString(7, objContact.getCity());
                prepStmt.setString(8, objContact.getState());
                prepStmt.setString(9, countryId);
                prepStmt.setString(10, cutomerId);
              
                prepStmt.executeUpdate();
                result = true;
                prepStmt.close();
                releaseConnection(con);
            } 
            catch(SQLException sql){
                releaseConnection(con);
                Debug.print("SQL Exception in MySQLDAO.updateContactDetails():" + sql.getMessage());
            }
            catch(Exception e){
                releaseConnection(con);
                Debug.print("General Exception  in MySQLDAO.updateContactDetails():" + e.getMessage());
            }
            return result;
        }
//=============================================update Customer Details=========================================      
    public boolean updateUserPassword(String cutomerId, String password) {
            Debug.print("MySQLDAO.updateUserPassword():");
            PreparedStatement prepStmt = null;
            boolean result = false;
            if(objUserMaster.getEmailId()!=null){
                makeConnection();
                try {
                    String updateStatement = " update " + HLC_MYSQL_CUTOMER + " set customers_password = ? " +
                            " where customers_id   = ?";
                    prepStmt = con.prepareStatement(updateStatement);
                    prepStmt.setString(1, cutomerId);
                    prepStmt.setString(2, password);
                    prepStmt.executeUpdate();
                    result = true;
                    prepStmt.close();
                    releaseConnection(con);
                } 
                catch(SQLException sql){
                    releaseConnection(con);
                    Debug.print("SQL Exception in MySQLDAO.updateUserPassword():" + sql.getMessage());
                }
                catch(Exception e){
                    releaseConnection(con);
                    Debug.print("General Exception  in MySQLDAO.updateUserPassword():" + e.getMessage());
                }
            }
            return result;
        }    
//============================================ Address Update  ===================================       
    private boolean updateAddressId(String cutomerId, String addressId){
        Debug.print("MySQLDAO.updateAddressId():" + cutomerId);
        boolean result = false;
        PreparedStatement prepStmt = null;
        makeConnection();
   	try {
            String selectStatement = "  update " + HLC_MYSQL_CUTOMER + " set customers_default_address_id = ?  where  customers_id  = ? " ;
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,addressId);
            prepStmt.setString(2,cutomerId);
            int intResult  = prepStmt.executeUpdate();
            if(intResult != 0){
                result = true;
            }
            prepStmt.close();
            releaseConnection(con);
            Debug.print("MySQLDAO.updateAddressId():" + result);
        }
        catch(SQLException sql){
            releaseConnection(con);
            Debug.print("SQL Exception in MySQLDAO.updateAddressId():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection(con);
            Debug.print("General Exception  in MySQLDAO.updateAddressId():" + e.getMessage());
        }
        return result;
    }

     //============================================ Getting Cutomer ID based on Email ID===================================       
    private String selectCutomerId(String emailId){
        Debug.print("MySQLDAO.selectCutomerId():" + emailId);
        String  cutomerId = "";
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
       // boolean result = statusChange(toUserId);
        makeConnection();
   	try {
            String selectStatement = " SELECT  customers_id from " + HLC_MYSQL_CUTOMER + " where customers_email_address = ?"; 
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,emailId);
            rs = prepStmt.executeQuery();
            if(rs.next()){
                cutomerId = rs.getString(1);
            }
            rs.close();
            prepStmt.close();
            releaseConnection(con);
            Debug.print("MySQLDAO.selectCutomerId():" + cutomerId);
        } 
        catch(SQLException sql){
            releaseConnection(con);
            Debug.print("SQL Exception in MySQLDAO.selectCutomerId():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection(con);
            Debug.print("General Exception  in MySQLDAO.selectCutomerId():" + e.getMessage());
        }
        return cutomerId;
    }
    
       //============================================ Getting Cutomer ID based on Email ID===================================       
    private String selectAutoIncrementId(String fieldName,String tableName){
        Debug.print("MySQLDAO.selectAutoIncrementId(): FieldName:" + fieldName);
        Debug.print("MySQLDAO.selectAutoIncrementId(): Table Name:" + tableName);
        String  cutomerId = "";
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
       // boolean result = statusChange(toUserId);
        makeConnection();
   	try {
            String selectStatement = " SELECT max(" + fieldName +  ") FROM " + tableName;

            prepStmt = con.prepareStatement(selectStatement);
            rs = prepStmt.executeQuery();
            if(rs.next()){
                cutomerId = rs.getString(1);
            }
            rs.close();
            prepStmt.close();
            releaseConnection(con);
            Debug.print("MySQLDAO.selectAutoIncrementId():" + cutomerId);
        } 
        catch(SQLException sql){
            releaseConnection(con);
            Debug.print("SQL Exception in MySQLDAO.selectAutoIncrementId():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection(con);
            Debug.print("General Exception  in MySQLDAO.selectAutoIncrementId():" + e.getMessage());
        }
        return cutomerId;
    }
    
    
    //============================================ Getting Cutomer ID based on Email ID===================================       
    private String selectAddressId(String fieldName, String fieldValue){
        Debug.print("MySQLDAO.selectAddressId():" + fieldValue);
        String  addressId = "";
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
       // boolean result = statusChange(toUserId);
        makeConnection();
   	try {
            String selectStatement = " SELECT  customers_default_address_id from " + HLC_MYSQL_CUTOMER + " where " + fieldName + "  = ?"; 
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,fieldValue);
            rs = prepStmt.executeQuery();
            if(rs.next()){
                addressId = rs.getString(1);
            }
            rs.close();
            prepStmt.close();
            releaseConnection(con);
            Debug.print("MySQLDAO.selectAddressId():" + addressId);
        } 
        catch(SQLException sql){
            releaseConnection(con);
            Debug.print("SQL Exception in MySQLDAO.selectAddressId():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection(con);
            Debug.print("General Exception  in MySQLDAO.selectAddressId():" + e.getMessage());
        }
        return addressId;
    }
 //============================================ Getting Cutomer ID based on Email ID===================================       
    private String selectCountryId(String countryName){
        Debug.print("MySQLDAO.selectAddressId():" + countryName);
        String  countryId = "";
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
       // boolean result = statusChange(toUserId);
        makeConnection();
   	try {
            String selectStatement = " SELECT  countries_id  from " + HLC_MYSQL_COUNTRY + " where countries_name  = ?"; 
            prepStmt = con.prepareStatement(selectStatement);
            prepStmt.setString(1,countryName);
            rs = prepStmt.executeQuery();
            if(rs.next()){
                countryId = rs.getString(1);
            }
            rs.close();
            prepStmt.close();
            releaseConnection(con);
            Debug.print("MySQLDAO.selectAddressId():" + countryId);
        } 
        catch(SQLException sql){
            releaseConnection(con);
            Debug.print("SQL Exception in MySQLDAO.selectAddressId():" + sql.getMessage());
        }
        catch(Exception e){
            releaseConnection(con);
            Debug.print("General Exception  in MySQLDAO.selectAddressId():" + e.getMessage());
        }
        return countryId;
    }
    
   //=============================================MySQL Database Connection details=========================================    
    private void makeConnection() {
        Debug.print("MySQLDAO : makeConnection");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/os_commerce","root","mY82uSeA");
        }
        catch (SQLException sqlExp) {
            Debug.print("MySQLDAO : Unable to connect to database. " + sqlExp.getMessage());
        }
        catch (Exception exp) {
            Debug.print("MySQLDAO : Exception while calling makeConnection. " + exp.getMessage());
        }
    }
     
    private void releaseConnection(Connection con) {
        Debug.print("MySQLDAO: releaseConnection");
        try {
            if(!con.isClosed()){
                con.close();
            }
        } 
        catch (SQLException sqlExp) {
            Debug.print("MySQLDAO: Unable to release Connection. " + sqlExp.getMessage());
        }
        catch (Exception ex) {
            Debug.print("MySQLDAO: Exception while releasing Connection: " + ex.getMessage());
        }
    }
    
    
}
