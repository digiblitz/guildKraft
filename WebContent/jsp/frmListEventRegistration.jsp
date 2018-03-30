<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html>
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/validate.js" type="text/javascript" ></script>
<script language="javascript">
function onValidate(){
	if(document.frmListEvent.selStatus.value==""){
		alert("Select a Status");
		document.frmListEvent.selStatus.focus();
		return false;
	}
	if(document.frmListEvent.year.value==""){
		alert("Select a Year");
		document.frmListEvent.year.focus();
		return false;
	}
	return true;
}
</script>

</head>
<%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%!				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
					String dateFormat(String fieldName){					
						java.util.Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}
						
						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
					}
  %>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
			 <%
			  String approveStatus = (String)request.getAttribute("approveStatus");
				String dispAppStatus = "";
				if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveSuccess")){
					dispAppStatus = "Approval Status Changed Successfully";
				} else if(approveStatus!=null && approveStatus.equalsIgnoreCase("approveFailed")){
					dispAppStatus = "Approval Status Cannot be Changed";
				}
				
				 String updateStatus = (String)request.getAttribute("updateStatus");
				String tempUpdtStatus = "";
				if(updateStatus!=null && updateStatus.equalsIgnoreCase("updateSuccess")){
					tempUpdtStatus = "Event Registration Details Updated Successfully";
				} else if(updateStatus!=null && updateStatus.equalsIgnoreCase("updateFailed")){
					tempUpdtStatus = "Event Registration Details not Updated Successfully";
				}
			  %>
	
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
                            <h2>Meetings:Listing Event Registration Entries</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
                            
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmListEvent" id="frmListEvent" method="post" action="eventRegList.html" onsubmit="return onValidate();">
							
                               <input type="hidden" name="cmd" value="eventList"/>
							    <div class='form-group'>
							   
							   <%if(approveStatus!=null && approveStatus.trim().length()!=0){%>
							   
								<label class='control-label col-md-2 col-md-offset-2'><%=dispAppStatus%></label>
		
								<%}%>
		
								<%if(updateStatus!=null && updateStatus.trim().length()!=0){%>
								<label class='control-label col-md-2 col-md-offset-2' ><%=tempUpdtStatus%></label>
		
								<%}%>	
		
					</div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <%	
													String status = (String) request.getAttribute("status");
													String year = (String)request.getAttribute("year");
													int selYear =0;
													if(year != null && year.trim().length()!=0){
													 selYear = Integer.parseInt(year);
													}									
												%>
														<select name="selStatus" id="selStatus" class="form-control" > 
														<option value="" selected="selected">Select One</option>
												<%	String [] statStr = {"Approved","Pending","Rejected"};
												for(int i = 0 ; i< 3 ;i++){
												if(status!= null && status.equalsIgnoreCase(statStr[i])){%>
																	<option  value="<%=statStr[i]%>" selected="selected"><%=statStr[i]%></option>
																<%
																}
																else{
																%>
																	<option  value="<%=statStr[i]%>"><%=statStr[i]%></option>
																<%	}
												}								
												 %>
												  </select>
												   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Competition Year:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="year" id="year" class="form-control" > 


													<option value="" selected="selected">Select One</option>
											<%	java.util.Date orgDate = new java.util.Date();
												int currentYear = 1900+orgDate.getYear();
												for(int i = 2000;i<=(currentYear+2);i++){
											if(year!=null && selYear==i ){%>
																<option  value="<%=i%>" selected="selected"><%=i%></option>
															<%
															}
															else{
															%>
																<option  value="<%=i%>"><%=i%></option>
															<% }	
														}									
											 %>
											  </select>
											  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'  name="type" value="Submit">Submit</button>
										
                                    </div>
                                    
                                </div>
							</form>
								
								
								
								<div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-2">
											<label class='control-label label1'>Event ID</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Event Title </label>
										</div>
											
							   
										<div class="col-md-2">
											<label class='control-label label1'>Begin Date</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>End Date</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Edit</label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label label1'>Approve</label>
										</div>
		
									</div>
                                </div>
								
								
								<%
								ArrayList ValueList = (ArrayList)request.getAttribute("EVENT_REG_LIST");
							
								if((ValueList!=null && ValueList.size()!=0)){
									Iterator itr = 	ValueList.iterator();
										while(itr.hasNext()) {	
											String[] HLCEventDetails = (String [] ) itr.next();
										//State Masters
											String eventId  = HLCEventDetails[0];
											String eventTitle  = HLCEventDetails[1];
											String eventBeginDate = HLCEventDetails[2];
											String eventEndDate  = HLCEventDetails[3];
											
										
								%>
								
								 <form class='form-horizontal' role='form' name="frmListEventReg" id="frmListEventReg" method="post" action="eventRegList.html">
								 <input type="hidden" name="cmd" value="singleEventDetail"/>
								  <input type="hidden" name="eventId" id="eventId" value="<%=eventId%>" />
								
								
									<div class='form-group'>
                                    <div class='col-md-12'>
									
                                        
										<div class="col-md-2">
											<label class='control-label'><%=nullCheck(eventId)%></label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label'><%=nullCheck(eventTitle)%> </label>
										</div>
											
							   
										<div class="col-md-2">
											<label class='control-label'><%=dateFormat(eventBeginDate)%></label>
										</div>
										
										<div class="col-md-2">
											<label class='control-label'><%=dateFormat(eventEndDate)%></label>
										</div>
										
										<div class="col-md-2">
											<button class='btn-lg btn-primary' type='submit'  name="submit" value="Edit">Edit</button>
											
										</div>
										
										<div class="col-md-2">
										<button class='btn-lg btn-primary' type='submit'  name="submit" value="Approve">Approve</button>
										
										</div>
										
		
									</div>
                                </div>
								
								<%}}else{%>
								
								<div class='col-md-8'>
									<div class='col-md-6'>
									</div>
									<div class='col-md-6'>
										No Records Found!
									</div>
								</div>
								
								<% } %>
								
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
