<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeUserICPAssessApply.js" type="text/javascript" ></script>

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
                            <h2>Meetings: Apply ICP Assessment</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmMeeICPAssessment" id="myform" method="post" action="./IcpUsrMeetList.html?process=applyDisp">
							
                               <%
							Vector accessDet=new Vector();
							accessDet=(Vector)request.getAttribute("meeDet");
							System.out.println("size in jsp :"+accessDet.size());
                                                        
							if(accessDet!=null && accessDet.size()!=0)
							{
                                                         Enumeration en=accessDet.elements();    
                                                            
							while(en.hasMoreElements())
							{
                                                                  String[] icpVal = (String[])en.nextElement();
/*									 out.print(" 38 "+icpVal[38]+"<br>");
									 out.print(" 39 "+icpVal[39]+"<br>");
									 out.print(" 40 "+icpVal[40]+"<br>");
									 out.print(" 41 "+icpVal[41]+"<br>");
									 out.print(" 42 "+icpVal[42]+"<br>");									 									 
									 out.print(" 43 "+icpVal[43]+"<br>");
									 out.print(" 44 "+icpVal[44]+"<br>");									 									 									 									 
									 out.print(" 45 "+icpVal[45]+"<br>");
									 out.print(" 46 "+icpVal[46]+"<br>");
									 out.print(" 47 "+icpVal[47]+"<br>");
									 out.print(" 48 "+icpVal[48]+"<br>");
									 out.print(" 49 "+icpVal[49]+"<br>");
									 out.print(" 50 "+icpVal[50]+"<br>");
									 out.print(" 51 "+icpVal[51]+"<br>");
									 out.print(" 52 "+icpVal[52]+"<br>");
									 out.print(" 53 "+icpVal[53]+"<br>");
									 out.print(" 54 "+icpVal[54]+"<br>");
									 out.print(" 55 "+icpVal[55]+"<br>");
									 out.print(" 56 "+icpVal[56]+"<br>");
									 out.print(" 57 "+icpVal[57]+"<br>");									 									 									 									 									 									 									 									 									 									 									 									 									 
									 out.print(" 58 "+icpVal[58]+"<br>");
									 out.print(" 59 "+icpVal[59]+"<br>");
									 out.print(" 60 "+icpVal[60]+"<br>");*/
							 									 									 									 									 									 									 									 									 									 									 									 									 
																  
                                                                  String dat1=icpVal[2];
								  String[] dat=dat1.split(" ");
                            %>
							
							 <div class='panel-heading col-md-offset-2'>
								<h2>ICP Assessment Details:</h2>
							</div>
								
								<input type="hidden" name="mid" value="<%=icpVal[0]%>" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assessment Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[1]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=dat[0]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>No. of Days:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[3]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[26]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[5]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Host ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[7]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[27]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[28]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[30]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[31]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[32]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[33]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[34]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[35]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[36]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[29]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assessor Detail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[9]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically:</label>
									
									<%String[] facil = icpVal[10].split("#");
									String facility="";
									for(int i=0;i<facil.length;i++){
									if(!facil[i].equals("null")){
											facility+=facil[i]+",";
										}
									}
									%>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=facility%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='panel-heading col-md-offset-2'>
								<h2>Land Owner Details :</h2>
								</div>
								
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name :</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[11]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name : </label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[12]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[13]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[16]%></label>
                                            </div>
                                        </div>

                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[15]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[14]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone: </label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[18]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[19]%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='panel-heading col-md-offset-2'>
								<h2>Transaction Details :</h2>
								</div>
								
								<% 
								  String paystat = icpVal[51];
								  if(paystat.equalsIgnoreCase("check")){
								%>
								
								
							<div class='form-group'>
							 	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Number:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[47]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Name:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[48]%></label>
                                            </div>
                                        </div>

                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[49]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[46]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[45]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%	}else{ %>	
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[54]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
								 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=icpVal[49]%></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								 <% } %>
								 
								<%}}else{%>
								
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        No Records Found !
                                    </div>
								</div>
								
								<% }%>
								

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="sub" type="submit" value="Apply">Apply</button>
										
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
