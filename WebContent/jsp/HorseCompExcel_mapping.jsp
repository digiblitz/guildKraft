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
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->

</head>
<script language="javascript">
function called(){
	
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
                            <h2>Membership: Competition Result Mapping</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
				<p>All available column names in excel sheet are listed in the left side.Available column names on the destination table is provided on the right side.<br />
				
				To map a particular excel column to a particular table column select the appropriate available in the dropdown available appropriate straight to the table column, click on the ' Map Data' button beside to Map selected datas. </p>
			
					
					<%	
					 
					    ArrayList tblDetails = new ArrayList();
						tblDetails = (ArrayList)request.getAttribute("tblDetails");
						 	                
						String dropName1="";
						String dbcolName="";
						
						if(tblDetails != null)
						{	 
						for(int j=0;j<tblDetails.size();j++)
						{
							dropName1 = "colSel"+String.valueOf(j);
					%>
					
					<div class="form-group">
						<div class="col-md-12 gp">
							<div class="col-md-5">
								<label class="control-label col-md-2 col-md-offset-1">Column #<%=j+1%>:</label>
									 <div class='col-md-2'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class="control-label"><%=head1%></label>
											</div>
										</div>
									</div>
								</div>
							
								
								
								
                      <%
							String head1 = null;
						
							head1 = (String)tblDetails.get(j);
							dbcolName = "dbVal"+String.valueOf(j);
							%>
					<span class="formXmap"></span>
					  </div>
					  <input type="hidden" value="<%=head1%>" name="<%=dbcolName%>" />
			<%}}%> 
					  	<div class="col-md-2"></div>
					
					<%
		Vector excelColumns = new Vector();
		ArrayList excelRow = new ArrayList();
		
		ArrayList tblDetails1 = new ArrayList();
				
		tblDetails1 = (ArrayList)request.getAttribute("tblDetails");
		
		System.out.print("tblDetails.size() :"+tblDetails1.size());
		
		%>
		
		<input type="hidden" name="dropCt" value="<%=tblDetails.size()%>" />
		
		<%
		
		Vector excelRows = new Vector();
		
		excelColumns = (Vector)request.getAttribute("excelHead");
		excelRows = (Vector)request.getAttribute("excelRows");
                
                session.setAttribute("excelRows",excelRows);
                
		System.out.print("excelColumns.size() :"+excelColumns.size());
		System.out.print("excelRows.size() :"+excelRows.size());
                
		String dropName="";
		
		if(excelColumns != null)
		{	 
		for(int i=0;i<tblDetails.size();i++)
		{
			dropName = "colSel"+String.valueOf(i);
			
	%>
						<div class="col-md-5">
									<label class="control-label col-md-2 col-md-offset-1">Excel Column #<%=i+1%>:</label>
									 <div class='col-md-2'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<select name="<%=dropName%>" id="<%=dropName%>" class="selectboxOne">
												<option value="" selected="selected">Select One</option>
													<%
														String head="";
														
														for(int j=0;j<excelColumns.size();j++)
														{
															head = (String)excelColumns.get(j);
															
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
                                        <button class='btn-lg btn-primary' type='submit'>Map Data</button>
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
