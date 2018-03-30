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

<%@ page import="com.hlcform.util.*" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script language="javascript">


function radValid(){

var lenques=document.frmUserSignup.info_rad.length;

if(lenques==undefined)
{

if(document.frmUserSignup.prof_rad[1].checked==true){
document.frmUserSignup.info_rad.checked=false;
}
}
else {
for(i=0;i<lenques;i++)
{
if(document.frmUserSignup.prof_rad[1].checked==true)
 { document.frmUserSignup.info_rad[i].checked=false; }
}


}
}


function chstat()
{
var lenques=document.frmUserSignup.info_rad.length;

if(lenques==undefined)
{
	if(document.frmUserSignup.info_rad.checked)
	{
		document.frmUserSignup.prof_rad[0].checked=true;
		document.frmUserSignup.prof_rad[1].checked=false;

	}
	
}
else
{

for(i=0;i<lenques;i++)
{
if(document.frmUserSignup.info_rad[i].checked)
 { chosenquest= document.frmUserSignup.info_rad[i].value; }

}
if(chosenquest!="")
{
	document.frmUserSignup.prof_rad[0].checked=true;
	document.frmUserSignup.prof_rad[1].checked=false;	
	
}
}

}


function myValidate()
{
var lenques=document.frmUserSignup.info_rad.length;
var chosenquest="";

if(lenques==undefined)
{
	if(document.frmUserSignup.info_rad.checked)
	{
		if(document.frmUserSignup.prof_rad[0].checked==false && document.frmUserSignup.prof_rad[1].checked==false)
		{
			alert("Please Check any Option for Profile match !");
			return false;
		}		

	}
	else
	{
		if(document.frmUserSignup.prof_rad[0].checked)
		{
			alert("Please Check any One Of Profiles that Matches you !");
			return false;
		}
	}
	
}
else
{

for(i=0;i<lenques;i++)
{
if(document.frmUserSignup.info_rad[i].checked)
 { chosenquest= document.frmUserSignup.info_rad[i].value; }

}
if(chosenquest!="" && chosenquest!="null")
{
	if(document.frmUserSignup.prof_rad[0].checked==false && document.frmUserSignup.prof_rad[1].checked==false)
		{
			alert("Please Check any Option for Profile match !");
			return false;
		}	
	
}
else
{
	if(document.frmUserSignup.prof_rad[0].checked)
		{
			alert("Please Check any One Of Profiles that Matches you !");
			return false;
		}
}

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
                            <h2>User Registration: Account Matching Result</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
     
    							<%
									String source = (String)request.getAttribute("source");
									String eventTypeId = (String)request.getAttribute("eventTypeId");
									String compYear = (String)request.getAttribute("compYear");
								%>
                      <form name="frmUserSignup" method="post" id="myform" action="MemberUsrSignUp.do" onsubmit="return myValidate();">
                        <table border="0" cellpadding="0" align="center" cellspacing="0" class="formLayout" width="630">
                          <input type="hidden" name="source" value="<%=source%>" />
                          <input type="hidden" name="eventTypeId" id="eventTypeId" value="<%=eventTypeId%>" />
                          <input type="hidden" name="compYear" id="compYear" value="<%=compYear%>" />
                          <input type="hidden" name="process" value="auth" />
                         
						  <%    HLCUsrSignUpVO usrVal1=new HLCUsrSignUpVO();
									  		int j=0;
											int count1=0;
											String memberID="";
                                        	ArrayList usrDet1=new ArrayList();
											usrDet1=(java.util.ArrayList)request.getAttribute("membDetails");
									  		if(usrDet1!=null){
												for(j=0;j<usrDet1.size();j++){
												usrVal1=(HLCUsrSignUpVO)usrDet1.get(j);
												String statusName=usrVal1.getStatusName();
												memberID=usrVal1.getMembid();
													if((statusName!=null && statusName.equalsIgnoreCase("Duplicate")) || (statusName!=null && statusName.equalsIgnoreCase("Merged"))){
													count1=count1+1;
													}
												}
											}
									  		System.out.println("usrDet1 :"+usrDet1.size());
									  		System.out.println("count1 :"+count1);
									  		if(usrDet1.size()!=count1){%>
                        
						 <div class="form-group">
	                         <label class="control-label label1">Matching Results:</label>
						</div>	
										 
                            <p>Similar account(s) already exists. They are as such:
                               
                              Select the result that matches your profile to proceed with the sign up process. </p>
                          
                          <%HLCUsrSignUpVO usrVal=new HLCUsrSignUpVO();
											int i=0;
                                                                                        
											ArrayList usrDet=new ArrayList();
											usrDet=(java.util.ArrayList)request.getAttribute("membDetails");
											
											 if(usrDet!=null)
											{
                                                                                            
                                            System.out.println("usrDet.size() in jsp :"+usrDet.size());

											for(i=0;i<usrDet.size();i++)
											{
												usrVal=(HLCUsrSignUpVO)usrDet.get(i);
												
												String statusName="";
												statusName=usrVal.getStatusName();
												System.out.println("statusName :"+statusName);
										%>
                          				<%
											  if((statusName!=null) && (!(statusName.equalsIgnoreCase("Duplicate")))){	
											 
											  if((statusName!=null) && (!(statusName.equalsIgnoreCase("Merged")))){
											  
											  %>
                        
						 <div class="form-group">
						 	<input type="radio" name="info_rad" value="<%=usrVal.getUserId()%>" onclick="chstat();"/>Information <%=i+1%>
						 </div>
                                      
                             <div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                 				<input name="firstName" id="firstNameId" class="form-control" value="<%=usrVal.getFname()%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;"  readonly="readonly" />  
											</div>
										</div>
									</div>
									
									                               
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                 				<input name="lastName" id="lastNameId" class="form-control" value="<%=usrVal.getLname()%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;"  readonly="readonly" />  
											</div>
										</div>
									</div>
									
									                               
                               				 <%

												String digno="";
												if(usrVal.getPhone()!=null)
												{
				
													String ph=usrVal.getPhone();
													int phlen=ph.length();

													if(phlen>4)
													{
														int rstsiz=phlen-4;
														digno=ph.substring(rstsiz,phlen);
													}
													else
													{
														digno=usrVal.getPhone();
													}													
												}

												String emailId="";
												if(usrVal.getEmail()!=null){
													String email=usrVal.getEmail();
													int indx = email.indexOf("@");
													emailId = email.substring(indx+1);                                                                                                    
													System.out.print("emailId :"+emailId);
												}
												
												String zp="";
												if(usrVal.getZip()!=null){
													String zip = usrVal.getZip();
													if(zip.length()>2){

														zp = zip.substring(0,2);
													}else{
														zp = zip;
													}         System.out.print("zip : " +zp);                                           
												}


													String usid="";
												if(usrVal.getUserId()!=null){
													String hlcid=usrVal.getUserId();
													if(hlcid.length()>2){
														usid=hlcid.substring(0,2);                                                                                                        
													}else{
														usid = hlcid;                                                                                                                
													}
												}

                                                String mId="N/A";
                                                                                                
												if(usrVal.getMembid()!=null)
												{
													String hlcid=usrVal.getMembid();
													
													if(hlcid.length()>2){
														mId=hlcid.substring(0,2);                                                                                                        
													}else{
														mId = hlcid;                                                                                                               													
													}
													
                                                }
                                                                                                
												%>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email  (Last domain):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                     			 xxxxxx@<input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=emailId%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;"  readonly="readonly" />  
												 
											</div>
										</div>
									</div>
									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone Number (Last 4 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>                               
                                					xxx-xxx- <input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=digno%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="8" readonly="readonly" />  
											
											</div>
										</div>
									</div>
                                   
								  
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip (First 2 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>   
                               					<input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=zp%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="2" readonly="readonly" />xxx
											</div>
										</div>
									</div>
                                  
								  
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Member ID (First 2 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>   
                                 				<input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=mId%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="2" readonly="readonly" />xxxxxx
											</div>
										</div>
									</div>
								</div>
                                    
                                
                          <%}}else if(statusName==null){ System.out.println("2");%>
						  
						   <div class="form-group">
						 	<input type="radio" name="info_rad" value="<%=usrVal.getUserId()%>" onclick="chstat();"/>Information <%=i+1%>
						 </div>
                                      
                             <div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                               					<input name="firstName" id="firstNameId" class="form-control" value="<%=usrVal.getFname()%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="20" readonly="readonly" />                                 
												
												 </div>
											</div>
										</div>
                                  
								  
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                 				<input name="lastName" id="lastNameId" class="form-control" value="<%=usrVal.getLname()%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="20" readonly="readonly" /> 
												
											</div>
										</div>
									</div>                               
                               			
										 <%

												String digno="";
												if(usrVal.getPhone()!=null)
												{
				
													String ph=usrVal.getPhone();
													int phlen=ph.length();

													if(phlen>4)
													{
														int rstsiz=phlen-4;
														digno=ph.substring(rstsiz,phlen);
													}
													else
													{
														digno=usrVal.getPhone();
													}													
												}

												String emailId="";
												if(usrVal.getEmail()!=null){
													String email=usrVal.getEmail();
													int indx = email.indexOf("@");
													emailId = email.substring(indx+1);                                                                                                    
													System.out.print("emailId :"+emailId);
												}
												
												String zp="";
												if(usrVal.getZip()!=null){
													String zip = usrVal.getZip();
													if(zip.length()>2){

														zp = zip.substring(0,2);
													}else{
														zp = zip;
													}                 System.out.print("zip : " +zp);                                           
												}


												String usid="";
												if(usrVal.getUserId()!=null){
													String hlcid=usrVal.getUserId();
													if(hlcid.length()>2){
														usid=hlcid.substring(0,2);                                                                                                        
													}else{
														usid = hlcid;                                                                                                                
													}
												}

                                                String mId="N/A";
                                                                                                
												if(usrVal.getMembid()!=null)
												{
													String hlcid=usrVal.getMembid();
													
													if(hlcid.length()>2){
														mId=hlcid.substring(0,2);                                                                                                        
													}else{
														mId = hlcid;                                                                                                               													
													}
													
                                                }
                                                                                                
												%>
												
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email  (Last domain):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                               						xxxxxx@<input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=emailId%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="20" readonly="readonly" />
                                             
											 </div>
										</div>
									</div>	 
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone Number (Last 4 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                      				xxx-xxx-<input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=digno%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="8" readonly="readonly" /> 
											 </div>
										</div>
									</div>	                    
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip (First 2 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=zp%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="2" readonly="readonly" /> xxx
											</div>
										</div>
									</div>	   
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID (First 2 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												 <input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=mId%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="2" readonly="readonly" />xxxxxx
											</div>
										</div>
									</div>
								</div>
												
                                                         
                               
                             
                          <%}else{ System.out.println("3");}%>
                          <%}
										 }
									  %>
                        			
									<div class="form-group">
										<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Are you sure the selection matches your profile?</label>
                                   			 <div class='col-md-8'>
                                        		<div class='col-md-3 indent-small'>
                                           			 <div class='form-group internal'> 
                           								<input type="radio" name="prof_rad" style="margin:12px" value="yes" checked="checked"  onclick="" />
                              							Yes, it matches my profile.<br />
														  <input type="radio" name="prof_rad" style="margin:12px" value="no" onclick="radValid();" />
                           									 No, it doesn't match my profile. 
													</div>
												</div>
											</div>
                       					</div>
                           
										  <%}else{System.out.println("4");%>
										  <%
													//String source = (String) request.getAttribute("source");
													//String eventTypeId = (String)request.getAttribute("eventTypeId");
													//String compYear = (String)request.getAttribute("compYear");
													String regBtn = "";
													String noBtn = "";
													if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
													regBtn = "MemberUsrSignUp.do?process=usrReg&source=fromEventEntry&eventTypeId="+eventTypeId+"&compYear="+compYear;
													noBtn = "MemberUsrSignUp.do?process=view&source=fromEventEntry&eventTypeId="+eventTypeId+"&compYear="+compYear;
													}else{
													//regBtn = "MemberUsrSignUp.do?process=usrReg";
													regBtn = "MemberUsrSignUp.do?process=usrEmpReg";
													
													noBtn = "MemberUsrSignUp.do?process=view";
											}
											%>
							<div class="form-group">
                          		<label class='control-label label1 '>Membership</label>
							</div>
								
                          <p>&emsp;The Member ID [<%=memberID%>] has been merged with an older account, please search again using your first initial and last name<p>
                               
                               <p> <span style="color:#FF0000" > IMPORTANT </span> -- If you are a previous or current member, do not create a new member account.
                              If you need help logging in, please contact us at <a href="mailto:anandv@digiblitz.com">anandv@digiblitz.com</a> 
                              or call (703) 779-0440 and press 1
                              </p>
                              <br />
                              <br />
                            
								<div class='form-group'>
                                    <div class='col-md-offset-2 col-md-3'>
                                        <button class='btn-lg btn-primary' name="button" type="button"  value="Yes, Register Me" onclick="location.href='<%=regBtn%>'">Yes, Register Me</button>
                                    </div>
                                    <div class='col-md-3'>
                                        <button class='btn-lg btn-danger' name="button" type="button"  value="No, Try Again" onclick="location.href='<%=noBtn%>'" style=''>No, Try Again</button>
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
