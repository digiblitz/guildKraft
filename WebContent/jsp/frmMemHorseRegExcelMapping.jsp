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
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
<%@ page import="com.hlcmrm.util.*"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcform.util.*" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/calendar2.js" type="text/javascript" ></script>

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
                            <h2>Membership: Competition Registration Details Mapping.</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>All available column names in excel sheet are listed in the left side.Available column names on the destination table is provided on the right side.
				
				To map a particular excel column to a particular table column select the appropriate available in the dropdown available appropriate straight to the table column, click on the' Map Data' button beside to Map selected datas.</p>
							
						<!--==============================Form Description=================================-->
							
                           <%
								ArrayList excelColumns = new ArrayList();
								ArrayList excelRow = new ArrayList();
								
								ArrayList tblDetails = new ArrayList();
										
								tblDetails = (ArrayList)request.getAttribute("tblDetails");
								
								System.out.print("tblDetails.size() :"+tblDetails.size());
							
						%>	
							
							<!--==============================Form Body=================================-->
							
                       

                                <div class='form-group'>
								
										<%		                
											String dropName1="";
											
											if(tblDetails != null)
											{	 
											for(int j=2;j<tblDetails.size()-4;j++)
											{
												dropName1 = "colSel"+String.valueOf(j);
										%>
										
								
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Column #<%=j+1-2%> :</label>
											
											 <%
												String[] head1 = null;
											
												head1 = (String[])tblDetails.get(j);
												
												%>
											
											<label class='control-label'><%=head1[0]%></label>
								</div>
								
						<%}}%> 
						
						<input type="hidden" name="dropCt" value="<%=tblDetails.size()-6%>" />
						
						
						
						<%
					
						Vector excelRows = new Vector();
						
						excelColumns = (ArrayList)request.getAttribute("excelHead");
						excelRows = (Vector)request.getAttribute("excelRows");
								
								session.setAttribute("excelRows",excelRows);
								
						System.out.print("excelColumns.size() :"+excelColumns.size());
						System.out.print("excelRows.size() :"+excelRows.size());
								
						String dropName="";
						
						if(excelColumns != null)
						{	 
						for(int i=0;i<tblDetails.size()-6;i++)
						{
							dropName = "colSel"+String.valueOf(i);
					%>
					
					
					 <div class='form-group'>
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Excel Column #<%=i+1%>:</label>
					 	<div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                              <div class='form-group internal'>
					 		<select name="<%=dropName%>" id="<%=dropName%>" class="selectboxOne">
							<option value="" selected="selected">Select One</option>
							<%
								String head="";
								
								for(int j=0;j<excelColumns.size();j++)
								{
									head = (String)excelColumns.get(j);
								   // System.out.print("head in jsp" + j);	
									%>
									<option value="<%=j%>"><%=head%></option>
							  <%}
							%>
							</select>
								 
					 </div>
				</div>
			</div>
		</div>
					
					
					<%}}%>	
                                   
                                    

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Map Data">Map Data</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="button" value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
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
