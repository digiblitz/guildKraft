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

<!--==============================================IMPORT THE CLASS END HERE============================================-->


<%@ page import="java.util.*"%>
<%@ page import="com.hlcform.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlccommon.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


<script src="js/refund-request.js" type="text/javascript" ></script>


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
                            <h2>Membership: Refund Request Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Members can request a refund for products and services purchased within the last 30 days from HLC. 
	Your refund request will be sent for approval, and you will be notified of the status.</p>
							
						<!--==============================Form Description=================================-->
							
                            <%
                            String err = request.getParameter("err");
                            if(err!=null) {
                            %>

                            <p>This Privilege Name Already Exist</p>
                            <%
                            }
                            %>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmRefundReq" id="frmRefundReq" method="post" action="./RefundReq.html" onSubmit="return frmRefundReqval();">
							
                               
								
								 <%
									String balamt=(String)request.getAttribute("rfbalamt");
								  %>
								  
								  
								  <p class="para">A list of items and amounts available for refund are displayed below:</p>
								
								<div class='form-group'>
								
															<%
																	 
																ArrayList donDet=new ArrayList();
																 donDet=(ArrayList)request.getAttribute("donDet");	
																  ArrayList donSelect=new ArrayList();
																  donSelect=(ArrayList)request.getAttribute("donSelect");
																  
															 if(donDet!=null)
															 {
															 	String doncbname;
																String dontbname;
																int donsiz=donDet.size();
																HLCDonationDetailVO onjDon = new HLCDonationDetailVO();
																
															 	for(int j=0;j<donDet.size();j++)
															 	{
																	
                                                                                                                                        //doncbname="donCb"+j;
																	//dontbname="donTb"+j;
																	
																	 HLCDonationVO donvo=new HLCDonationVO();
																	 donvo=(HLCDonationVO)donDet.get(j);
																	 
																	 String donId=donvo.getDonationId();
																	 String donName=donvo.getDonationName();
																	 String donAmt=donvo.getDonationPrice();
																	 String doncnct=donId+"#"+donName+"#"+donAmt;
																	 System.out.println("doncnct :"+doncnct);
																	 
																		String donval="0";
																		String donChked="";
																																		
																		for(int u=0;u<donSelect.size();u++)
																		{		
																		
																		doncbname="donCb"+u;
																	    dontbname="donTb"+u;
																	
																			onjDon=(HLCDonationDetailVO)donSelect.get(u);										
																		if(donSelect!=null && donName.equalsIgnoreCase(onjDon.getDonationName()))
																		{
																			donval=onjDon.getDonationPrice();
																		%>
																
							 	<div class="form-group">							
									<div class='col-md-8 col-md-offset-2'>
									
									<div class='col-md-4 col-md-offset-1'>
									<input type="checkbox" name="<%=doncbname%>" id="<%=doncbname%>" value="<%=doncnct%>" onclick="Sumup();"/>	<%=donName%>
									</div>
									
									<div class='col-md-2 '>
									<input name="<%=dontbname%>" id="<%=dontbname%>" readonly class="form-control" value="<%=donval%>" />
									</div>
									
									</div>
								</div>
							
							
							
							
																		<%
																			System.out.println("inside checked......"+onjDon.getDonationPrice());
																			//t=nonhlcct-1;
																		}}}%>																
																		
																			<input type="hidden" name="donCbxCt" value="<%=donSelect.size()%>" />
																		<%}
																		
																		/*HLCMemberDetails objMember = new HLCMemberDetails();
					 													objMember=(com.hlcform.util.HLCMemberDetails)request.getAttribute("objMember");*/
                                                                                                                                                         
                                                                           String memTypsel=(String)request.getAttribute("memTypId");
      
	  																	   //String memTypsel="";
     																	           String memberTypeId1 ="";
																		   String membershipName1 = "";
																		   String membershipAmount1 = "";
																		   String cnct1=memberTypeId1+"#"+membershipName1+"#"+membershipAmount1;
																		   String stat="no";
																		 
																		   Vector dispMembershipTypeVect=new Vector();
																 			dispMembershipTypeVect=(Vector)request.getAttribute("dispMembershipTypeVect");
																			 Enumeration itrators= (Enumeration)dispMembershipTypeVect.elements();
																 
																		   while(itrators.hasMoreElements()){
																		   String[] sarray = (String[]) itrators.nextElement();
					
																		   String memberTypeId = sarray[0];
																		   String membershipName = sarray[1];
																		   String membershipAmount = sarray[2];
																		   String cnct=memberTypeId+"#"+membershipName+"#"+membershipAmount;
																		   
																		   //memTypsel=objMember.getMembershipTypeName();
																		   
																		   if(memTypsel!=null)
																		   {
																		   if(memTypsel.equalsIgnoreCase(memberTypeId))
																		   {
																	             stat="yes";
																				 
																				 memberTypeId1 = memberTypeId;
																		   		 membershipName1 = membershipName;
																		   		 membershipAmount1 = membershipAmount;
																		         cnct1=memberTypeId1+"#"+membershipName1+"#"+membershipAmount1;
																      %>
																	  
																	  
																	  
																
								<div class='col-md-8 col-md-offset-2'>
									
									<div class='col-md-4 col-md-offset-1'>
									<input type="checkbox" name="membTypFee" value="<%=membershipAmount1%>" onclick="Sumup();"/>   <%=membershipName1%>
									</div>
									
									<div class='col-md-2'>
									<input name="mem_amt" id="mem_amt" readonly="readonly" class="form-control" value="<%=membershipAmount1%>" size="10" />
									</div>
								</div>
								
								<%}}}%>
																
								<input type="hidden" name="selected_mem" value="<%=cnct1%>" />																
								<input type="hidden" name="memb_avail" value="<%=stat%>" />
							</div>
					 
		 

                                <div class='form-group'>
								   <div class='col-md-offset-3'>
                                    <label class='control-label col-md-2' for='id_title'>Claim Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-5 indent-small'>
                                            <div class='col-md-offset-4'>
											  <i class="fa fa-dollar"></i>
                                               <input type="text" name="claimAmount" readonly="form-control" value="0" class="form-control"  />
                                            </div>
                                        </div>
										</div>

                                    </div>
									</div>
									
									<div class='form-group'>
									   <div class='col-md-offset-3'>
									     <label class='control-label col-md-2' for='id_title'>Reason: </label>
                                          <div class='col-md-8'>
                                            <div class='col-md-5 indent-small'>
                                            <div class='col-md-offset-4'>
                                               <textarea name="txtarea" class="form-control" rows="5"></textarea>
											   <span id="span_astriesk">*</span> 
                                            </div>
                                        </div>
									</div>	

                                    </div> 
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-4'>
                                        <button class='btn-lg btn-primary' name="subsub" type="submit" value="Apply Refund">Apply Refund</button>
										
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

</html>
