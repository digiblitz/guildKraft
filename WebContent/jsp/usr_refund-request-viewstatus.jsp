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

<script src="js/frmSponsReg.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>

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
 
	
	  <%
           /*
            * Display Refund details 
            ***
            *
            */
        
            String id=request.getParameter("id");
            int ids=Integer.parseInt(id);
            Vector refundDetail = new Vector();
            refundDetail = (Vector) request.getAttribute("refundDetail");
            String[] refdet=(String[])refundDetail.elementAt(ids);
		//	String[] membid={details[4],details[7]};
		//	session.setAttribute("usrdet",membid);
                //   	System.out.println(" ref approve Jsp Mid from Jsp :" +membid[0] +" "+"Refund Id Jsp:"+membid[1]);
            
            String[] dat=refdet[3].split(" ");
            String rid=refdet[0];
            String bal="0.00";
            String clamt="0.00";
            String comment="";
            String appamt="0.00";
          	String approval_status = "false";
            if(refdet[10]!=null)
            {
                bal=refdet[10];
            }
            if(refdet[2]!=null)
            {
                clamt=refdet[2];
            }
            if(refdet[11]!=null)
	   {
                comment=refdet[11];
	   }
            if(refdet[4]!=null)
	   {
                appamt=refdet[4];
	   }
		   approval_status = refdet[13];
            String[] ref={dat[0],bal,clamt,comment,appamt,rid,refdet[12]};
            session.setAttribute("refdet",ref);
     %>
	 
	 	<div class="col-md-10">
			<div class='container'>
				<div class='panel panel-primary dialog-panel'>
				
						<div class='panel-heading'>
                            <h2>My Request Detail:</h2>
						</div>
						
						 <div class='panel-body'>
	 
	   
		<form class='form-horizontal' role='form' name="frmAdvMag" id="myform" method="post" action="./UsrRefundClaimDisp.html">
		  
					
					<!--==============================Form Title=================================-->
                        
         
		  		<div class='form-group'>
                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date Of Request:</label>
					 <div class='col-md-8'>
                           <div class='col-md-3 indent-small'>
                               <div class='form-group internal'>
							   		<label class="control-label"><%=dateFormat(dat[0])%></label>
								</div>
							</div>
					</div>
			
           
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Balance Amount:</label>
             <div class='col-md-8'>
                 <div class='col-md-3 indent-small'>
                     <div class='form-group internal'>
					 	<label class="control-label">$<%=bal%></label>
					 </div>
				</div>
			</div>
							
           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Claim Amount:</label>
           <div class='col-md-8'>
                 <div class='col-md-3 indent-small'>
                     <div class='form-group internal'>
					 	<label class="control-label">$<%=clamt%></label>
					 </div>
				</div>
			</div>
           
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>My Comments: </label>
            <div class='col-md-8'>
                 <div class='col-md-3 indent-small'>
                     <div class='form-group internal'>
					 	<label class="control-label"><%=comment%></label>
					 </div>
				</div>
			</div>
		</div>
			
			
        	<div class="form-group">
			
               <label class="control-label label1  col-md-3 col-md-offset-1">Request Status Detail:</label>
			
        	</div>	
				
		<div class='form-group'>	
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Status: </label>
          		 <div class='col-md-8'>
                 	<div class='col-md-3 indent-small'>
                    	 <div class='form-group internal'>
						 	<label class="control-label"><%=refdet[12]%></label>
					 </div>
				</div>
			</div>
			
         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approved Amount:</label>
             <div class='col-md-8'>
                 <div class='col-md-3 indent-small'>
                     <div class='form-group internal'>
					 	<label class="control-label">$<%=appamt%></label>
					 </div>
				</div>
			</div>
		</div>
			
         
            <%
			Double d=new Double(bal);
			//Double e=new Double();
			double e=d.parseDouble(bal);

			//String[] balsplit=bal.split(".");
			System.out.println(e);
           // String stat=(String)request.getAttribute("balanceStatus");
			if(approval_status.equalsIgnoreCase("Approved")){
			%>
			
			<div class='form-group'>
                 <div class='col-md-offset-5 col-md-1'>
                      <button class='btn-lg btn-primary' type='button' onclick="javascript:history.back(-1);" >Back</button>
                  </div>
			</div>
         
			<%}
			else if(refdet[12].equalsIgnoreCase("Approved") && e!=0.0)
            {%>
			<div class='form-group'>
                 <div class='col-md-offset-4 col-md-2'>
										
				<button class='btn-lg btn-primary' type='submit' >Apply request</button>
			</div>
		</div>
		
         
          
		  <%}
		  else{%>
		  		
		  		<div class='form-group'>
                 <div class='col-md-offset-5 col-md-1'>
                      <button class='btn-lg btn-primary' type='button' onclick="javascript:history.back(-1);" >Back</button>
                  </div>
			</div>
          
          <%}%>
       
 
			
		
		  
	
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
