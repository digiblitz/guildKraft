<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.hlcmro.util.*"%>
<%@ page import="java.text.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmEvntOrgRenewal.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
<script language="JavaScript" src="js/calendar2.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
function onValidate(){
	if(document.myform.acStatus.value==""){
		alert("Select any Approval Status");
		document.myform.acStatus.focus();
		return false;
	}
	return true;
}
</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
						<%! 
						String  nullCheck(String fieldName){
							String retValue = "N/A";
								if(fieldName!=null && fieldName.trim().length()!=0){
								retValue = fieldName;
								}
							return retValue;
						}
						
						%>
						<%
						ArrayList listContact = (ArrayList)session.getAttribute("dynamicOrgDetails");
							
								String prefix1 = "";
								String first_name = "";
								String middle_name = "";
								String last_name = "";
								String sufix = "";
								String email_id = "";
								String suite = "";
								String address1 = "";
								String address2 = "";
								String city = "";
								String state = "";
								String country = "";
								String zip = "";
								String phone_no = "";
								String mobile_no = "";
								String fax_no = "";
								
								if(listContact !=null && listContact.size()!=0){
									Iterator it = listContact.iterator();
									while(it.hasNext()){
										prefix1 = (String)it.next();
										if(prefix1==null)
										prefix1 = "";
										first_name  = (String)it.next();
										if(first_name==null)
										first_name = "";
										middle_name  = (String)it.next();
										if(middle_name==null)
										middle_name = "";
										last_name = (String)it.next();
										if(last_name==null)
										last_name = "";
										sufix =  (String)it.next();
										if(sufix==null)
										sufix = "";
										email_id  = (String)it.next();
										if(email_id==null)
										email_id = "";
										suite =  (String)it.next();
										if(suite==null)
										suite = "";
										address1 =  (String)it.next();
										if(address1==null)
										address1 = "";
										address2 = (String)it.next();
										if(address2==null)
										address2 = "";
										city = (String)it.next();
										if(city==null)
										city = "";
										state =  (String)it.next();
										if(state==null)
										state = "";
										country = (String)it.next();
										if(country==null)
										country = "";
										zip = (String)it.next();
										if(zip==null)
										zip = "";
										phone_no = (String)it.next();
										if(phone_no==null)
										phone_no = "";
										mobile_no = (String)it.next();
										if(mobile_no==null)
										mobile_no = "";
										fax_no = (String)it.next();
										if(fax_no==null)
										fax_no = "";
									}
								}
						
						%>

 <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
			<div class="col-md-2 pad">
		
		<!--==============================include infobar Here=================================-->
		
            <%@ include file = "../../include/infobar.jsp" %>
			
		<!--==============================include infobar Here=================================-->
		
			</div>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Event Registration USEF Endorsed Competition/Management Application</h2>
                        </div>
                      
					<!--==============================Form Title=================================-->
					  <div class='panel-body'>
			                   <%
								SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
									HLCEndorsedFormVO	objEndorseDet = (HLCEndorsedFormVO)request.getAttribute("DisplayEndorsedDetails");
									String acStatus=objEndorseDet.getReqStatus();
								if(objEndorseDet==null){
									out.println("No records are available");
								}
								else{
								
								
								%>
	         	<p>USEF Endorsed Competition Details:</p>
				<div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getReqStatus())%></label>
											 </div>
										</div>
								 </div>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Competition:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCompName())%></label>
											 </div>
										</div>
								 </div>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location of Competition:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCompLocation())%></label>
											 </div>
										</div>
								 </div>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCompCountry())%></label>
											 </div>
										</div>
								 </div>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getStatName())%></label>
											 </div>
										</div>
								 </div>
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getStatName())%></label>
											 </div>
										</div>
								 </div>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCompCity())%></label>
											 </div>
										</div>
								 </div>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCompZip())%></label>
											 </div>
										</div>
								 </div>
			
			
											<%
											String compDate ="";
											if(objEndorseDet.getCompDate()!=null){
											compDate =sdf.format(objEndorseDet.getCompDate());
											}
											
											%>
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Competition:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=compDate%></label>
											 </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area Championship:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getAreaName())%></label>
											 </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>NO:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getOrgId())%></label>
											 </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Organizer & Contact:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=first_name%></label>
											 </div>
										</div>
								 </div>		
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=address1%></label>
											 </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=city%></label>
											 </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=state%></label>
											 </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=country%></label>
											 </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone Number:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=phone_no%></label>
											 </div>
										</div>
								 </div>	
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=email_id%></label>
											 </div>
										</div>
								 </div>		
			
		
				<p>USEF Competition Management Details:	</p>
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Competition Management:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_Name())%></label>
											 </div>
										</div>
								 </div>		
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address of principal place of business:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_Addrs())%></label>
											 </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_Country())%></label>
											 </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_State())%></label>
											 </div>
										</div>
								 </div>	
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_City())%></label>
											 </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_Zip())%></label>
											 </div>
										</div>
								 </div>		
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone Number::</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_Phone())%></label>
											 </div>
										</div>
								 </div>		
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax Number:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getCom_Mgt_Fax())%></label>
											 </div>
										</div>
								 </div>		
                 <p>Competition Manager/Organizer Information</p>
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Competition Manager/Organizer Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getMgr_Name())%></label>
											 </div>
										</div>
									</div>
										
										<%
										String memUsefNo =objEndorseDet.getManager_usef_memberId();
										if(memUsefNo==null){
										memUsefNo="Not Given";
										}
								
										%>
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>USEF Membership No.:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=memUsefNo%></label>
											 </div>
										</div>
									</div>				
		
									<%
									String memUseaNo =objEndorseDet.getManager_hlc_memberId();
									if(memUseaNo==null){
									memUseaNo="Not Given";
									}
							
									%>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership No.:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=memUseaNo%></label>
											 </div>
										</div>
									</div>			
			
			<p>Member Secretary Information **</p>
			<p>** A Secretary's information is only required if neither the Manager/Organizer nor Secretary is a USEF Senior Member.</p>
			             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Secretary Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(objEndorseDet.getSectryName())%></label>
											 </div>
										</div>
									</div>					
				
										<%
										String memNo =objEndorseDet.getSecretary_usef_memberId();
										if(memNo==null){
										memNo="Not Given";
										}
								
										%>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>USEF Membership No.:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=memNo%></label>
											 </div>
										</div>
									</div>					
						
			
										<%
											String paymentMode=objEndorseDet.getPaymentStatus();
											String transId=objEndorseDet.getSslTxnId();
											float CardAmount=objEndorseDet.getAmt();
											String ccNo=objEndorseDet.getCcNumber();
											int checkNo=objEndorseDet.getChkNumber();		
											//float checkAmt=objEndorseDet.getChkAmount();
											String bkName=objEndorseDet.getBankName();
											String ccN=objEndorseDet.getCcName();
											String ccType=objEndorseDet.getCcType();
											String ccNum=objEndorseDet.getCcNumber();
											int expMon=objEndorseDet.getCc_exp_Month();
											int expYr=objEndorseDet.getCc_exp_Year();
										
											String tempDt ="";
											if(objEndorseDet.getChkDt()!=null){
											tempDt =sdf.format(objEndorseDet.getChkDt());
											}
								
										if(paymentMode!=null && paymentMode.equalsIgnoreCase("card")){
														%>					 
			
				<p>Credit Card Payment Details:	</p>
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount ($) :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=CardAmount%></label>
											 </div>
										</div>
									</div>	
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>CC Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(ccN)%></label>
											 </div>
										</div>
									</div>	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CC Type:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(ccType)%></label>
											 </div>
										</div>
									</div>			
				                                            <%}
										                       else if(paymentMode!=null && paymentMode.equalsIgnoreCase("Check"))
														    	{ 
															    %>
				<p>Check Payment Details:	</p>
				              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Amount:</label>
                                    <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=CardAmount%></label>
											 </div>
										</div>
									</div>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=tempDt%></label>
											 </div>
										</div>
									</div>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Number:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=checkNo%></label>
											 </div>
										</div>
									</div>	
										<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=tempDt%></label>
											 </div>
										</div>
									</div>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=nullCheck(bkName)%></label>
											 </div>
										</div>
									</div>	
								</div>	
                           <%}%>
			 <form  class='form-horizontal' role='form' name="myform" id="myform" action="EventOrgRenewal.html" method="post" onsubmit="return onValidate();">
			  <input type="hidden" name="eventProcess" value="approveEndorse" />
			  <input type="hidden" name="eventId" value="<%=objEndorseDet.getEventId()%>" />
			  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approval Status:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <select name="acStatus" id="acStatus" class="form-control" >
											<option selected="selected" value="" >Select One</option>
												<%	String[] status = new String[]{"Approved","Pending","Rejected"};
													for(int k =0; k<status.length; k++){
														if(acStatus!=null && acStatus.equalsIgnoreCase(status[k])){
												%>
											<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
												<%}else{%>
											<option value="<%=status[k]%>"><%=status[k]%></option>
												<%}}%>
						                </select>
										</div>
									</div>
								</div>		
				
               <div class='form-group'>
					<div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-primary'  type="submit" name="submit" value="Submit">Submit</button>
					</div>
				</div>
		
		<%
		}
		%>
	
	
</form>
             <!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				
            </div>
			
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>
