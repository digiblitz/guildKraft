<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<jsp:root version="1.2" xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:display="urn:jsptld:http://displaytag.sf.net/el"
 xmlns:c="urn:jsptld:http://java.sun.com/jstl/core">
  <jsp:directive.page contentType="text/html; charset=UTF-8" />
  <jsp:directive.page import="org.displaytag.sample.*" />
  <jsp:include page="../../inc/header.jsp" flush="true" />


 <jsp:scriptlet> request.setAttribute( "test", session.getAttribute("demo")); </jsp:scriptlet>



							 <div class='form-group'>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											
												  <display:table name="test" export="true" id="currentRowObject">
													  <display:caption ><jsp:expression>session.getAttribute("reportTitle") </jsp:expression></display:caption>
													<display:column property="year" title="Area"> </display:column>
													<display:column property="count" title="Participated"> </display:column>
												   <display:setProperty name="export.pdf" value="true" />
												  </display:table>
												  
											</div>
										</div>
									</div>
								</div>



</jsp:root>

