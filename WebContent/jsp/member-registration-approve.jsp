<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.hlcform.util.HLCMemberDetails"%>
<%@ page import="com.hlccommon.util.HLCNonUseaOrgVO"%>
<%@ page import="com.hlcform.util.HLCPaymentDetails"%>
<%@ page import="com.hlccommon.util.HLCDonationDetailVO" %>
<%@ page import="com.hlcform.util.DBHelper" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script src="javascripts/frmMemRegiApprove.js" type="text/javascript"></script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
<!--<script src="javascripts/frmMembRegi.js" type="text/javascript" ></script>-->
<script language="javascript">
function showComments(divId){

		if(document.getElementById('mainPayNfs').checked == true){
			document.getElementById('admintxtArea').disabled = false;
			document.getElementById('usrtxtArea').disabled = false;		
		}
		else{
			document.getElementById('admintxtArea').disabled = true;
			document.getElementById('usrtxtArea').disabled = true;		
		}
}

function showSubComments(divId,Sz){
	var subpay="subpay"+Sz;
	var subusrtxtArea="subusrtxtArea"+Sz;
	var subadmintxtArea="subadmintxtArea"+Sz;
	var chkItem ="chkItem"+Sz;
	//alert(document.getElementById('subPaySz').value);
		if(document.getElementById(subpay).checked==true){
			document.getElementById(subusrtxtArea).disabled = false;
			document.getElementById(subadmintxtArea).disabled = false;
			document.getElementById(chkItem).value="avail";
			
		}
		else{
			document.getElementById(subusrtxtArea).disabled = true;
			document.getElementById(subadmintxtArea).disabled = true;
			document.getElementById(chkItem).value="notavail";
		}
}

</script>
</head>



</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

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
                            <h2>Membership: Membership Approval Form  </h2>
                        </div>
						<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
								 <%!SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
							SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
							
							String dateFormat(String fieldName){
								String dispDate = "N/A";
								if(fieldName!=null && fieldName.trim().length()!=0 && fieldName!="N/A"){
									Date clDate = null;
									Calendar cal = Calendar.getInstance();
									GregorianCalendar gc = new GregorianCalendar();
									try{
										clDate = sd.parse(fieldName);
									}catch(Exception e){
										System.out.println("Error While Parsing Date: "+e);
									}
									
									gc.setTime(clDate);
									cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
									
									if(clDate!=null ){
									dispDate = sd1.format(cal.getTime());
									}
								}
								return dispDate;
							}
  %>
       
                    <form class='form-horizontal' role='form' name="frmmemRegiApprove" id="frmmemRegiApprove" action="MemberRegiList.html" onsubmit="return myval();">
                      <!-- henu -->
                      <input type="hidden" name="memRegiListProcess" value="memRegiApprove"/>
                     
                
           <!--<img src="images/usea_logo.jpg" width="100" height="99" class="imgFloatLeft" />-->
                   
                    <p>You are viewing the Membership Details of a selected member.</p>
                  
                  <p>To Approve a membership and assign a status select one from the drop-down menu and submit it.</p>
              <% 
								//Henu..
                String usrtypname=request.getParameter("usrtypname");
                                 
				String str1 [] = new String [15];
				String str2 []  = new String [15];
				String str3 [] = new String [15];
				String[] regdat=new String [10];
				String[] expdat=new String [10];

						Vector memberTypeVect3=new Vector();
						memberTypeVect3=(Vector)request.getAttribute("userTypeVect3");
						System.out.println("memberTypeVect3:"+memberTypeVect3);
						System.out.println("memberTypeVect3: SIZE  "+memberTypeVect3.size());


						ArrayList familyAddOnId = (ArrayList)request.getAttribute("familyAddOnId");
																																																																															                        session.setAttribute("familyAddOnId",familyAddOnId);

				 if (  memberTypeVect3.elementAt(0) != null && memberTypeVect3.size() !=0)
				  {
						   str1   = (String[]) memberTypeVect3.elementAt(0);
				  }	   
				  if (memberTypeVect3.size() == 2 ) 
				  {
					 if (memberTypeVect3.elementAt(1) != null) 
					 {
							   str2   = (String[]) memberTypeVect3.elementAt(1);
					 }
				  }
				  if (memberTypeVect3.size() == 3) 
				  {
					  if (memberTypeVect3.elementAt(2) != null) 
					  {
							str2   = (String[]) memberTypeVect3.elementAt(1);
							str3  = (String[]) memberTypeVect3.elementAt(2);

							regdat=str1[6].split(" ");
							expdat=str1[7].split(" ");
					  }
				  }

	
		     			String finalDate="";
		 	            String dispFinalDate="N/A";
			 
		 				java.util.Calendar c5 = java.util.Calendar.getInstance();
    					int day = c5.get(Calendar.DATE);
						int month1 = c5.get(Calendar.MONTH);
						
						int month=month1+1;
						int year = c5.get(Calendar.YEAR);
						String date="";
						String chkDat="";
						
						if(month<10)
						{
							date = year+"-"+"0"+month+"-"+day;
							System.out.print("inside if(month1<10) ");
							chkDat = "0"+month+"/"+day+"/"+year;
						}
						else
						{
						date = year+"-"+month+"-"+day;
						chkDat = month+"/"+day+"/"+year;
						}
		 
		    Date appDate = new Date();
		    appDate = (Date)request.getAttribute("approvalDate");
			if(appDate==null){
			finalDate = chkDat;
			System.out.println("Final Date : "+finalDate);
			}
			else{
			java.sql.Date dt=DBHelper.toSQLDate(appDate);
			String tmpDat="";
			tmpDat=dt.toString();
			String ttDay[]=tmpDat.split("-");
			finalDate = ttDay[1]+"/"+ttDay[2]+"/"+ttDay[0];
			System.out.print("finalDate :"+finalDate);
			dispFinalDate = tmpDat;
			
			}
						
	%>
	
	       
              <input type="hidden" name="usrtypname" value="<%=usrtypname%>" />
			  
			  <p>Basic Information: </p>
			  <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=str2[2]%></label>
											 </div>
										</div>
									</div>		 
            
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=str2[4]%></label>
											 </div>
										</div>
									</div>		
               
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=str2[8]%></label>
											 </div>
										</div>
									</div>		
               
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'>Human</label>
											 </div>
										</div>
									</div>		
											 
										
									  <%
														String pmob;
						
														if(str3[9]!=null && str3[9].trim().length()!=0)
														{
															pmob=str3[9];
														}
														else
														{
															pmob="N/A";
														}
						
														String pph;
						
														if(str3[8]!=null && str3[8].trim().length()!=0)
														{
															pph=str3[8];
														}
														else
														{
															pph="N/A";
														}
						
														%>
								     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=pmob%></label>
											 </div>
										</div>
									</div>	
														%>
								     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=pph%></label>
											 </div>
										</div>
									</div>	
							</div>		
				<div class='form-group'>												
                   <label class='control-label label1'>Membership Information </label>  
			   </div>
			   	<div class='form-group'>
				                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=str1[0]%></label>
											 </div>
										</div>
									</div>	
             
             
                <input name="memberId" id="memberId" type="hidden" value="<%=str1[0]%>" />
                <%
                    session.setAttribute("status_membId",str1[0]);
                %>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=str1[12]%></label>
											 </div>
										</div>
									</div>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Current Membership Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=str1[11]%></label>
											 </div>
										</div>
									</div>	
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Registration Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=dateFormat(regdat[0])%></label>
											 </div>
										</div>
									</div>	
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Activation Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=dateFormat(dispFinalDate)%></label>
											 </div>
										</div>
									</div>	
                                  
            
              
											  <%
									  if(!str1[12].equalsIgnoreCase("Life Member"))
									  {%>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Expiry Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=dateFormat(expdat[0])%></label>
											 </div>
										</div>
									</div>	
			
											  <%}
									
									  String mailaddr="";
									  if(str1[10]!=null){
									  mailaddr =str1[10];
									  }
									  else{
									  mailaddr="NA";
									  }
									  %>
											  <%
									   HLCMemberDetails objMember = new HLCMemberDetails();
									   objMember=(HLCMemberDetails)request.getAttribute("objMember");
									  
									  if(str1[12].equalsIgnoreCase("Life Member") || str1[12].equalsIgnoreCase("Full Member"))
									  {
									 
									  int addon=0;
									  if(objMember.getFamilyAddOn()!=null)
									  {
										 addon =objMember.getFamilyAddOn().size();
										 %>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Family Add on:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=addon%></label>
											 </div>
										</div>
									</div>
            
                                                            <% 
															  String[] familyAddOnId1 = new String[2];
															  String famMid="";
															  String famUid="";
															  
													if(familyAddOnId !=null && familyAddOnId.size()!=0){
													
															Iterator it = familyAddOnId.iterator();
															while(it.hasNext()){
																familyAddOnId1 = (String[])it.next();
																famMid=familyAddOnId1[0];
																famUid=familyAddOnId1[1];
																
																System.out.print("famMid :"+famMid);
																System.out.print("famUid :"+famUid);
																																
													 %>
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Family member ID :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <a href="MembershipReg.html?process=familyView&amp;familyAddOnId1=<%=famMid%>&amp;userId=<%=famUid%>" target="_blank"><%=famMid%></a>                                            </div>
										</div>
									</div>	
			
										  <%}}}}%>
										  <%
								   if(str1[12].equalsIgnoreCase("Family Member"))
								   {
								  String parentId="";
								  if(str1[3]!=null){
								  parentId =str1[3];
								  }
								  else
								  {
									parentId="NA";
								  }%>
	                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Parent MemberID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=parentId%></label>
											 </div>
										</div>
									</div>
								</div>	
										  <%}
								  %>
              <div class='form-group'>												
                   <label class='control-label label1'>Non Membership Information </label>  
			   </div>
                 
                                                       <%
															 ArrayList nonhlc=new ArrayList();
															 ArrayList donSelect=new ArrayList();
																	 
															nonhlc=(ArrayList)request.getAttribute("nonhlc");
															donSelect=(ArrayList)request.getAttribute("donSelect");
															
															if(nonhlc!=null)
															{
																System.out.println("nonhlc.size() :"+nonhlc.size());
																HLCNonUseaOrgVO onjNonUsea = new HLCNonUseaOrgVO();
																
																if(nonhlc.size() == 0)
																{%>
                                  <p id="p_error">No Non Organization details available for this Member!!</p>
                
                <%}
																
																for(int t=0;t<nonhlc.size();t++)
																{		
																		onjNonUsea=(HLCNonUseaOrgVO)nonhlc.get(t);
															%>
															
                	<div class='form-group'>
				                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non HLC Organization Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=onjNonUsea.getNonuseaOrgName()%></label>
											 </div>
										</div>
									</div>	
             
                 
                                                             <%
																  	String nonMemId="";
																	
																	if(onjNonUsea.getNonuseaMemberId()!=null)
																	{
																		nonMemId=onjNonUsea.getNonuseaMemberId();
																	}
																	else
																	{
																		nonMemId="NA";
																	}		
																														  
																  %>
                                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non HLC MemberID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=nonMemId%></label>
											 </div>
										</div>
									</div>	
							</div>		
									
             
                 
                                                              <%}}else
																  {%>
                                       <p id="p_error">No Non Organization details available !! </p>
                
                                                                <%}
																  
						
																  %>
              <div class='form-group'>												
                   <label class='control-label label1'>Donation Information </label>  
			   </div>
																																																 
																																																 
																																																				<%
																																																																														   String userID="";
																																																				userID=(String)request.getAttribute("userId");
																																																																																			System.out.println("userId in jsp :"+userID);
																																																																																								
																																																																				if(donSelect!=null)
																																																																				{
																																																																					System.out.println("donSelect.size() :"+donSelect.size());
																																																																					
																																																																					HLCDonationDetailVO onjDon = new HLCDonationDetailVO();
																																																																					
																																																																					if(donSelect.size() == 0)
																																																																					{%>
																																																                        <p id="p_error">No donation details available for this member!!</p>
               
                <%}
																					
									
									for(int u=0;u<donSelect.size();u++)
									{		
										onjDon=(HLCDonationDetailVO)donSelect.get(u);	
									String[] tmp=onjDon.getMemberDonationDate().split(" ");
								%>
								<div class='form-group'>
				                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donated On:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=dateFormat(tmp[0])%></label>
											 </div>
										</div>
									</div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donation Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=onjDon.getDonationName()%></label>
											 </div>
										</div>
									</div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donation Amount:($) </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=onjDon.getDonationPrice()%></label>
											 </div>
										</div>
									</div>

                
							                                              <%
																			 String donBy="N/A";
																			 
																			 if(onjDon.getDonatedBy()!=null)
																			 {
																				donBy=onjDon.getDonatedBy();
																			 }
																			 
																			%>
							      <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donated By </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=donBy%></label>
											 </div>
										</div>
									</div>
								</div>	
                 
											<%}}else
																							  {%>
                                <p id="p_error">No Donation Details Available for this Member!!</p>
                
											<%}%>
                													  %>
              <div class='form-group'>												
                   <label class='control-label label1'>Amateur Rider Information </label>  
			   </div>
					

									 <%
										String AmateurName="";
										String AmateurDec1="";
										String AmateurDec2="";
										
										boolean isAmateurDec2;
										boolean isAmateurDec1;  
										
										if(objMember.getAmateurName() !=null)
										{
											AmateurName=objMember.getAmateurName();
										}
										else
										{
											AmateurName="NA";
										}
																		
											isAmateurDec1=objMember.isAmateurDec1();
											
											if(isAmateurDec1 == true)
											{
												AmateurDec1="Yes";
											}
											else
											{
												 AmateurDec1="No";   
											}
											
											
											
										   isAmateurDec2=objMember.isAmateurDec2();
											
											if(isAmateurDec2 == true)
											{
												AmateurDec2="Yes";
											}
											else
											{
												 AmateurDec2="No";   
											}
										 
										 System.out.println("AmateurName :"+AmateurName); 
										 System.out.println("AmateurDec1 :"+isAmateurDec1);  
										 System.out.println("AmateurDec2 :"+isAmateurDec1);  
											
													
                                     %>
							<div class='form-group'>
				                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=AmateurName%></label>
											 </div>
										</div>
									</div> 
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Possession of a current USEF Amateur Card ?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=AmateurDec1%></label>
											 </div>
										</div>
									</div> 
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Declaration serves as my affidavit for Amateur Status Eligibility ? </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=AmateurDec2%></label>
											 </div>
										</div>
									</div> 
								</div>	
                
               
                <input type="hidden" name="userId" value="<%=userID%>" />
                <div class='form-group'>												
                   <label class='control-label label1'>Main Payment Information: </label>  
			   </div>
					
                 
                                                              <%
																 HLCPaymentDetails objPayment = new HLCPaymentDetails();
																 
																 objPayment=(HLCPaymentDetails)request.getAttribute("objPayment");
																 System.out.println("objPayment jsp :"+objPayment.toString());
																 
																 String[] serviceType = (String[])request.getAttribute("serviceType");
																 
																 String chkAmt="";
                                                                 String pendingAmt="";   
													 		     String mainStat = "notavail";                                                             
																 if(objPayment != null)
																 {
																 
																if(objPayment.getPaymentStatus()!=null)
																{
																if(objPayment.getPaymentStatus().equalsIgnoreCase("card"))
																{
																String ccTyp="N/A";
																String ccNam="N/A";
																String ccNo="N/A";
																
																if(objPayment.getCcType()!=null)
															   {
																  ccTyp=objPayment.getCcType();
															   }
																
																 if(objPayment.getCcName()!=null)
															   {
																  ccNam=objPayment.getCcName();
															   }
																
																  if(objPayment.getCcNumber()!=null)
															   {
																  ccNo=objPayment.getCcNumber();
															   }                                                                                                                                                                                                                                                                       
																 
																String txId="N/A";
																
																if(objPayment.getSslTxnId()!=null)
																{	
																	txId=objPayment.getSslTxnId();
																}
																
                                                             %>
								  <div class='form-group'>								 
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getPaymentStatus()%></label>
											 </div>
										</div>
									</div>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=ccTyp%></label>
											 </div>
										</div>
									</div> 			 							 
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=ccNam%></label>
											 </div>
										</div>
									</div> 	
                
               
                                                              <!--<tr>
																	<td class="tableLeft">Card No: </td>
																	<th class="tableRight"><%=ccNo%></th>
																  </tr>	-->
										<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=txId%></label>
											 </div>
										</div>
									</div> 	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayment.getPaymentDate())%></label>
											 </div>
										</div>
									</div> 	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getAmount()%></label>
											 </div>
										</div>
									</div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getSslResultMessage()%></label>
											 </div>
										</div>
									</div> 								  
                <%}else{
                                                                                                                                    
																																															chkAmt=String.valueOf(objPayment.getCheckAmount());
																																															pendingAmt = String.valueOf(objPayment.getPendingAmount());
																																															%>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getPaymentStatus()%></label>
											 </div>
										</div>
									</div>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getCheckNumber()%></label>
											 </div>
										</div>
									</div>
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getBankName()%></label>
											 </div>
										</div>
									</div>	 
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%= sd1.format(objPayment.getCheckDate())%></label>
											 </div>
										</div>
									</div>	
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=chkAmt%></label>
											 </div>
										</div>
									</div>	
										     
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Pending Amount: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=pendingAmt%></label>
											 </div>
										</div>
									</div>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date:  </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayment.getPaymentDate())%></label>
											 </div>
										</div>
									</div>	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getAmount()%></label>
											 </div>
										</div>
									</div>	
				
               
                <input type="hidden" value="<%=objPayment.getPaymentId()%>" name="parentpayId" />
                <%}}else{%>
                <p id="p_error">No Payment Details Available for this Member !</p>
                <%}}else{%>
               <p id="p_error">No Payment Details Available for this Member !</p>
                <%}%>
                <%
        if(str1[11].equalsIgnoreCase("Pending"))
        {
           if(objPayment.getPaymentId()!=null)
               {
               
			   if(objPayment.getPaymentStatus().equalsIgnoreCase("check"))
               {
			   
			   session.setAttribute("amt",String.valueOf(objPayment.getAmount()));
                           session.setAttribute("pendingAmt",String.valueOf(objPayment.getPendingAmount()));
			   
			   float checkAmt=objPayment.getCheckAmount();
			   double totAmt=objPayment.getAmount();
			   
			   System.out.print(" objPayment.getPendingAmount() :"+checkAmt);
			   System.out.print(" objPayment.getAmount() :"+totAmt);

			   if(checkAmt<totAmt)
			   {
        	%>
                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Edit Payment Details:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <a href="./AdminMembPayment.html?process=disp&amp;userId=<%=userID%>&amp;pid=<%=objPayment.getPaymentId()%>">Edit Payment</a>
											 </div>
										</div>
									</div>	
                <%      }
        }
		else
		{
		
			System.out.print("objPayment.getSslResult() :"+objPayment.getSslResult());
			
			if(objPayment.getSslResult()!=null && objPayment.getSslResult().trim().length()!=0 )
                                                                                                                                      			{
                 if(objPayment.getSslResult().equalsIgnoreCase("1"))
				 {

				 
				 session.setAttribute("amt",String.valueOf(objPayment.getAmount()));
                 				                 
				 %>
                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Edit Payment Details:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <a href="./AdminMembPayment.html?process=disp&amp;usr=user&amp;cardStatus=card&amp;userId=<%=userID%>&amp;pid=<%=objPayment.getPaymentId()%>">Edit Payment</a>
											 </div>
										</div>
									</div>	
								</div>	
                                
                <%}}}}}
		else{}

           if(objPayment.getPaymentId()!=null)
               {
               
			   if(objPayment.getPaymentStatus().equalsIgnoreCase("check"))
               {
			  String serviceTypeId=" ";
			  String memberType=" ";
			  String memberAmount=" ";
			  String payId_amount=" ";
			  mainStat = "avail";
			  if(serviceType.length!=0 || serviceType!=null){
					serviceTypeId =serviceType[0];
					memberType = serviceType[1];
					memberAmount = serviceType[2];
			  }
			  payId_amount = objPayment.getPaymentId()+"#"+memberAmount+"#"+objPayment.getAmount();
			  boolean nsfCharge_Status =  objPayment.isNsf_charge_status();
			  if(nsfCharge_Status==false){
		  %>
                  <div class='form-group'>	
				  <input type="checkbox" id="mainPayNfs" name="mainPayNfs" value="<%=payId_amount%>" onclick="showComments('commentArea');"/>
                    NSF Charge
					
                      <div class='col-md-8'>
                             <div class='col-md-3 indent-small'>
                                    <div class='form-group internal'>
											 <label class='control-label'><%=memberAmount%></label>
										</div>
								</div>
						</div>
						</div>
						<div class="form-group">	
                		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Admin Comments:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<textarea disabled="disabled" id="admintxtArea" name="admintxtArea" rows="2" class="form-control"></textarea>
											</div>
										</div>
									</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Comments:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<textarea name="usrtxtArea" id="usrtxtArea" disabled="disabled" rows="2" class="form-control"></textarea>
											</div>
										</div>
									</div>	
							</div>			
                   
                <% } 
		    }
		    }
	    %>
                <%
	   
	   ArrayList childPayment=new ArrayList();
	   
	   childPayment=(ArrayList)request.getAttribute("childPayment");
	   System.out.println("childPayment.size() in jsp :"+childPayment.size());
	   
	   int x=0;
	   String subpay="";
	   String subStat ="notavail";
	   int subPaySz = 0;
	   if(childPayment != null)
	   {
	   for(x=0; x<childPayment.size(); x++)
	   {
	   		objPayment = new HLCPaymentDetails();
			objPayment = (HLCPaymentDetails)childPayment.get(x);
			subPaySz = childPayment.size();
			System.out.println("objPayment in jsp :"+objPayment.toString());		
			%>
                <input type="hidden" name="subPaySz" id="subPaySz" value="<%=childPayment.size()%>" />
                 <div class='form-group'>												
                   <label class='control-label label1'>Sub Payment Information <%=x+1%>: </label>  
			   </div>
                <%
						
			if(objPayment.getPaymentStatus()!=null)
			{
			if(objPayment.getPaymentStatus().equalsIgnoreCase("card"))
			{
//out.print("setSslResult " + objPayment.getSslResult());                                                   
												String ccTyp1="N/A";
												String ccNam1="N/A";
												String ccNo1="N/A";
												
												if(objPayment.getCcType()!=null)
											   {
												  ccTyp1=objPayment.getCcType();
											   }
												
												 if(objPayment.getCcName()!=null)
											   {
												  ccNam1=objPayment.getCcName();
											   }
												
												  if(objPayment.getCcNumber()!=null)
											   {
												  ccNo1=objPayment.getCcNumber();
											   }                                                                                                                               				 												String txId1="N/A";
												
												if(objPayment.getSslTxnId()!=null)
												{	
													txId1=objPayment.getSslTxnId();
												}
                                                                                                                                    
																%>
							<div class="form-group">
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getPaymentStatus()%></label>
											 </div>
										</div>
									</div>	
                            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=ccTyp1%></label>
											 </div>
										</div>
									</div>	
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=ccNam1%></label>
											 </div>
										</div>
									</div>	
                            
                
               
                <!--<tr>
																	<td class="tableLeft">Card No: </td>
																	<th class="tableRight"><%=ccNo1%></th>
																  </tr>	-->
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=txId1%></label>
											 </div>
										</div>
									</div>	
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayment.getPaymentDate())%></label>
											 </div>
										</div>
									</div>		
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getAmount()%></label>
											 </div>
										</div>
									</div>											  
               
              
               
                <%}else{     %>
				              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getPaymentStatus()%></label>
											 </div>
										</div>
									</div>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getCheckNumber()%></label>
											 </div>
										</div>
									</div>	
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getBankName()%></label>
											 </div>
										</div>
									</div>		
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayment.getCheckDate())%></label>
											 </div>
										</div>
									</div>		
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayment.getPaymentDate())%></label>
											 </div>
										</div>
									</div>		
                               	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayment.getAmount()%></label>
											 </div>
										</div>
									</div>		
              
									  <%
									  String serviceTypeId=" ";
									  String memberType=" ";
									  String memberAmount=" ";
									  String payId_amount1=" ";
									  subStat="avail";
									  if(serviceType.length!=0 || serviceType!=null){
											serviceTypeId =serviceType[0];
											memberType = serviceType[1];
											memberAmount = serviceType[2];
									  }
									  payId_amount1 = objPayment.getPaymentId()+"#"+memberAmount+"#"+objPayment.getAmount();
									  
									  boolean nsfCharge_Status =  objPayment.isNsf_charge_status();
										if(nsfCharge_Status==false){
									  %>
                 <div class='form-group'>	
						  <input type="checkbox" id="subpay<%=x%>" name="subpay<%=x%>" value="<%=payId_amount1%>"  onclick="showSubComments('subcommentArea<%=x%>',<%=x%>)"/>
							NSF Charge
						  <input type="hidden" name="chkItem<%=x%>" value="" />
						   <div class='col-md-8'>
									 <div class='col-md-3 indent-small'>
											<div class='form-group internal'>
													 <label class='control-label'><%=memberAmount%></label>
												</div>
										</div>
								</div>
					</div>
					<div class="form-group">	
                		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Admin Comments:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<textarea disabled="disabled" name="subusrtxtArea<%=x%>" id="subusrtxtArea<%=x%>" rows="2" class="form-control"></textarea>
											</div>
										</div>
									</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Comments:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<textarea disabled="disabled" name="subadmintxtArea<%=x%>" id="subusrtxtArea<%=x%>" rows="2" class="form-control"></textarea>
											</div>
										</div>
									</div>	
								</div>	
                
               
                <% } %>
                <%}}%>
                <input type="hidden" name="chkItem<%=x%>" value="" />
                <input type="hidden" name="subpay<%=x%>" value="viewalldona" />
                <%
			
	   }
	   }
	   
	   ArrayList NSFcharge=new ArrayList();
	   
	   NSFcharge=(ArrayList)request.getAttribute("NSFcharge");
	   System.out.println("childPayment.size() in jsp :"+NSFcharge.size());
	   int paymentNo = 0;
	   if(NSFcharge != null)
	   {
	   for(int x1=0; x1<NSFcharge.size(); x1++)
	   {
	   		HLCPaymentDetails objPayDet = new HLCPaymentDetails();
			objPayDet = (HLCPaymentDetails)NSFcharge.get(x1);
			System.out.println("objPayment in jsp :"+objPayDet.toString());		
		%>
                <%
			if(objPayDet.getPaymentStatus()!=null)
			{
			paymentNo++;
			if(objPayDet.getPaymentStatus().equalsIgnoreCase("card"))
			{
					//out.print("setSslResult " + objPayDet.getSslResult()); 
				  	String ccTyp1="N/A";
					String ccNam1="N/A";
					String ccNo1="N/A";
					String txId1="N/A";
					
					if(objPayDet.getCcType()!=null){
					  ccTyp1=objPayDet.getCcType();
				   }
				   if(objPayDet.getCcName()!=null){
					  ccNam1=objPayDet.getCcName();
				   }
 				   if(objPayDet.getCcNumber()!=null){
					  ccNo1=objPayDet.getCcNumber();
				   }                               
				   if(objPayDet.getSslTxnId()!=null){	
						txId1=objPayDet.getSslTxnId();
				   }                                                                                                                
				%>
				 <div class='form-group'>												
                   <label class='control-label label1'>NSF Payment Information <%=paymentNo%>: </label>  
			   </div>
                       	<div class="form-group">
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayDet.getPaymentStatus()%></label>
											 </div>
										</div>
									</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=ccTyp1%></label>
											 </div>
										</div>
									</div>	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=ccNam1%></label>
											 </div>
										</div>
									</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=txId1%></label>
											 </div>
										</div>
									</div>	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayDet.getPaymentDate())%></label>
											 </div>
										</div>
									</div>	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayDet.getAmount()%></label>
											 </div>
										</div>
									</div>	
								</div>											
               
               
               
              
                <%}else{      %>
				<div class='form-group'>												
                   <label class='control-label label1'>NSF Payment Information <%=paymentNo%>: </label>  
			   </div>
			          	<div class="form-group">
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayDet.getPaymentStatus()%></label>
											 </div>
										</div>
									</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayDet.getCheckNumber()%></label>
											 </div>
										</div>
									</div>		
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayDet.getBankName()%></label>
											 </div>
										</div>
									</div>				
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayDet.getCheckDate())%></label>
											 </div>
										</div>
									</div>	
										</div>				
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=sd1.format(objPayDet.getPaymentDate())%></label>
											 </div>
										</div>
									</div>					
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class='control-label'><%=objPayDet.getAmount()%></label>
											 </div>
										</div>
									</div>	
							</div>						
                
                <%   }  
		 }
		 }	
		 }%>     <div class='form-group'>
		        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assign Status:</label>
                             <div class='col-md-8'>
                                     <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
										 <select name="uStatusId" id="uStatusId" class="form-control" >
										
										  <%
										if(str1[11].equalsIgnoreCase("Pending")){
									%>
										  <option value="Pending" selected="selected">Pending</option>
										  <option value="Active" >Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged">Merged</option>
										  <% }
										else if(str1[11].equalsIgnoreCase("Active")){	
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active" selected="selected">Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged">Merged</option>
										  <% } 
										else if(str1[11].equalsIgnoreCase("Inactive")){	
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active">Activate</option>
										  <option value="Inactive" selected="selected">Inactive</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged">Merged</option>
										  <% } 
										else if(str1[11].equalsIgnoreCase("Expired")){	
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active">Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired" selected="selected">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged">Merged</option>
										  <% } 
										else if(str1[11].equalsIgnoreCase("Suspended")){	
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active">Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended" selected="selected">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged">Merged</option>
										  <% } 
										else if(str1[11].equalsIgnoreCase("Duplicate")){	
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active">Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate" selected="selected">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged">Merged</option>
										  <% } 
										else if(str1[11].equalsIgnoreCase("Deceased")){	
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active">Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased" selected="selected">Deceased</option>
										  <option value="Merged">Merged</option>
										  <% } 							
										else if(str1[11].equalsIgnoreCase("Merged")){	
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active">Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged" selected="selected">Merged</option>
										  <% } else {
									%>
										  <option value="Pending">Pending</option>
										  <option value="Active">Activate</option>
										  <option value="Inactive">Deactivate</option>
										  <option value="Expired">Expired</option>
										  <option value="Suspended">Suspended</option>
										  <option value="Duplicate">Duplicate</option>
										  <option value="Deceased">Deceased</option>
										  <option value="Merged">Merged</option>
										  <%	} %>
										</select>
					              </div>
					         </div>
					     </div>
					</div> 
                  
               <div class='form-group'>
		        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approval  Date:</label>
                             <div class='col-md-8'>
                                     <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
                 
											<input name="approvalDate" type="text" id="approvalDate" class="form-control" size="10" />
											
											<a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
                   
				                          </div>
				                     </div>
				              </div>
				  </div>
                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="Submit" type="submit"  value="Submit" >Submit</button>
										 <input type="hidden" value="<%=mainStat%>" name="mainStat" />
                                    </div>
                                    <div class='col-md-2'>
                                        <button  name="Submit2" type="button"  value="Back"  class="btn-lg btn-primary" onclick="javascript:history.back(-1);" > Back</button>
                                         <input type="hidden" value="<%=subStat%>" name="subStat" />

									</div>
                  </div>
               
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
<script language="javascript">
	var cal1 = new calendar2(document.forms['frmmemRegiApprove'].elements['approvalDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	</script>
</html>
