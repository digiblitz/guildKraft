<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script language="javascript">
function postData(stat){

if((document.frmHorseMemberList.statSelect.selectedIndex==0)||(document.frmHorseMemberList.statSelect.options.value=="")){
	alert('Select any one of the status');
	document.frmHorseMemberList.selectTyp.selectedIndex=0;	
	document.frmHorseMemberList.statSelect.focus();
}
}
function myValidate(){	
  if((document.frmHorseMemberList.statSelect.selectedIndex==0)||(document.frmHorseMemberList.statSelect.options.value=="")){
  	alert('Select any Status');
	document.frmHorseMemberList.statSelect.focus();
	return false;
  }
  if((document.frmHorseMemberList.selectTyp.selectedIndex==0)||(document.frmHorseMemberList.selectTyp.options.value=="")){
  	alert('Select any Membership Type');
	document.frmHorseMemberList.selectTyp.focus();
	return false;
  }
  return true;
}
function updateBtn(hrsId){
	strURL = "./AdminHorseEdit.html?process=desc&memid="+hrsId;
	window.location.href = strURL;
}
function editBtn(payId){
	strURL = "./RegHorseListing.html?process=adminTransacDet&pid="+payId;
	window.location.href = strURL;
}
function postDataForPagination() {
	/*frmHorseMemberList.method="post";
	frmHorseMemberList.action="RegHorseListing.do";
	frmHorseMemberList.submit();*/
	var selectTyp = document.frmHorseMemberList.selectTyp.value;
	var statSelect = document.frmHorseMemberList.statSelect.value;
	var pn = document.frmHorseMemberList.pn.value;
    strURL = "./RegHorseListing.html?selectTyp="+selectTyp+"&statSelect="+statSelect+"&pn="+pn;
	window.location.href = strURL;
}
function postDataForPagination1() {
	/*frmHorseMemberList.method="post";
	frmHorseMemberList.pn.value = frmPageHr.pn1.value;
	frmHorseMemberList.action="RegHorseListing.do";
	frmHorseMemberList.submit();*/
	var selectTyp = document.frmHorseMemberList.selectTyp.value;
	var statSelect = document.frmHorseMemberList.statSelect.value;
	var pnVal = document.frmPageHr.pn1.value;
    strURL = "./RegHorseListing.html?selectTyp="+selectTyp+"&statSelect="+statSelect+"&pn="+pnVal;
	window.location.href = strURL;
}
</script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
</head>

<body>
 <div>
 <!-- HEADER START HERE -->
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</div>
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
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
				
					<table width="545"  border="0"  align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
					  <tr>
						<td colspan="5" class="tblMainHead">
						Membership: <span class="styleBoldTwo">Admin Non-Human Member Registration Listing </span></td>
					  </tr>
					  <tr>
						<td colspan="5" class="tblDescrp">
							The Non-Human Member's registered with are listed as follows. <br />
							<br />
							To Approve a Non-Human Member's account, click on the <strong>'Approve'</strong> button beside it.</td>
					  </tr>
					 
					 <tr>
						<td>
						
							 <table width="523" border="0" align="center" cellpadding="0" cellspacing="1" class="formLayout">
							 <form name="frmHorseMemberList" id="frmHorseMemberList" method="post" action="RegHorseListing.html" onsubmit="return myValidate();">
								  <tr>
								<td height="25" colspan="2"  bgcolor="#ffffff" class="alignLeft">&nbsp;&nbsp;<strong>Status:</strong>
								  <select name="statSelect" class="selectboxOne" > 
								  <option value="" selected="selected">Select One</option>		
                                    <%
										String staId = (String) request.getAttribute("statusId");
										if(staId==null) staId = "";
										
										String memTypId = (String) request.getAttribute("memTypeId");
										if(memTypId==null) memTypId = "";										
										
									
									ArrayList statusList = (ArrayList)request.getAttribute("statusList");
									//String res ="select";
									
									if(statusList!=null&& statusList.size()!=0){
										Iterator itStatus = statusList.iterator();
										while(itStatus.hasNext()){
											String statusListArray[] = (String [])itStatus.next();
											String statusId = statusListArray[0];
											String statusName = statusListArray[1];
											if(statusId.equals(staId)){
												%>
													<option  value="<%=statusId%>" selected="selected"><%=statusName%></option>
												<%
												}
												else{
												%>
													<option  value="<%=statusId%>"><%=statusName%></option>
												<%
												}
										}
									}
                                   %>
                                  </select>
								  								  </td>
							    <td height="25" colspan="3"  bgcolor="#ffffff" class="alignLeft"><strong> Membership Type: </strong>
							      <select name="selectTyp" class="selectboxOne" onchange="postData(this.value);">
							   <option value="" selected="selected">Select One</option>			
									<%
									//String sel_res="select";;
									Vector horsememberVect=new Vector();
									horsememberVect=(Vector)request.getAttribute("horsememberVect");
									if(horsememberVect!= null && horsememberVect.size()!=0){
										Enumeration itrators= (Enumeration)horsememberVect.elements();
										while(itrators.hasMoreElements()){
											String[] sarray = (String[]) itrators.nextElement();
											String memberTypeId = sarray[0];
											String membershipName = sarray[1];
											String membershipAmount =sarray[2];
											if(memTypId.equalsIgnoreCase(memberTypeId)){
											%>
												<option  value="<%=memberTypeId%>" selected="selected"><%=membershipName%></option>
											<%	
											}
											else{		
											%>
												<option  value="<%=memberTypeId%>"><%=membershipName%></option>	
											<%
											}
										}
									}
									%>
			                   </select>
							  					    
							    </td>
								 <td bgcolor="#ffffff" class="tableLeft" colspan="2"><input type="submit" name="click2" value="Submit" class="gradBtn"/></td>
						       </tr>
					
						<%
							int start = 1;
							int end = 1;
							int totalPage = 0;
							String rowCnt = (String)request.getAttribute("rCnt");
							String pageNo = (String) request.getAttribute("pNo");

							int rCnt = 0;
							int pNo = 0;
							if(rowCnt==null){
								rCnt = 0;
							}
							else{
								rCnt = Integer.parseInt(rowCnt);
								end = (rCnt/25);
								totalPage = (rCnt%25);
								if(totalPage>0){
									end = end  +1;
								}
							}

							if(pageNo==null){
								pNo = 1;
							}
							else{
								pNo = Integer.parseInt(pageNo);
							}
							if(rCnt!=0){
							%>
							<tr>
							<td  colspan="7"  bgcolor="#ffffff" class="alignRight">
							<span class="alignRight"><strong>View Page(s): </strong></span> &nbsp;
							<select name="pn" id="pn" class="selectboxOne" onchange="myValidate();postDataForPagination();">
							<%
								for(int i = 1; i <=end; i++) { 
									if(pNo==i){
									%>
										<option selected="selected" value="<%=i%>"><%=i%></option>
									<%
									}
									else{
									%>
										<option value="<%=i%>"><%=i%></option>
									<%
									}
								}
								%>
							  </select>
							  <strong> of <%=end%> </strong>							  </td> 
						 </tr>
						   <%
						   }
						   %>
						   	</form>
						  <tr>
								<td width="92" height="23" class="tblRowHeadTwo">Non-Human Member Id</td>
								<td width="114" class="tblRowHeadTwo">Non-Human Member Name</td>	
								<td width="91" class="tblRowHeadTwo">Owner Name </td>
								<td width="73" class="tblRowHeadTwo">Rider ID </td>
																							
								 
								<td width="67" class="tblRowHeadTwo">Edit </td>
								<td width="76" class="tblRowHeadTwo">Activate</td>
                                <td width="76" class="tblRowHeadTwo">Transaction Details</td>
							   </tr>
						<%
							ArrayList horseVal = (ArrayList)request.getAttribute("arrVal");
							//out.print("size of horseVal "+horseVal.size());
							if(horseVal!=null && horseVal.size()!=0){
							Iterator itr = 	horseVal.iterator();
							while(itr.hasNext()) {				   
								HLCHorseRegListVO objHrListVO = (HLCHorseRegListVO) itr.next();
								String horseMemberId = objHrListVO.getHorseMemberId();
								String horseName = objHrListVO.getHorseName();
								String riderID = objHrListVO.getRiderID();//null
								String firstName = objHrListVO.getFirstName();//null
								String lastName = objHrListVO.getLastName();//null
								String reqStatus = objHrListVO.getReqStatus();//null
								String ownerId = objHrListVO.getOwnerId();//null
								Date dte = objHrListVO.getAddDate();
								String regBy = objHrListVO.getRegisteredBy();
								String memberType = objHrListVO.getMembershipTypeName();
								String paymentId = objHrListVO.getPaymentId();
								String date  = dte.toString(); 
								if( regBy==null){
									regBy="";
								}
								%>
								<form name="testfrm" action="RegHorseListing.html?" method="post">
									 <tr>
										<td height="26" bgcolor="#E3E1D2" class="alignCenter"><a href="./RegHorseListing.html?process=desc&memid=<%=horseMemberId%>"><%=horseMemberId%></a> </td>
										<td bgcolor="#E3E1D2" class="alignCenter"><%=horseName%></td>	
										<td height="26" bgcolor="#E3E1D2" class="alignCenter"><a href="ownRidDet.html?process=view&ownerInfo=ownerValue&userId=<%=ownerId%>"><%=firstName+" "+lastName%></a></td>
										<td bgcolor="#E3E1D2" class="alignCenter"><a href="ownRidDet.html?process=view&memberId=<%=riderID%>"><%=riderID%></a></td>
										<td bgcolor="#E3E1D2" class="alignCenter">
										<input type="button" name="btnOwner" value="Update" class="twoBtn" onclick="updateBtn('<%=horseMemberId%>');"  /></td>
			<!--<input type="button" name="btnOwner" value="Update" class="twoBtn" onclick="javascript:location.href('Owner.do?changeProcess=initPage&ownerId=< %=ownerId%>&horseId=< %=horseMemberId%>');"  />-->								
                                                                                <td bgcolor="#E3E1D2" class="alignCenter">
                                                                                <input type="submit" name="click" value="Approve" class="twoBtn"/></td>	
																				<td bgcolor="#E3E1D2" class="alignCenter">
																				<input type="button" name="btnOwner" value="Edit" class="twoBtn" onclick="editBtn('<%=paymentId%>');"  /></td>
                                                                                <input type="hidden" name="process" value="Approve"/>
                                                                                <input type="hidden" name="memid" value="<%=horseMemberId%>"/>
                                                                                <input type="hidden" name="ownerId" value="<%=ownerId%>"/>
								  </tr>
							</form>
							<%
							}
							%>
							<%
							} else
							{
						   %>
					
							  <tr>
								<td height="25" colspan="7" class="alignCenter"><strong>No Records Found!</strong></td>
							   </tr>
							<% } 
							if(rCnt!=0){
							%>
							<form name = "frmPageHr" method="post">
						<tr>
							<td  colspan="7"  bgcolor="#ffffff" class="alignRight">
							<span class="alignRight"><strong>View Page(s): </strong></span> &nbsp;
							
							<select name="pn1" id="pn1" class="selectboxOne" onchange="myValidate();postDataForPagination1();">
							<%
								for(int i = 1; i <=end; i++) { 
									if(pNo==i){
									%>
										<option selected="selected" value="<%=i%>"><%=i%></option>
									<%
									}
									else{
									%>
										<option value="<%=i%>"><%=i%></option>
									<%
									}
								}
								%>
							  </select>
							 
							  <strong> of <%=end%> </strong>							  </td> 
						 </tr>
						  </form>
						   <%
						   }
						   %>
						  </table>
			</td>
					</tr>  
					</table>
					
					<!-- CONTENTS END HERE -->		
			</td>
		  </tr>
	  </table>
	</td>
  </tr>
  <!--==============================================footer start here============================================-->
 <div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>
<!--==============================================footer end here============================================-->
</table>
</body>
</html>
