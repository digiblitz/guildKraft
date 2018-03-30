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
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="javascripts/validate.js" type="text/javascript" ></script>
  
</head>
<script>
    function submitForm() {
       location.href = "refund.html?method=refundRequestViewStatus"
    }
</script>
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
                            <h2>Membership Refund Application Listings:</h2>
							</div>
				 <div class='panel-body'>
					<div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-2">
									<label class='control-label label1'>Claim Date</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Claim amount</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Approved amount</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Balance Amount</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Status</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>&emsp;View</label>
								</div>
								
							
						   
						</div>
					</div>
				</div>
							
							
							
							
						   
						   
				 
	
                   <%
                      Vector refundDetail=new Vector();
                      refundDetail = (Vector) request.getAttribute("refundDetail");
       		      request.setAttribute("refundDetail",refundDetail);
                      Enumeration en=refundDetail.elements();
                      
		       int i=0;
                      
                       String clamt;
                       String appamt;
                       String balamt;
                       String stat;
                       
					  if(refundDetail!=null && refundDetail.size()!=0)
					  {
					  
					  System.out.print("refundDetail.size() in jsp :"+refundDetail.size());
					  
                      while(en.hasMoreElements())
                      {
					  String[] usrrefdet=(String[])en.nextElement();
					 
					  String[] dat=usrrefdet[3].split(" ");
					  
					  if(usrrefdet[2]!=null)
					  {
					  	clamt=usrrefdet[2];
					  }else{
					  	clamt="0.00";
					  }
					  if(usrrefdet[4]!=null)
					  {
					  	appamt=usrrefdet[4];
                                                
                                          }else{
					  	appamt="0.00";
					  }
					  
					  if(usrrefdet[10]!=null)
					  {
					  	balamt=usrrefdet[10];
                                          }
					  else{
					  	balamt="0.00";
					  }
					  
					  if(usrrefdet[12]!=null)
					  {
					  	stat=usrrefdet[12];
					  }
					  else{
					  	stat="";
					  }
					  					   
						%> 
			   
			<form class='form-horizontal' role='form' name="frmCntryMailList" id="myform" method="post" action="./UsrRefundReqListAction.html">
				<div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
									   <div class='col-md-2'>
									   		<label class='control-label'>&emsp;&nbsp;<%=dateFormat(dat[0])%></label>
										</div>
										
										<div class='col-md-2'>
									   		<label class='control-label'>&emsp;<%=amtFormat(clamt)%></label>
										</div>
										
										<div class='col-md-2'>
									   		<label class='control-label'>&emsp;<%=amtFormat(appamt)%></label>
										</div>
									
										<div class='col-md-2'>
									   		<label class='control-label'>&emsp;<%=amtFormat(balamt)%></label>
										</div>
										
										<div class='col-md-2'>
									   		<label class='control-label'><%=stat%></label>
										</div>
										
						<input type=hidden name="id" value="<%=i%>">
						<input type=hidden name="rId" value="<%=usrrefdet[0]%>">
						 <input type=hidden name="id" value="<%=i%>">
						 <input type=hidden name="rId" value="<%=usrrefdet[0]%>">
												
							<div class='col-md-2'>
										
								<button class='btn-sm btn-primary' type='submit'>View</button>
										</div>	
										
									</div>
								</div>
							</div>
						
								    
            
                       
			
			<!--<td bgcolor="#E3E1D2" class="alignLeft"><input type="submit" name="Submit2" value="View" class="oneBtn" /></td>-->
			 </form>
          
                  <%   i++; }}else{%>
				<div class='form-group'>
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
												No Records Found !!
											</div>
										</div>
									</div>
								</div>
					
				 <% }
                 %> 
				 	<div class='form-group'>
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
											<a href="./RefundReqDisp.html" >Apply For Refund Request</a>	
											</div>
										</div>
									</div>
								</div>   

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
