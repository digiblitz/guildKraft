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
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmSponsReg.js" type="text/javascript" ></script>
<script src="js/refund-approve.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
 <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	<%String mid=(String)request.getAttribute("memid");%>
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
                            <h2>Membership: Refund Approval Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
    
	
		<form name="frmAdvMag" id="frmAdvMag" method="post" action="./RefundReqApproveAction.html" onSubmit="return frmRefoundAppval();">
                <input type="hidden" name="method" value="successApprove"/>
				
                <%
					String dispDate = "N/A";
					SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
					Date clDate = null;
					Calendar cal = Calendar.getInstance();
					GregorianCalendar gc = new GregorianCalendar();

					String id=request.getParameter("id");
                    int ids=Integer.parseInt(id);
                    Vector usrdet = new Vector();
                    usrdet = (Vector) request.getAttribute("refundDetail");
                    String[] details=(String[])usrdet.elementAt(ids);
					String[] cldat=details[5].split(" ");

					try{
						clDate = sd.parse(cldat[0]);
					}catch(Exception e){
						System.out.println("Error While Parsing Date: "+e);
					}
					
					gc.setTime(clDate);
					cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
					dispDate = sd1.format(cal.getTime());
					
                  %>  
			
        <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout">
          <tr> 
            <td colspan="2" class="tblRowHead">Approve Refund:</td>
          </tr>
		  <tr> 
            <td class="tableLeft">Date Of Request:</td>
            <th class="tableRight"><%=dispDate%></th>
          </tr>
          <tr> 
            <td class="tableLeft">First Name:</td>
            <th class="tableRight"><%=details[0]%></th>
          </tr>
          <tr> 
            <td class="tableLeft">Last Name:</td>
            <th class="tableRight"><%=details[1]%></th>
          </tr>
          <tr> 
            <td class="tableLeft">E-Mail ID: </td>
            <th class="tableRight"><%=details[15]%></th>
          </tr>
          <!--tr> 
            <td class="tableLeft">Date of Application: </td>
            <th class="tableRight">2006-08-29</th>
          </tr-->
          
			<!-- <input type="hidden" name="membid" value="<%=details[3]%>" /> -->
			<input type="hidden" name="membid" value="<%=mid%>" />
			<input type="hidden" name="refid" value="<%=details[2]%>" />
            <input type="hidden" name="userId" value="<%=details[16]%>" />
		  <!--tr> 
            <td class="tableLeft">Balance Amount: </td>
            <th class="tableRight">$500</th>
          </tr-->     
          <tr> 
            <td class="tableLeft">Claim Amount:</td>
            <td class="tableRight"><span class="styleBoldOne"><%=details[4]%></span></td>
			<input type="hidden" name="clamt" value="<%=details[4]%>" />

          </tr>
          <tr> 
            <td height="27" class="tableLeftTxtArea">Member Comments: </td>
            <td class="tableRight"><%=details[13]%>
			</td>
          </tr>
          <tr> 
            <td class="tableLeft">Approval Status: </td>
            <td class="tableRight"> <input type="radio" name="radiobutton" value="Approved" />
              Approved <input type="radio" name="radiobutton" value="Rejected" />
              Rejected</td>
          </tr>
          <tr> 
            <td class="tableLeft">Approved Refund Amount: </td>
            <td class="tableRight"><input type="text" name="appamt" class="textboxOne" size="25" /> 
              <span class="asterisk">*</span></td>
          </tr>
          <tr> 
            
          </tr>
          <tr> 
            <td class="tableLeft">&nbsp;</td>
            <td class="tableRight"><input type="submit" value="Submit" class="gradBtn" /></td>
          </tr>
        </table>
			
		</form>
	</div></div></div></div></div></div>
<div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>
</body>
</html>
