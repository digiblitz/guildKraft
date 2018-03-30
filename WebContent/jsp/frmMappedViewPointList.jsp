<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="javascript">
function callMapList(viewPointId) 
{
	
	strURL = "./artifactMapping.html?artiMapProcess=searchMappedGroup&viewPoint="+viewPointId;
	window.location.href = strURL;
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
						
                            <h2>View Point: Search Mapped Groups List</h2>
							
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<p>Please choose the any one of the view point in order to view the mapped group list</p>
               
                <form  class='form-horizontal' role='form' name="frmSearchMappedViewPoint" action="artifactMapping.html"  method="post" onsubmit="return myValidate();">
                  <input type="hidden" name="artiMapProcess" value="searchMappedGroup">
                  
                          <%String viewPointId = (String)request.getAttribute("viewPointId");
							 %>
                           
						    <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Point:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                             					<select name="viewPoint" id="viewPoint" class="form-control" onchange="callMapList(this.value);">
                                 			 	<option selected="selected" value="">Select One</option>
												  <%
													 ArrayList viewList = (ArrayList) request.getAttribute("viewList");
											 if(viewList!=null && viewList.size()!=0){
											Iterator it = viewList.iterator();
											while(it.hasNext()){
												String[] s = (String[])it.next();
												String viewId = s[0];
												String viewName = s[1];		
												
															
				
															
															if (viewId.equals(viewPointId)){
																	System.out.println(" View Name : "+viewName);
				
															 %>
											  <option value="<%=viewId%>" selected="selected"><%=viewName%></option>
											  <%
														 }
											 
										   else{
										   %>
											  <option  value="<%=viewId%>" ><%=viewName%></option>
											  <%
										 		  } }	}
											%>
										  </select>
										
										</div>
									</div>
								</div>
							</div>
							
                            	<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" type="submit"  value="Search">Search</button>
                                   </div>
							</div>
                </form>
				
                <form action="artifactMapping.html"  class='form-horizontal' role='form' name="frmMappedViewPoint">
                  <input type="hidden" name="artiMapProcess" value="">
                
				
						<div class='form-group'>
							<div class='col-md-12 gp'>
									<div class='row'>
										<div class='col-md-2 col-md-offset-1' >
										 	<label class="control-label label1">View Point</label>
										</div>
										<div class='col-md-2' >
										 	<label class="control-label label1">LOB</label>
										</div>
										<div class='col-md-3' >
										 	<label class="control-label label1">Views</label>
										</div>
										<div class='col-md-2' >
										 	<label class="control-label label1">Groups</label>
										</div>
										<div class='col-md-2' >
										 	<label class="control-label label1">Process/Domain</label>
										</div>
									</div>
								</div>
							</div>
										   
                     
								<%ArrayList userMapPointList = (ArrayList)request.getAttribute("userMapPointList");
														 if(userMapPointList!=null && userMapPointList.size()!=0){
												Iterator ituserMapPoint = userMapPointList.iterator();
												while(ituserMapPoint.hasNext()){
													String[] viewPointUser = (String[])ituserMapPoint.next();
													String viewPoint = viewPointUser[0];
													String lob = viewPointUser[1];
													String view = viewPointUser[2];
													String group = viewPointUser[3];
													String processdDom = viewPointUser[4];
							if(lob!=null && view!=null && group !=null && processdDom !=null){						
							 %>
                    
					
						<div class='form-group'>
							<div class='col-md-12 gp'>
									<div class='row'>
										<div class='col-md-2 col-md-offset-1' >
										 	<label class="control-label "><%=viewPoint%> </label>
										</div>
										<div class='col-md-2' >
										 	<label class="control-label "><%=lob%> </label>
										</div>
										<div class='col-md-3' >
										 	<label class="control-label "><%=view%> </label>
										</div>
										<div class='col-md-2' >
										 	<label class="control-label "><%=group%></label>
										</div>
										<div class='col-md-2' >
										 	<label class="control-label ">&emsp; <%=processdDom%> </label>
										</div>
										</div>
									</div>
								</div>
									
                     
                   				 <%}}
           							}else{ %>
									<div class='form-group'>
										<div class='row'>
											<div class='col-md-5' >
											</div>
												<div class='col-md-5' >
                   								No Records were Found !
												</div>
											</div>
										</div>
                     			 <%} %>
                   
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
