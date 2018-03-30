<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlcmro.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->

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
					  
					        <h2>Meetings: Area Chair - Area Map Listing</h2>
							
							</div>
				  <!--==============================Form Title=================================-->
						
						 <div class='panel-body'>

			  
				 <!--==============================Form Description=================================-->
				 
				<div class='form-group'>
							<div class="col-md-12">
									 
									 <div class='col-md-2 col-md-offset-2'>
										<label class='control-label label1 text-center'>Area Chair ID</label>
									</div>
									
									<div class='col-md-3'>
										<label class='control-label label1 text-center'>Area Chair Name</label>
									</div>
									
									<div class='col-md-2'>
										<label class='control-label label1 text-center'>Area</label>
									</div>
									
									<div class='col-md-2'>
										<label class='control-label label1 text-center'>Edit</label>
									</div>
						
						  
						  <%
						    ArrayList areaChairList = (ArrayList)request.getAttribute("allAreaChairList");
							if(areaChairList!=null && areaChairList.size()!=0){
								Iterator e = areaChairList.iterator();
								 while(e.hasNext()){
								 	HLCAreaChairsVO objACVO = (HLCAreaChairsVO)e.next();
									if(objACVO!=null){
										String mapAreaId = objACVO.getMapAreaId();
										String areaId = objACVO.getAreaId();
										String areaChairId = objACVO.getAreaChairId();
										String areaCode = objACVO.getAreaCode();
										String areaName = objACVO.getAreaName();
										String userID = objACVO.getUserId();
										String userCode = objACVO.getUserCode();
										String firstName = objACVO.getFirstName();
										String middleName = objACVO.getMiddleName();
										String lastName = objACVO.getLastName();
										String emailId = objACVO.getEmailId();
										if(areaName==null) areaName = "";
										if(firstName==null) firstName = "";
										if(middleName==null) middleName = "";
										if(lastName==null) lastName = "";
										String nameDet = firstName + " " + middleName + " " + 	lastName;																			
									  %>
									  <form name="frmAreaMapListing" method="post" action="EventOrgRenewal.html" >
									  <input type="hidden" name="eventProcess" value="initEditAreaChairArea"/>
									  <input type="hidden" name="mapAreaId" value="<%=mapAreaId%>"/>
									  
						 <div class='form-group'>
							  <div class="col-md-12">
									
										<div class='col-md-2 col-md-offset-2 gp'>
                                   			<label class='control-label text-center'><a href="EventOrgRenewal.html?mapAreaId=<%=mapAreaId%>&eventProcess=showAreaChairDet" class="linkFive"><%=userCode%></a></label>
										</div>
										
										<div class='col-md-3 gp'>
                                   			<label class='control-label text-center'><%=nameDet%></label>
										</div>
										
										<div class='col-md-2 gp'>
                                   			<label class='control-label text-center'><%=areaName%></label>
										</div>
										
										<div class='col-md-2 gp'>
                                       		 <button class='btn-sm btn-primary' type='submit'  name="Submit2" value="Edit">Edit</button>
										</div>
										
							<!--	<td bgcolor="#E3E1D2" class="alignCenter"><input name="Submit" type="submit" class="twoBtn" value="Deactivate" /></td> -->
									  
									  </form>
									  </div>
								</div>
							
									  <%
									  }
						  			}
								}
								else{
								%>
								 <div class='form-group'>
								
                                   	<div class="container"> 
								   
									   <div class="row"> 
									   
									   		<div class='col-md-4'>
											
											</div>
									   
											<div class='col-md-4'>
										
					 							<p>No records are available. </p>
												
											</div>
											
										</div>
									</div>
									</div>
                             
								<%
								}
						  %>
						  

						  <!--<tr>
							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="#" class="linkThree">Prev</a> | <a href="#" class="linkThree">Next</a>			</td>
						   </tr>-->
						  
				  <!--==============================================import content code end here============================================-->
	  			 				
					
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
