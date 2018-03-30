<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<script>
    function submitForm() {
       document.forms[0].submit();
    }
</script>
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
                            <h2>Membership: Refund Application Listings</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
                            
							
	
			<p>The Refund Applications are listed as follows. <br />
		
		To 'Finalize' an application, click on the 'Finalize' button beside it. </p>
	
		 <!-- <tr>
			<td colspan="4">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<th height="20" width="125" valign="top" class="alignRight" style="border-bottom:1px solid #999;">&nbsp;Color Legends:&nbsp; </th>
					<td valign="middle" class="alignLeft" style="border-bottom:1px solid #999;">
						<span class="legendTwo">&nbsp;</span> &nbsp;Finalize.					</td>
				  </tr>
				</table>			</td>
		  </tr>-->
		  <!--
		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
		      <a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			 </td>
		   </tr>
		  -->
		   <div class="form-group">
			<div class="col-md-12 gp">
				<div class="col-md-2 col-md-offset-2">
					<label class="control-label label1">Firstname</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">Lastname</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">Status</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">View</label>
				</div>
				
  			</div>
		</div>
		 
		  
                   <%
                        int i=0;
						Vector refundDetail=new Vector();
						refundDetail = (Vector) request.getAttribute("refundDetail");
                                                session.setAttribute("refundDetail",refundDetail);
                        
                        Enumeration en=refundDetail.elements();
                        
                        while(en.hasMoreElements())
                        {
                            String refdet[]=(String[])en.nextElement();
                            
                        if(refdet[1]!=null)
                        {%>
                        <form name="frmCntryMailList" id="myform" method="post" action="./AdminRefundStatusDisp.html">
                         <div class="form-group">
							<div class="col-md-12 gp">
								<div class="col-md-2 col-md-offset-2">
									<label class="control-label "><%=refdet[0]%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=refdet[1]%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=refdet[14]%></label>
								</div>
								<div class="col-md-2">
									<button class='btn-sm btn-primary' type='submit'  name="Submit2" value="View Details" onClick="javascript:submitForm();">View Details</button>
									
								</div>
								
							</div>
						</div>
						
                      <input type=hidden name="id" value="<%=i%>">
					  
                  </form>
						
                  <%   }  else {%>
					
							<div class="form-group">
								<div class="col-md-12 gp">
									<div class="col-md-4">
										</div>
									<div class="col-md-4">
										<p>No Records Found </p>
										</div>
								</div>
							</div>
			
                           
				                 
                <% } i++;   
                }%>    
		   
                   	  
		   <!--
		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
			<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
		   </tr>
		   -->
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
