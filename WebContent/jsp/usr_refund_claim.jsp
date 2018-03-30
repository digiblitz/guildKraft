<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="javascripts/frmAppRefundval.js" type="text/javascript" ></script>
<script src="javascripts/frmSponsReg.js" type="text/javascript" ></script>
<script src="javascripts/MemberRefund.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
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
			
			
					 <%!
						SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
						SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
						
						String dateFormat(String fieldName){					
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
							String dispDate = "N/A";
							if(clDate!=null ){
							dispDate = sd1.format(cal.getTime());
							}
							return dispDate;
						}
					%>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership: Refund Application Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Please indicate how disperse your approved refund.
Select one or more  Refund Type categories below, and enter dollar amounts up to the Balance Amount shown. 

If you choose Check/Credit Card Refund, then amount entered will be refunded based on the original payment method.	</p>
							
						<!--==============================Form Description=================================-->
							
                           <%		
								 String[] claimdet=(String[])session.getAttribute("refunddet");
										 Vector refundTyp=new Vector();
										 refundTyp=(Vector)request.getAttribute("refundTyp");
										
										// session.setAttribute("claimdet",claimdet);
							%>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmAdvAppRefund" id="frmAdvAppRefund" method="post" action="./UsrRefClaim.html" onSubmit= "return Dispall();">
							
                               
									<label class="control-label label1">Apply Refund:</label>
								

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date Of Approval:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=dateFormat(claimdet[0])%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Balance Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'>$<%=claimdet[1]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Requested Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'>$<%=claimdet[2]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approved Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'>$<%=claimdet[4]%></label>
                                            </div>
                                        </div>

                                    </div>
								
                                </div>
								
								<input type="hidden" name="ridId" value="<%=claimdet[5]%>"/>
            
								<input type="hidden" name="cbxct" value="<%=refundTyp.size()%>"/>
					
								 <input name="approveamt" type="hidden" value="<%=claimdet[4]%>" />
								 
								 
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Refund Type:</label>
                                    <div class='col-md-8'>
                                        
												<% Enumeration en=refundTyp.elements();
																		int chksfx=0;
														while(en.hasMoreElements()) 
													{
														 String[] refundDet=(String[])en.nextElement();
														
														  String cbx="refundcb";
														  String tb="refundtb";
														  String cbxname=cbx+Integer.toString(chksfx);
														  String tbname=tb+Integer.toString(chksfx);
													%>
													
										<div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input type="checkbox"  name="<%=cbxname%>" value="<%=refundDet[0]%>" /><%=refundDet[1]%>
					
											</div>
										</div>
										
										
										
										<div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i>
											<input type="text" name="<%=tbname%>" class="form-control"  />
											</div>
										</div>
										
								
										
								 <%chksfx++;}%>		
								 
								</div>
							</div>	
										
										
										
									

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="subsub" type="submit" value="Submit">Submit</button>
										 
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
