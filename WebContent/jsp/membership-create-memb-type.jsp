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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.math.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
        <script src="js/frmCreateMembType.js" type="text/javascript" ></script>
        <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
        <script language="javascript">
            function isnotInteger(str){
                stringIntCheck="0123456789";
                f2=1;
                for(j=0;j<str.length;j++)
                { if(stringIntCheck.indexOf(str.charAt(j))==-1)
                    {f2=0;}}
                if(f2==0)
                {alert('Enter valid priority'); document.frmCreateMembType.periodValue.focus();  return false;} else {   return true;}
            }
            function cancelAddRole()
            {
            if(confirm("Do you want to Cancel and go back to List Page?")){
                strURL = "./memberMaster.html?memProcess=initList";
                window.location.href = strURL;
                }
	  else
	    {
		return;
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
                            <h2>Membership Types-Human: Create</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				<p>You can Create a New Membership Type - Human for all members and non-members Online Services Dashboard, right here! </p>
                                    
                                    <!--Debugs Statrts Here-->
                                    <%
                                                // String status = (String) request.getAttribute("status");
                                                //  if (status != null) {
                                                //                 if (status.equalsIgnoreCase("false")) {%>
                                    <!--<tr>
                                        <td class="styleError" colspan="4">Membership Type already exists</td>
                                    </tr>-->

                                    <%//}   }%>
                                    <!--Debug Ends Here-->
      								
									      <form class='form-horizontal' role='form' name="frmCreateMembType" id="frmCreateMembType" method="post" action="./memberMaster.html" onsubmit="return myvalidate(); ">
                                                <input type="hidden" name="memProcess" value="createMemTyMaster"/>
                                                <input type="hidden" name="populYr" value="0" />
                                                <input type="hidden" name="memNme" value="" />
                                                    <!--<tr>
                                                                          <td colspan="2" class="tblRowHead">
																	Create Membership Type </td>
				 										 </tr>-->
                                                
												
												<p>Fields marked with an asterisk (<span style="color:#FF0000"> *</span>) are required.</p>
                                                   
                                                    <%
                                                                String status = (String) request.getAttribute("status");
                                                                if (status != null) {
                                                                    if (status.equalsIgnoreCase("false")) {%>
                                                    <p id="p_error">Membership Type already exists</p>
                                                   

                                                    <%}   }%>
                                                   
										
                              <div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input name="memName" id="memName" type="text" class="form-control"  /> 
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Cost $:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input name="memAmount" id="memAmount" type="text" class="form-control" /> 
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
										
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Duration:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input style="width:30px" type="text" class="textboxOne" name="DurationNoDdl" id="DurationNoDdl" />
                                                            <select style="width:145px" name="DurationTypeDdl" id="DurationTypeDdl" class="selectboxOne">
                                                                <option value="Select One">Select One</option>
                                                                <option  value="year">Year</option>
                                                                <option  value="month">Month</option>
                                                            </select> 
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
										
										
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input type="radio" name="rd1" style="margin:12px" id="status1" value="1"   />Active
                                                         <input type="radio" name="rd1" id="status2" style="margin:12px" value="0" />Inactive
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div> 
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Priority:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input style="width:50px;" name="periodValue" id="periodValue" type="text" class="form-control" maxlength="3" />
												</div>
											</div>
										</div> 
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>QB Transaction Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <select name="transacType" id="transacType" class="form-control" >
                                                                <option selected="selected" value="Select One">Select One</option>
                                                                <%
                                                                            ArrayList accDetails = (ArrayList) request.getAttribute("accDetails");
                                                                            if (accDetails != null && accDetails.size() != 0) {
                                                                                Iterator itr = accDetails.iterator();
                                                                                while (itr.hasNext()) {
                                                                                    String txnDet[] = (String[]) itr.next();

                                                                                    String txnId = txnDet[0];
                                                                                    String txnName = txnDet[1];
                                                                %>
                                                                <option value="<%=txnId%>"><%=txnName%></option>
                                                                <%	 }
                                                                            }
                                                                %>
                                                            </select> 
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>  
									</div>
									
									 <div class='form-group'>
										 	<div class='col-md-1 col-md-offset-4' gp>
									            <button class='btn-lg btn-primary' name="Button" type="submit" value="Create" onSubmit= "">Create</button>
											</div>
											<div class='col-md-1'>
									          <button class='btn-lg btn-primary' type="reset" style="margin-left:7px" name="reset"  value="Clear" onclick= "resetAll();">Clear</button>
											</div>
											<div class='col-md-1'>
												<button class='btn-lg btn-danger' type="button" value="Cancel"  onclick="cancelAddRole();">Cancel</button>
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
