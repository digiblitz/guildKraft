<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeAnnualConvRegister.js" type="text/javascript" ></script>

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
                            <h2>sss Meetings:  Annual Meeting &amp; Convention Registration Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>You are viewing the details of the Annual Convention Registration you had applied for.
								
								Your approval status is shown below.</p>
							
						<!--==============================Form Description=================================-->
							
                          
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeAnnualConvRegister" id="myform" action="./ViewAnnualConRegDetailList.html">
							
                               <% 
								String basicInfo [] = new String [20];
								
								Vector memberDispVect=(Vector)request.getAttribute("viewMember");
								System.out.println("vector Element in Member Detail: "+memberDispVect);
								System.out.println("vector Element SIZE : "+memberDispVect.size());
								if (  memberDispVect.elementAt(0) != null && memberDispVect.size() !=0) {
								   basicInfo   = (String[]) memberDispVect.elementAt(0);
								}	   
								
							%>
							
							<div class='form-group'>
							 	<label class='control-label'>Mailing Information</label>
							</div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[20] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[6] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[4] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[5] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[11]+" "+basicInfo[12]  %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[15] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[14] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[13] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip Code:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[16] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[17] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[19] %></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[7] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								<div class='form-group'>
							 	<label class='control-label'>Badge Information:</label>
							</div>
							
							<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Name of Badge:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[2] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								<div class='form-group'>
							 	<label class='control-label'>Registration Information:</label>
							</div>
							
							<%
		   		
								 Vector specificationDetail1=(Vector)request.getAttribute("viewSpecification");
								 System.out.println("Inside JSP specificationDetail: "+specificationDetail1);
								 if(specificationDetail1!=null && specificationDetail1.size()!=0){ 
									 String spec1[] = (String [])specificationDetail1.elementAt(0);
									 //int len = spec1.length();
									 String daysApplied[] = new String [10];
										if (spec1.length > 3 && spec1[3] != null) {
											daysApplied = spec1[3].split("#");
										}
										System.out.print(" injsp specificationName:  "+spec1[0]);
										System.out.print(" userTypeName:  "+spec1[1]);
										System.out.print(" noOfTickets:  "+spec1[2]);
										System.out.print(" daysApplied:  "+spec1[3]);
			//{specificationName,userTypeName,noOfTickets,daysApplied};
					   %>
					   
					   		<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Registration Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=spec1[0] %></label>
                                            </div>
                                        </div>

                                    </div>
								</div>
									
									 <% if ( spec1[0].equalsIgnoreCase("Daily Basis") ) {%>
									
									<div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dates Opted For:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=daysApplied[0] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								 <% if (daysApplied.length > 1) { %>
								 
								 <div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>&nbsp;</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=daysApplied[1] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								 <% } if (daysApplied.length > 2) { %>
								
								<div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>&nbsp;</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=daysApplied[2] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								 <%  } if (daysApplied.length > 3) { %>
								 
								 <div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>&nbsp;</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=daysApplied[3] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								 <% } } %>
								 
								  <div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=spec1[1] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								  <% } %>
								  
							<div class='form-group'>
							 	<label class='control-label'>Other Activities Information: Activity Type</label>
							</div>
							
							<%
		   		
									 Vector specificationDetail=(Vector)request.getAttribute("viewSpecification");
									 System.out.println("Inside JSP specificationDetail: "+specificationDetail);
									 if(specificationDetail!=null && specificationDetail.size()!=0){ 
									  Enumeration enm1=specificationDetail.elements();
									  
									  while(enm1.hasMoreElements()){
											String[] spec = (String[])enm1.nextElement();
											for (int i=0;i<spec.length; i++) {
												System.out.println("Content : "+spec[i]);
											}
											
											//String daysApplied[] = spec[3].split("#");
											System.out.print(" injsp specificationName:  "+spec[0]);
											System.out.print(" userTypeName:  "+spec[1]);
											System.out.print(" noOfTickets:  "+spec[2]);
											System.out.print(" daysApplied:  "+spec[3]);
				//{specificationName,userTypeName,noOfTickets,daysApplied};
						   %>
						   
						   
						   <div class='form-group'>
							 	<label class='control-label label1'><%=spec[0] %></label>
							</div>
							
							<div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=spec1[1] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								<div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of Tickets:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=spec[2]+"  Nos." %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								 <% }}%>
								 
							<div class='form-group'>
							 	<label class='control-label'>Payment Information</label>
							</div>
							
							
							<div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'>$<%=basicInfo[3] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								  
							<div class='form-group'>
							 	<label class='control-label'>Approval Status</label>
							</div>
							
							<div class='form-group'> 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=basicInfo[8] %></label>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
							
                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
										<button type="button" value=" Back " class="btn-lg btn-primary3" onclick="javascript:history.back(-1);">Back</button>
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
