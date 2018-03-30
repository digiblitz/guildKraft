<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
 <%@ page import="java.util.*" %> 
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="javascripts/frmMeeICPValid.js" type="text/javascript" /></script>
 
<script type="text/javascript">
 function MM_openBrWindow(theURL,winName,features) {  
  window.open(theURL,winName,features);
}
function dis_able(){
	document.frmMeeUserICPAssessInsure.membno.disabled=true;
	document.frmMeeUserICPAssessInsure.membno.value="";
}
function call(obj){
	if((document.frmMeeUserICPAssessInsure.membno.value=="")||(document.frmMeeUserICPAssessInsure.membno.value.indexOf(' ')==0)){
		document.frmMeeUserICPAssessInsure.hlcmemb.focus();
	}
	else{
		HLCMemberDetails(obj);
	}
}
</script>

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
                            <h2>Meetings: Insurance Release - ICP Assessment</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeUserICPAssessInsure" id="frmMeeUserICPAssessInsure" method="post" action="IcpUsrMeetList.html" onsubmit="return myvalidate();">
							
                                <input type="hidden" name="process" value="apply">
								
								<div class='panel-heading col-md-offset-2'>
									<h2>Activity Details:</h2>
								</div>
								
								<%
                                    Vector icpMeeList=new Vector();
                                    icpMeeList=(Vector)request.getAttribute("meeDetapp");
                                    System.out.println("size :"+icpMeeList.size());
                                                        
									if(icpMeeList!=null && icpMeeList.size()!=0)
									{
									  Enumeration en=icpMeeList.elements();    
																	
									while(en.hasMoreElements())
									{
										 String[] icpVal = (String[])en.nextElement();
										 String dat1=icpVal[2];
										  String[] dat=dat1.split(" ");
                                 %>
								 
								  <input type="hidden" name="mid" value="<%=icpVal[0]%>" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name of Activity</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" readonly="true" class="form-control" value="<%=icpVal[1]%>" name="textfield" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" readonly="true" value="<%=icpVal[26]%>" name="textfield2" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date(s)to be held</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" readonly="true" value="<%=dat[0]%>" name="textfield4" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Location</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" readonly="true" value="<%=icpVal[5]%>" name="textfield3" /> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" readonly="true" value="<%=icpVal[32]%>" name="textfield32" />
                                            </div>
                                        </div>

                                    </div>
								</div>
								
							<div class='form-group'>
								<div class='col-md-offset-2'>
								<a href="javascript:MM_openBrWindow('terms-conditions.html','terms','width=520,height=565')" class="linkFour">View Terms &amp; Conditions</a> 
								</div>
								
								<div class='col-md-offset-2'>
								<input type="checkbox" name="chkAccept" value="checkbox" />  
								I Agree to the terms and conditions.
								</div>
								
							</div>
							
							<div class='panel-heading col-md-offset-2'>
								<h2>Participant&#8217;s Details:</h2>
							</div>
							
						<% 
							ArrayList listContact = (ArrayList) request.getAttribute("userInfo");
							String prefix1="";
							String first_name = "";
							String middle_name = "";
							String last_name = "";
							String sufix = "";
							String email_id = "";
							String suite = "";
							String address1 = "";
							String address2 = "";
							String city = "";
							String state = "";
							String country = "";
							String zip = "";
							String phone_no = "";
							String mobile_no = "";
							String fax_no = "";
							
							if(listContact !=null && listContact.size()!=0){
								Iterator it = listContact.iterator();
								while(it.hasNext()){			
									prefix1 = (String)it.next();
									if(prefix1==null)
									prefix1 = "- N.A -";
									first_name  = (String)it.next();
									if(first_name==null)
									first_name = "- N.A -";
									middle_name  = (String)it.next();
									if(middle_name==null)
									middle_name = "- N.A -";
									last_name = (String)it.next();
									if(last_name==null)
									last_name = "- N.A -";
									sufix =  (String)it.next();
									if(sufix==null)
									sufix = "- N.A -";
									email_id  = (String)it.next();
									if(email_id==null)
									email_id = "- N.A -";
									suite =  (String)it.next();
									if(suite==null)
									suite = "- N.A -";
									address1 =  (String)it.next();
									if(address1==null)
									address1 = "- N.A -";
									address2 = (String)it.next();
									if(address2==null)
									address2 = "- N.A -";
									city = (String)it.next();
									if(city==null)
									city = "- N.A -";
									state =  (String)it.next();
									if(state==null)
									state = "- N.A -";
									country = (String)it.next();
									if(country==null)
									country = "- N.A -";
									zip = (String)it.next();
									if(zip==null)
									zip = "- N.A -";
									phone_no = (String)it.next();
									if(phone_no==null)
									phone_no = "- N.A -";
									mobile_no = (String)it.next();	
									if(mobile_no==null)
									mobile_no = "- N.A -";
									fax_no = (String)it.next();
									if(fax_no==null)
									fax_no = "- N.A -";
									}
								}
						  %>
								
								
								 <div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email Id</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" readonly="true" value="<%=email_id%>" name="textfield34" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" readonly="true" value="<%=first_name%>" name="textfield35" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" readonly="true" value="<%=last_name%>" name="textfield35" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" readonly="true" value="<%=address1%>&nbsp;<%=address2%>" name="textfield36" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Country</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" readonly="true" value="<%=country%>" name="textfield37" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" readonly="true" value="<%=state%>" name="textfield3723" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" value="<%=city%>" readonly="true" class="form-control" name="textfield372" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip Code</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" value="<%=zip%>" readonly="true" class="form-control" name="textfield3722" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" readonly="true" value="<%=phone_no%>" class="form-control" name="textfield373" /> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" value="<%=fax_no%>" readonly="true" name="textfield373" /> 
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								<div class='panel-heading col-md-offset-2'>
								<h2>Other Information:</h2>
								</div>
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Are You a member?</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          	<input type="radio" name="hlcmemb" readonly="true" value="yes" onclick="isRadio();" /> Yes 
							 
							  				<input type="radio" name="hlcmemb" value="no" checked="checked" onclick="dis_able();" /> No
							 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If yes, Your Membership Number</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          	<input type="text" class="form-control" name="membno" onblur="call(this);" disabled="disabled"/>
							 
                                            </div>
                                        </div>

                                    </div>
							
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'  name="sub" value="Apply">Apply</button>
										
                                    </div>
                                   
                                </div>
								
								<%}}else{%>
						 
                                <% }%>
								
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
