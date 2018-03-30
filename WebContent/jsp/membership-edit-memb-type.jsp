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


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <script src="javascripts/validate.js" type="text/javascript" ></script>
        <script src="javascripts/frmCreateMembType.js" type="text/javascript" ></script>
        <script language="javascript">
            /*function isnotInteger(str){
        stringIntCheck="0123456789";
        f2=1;
        for(j=0;j<str.length;j++)
        { if(stringIntCheck.indexOf(str.charAt(j))==-1)
         {f2=0;}}
        if(f2==0)
        {alert('Enter valid priority'); document.frmCreateMembType.periodValue.focus();  return false;} else {   return true;}
        }	*/

            function clearFields(obj){
				//document.frmCreateMembType.memName.value="";
                document.frmCreateMembType.memAmount.value="";
                document.frmCreateMembType.periodValue.value="";
                document.frmCreateMembType.DurationNoDdl.value="";
                document.getElementById('frmCreateMembType').status1.checked=false;
                document.getElementById('frmCreateMembType').status2.checked=false;
                document.frmCreateMembType.transacType.options.selectedIndex = 0;
				document.frmCreateMembType.DurationTypeDdl.options.selectedIndex= 0;
                /*var vOptionsLen = 0;
                if(document.frmCreateMembType.DurationTypeDdl.options[document.frmCreateMembType.DurationTypeDdl.selectedIndex].value!='')
                {
                    document.frmCreateMembType.DurationTypeDdl.options.length = document.frmCreateMembType.DurationTypeDdl.options.length+1;
                    document.frmCreateMembType.DurationTypeDdl.options[document.frmCreateMembType.DurationTypeDdl.options.length-1].value = "";
                    document.frmCreateMembType.DurationTypeDdl.options[document.frmCreateMembType.DurationTypeDdl.options.length-1].text = "Select One";
                    document.frmCreateMembType.DurationTypeDdl.selectedIndex = 	document.frmCreateMembType.DurationTypeDdl.options.length-1;
                }
                for(var i=0;i<(obj.DurationTypeDdl.options.length-1);i++)
                {
                    if(document.frmCreateMembType.DurationTypeDdl.options[i].value=='')
                    {
                        vOptionsLen++;
                        document.frmCreateMembType.DurationTypeDdl.options.length = document.frmCreateMembType.DurationTypeDdl.options.length - vOptionsLen;
                        document.frmCreateMembType.DurationTypeDdl.selectedIndex = 	document.frmCreateMembType.DurationTypeDdl.options.length-1;

                    }
                }*/
                return true;
            }

            function cancelEditMember(){
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
            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership Types-Human: Edit</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
   
							 <%!
								String nullCheck(String fieldName) {
									String retValue = "";
									if (fieldName != null && fieldName.trim().length() != 0) {
										retValue = fieldName;
									}
					
									return retValue;
					
								}
					
							%>
						
						
						 <p>You can Edit/Update the Membership Type - Human created by you as given below. </p>
                                   
                              <form class='form-horizontal' role='form' name="frmCreateMembType" id="frmCreateMembType" method="post" action="./memberMaster.html" onsubmit="return myvalidate();">
                                 <input type="hidden" name="memProcess" value="memTyEdit"/>
                                                <%
                                                           String membershipName = "";
                                                            String yr = (String) request.getAttribute("year");
                                                %>
                                    <input type="hidden" name="populYr" value="<%=yr%>" />
                                        <input type="hidden" name="memNme" value="" />
                                                
                                                    <!--<tr>
                                                        <td colspan="2" class="tblRowHead">
						Edit Membership Type </td>
                                                    </tr>-->
                                                    <!--Debug Starts Here-->
                                                    <%
                                                                // String status = (String) request.getAttribute("status");
                                                                //   if (status != null) {
                                                                //     if (status.equalsIgnoreCase("false")) {
													%>
                                                    <!-- <tr>
                                                         <td class="styleError" colspan="4">Membership Type already exists</td>
                                                     </tr>-->
                                                    <%		//}
                                                                //      }
													%>
                                                    <!--Debug Ends Here-->
                                         <p>Fields marked with an asterisk (<span style="color:#FF0000"> *</span>) are required.</p>
                                                    
                                                    <%
                                                                String status = (String) request.getAttribute("status");
                                                                if (status != null) {
                                                                    if (status.equalsIgnoreCase("false")) {
                                                    %>
                                                     <p id="p_error">Membership Type already exists</p>
                                                    
                                                    <%		membershipName=(String)request.getAttribute("memName");
                                                                    }
                                                                }
                                                    %>

                                                    <%
                                                                String[] subType = (String[]) session.getAttribute("displayEditMemDetails");
                                                                String membershipTypeId = "";
                                                                String membershipTypeName = "";
                                                                String membershipAmount = "";
                                                                String userTypeId = "";
                                                                String periodValue = "";
                                                                String mDate = "";
                                                                String transacTypeId = "";
                                                                String DurationNo = "";
                                                                String DurationType = "";
                                                                int active_status = 0;
                                                                int membership_year = 0;

                                                                if (subType != null) {
                                                                    membershipTypeId = subType[0];
                                                                    membershipTypeName = subType[1];
                                                                    userTypeId = subType[2];
                                                                    membershipAmount = subType[3];
                                                                    mDate = subType[4];
                                                                    periodValue = subType[5];
                                                                    transacTypeId = subType[6];
                                                                    DurationNo = subType[7];
                                                                    DurationType = subType[8];
                                                                    active_status = Integer.parseInt(subType[9]);
                                                                    membership_year = Integer.parseInt(subType[10]);

                                                                    if (periodValue == null) {
                                                                        periodValue = "";
                                                                    }
                                                                }

                                                                String uTypeId = (String) request.getAttribute("uTypeId");
                                                    %>
                                                    <input type="hidden" id="memId" name="memId" value="<%=membershipTypeId%>"/>
                                                    <input type="hidden" id="memyear" name="memyear" value="<%=membership_year%>"/>
                                               
											   
							 <div class='form-group'>
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                      <% 
														System.out.print("Name" +membershipName);
														if(membershipName=="")
														{     %>
                                                      <input name="memName" id="memName" type="text" class="form-control" value="<%=membershipTypeName%>" readOnly="true"/>
														<%}
														else{
															%>
													 <input name="memName" id="memName" type="text" class="form-control" value="<%=membershipName%>" readOnly="true"/>
															 <% } %>
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
											
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Cost $:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input name="memAmount" id="memAmount" type="text" maxlength="16" value="<%=membershipAmount%>" class="form-control" /> 
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>		
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Duration:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input type="text" value="<%=DurationNo%>" name="DurationNoDdl" id="DurationNoDdl" maxLength="3" class="textboxOne" style="width:30px;"/>

                                                            <select style="width:145px" name="DurationTypeDdl" id="DurationTypeDdl" class="selectboxOne">
															<option selected="selected" value="">Select One</option>

                                                                <%
                                                                            if (DurationType.equals("year")) {
                                                                %>

                                                                <option selected="selected" value="year">Year</option>
                                                                <option value="month">Month</option>

                                                                <%                                                                                                                                                 } else {
                                                                %>
                                                                <option selected="selected" value="month">Month</option>
                                                                <option value="year">Year</option>
                                                                <%}%>

                                                            </select> 
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
										
										
                                  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                         <%

                                                                    if (active_status == 1) {
                                                        %>
                                                       <input type="radio" name="rd1" id="status1" style="margin:12px" value="active" checked="true"  />Active
                                                      <input type="radio" name="rd1" id="status2" style="margin:12px" value="inactive" />Inactive  
                                                            <%               } else {
                                                            %>
                                                        <input type="radio" name="rd1" id="status1" style="margin:12px"  value="active" />Active
                                                      <input type="radio" name="rd1" id="status2"  style="margin:12px" value="inactive" checked="true"/>Inactive 
                                                            <% }%>
															
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div> 
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Priority:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                       <input style="width:50px;" name="periodValue" id="periodValue" type="text"   value="<%=periodValue%>" class="form-control" />
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
                                                                                    if (transacTypeId != null) {
                                                                                        if (transacTypeId.equalsIgnoreCase(txnId)) {
                                                                %>
                                                                <option value="<%=txnId%>" selected="selected"><%=txnName%></option>
                                                                <%	} else {%>
                                                                <option value="<%=txnId%>"><%=txnName%></option>
                                                                <%	}
                                                                 } else {%>
                                                                <option value="<%=txnId%>"><%=txnName%></option>
                                                                <%}
                                                                                }
                                                                            }
                                                                %>
                                                      </select> 
													    <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>  
									</div>
									
                                          <input type="hidden" value="<%=membershipTypeId%>" name="memId" />
										  
										 <div class='form-group'>
										 	<div class='col-md-1 col-md-offset-4' gp>
									            <button class='btn-lg btn-primary' name="Button" type="submit"  value="Update">Update</button>
											</div>
											<div class='col-md-1 '>
									          <button class='btn-lg btn-primary' name="Clear" style="margin-left:7px" type="reset"  value="Clear"  onClick = "clearFields(this.form)" >Clear</button>
											</div>
											<div class='col-md-1 '>
												<button class='btn-lg btn-danger' type="button" value="Cancel" onclick="cancelEditMember()">Cancel</button>
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
