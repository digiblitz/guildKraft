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
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <script language="javascript">

//window.onload=call();
 
  function popitup(url) {
	
		newwindow=window.open(url,'name','height=170,width=350,scrollbars=no,resizable=no,top=300,left=500,toolbar=yes,menubar=no,dialog=yes');
                        if (window.focus) {newwindow.focus()}
                        return false;
	}


  function callAdd(lcExist,id,name,version,govStat){
   // boolean val;
	// val= validate(lcExist);
	//  if (val == true){
		strURL = "./SysMgmt.html?process=busineessProce&id="+id+"&bpName="+name+"&bpVersion="+version+"&txtName=Add BPEL"+"&govStat="+govStat;
			window.location.href = strURL;
	//  }else
  //           return false;					
	 }

	 
  function callEndGov(fwd,artiId,govStat){
	  //alert("df");

		 
		strURL = "./SysMgmt.html?process=callEndGov&fwd="+fwd+"&name=bpm"+"&artifactId="+artiId+"&govstatus="+govStat;
				window.location.href = strURL;
					
		       }
  function validate(lcExist)
  {
  	if(lcExist.equals("false")){
  		alert("There is no lifecycle associated with Business Process artifact. Please create the lifecycle first and then start the Governance");  		
  		return false;
  		}
  	return true;
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
                            <h2>View Business Process Artifact List </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
							  <%
						  
						  String gov=(String)request.getAttribute("stopGov");
						  String id=(String)request.getAttribute("id");
						  String ErrorMsg=(String)request.getAttribute("ErrorMsg");
						  
						  if(ErrorMsg!=null){%>
							 <p id="p_error"><%=ErrorMsg%></p>
								<%
						  }else{	  
						  ErrorMsg="";
						  }
						  if(id==null)id="";
						  if(gov==null)gov="";
						  System.out.println("gov==="+gov+"==id=="+id);
						  %>
       
                      <form class='form-horizontal' role='form' action="SysMgmt.html" name="frmArti" id="frmArti">
                        <input type="hidden" name="process" value="callArtifactBPList"/>
                        <input type="hidden" name="reqname" value=""/>
                        
						  <div class='form-group'>
								<div class='container'>
									<div class='col-md-12 gp '>
										 <div class='row'>
										 
											<div class=' col-md-3'>
												<label class='control-label label1 col-md-offset-3'>Name</label>
											</div>
											<div class=' col-md-1 '>
												<label class='control-label label1'>Version</label>
											</div>
											<div class=' col-md-2'>
												<label class='control-label label1'>Consumable</label>
											</div>
											<div class=' col-md-2'>
												<label class='control-label label1'>Owner</label>
											</div>
											<div class=' col-md-2'>
												<label class='control-label label1'>Domain</label>
											</div>
											<div class=' col-md-2'>
												<label class='control-label label1'>Governance</label>
											</div>
										</div>
									</div>
								</div>
							</div>
													<%
									  Boolean lcExist=(Boolean)request.getAttribute("cycleExist");
									  ArrayList list=(ArrayList)request.getAttribute("list");
							//System.out.println  ("artifactData"+artifactData.size());   
							
																		 
						   if (list != null && list.size() != 0) {  
																					
						   Iterator iter = list.iterator();
                                                                //String [] userType = {ID, name };
                                                                while (iter.hasNext()) {
                                                                	 
                                                                	
                                                                	String [] artiType=(String[])iter.next();
                                                                	//String id=artiType[0];
                                                                	String artId=artiType[0];
                                                                	String name=artiType[1]; 
                                                              System.out.println("Inside jsp BP name"+name);
                                                                	String version=artiType[2];
																	String govStat=artiType[3];
																	
                                                                	if(version==null)version="";
                                                                	

                                                %>
                           
						   
						     <div class='form-group'>
								<div class='container'>
									<div class='col-md-12 gp '>
										 <div class='row'>
											<div class=' col-md-3'>
												<label class='control-label '><%=name%></label>
											</div>
											<div class=' col-md-1'>
												<label class='control-label col-md-offset-1'><%=version%></label>
											</div>
											<div class=' col-md-2'>
											</div>
											<div class=' col-md-2'>
											</div>
											<div class=' col-md-2'>
											</div>
											
                             				<%if(govStat.equalsIgnoreCase("Start")){ %>
											
											<div class=' col-md-2 '>
											
											<button class='btn-sm btn-primary' name="button" type="button" onclick="callAdd('<%=lcExist%>','<%=artId%>','<%=name%>','<%=version%>','<%=govStat%>')" value="Start Governance" >Start Governance</button>
											
											</div>
                            
                                  			<%}else if(govStat.equalsIgnoreCase("End")){ %>
											
											<div class=' col-md-2 '>
											
											<button class='btn-sm btn-danger' name="button" type="button" onclick="callEndGov('callArtiList','<%=artId%>','<%=govStat%>')" value="End Governance " >End Governance</button>
											</div>
											<%}%>
											
											
									</div>
								</div>
							</div>
						</div>
                                
										  <%}}else{%>
                           		 	
										   <div class='form-group'>
												<div class=' col-md-5'>
													</div>
													<div class=' col-md-5'>
														No DATA 
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
