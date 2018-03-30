<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ page import="com.hlccommon.util.HLCHorseRegisterationVO"%>
<%@ page import="com.hlchorse.form.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><%=(String)session.getAttribute("title")%></title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <script src="javascripts/basic.js" type="text/javascript" ></script>
        <script src="javascripts/frmHorseReg.js" type="text/javascript" ></script>
        <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
		<script language="javascript">
		function chngRidOwnr(hrsId){
			strURL = "./changeOwnRidPay.html?process=dispdet&horseMemberId="+hrsId;
			window.location.href = strURL;
		}
		function addnewRiderOwnr(hrsId){
			strURL = "./horserRidOwnAdd.html?process=addRid&horseMemberId="+hrsId+"&cardStatus=check";
			window.location.href = strURL;		
		}
		function addOtherRidrOwnr(hrsId){
			strURL = "./horserRidOwnAdd.html?process=addRidOwn&horseMemberId="+hrsId;
			window.location.href = strURL;				
		}
		</script>
    </head>
   <%! 
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    String  nullCheck(String fieldName){
        String retValue = "NG";
        if(fieldName!=null && fieldName.trim().length()!=0){
            retValue = fieldName;
        }
        return retValue;
    }
    %>
    <%! String dateCheck(Date fieldName){
        String detValue = "NG";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
    }
    %>
    <%! float floatCheck(float fieldName){
        float floateValue = 0;
        if(fieldName!=0.0){
            floateValue = fieldName;
        }
        return floateValue;
    }
    %>
    <%! 
    DecimalFormat result  = new DecimalFormat("0.00");
    String amtFormat(String amtVal){
        String amountValue = "0.00";
        if(amtVal!=null && amtVal.trim().length()!=0){
            System.out.print(Double.parseDouble(amtVal));
            amountValue = result.format(Double.parseDouble(amtVal));
        }
        return amountValue;
    }
    %>
    <body>
    
               <div>
 <!-- HEADER START HERE -->
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</div>

<section id="content">
        <table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">

            <tr>
                <td class="infoBar">
                    <!-- INFO BAR STARTS HERE -->
                    <%@ include file = "../../include/infobar.jsp" %>
                    <!-- INFO BAR ENDS HERE -->	
                </td>
            </tr>
            <tr>
                <td class="tableCommonBg">
                    
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
                        
                        <%
                        
                        HLCHorseRegisterationVO HorseDisp =(HLCHorseRegisterationVO) request.getAttribute("HorseDet");
                        String horseMemberId = (String) HorseDisp.getHorseMemberId();
                        String competitionName =(String) HorseDisp.getCompetitionName();
                        String registeredName = (String) HorseDisp.getRegisteredName();
                        String baRegisteredName = (String)HorseDisp.getBaRegisteredName();
                        String baPastName = (String)HorseDisp.getBaPastName();
                        String ownerId = (String)HorseDisp.getOwnerId();
                        String riderMemberId = (String)HorseDisp.getRiderMemberId();
                        
                        
                        String paymentId = (String)HorseDisp.getPaymentId();
                        String requestStatus = (String)HorseDisp.getRequestStatus();
                        String firstName = (String)HorseDisp.getFirstName();
                        String lastName = (String)HorseDisp.getLastName();
                        String comments =(String)HorseDisp.getComments();
                        String color = (String)HorseDisp.getColor();
                        String gender = (String)HorseDisp.getGender();
                        
                        String height = (String)HorseDisp.getHeight();
                        String yearFoaled = (String)HorseDisp.getYearFoaled();
                        String breed = (String)HorseDisp.getBreed();
                        String country1 = (String)HorseDisp.getCountry();
                        String sire = (String)HorseDisp.getSire();
                        String sireBreed = (String)HorseDisp.getSireBreed();
                        String dam = (String)HorseDisp.getDam();
                        String damBreed = (String)HorseDisp.getDamBreed();
                        String breed2 = (String)HorseDisp.getBreed2();
                        String sireBreed2 = (String)HorseDisp.getSireBreed2();
                        String damBreed2 = (String)HorseDisp.getDamBreed2();
                        String importedFrom = (String)HorseDisp.getImportedFrom();
                        Date imp_dte = HorseDisp.getImportDate();
                        String foreignGrade = (String)HorseDisp.getForeignGrade();
                        float foreignPoints = (float)HorseDisp.getForeignPoints();
                        String assignedGrade = (String)HorseDisp.getAssignedGrade();
                        float assignedPoints = (float)HorseDisp.getAssignedPoints();
                        String notes = (String)HorseDisp.getNotes();
                        String splNotes = (String)HorseDisp.getSplNotes();
                        String regstrBy = (String)HorseDisp.getRegisteredBy();
                        String membertype=(String)HorseDisp.getMemberTypeName();
                        String statusName = (String)HorseDisp.getStatusName();
                        Date actDate1 =  HorseDisp.getActivationDate() ;
                        Date upgraDate1 =  HorseDisp.getUpgradationDate() ;
                        
                        
                        %>
                        <tr>
                            <td width="260" class="menuTablePad">
                                <!-- LEFT MENU STARTS HERE -->
                                <%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
                                <!-- LEFT MENU ENDS HERE -->

                            </td>
                            <td width="500" class="subDeptTablePad">
                                <!-- CONTENTS START HERE -->
                                <div class="rowHead">
                                    Owner Information:
                                </div>	
                                
                                <div class="colspan">
                                    <strong>Membership:</strong> <span class="styleBoldTwo">Horse Registration Details </span> 
                                </div>
                                <div id="commonBG" class="textCommon"> You are viewing	the	details	of the horse registered by you. </div>
                                <%
									String primaryOwner = (String)request.getAttribute("primaryOwner");
									System.out.print("primaryOwner value:" + primaryOwner);
									if(statusName!=null && statusName.equals("Active")){
										System.out.print("Inside the condition requestStatus value:" + requestStatus);
								%>
                                <div class="alignLeft">
                                    <span>	
                                        <input type="button" class="gradBtn" name="Change Horse" value="Horse/Rider/Owner Change" onclick="chngRidOwnr(<%=horseMemberId%>);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </span>
									<%
									if(primaryOwner!=null && primaryOwner.equalsIgnoreCase("primaryOwner")){
									%>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Add New Rider/Owner"  class="gradBtn" onclick="addnewRiderOwnr(<%=horseMemberId%>);"/>
                                    </span>
									<%
									}else{
									%>
									 <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Add New Rider/Owner"  class="gradBtn" onclick="addOtherRidrOwnr(<%=horseMemberId%>)"/>
                                    </span>
									<%}
									%>
                                </div>
                                <%	}%>								
                                <div class="rowExpand">Horse Registration Details:</div>
                                <table width="523" border="0" align="center" cellpadding="0" cellspacing="1" class="formLayout">
                                    <tr>
                                        <td width="145" height="27" class="tblRowHeadTwo">Horse Username</td>
                                        <td width="145" class="tblRowHeadTwo">Relationship</td>
                                        <td width="145" class="tblRowHeadTwo">Relationship Status</td>
                                        <td width="145" class="tblRowHead">Degrade</td>
                                    </tr>
                                    <%
                                    ArrayList HorseDisp1 = (ArrayList) request.getAttribute("ListVO");
                                    String firstName1,last_name1,relationship_status1,relationship_type_id1,relationship_type_name1,relation_id="";
                                    String payinfo[] =(String[]) request.getAttribute("paydet");
                                    String checkNumber ="";
                                    String paymentStatus = "";
                                    String checkName ="";
                                    String sslTxnId = "";
                                    String bankName ="";
                                    String checkDate = "";
                                    String amount = "";
                                    String checkAmount  ="";
                                    String sslResult= "";
                                    String tempPaymentId = "";
                                    String balAmt = "";
                                    String cardStatus= "";
                                    String cardType = "";
                                    String cardName = "";
                                    
                                    String temAmt ="";
                                    String output2= "";
                                    if(payinfo!=null && payinfo.length !=0){
                                        checkNumber =  payinfo[0];
                                        paymentStatus =  payinfo[1];
                                        checkName =  payinfo[2];
                                        sslTxnId = payinfo[3];
                                        bankName =  payinfo[4];
                                        checkDate =  payinfo[5];
                                        amount =  payinfo[6];
                                        checkAmount = payinfo[7];
                                        sslResult = payinfo[8];
                                        tempPaymentId = payinfo[9];
                                        balAmt = payinfo[10];
                                        cardName = payinfo[11];
                                        cardType = payinfo[12];
                                        cardStatus = payinfo[13];
                                        
                                        System.out.print("balAmt:" + balAmt);
                                    }
                                    
                                    System.out.print("HorseDisp1:" + HorseDisp1.size());
                                    if(HorseDisp1!=null && HorseDisp1.size()!=0){
                                        
                                        Iterator itr = 	HorseDisp1.iterator();
                                        while(itr.hasNext()) {
                                            String[] val=(String[])itr.next();
                                            firstName1 = val[0];
                                            last_name1 =  val[1];
                                            relationship_type_id1 = val[2];
                                            relationship_type_name1 = val[3];
                                            relationship_status1 =  val[4];
                                            relation_id = val[5];
                                            System.out.print("firstName1:" + firstName1);
                                            System.out.print("last_name1:" + last_name1);
                                            System.out.print("SFdsf111:" + relationship_type_id1);
                                            System.out.print("relationship_type_name1:" + relationship_type_name1);
                                            System.out.print("relationship_status1:" + relationship_status1);
                                            System.out.print("relation_id:" + relation_id); 		
                                    
                                    %>
                                    <form name="frmViewHorseReg" id="frmViewHorseReg" method="post" class="formcss" action="RegHorseListing.html" >
                                        <input type="hidden" name="process" value="userDegrade" />
                                        <input type="hidden" name="memid" value="<%=horseMemberId%>" />
                                        <input type="hidden" name="relTyp" value="<%=relationship_type_name1%>" />
                                        <input type="hidden" name="relId" value="<%=relation_id%>"/>
                                        <!-- For the Repayment Option  -->
                                        <tr>
                                            <td bgcolor="#E3E1D2" class="alignLeft"><%=firstName1%>&nbsp;<%=last_name1%></td>								
                                            <td bgcolor="#E3E1D2" class="alignLeft"><%=relationship_type_name1%></td>
                                            <td bgcolor="#E3E1D2" class="alignLeft"><%=relationship_status1%></td>
                                            <td bgcolor="#E3E1D2" class="alignCenter">
                                            <% 
                                            if(!(relationship_status1.equalsIgnoreCase("Pending"))&&((relationship_type_name1.equalsIgnoreCase("owner"))||(relationship_type_name1.equalsIgnoreCase("rider"))||(relationship_type_name1.equalsIgnoreCase("trainer")) )) {
                                            %>
                                            <input type="submit" name="degrade" class="twoBtn" value="Degrade"/>
                                            <%}
                                            else{	%>
                                            <input type="submit" name="degrade" class="twoBtn" value="Degrade" disabled="disabled" />
                                            <%	}
                                            %>
                                        </tr>
                                        
                                    </form>
                                    <%
                                        }
                                    } else {
                                    %>
                                    
                                    <tr>
                                        <td height="25" colspan="7" class="alignCenter"><strong>No Records Found!</strong></td>
                                    </tr>
                                    <% } %>
                                </table>
                                <div class="rowHead">
                                    Horse Registration Details:
                                </div>
                                <div class="row">
                                    <span class="label">Horse Registration Status:</span>
                                    <span class="formX"><span class="styleBoldOne"><%=nullCheck(statusName)%></span></span>
                                </div>
                                
                                <div class="row">
                                    <span class="label">Horse Registration Type:</span>
                                    <span class="formX"><span class="styleBoldOne"><%=nullCheck(membertype)%></span></span>
                                </div>
                                <div class="row">
                                    <span class="label">Activation Date :</span>
                                    <span class="formX"><span class="styleBoldOne"><%=dateCheck(actDate1)%></span></span>
                                </div>
                                
                                <div class="row">
                                    <span class="label">Upgradation Date:</span>
                                    <span class="formX"><span class="styleBoldOne"><%=dateCheck(upgraDate1)%></span></span>
                                </div>
                                <div class="rowHead">
                                    Horse Information Section:
                                </div>
                                <div class="row">
                                    <span class="label">Horse Member Id: </span>
                                    <span class="formX"><strong><%=nullCheck(horseMemberId)%></strong></span>
                                </div>
                                <div class="row">
                                    <span class="label">Horse Name: </span>
                                    <span class="formX"><strong><%=nullCheck(competitionName)%></strong></span>
                                </div>
                                <div class="row">
                                    <span class="label">Registered By:</span>
                                    <span class="formX"><span class="styleBoldOne"><%=nullCheck(regstrBy)%></span></span>
                                </div>								
                                
                                <div class="row">
                                    <span class="label">Registered Name:</span>
                                    <span class="formX"><%=nullCheck(registeredName)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Past Name:</span>
                                    <span class="formX"><%=nullCheck(baPastName)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Breed Assoc. Horse is registered with:</span>
                                    <span class="formX"><%=nullCheck(baRegisteredName)%></span>
                                </div>
                                <div class="rowHead">
                                    Horse Description:
                                </div>
                                <div class="row">
                                    <span class="label">Color:</span>
                                    <span class="formX"><%=nullCheck(color)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Sex:</span>
                                    <span class="formX"><%=nullCheck(gender)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Height</span>
                                    <span class="formX"><%=nullCheck(height)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Year foaled:</span>
                                    <span class="formX"><%=nullCheck(yearFoaled)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Breed:</span>
                                    <span class="formX"><%=nullCheck(breed)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Breed Two:</span>
                                    <span class="formX"><%=nullCheck(breed2)%></span>
                                </div>	
                                <div class="row">
                                    <span class="label">Country of origin:</span>
                                    <span class="formX"><%=nullCheck(country1)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Sire Name:</span>
                                    <span class="formX"><%=nullCheck(sire)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Sire Breed:</span>
                                    <span class="formX"><%=nullCheck(sireBreed)%></span>
                                </div> 
                                <div class="row">
                                    <span class="label">Sire Breed Two:</span>
                                    <span class="formX"><%=nullCheck(sireBreed2)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Dam Name:</span>
                                    <span class="formX"><%=nullCheck(dam)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Dam Breed:</span>
                                    <span class="formX"><%=nullCheck(damBreed)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Dam Breed Two:</span>
                                     <span class="formX"><%=nullCheck(damBreed2)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Imported From:</span>
                                    <span class="formX"><%=nullCheck(importedFrom)%></span>
                                </div>							 
                                <div class="row">
                                    <span class="label">Date Imported:</span>
                                    <span class="formX"><%=dateCheck(imp_dte)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Foreign Grade:</span>
                                    <span class="formX"><%=nullCheck(foreignGrade)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Foreign Points:</span>
                                    <span class="formX"><%=floatCheck(foreignPoints)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Assigned Grade:</span>
                                    <span class="formX"><%=nullCheck(assignedGrade)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Assigned Points:</span>
                                    <span class="formX"><%=floatCheck(assignedPoints)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Comments:</span>
                                    <span class="formX"><%=nullCheck(comments)%></span>
                                </div>
                                <%
                                if(paymentStatus!=null && paymentStatus.equalsIgnoreCase("check")){
                                %>
                                <div class="rowHead">Transaction Details:</div>
                                <div class="row">
                                    <span class="label">Check Number:</span>
                                    <span class="formX"><%=nullCheck(checkNumber)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Check Name:</span>
                                    <span class="formX"><%=nullCheck(checkName)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Amount(<strong>$</strong>):</span>
                                    <span class="formX"><%=amtFormat(amount)%></span>
                                </div>
                                 <div class="row">
                                    <span class="label">Check Enclosed Amount(<strong>$</strong>):</span>
                                    <span class="formX"><%=amtFormat(checkAmount)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Check Date:</span>
									
                                    <%!SimpleDateFormat sd1 = new SimpleDateFormat("yyyy-MM-dd");
					                   SimpleDateFormat sd2 = new SimpleDateFormat("MM-dd-yyyy");
					
										String dateFormat(String fieldName){					
										Date clDate = null;
										Calendar cal = Calendar.getInstance();
										GregorianCalendar gc = new GregorianCalendar();
										try{
										clDate = sd1.parse(fieldName);
										}catch(Exception e){
										System.out.println("Error While Parsing Date: "+e);
										}
										
										gc.setTime(clDate);
										cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
										String dispDate = "N/A";
										if(clDate!=null ){
										dispDate = sd2.format(cal.getTime());
										System.out.println("dispDate"+dispDate);
										}
										return dispDate;
										}
			%>
                                    <span class="formX"><%=dateFormat(checkDate)%></span>
                                    
                                </div>
                                <div class="row">
                                    <span class="label">Bank Name:</span>
                                    <span class="formX"><%=nullCheck(bankName)%></span>
                                </div>
                                <%	}
                                else if(paymentStatus!=null && (paymentStatus.equalsIgnoreCase("Card") || paymentStatus.equalsIgnoreCase("credit card"))){  
                                %>
                                <div class="rowHead">Transaction Details:</div><%
                                if(sslResult!=null && sslResult.equalsIgnoreCase("1")){%>
                                
                                <div class="row">
                                    <span class="label"><span class="styleBoldOne">Transaction Failed In Previous So</span> </span>
                                    <span class="formX"><a href='./Horserrepay.html?act=repay&paymentId=<%=tempPaymentId%>&totalAmount=<%=amount%>&registrationLevel=<%=statusName%>&horseMemberId=<%=horseMemberId%>&horseName=<%=competitionName%>'>Click Here To Make New Payment</a></span>
                                </div>	
                                <% } %>
                                <div class="row">
                                    <span class="label">Card Name:</span>
                                    <span class="formX"><%=nullCheck(cardName)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Card Type:</span>
                                    <span class="formX"><%=nullCheck(cardType)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Transaction Status:</span>
                                    <span class="formX"><%=nullCheck(cardStatus)%></span>
                                </div>
                                
                                <div class="row">
                                    <span class="label">Transaction Id:</span>
                                    <span class="formX"><%=nullCheck(sslTxnId)%></span>
                                </div>
                                <div class="row">
                                    <span class="label">Amount(<strong>$</strong>):</span>
                                    <span class="formX"><%=amtFormat(amount)%></span>
                                </div>
                                <%	}	
                                try {	
                                String BalAmount = (String)request.getAttribute("BalAmount"); 
                                
                                if (BalAmount!=null && BalAmount.trim().length()!=0){
                                float balanceAmt = Float.parseFloat(BalAmount); 
                                if(balanceAmt>0){
                                if(sslTxnId==null || sslTxnId.trim().length()==0){
                                %>
                                
                                <div class="rowHead">Pending Payment Information:</div>
                                
                                <div class="row">
                                    <span class="label"><span class="styleBoldOne">Proceed to Payment For Pending Amount</span> </span>
                                    <span class="formX"><a href='userDuePay.html?process=duepay&totalAmount=<%=balanceAmt%>&paymentIdVal=<%=paymentId%>&horseMemberId=<%=horseMemberId%>&amount=<%=amount%>'>Click Here To Make New Payment</a></span>						
                                </div>
                                <div class="row">
                                    <span class="label">Check Amount Recieved (<strong>$</strong>):</span>
                                    <span class="formX"><%=amtFormat(checkAmount)%></span>
                                </div>
                                
                                <div class="row">
                                    <span class="label">Amount in Due(<strong>$</strong>) : </span>
                                    <span class="formX"><span class="styleBoldOne"><%=balanceAmt%></span></span>
                                </div>
                                
                                <%
                                }}
                                } 
                                session.setAttribute("fromWhere","DuePay");
                                }
                                catch(Exception e)
                                {
                                System.out.println(" error in jsp :"+e);
                                }
                                %>	
                                <div class="alignCenter">
                                    <span><input type="button" value="Back" name="back" class="gradBtn" onclick="javascript:history.back(-1);"/>
                                    </span>
                                </div>
                                <!-- CONTENTS END HERE -->		 
                            </td>
                        </tr>
                    </table>
                    
                </td>
            </tr>
          
        </table>
        </section>
        <!--==============================================footer start here============================================-->
 <div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>
<!--==============================================footer end here============================================-->
    </body>
</html>
