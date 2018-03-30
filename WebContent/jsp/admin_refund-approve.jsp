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
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmSponsReg.js" type="text/javascript" ></script>
<script src="javascripts/frmAdminRefundApproval.js" type="text/javascript" ></script>
<script src="javascripts/AdvMagval.js" type="text/javascript" ></script>
<script src="javascripts/calendar2.js" type="text/javascript" ></script>
<script  src="js/ts_picker.js"></script>
<script src="js/datetimepicker_css.js"></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
<style>


#calendar2 {
    float: right;
    display: inline-block;
    position: absolute;
    right: 20px;
    top: 7px;
    font-size: 20px;
    color: #3498db;
}
</style>
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
                            <h2>Membership: Refund Approval Form</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
 
	
		<form name="frmAdvMag" id="myform" method="post" action="./AdminRefundStatusDisp.html?process=update" onsubmit="return myvalidate(this);">
        
		<%
			 Vector refundDetail=new Vector();
                         refundDetail = (Vector) request.getAttribute("refundDetail");
                         
                         Vector refundTyp=new Vector();
                         refundTyp = (Vector) request.getAttribute("refundTyp");
                         
                         String id=(String)request.getAttribute("reid");
                         int ct=Integer.parseInt(id);
                         String[] refund=(String[])refundDetail.elementAt(ct);
                         
                         System.out.println("Size :" +refundDetail.size());
                         String[] reqdate=refund[5].split(" ");
                                 
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

			
        <p class="para">Approve Refund:</p>
		  <div class='form-group'>
							
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date Of Request:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					<label class='control-label'><%=dateFormat(reqdate[0])%></label>
						</div>
					</div>
				</div>
           
            <input type="hidden" name="refundid" value="<%=refund[2]%>" />
            <input type="hidden" name="membstat" value="Approved" />
            <input type="hidden" name="memid" value="<%=refund[3]%>" />
            <input type="hidden" name="userId" value="<%=refund[16]%>" />
         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					<label class='control-label'><%=refund[0]%></label>
						</div>
					</div>
				</div>   
           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					<label class='control-label'><%=refund[1]%></label>
						</div>
					</div>
				</div>   
             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>E-Mail ID:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
								<label class='control-label'><%=refund[15]%></label>
						</div>
					</div>
				</div>
         
         
          <!--tr> 
            <td class="tableLeft">Date of Application: </td>
            <th class="tableRight">2006-08-29</th>
          </tr-->
          <!--<tr> 
            <td class="tableLeft">Member Id:</td>
            <th class="tableRight"></th>
          </tr>-->
          <!--tr> 
            <td class="tableLeft">Balance Amount: </td>
            <th class="tableRight">$500</th>
          </tr-->   
          
          <%
                String clAmt="0.00";
                
                if(refund[4]!=null)                    
                clAmt=refund[4];
          %>
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Claim Amount:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					<label class='control-label'><%=clAmt%></label>
						</div>
					</div>
				</div>
		
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Comments:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
							<label class='control-label'><%=refund[13]%></label>
						</div>
					</div>
				</div>
       
         
          
          <% 
          
          String appAmt="0.00";
          
          if(refund[6]!=null)
          appAmt=refund[6];
          
          %>
		  <div style="display:inline-block;width:100%;">
           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approved Refund Amount($):</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					<label class='control-label'><%=appAmt%></label>
						</div>
					</div>
				</div>
			</div>
		
		<%
                Enumeration en=refundTyp.elements();
                while(en.hasMoreElements())
                {
                    String[] refTyp=(String[])en.nextElement();
                    System.out.println(refTyp.length);
                %>
          <div class="form-group"> 
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'><%=refTyp[2]%></label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<label class="control-label">$<%=refTyp[3]%></label>
           
					</div>
				</div>
			</div>
 	        
           
                <%}%>
				
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Refund Date:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					     <input type="text" name="refunddate" id="date" class="form-control" readonly >
						  <a onclick="javascript:NewCssCal('date')"><i id="calendar2" class="fa fa-calendar"></i></a>
						</div>
					</div>
				</div>
             				
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Refund By:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					     <input type="text" name="refundby" class="form-control" > 
						</div>
					</div>
				</div>		
           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Checkque date:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					     <input type="text" name="chequedate" id="date" class="form-control" readonly >
						 <a onclick="javascript:NewCssCal('date')"><i id="calendar2" class="fa fa-calendar"></i></a>
						</div>
					</div>
				</div>	
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Checkque number:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					    <input type="text" name="chequeno" class="form-control"  > 
						</div>
					</div>
				</div>
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank name:</label>
				<div class='col-md-8'>
					<div class='col-md-3 indent-small'>
						<div class='form-group internal'>
					    <input type="text" name="bankname" class="form-control"  >
						</div>
					</div>
				</div>
			</div>	
         
          <!--tr> 
            <td class="tableLeftTxtArea">Department Comments: </td>
            <td class="tableRight">
              <textarea name="textarea" class="textAreaOne" rows="5"></textarea>
              <span class="asterisk">*</span></td>
          </tr-->
                       <div class="form-group">
							 <div class='col-md-offset-4 col-md-2'>
								<button type="submit" value="Submit"class='btn-lg btn-primary'>Submit</button>
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
			
				<%@ include file = "../../include/Footer_temp.jsp" %>
				
			<!--==============================include chat Here=================================-->
</body>


<script language="javascript">
	var cal1 = new calendar2(document.forms['frmAdvMag'].elements['refunddate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2 = new calendar2(document.forms['frmAdvMag'].elements['chequedate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
</script>
</html>
