<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<!--==============================================IMPORT THE CLASS END HERE============================================-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%=(String)session.getAttribute("title")%></title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <script src="js/basic.js" type="text/javascript"></script>
    <script src="javascripts/calendar2.js" type="text/javascript"></script>
    <script src="js/ts_picker.js"></script>
    <script src="js/datetimepicker_css.js"></script>
    <script language="javascript">

        function populateCurrYear() {
            var currfromYear = null;
            var currtoYear = null;
            var yearNow = null;
            currfromYear = document.getElementById("fromDate");
            currtoYear = document.getElementById("toDate");
            var currDate = new Date();
            yearNow = currDate.getFullYear();
            try {
                currfromYear.add(new Option(yearNow, yearNow));//in IE
            } catch (e) {
                currfromYear.add(new Option(yearNow, yearNow), null);//in FireFox
            }
            try {
                currtoYear.add(new Option(yearNow, yearNow));//in IE
            } catch (e) {
                currtoYear.add(new Option(yearNow, yearNow), null);//in FireFox
            }
        }




        function getfromdays() {
            var noLeapfrom = true;
            var sel = document.getElementById("frommonth").value;
            var selDay = document.getElementById("fromday");
            var currentfromYear = document.getElementById("toyear").value;//leap year check
            var currFYVal = parseInt(currentfromYear);
            if (((currFYVal % 4 == 0) && !(currFYVal % 100 == 0)) || (currFYVal % 400 == 0)) {

                noLeapfrom = false;
                if (selDay.length == 28) {
                    try {
                        selDay.add(new Option("30", "30"));//in IE
                        selDay.add(new Option("31", "31"));
                    }
                    catch (e) {
                        selDay.add(new Option("30", "30"), null);//in FireFox
                        selDay.add(new Option("31", "31"), null);
                    }
                }

            }



            if (selDay.length == 27) {

                try {
                    selDay.add(new Option("29", "29"));
                    selDay.add(new Option("30", "30"));//in IE
                    selDay.add(new Option("31", "31"));
                }
                catch (e) {
                    selDay.add(new Option("29", "29"), null);
                    selDay.add(new Option("30", "30"), null);//in FireFox
                    selDay.add(new Option("31", "31"), null);
                }

            }
            if (selDay.length == 29) {
                try {
                    selDay.add(new Option("31", "31"));//in IE

                } catch (e) {
                    selDay.add(new Option("31", "31"), null);

                }
            }
            if ((sel == 2) && (noLeapfrom)) {
                selDay.remove(selDay.length - 1);
                selDay.remove(selDay.length - 1);
                selDay.remove(selDay.length - 1);
            }
            if ((sel == 2) && (!noLeapfrom)) {
                selDay.remove(selDay.length - 1);
                selDay.remove(selDay.length - 1);
            }

            if ((sel == 11) || (sel == 9) || (sel == 6) || (sel == 4)) {
                selDay.remove(selDay.length - 1);
            }
        }


        function gettodays() {
            var noLeapto = true;
            var tosel = document.getElementById("tomonth").value;
            var toselDay = document.getElementById("today");
            var currenttoYear = document.getElementById("toyear").value;//leap year check
            var currTYVal = parseInt(currenttoYear);
            if (((currTYVal % 4 == 0) && !(currTYVal % 100 == 0)) || (currTYVal % 400 == 0)) {
                noLeapto = false;
                if (toselDay.length == 28) {
                    try {
                        toselDay.add(new Option("30", "30"));//in IE
                        toselDay.add(new Option("31", "31"));
                    }
                    catch (e) {
                        toselDay.add(new Option("30", "30"), null);//in FireFox
                        toselDay.add(new Option("31", "31"), null);
                    }
                }

            }


            if (toselDay.length == 27) {

                try {
                    toselDay.add(new Option("29", "29"));
                    toselDay.add(new Option("30", "30"));//in IE
                    toselDay.add(new Option("31", "31"));
                }
                catch (e) {
                    toselDay.add(new Option("29", "29"), null);
                    toselDay.add(new Option("30", "30"), null);//in FireFox
                    toselDay.add(new Option("31", "31"), null);
                }

            }
            if (toselDay.length == 29) {
                try {
                    toselDay.add(new Option("31", "31"));//in IE

                } catch (e) {
                    toselDay.add(new Option("31", "31"), null);//in FireFox

                }
            }

            if ((tosel == 2) && (noLeapto)) {
                toselDay.remove(toselDay.length - 1);
                toselDay.remove(toselDay.length - 1);
                toselDay.remove(toselDay.length - 1);
            }
            if ((tosel == 2) && (!noLeapto)) {
                toselDay.remove(toselDay.length - 1);
                toselDay.remove(toselDay.length - 1);
            }

            if ((tosel == 11) || (tosel == 9) || (tosel == 6) || (tosel == 4)) {
                toselDay.remove(toselDay.length - 1);
            }
        }

        function UpdateSelect() {
            select_value = document.generateHorseMemberReport.view.value;
            var id = 'hide_this_row';
            var obj = '';
            obj = (document.getElementById) ? document.getElementById(id) : ((document.all) ? document.all[id] : ((document.layers) ? document.layers[id] : false));

            if (select_value = 2) {
                obj.style.display = (obj.style.display != "none") ? "none" : "";//Hide Fields
            }
            else {
                obj.visibility = "show";//Show Fields
            }
        }





        function validate(type) {

            var flag = true;
            if (document.generateHorseMemberReport.fromDate.value == "") {
                alert("Select From Date");
                document.generateHorseMemberReport.fromDate.focus();
                flag = false;
                return flag;
            }

            if (document.generateHorseMemberReport.toDate.value == "") {
                alert("Select To Date");
                document.generateHorseMemberReport.toDate.focus();
                flag = false;
                return flag;
            }

            var toDay = new Date();
            var currentYear = toDay.getFullYear();
            var toDate = document.generateHorseMemberReport.toDate.value;
            var fromDate = document.generateHorseMemberReport.fromDate.value;
            var todateVal = toDate.split("/");
            var toselectedYear = todateVal[2];
            if (toselectedYear > currentYear) {
                alert("Please select ToDate less than or equal to current year");
                document.generateHorseMemberReport.toDate.focus();
                flag = false;
                return flag;

            }
            if (Date.parse(fromDate) > Date.parse(toDate)) {
                alert("FromDate should not be greater than Todate");
                flag = false;
                return flag;
            }

            if (flag) {
                popUp_report(type);
            }

        }

        function popUp_report(type) {


            var val = null; var status = null; var membershipid = null;
            var fromDate = document.getElementById("fromDate").value;
            var toDate = document.getElementById("toDate").value;
            var view = document.getElementById("view").value;
            var numArr = new Array();
            j = 0;
            var graph = document.getElementsByName("graph");

            for (i = 0; i < graph.length; i++) {
                if (graph[i].checked) {

                    numArr[j] = graph[i].value;
                    j++;

                }


            }
            if (type == 'horseStatusWise') {
                val = window.open("HorseMemberReports.html?process=HorseMembersStatusWise&fromDate=" + fromDate + "&toDate=" + toDate + "&view=" + view + "&graph=" + numArr.join()
                , 'HorseMemberReports',
                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
            }
            if (type == 'horseMembershipStatusWise') {
                status = document.getElementById("status").value;
                val = window.open("HorseMemberReports.html?process=HorseMembersMembershipAndStatusWise&fromDate=" + fromDate + "&toDate=" + toDate + "&status=" + status + "&view=" + view + "&graph=" + numArr.join()
                , 'HorseMemberReports',
                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
            }
            if (type == 'horseSpecificMembershipAndStatusWise') {
                membershipid = document.getElementById("membershipid").value;
                status = document.getElementById("status").value;
                val = window.open("HorseMemberReports.html?process=HorseSpecificMembershipAndStatusWise&fromDate=" + fromDate + "&toDate=" + toDate + "&status=" + status + "&membershipid=" + membershipid + "&view=" + view + "&graph=" + numArr.join()
                , 'HorseMemberReports',
                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
            }
            if (type == 'HorseMembersEventCompetitionsWise') {
                val = window.open("HorseMemberReports.html?process=HorseMembersEventCompetitionsWise&fromDate=" + fromDate + "&toDate=" + toDate + "&view=" + view + "&graph=" + numArr.join()
                , 'HorseMemberReports',
                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
            }
            if (type == 'HorseMembersEventCompetitionsAndMembershipTypeWise') {
                val = window.open("HorseMemberReports.html?process=HorseMembersEventCompetitionsAndMembershipTypeWise&fromDate=" + fromDate + "&toDate=" + toDate + "&view=" + view + "&graph=" + numArr.join()
                , 'HorseMemberReports',
                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
            }

            if (type == 'newlyRegHorseMembersMeberShipWise') {
                val = window.open("HorseMemberReports.html?process=newlyRegHorseMembersMeberShipWise&fromDate=" + fromDate + "&toDate=" + toDate + "&view=" + view + "&graph=" + numArr.join()
                , 'HorseMemberReports',
                'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
            }

        }

    </script>
    <!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
    <!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
    <% String type=(String)request.getAttribute("type");
    System.out.println("type----------->" + type);%>

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
                            <h2>
                                <%  if (type.equalsIgnoreCase("horseStatusWise")) { %>
                                Non-Human Members - Status Wise
                                <%  } else if (type.equalsIgnoreCase("horseMembershipStatusWise")) { %>
                                Non-Human Members - Membership Type Wise
                                <%  } else if(type.equalsIgnoreCase("horseSpecificMembershipAndStatusWise")) { %>
                                Non-Human Members - Membership Type and Status wise
                                <%  } else if(type.equalsIgnoreCase("newlyRegHorseMembersMeberShipWise")) { %>
                                Total Number of Newly Registered Non-Human Members
                                <% } else if(type.equalsIgnoreCase("HorseMembersEventCompetitionsWise")) { %>
                                Non-Humans Participated in Events
                                <% } else if(type.equalsIgnoreCase("HorseMembersEventCompetitionsAndMembershipTypeWise")) { %>
                                Non-Humans Participated in Events - Membership Type Wise
                                <%} %>
                            </h2>
                        </div>
                        <!--==============================Form Title=================================-->

                        <div class="panel-body">

                            <form class='form-horizontal' role='form' name="generateHorseMemberReport" method="post" onsubmit="return validate('<%=type%>');">
                                <% if(type.equalsIgnoreCase("horseStatusWise")) { %>
                                <input type="hidden" name="process" id="process" value="horseMembersStatusWise" />
                                <% } else if (type.equalsIgnoreCase("horseMembershipStatusWise")) { %>
                                <input type="hidden" name="process" id="process" value="horseMembershipStatusWise" />
                                <%  } else if (type.equalsIgnoreCase("horseSpecificMembershipAndStatusWise")){%>
                                <input type="hidden" name="process" id="process" value="HorseSpecificMembershipAndStatusWise" />
                                <% }else if (type.equalsIgnoreCase("newlyRegHorseMembersMeberShipWise")){%>
                                <input type="hidden" name="process" id="process" value="newlyRegHorseMembersMeberShipWise" />
                                <% } else if (type.equalsIgnoreCase("HorseMembersEventCompetitionsWise")){%>
                                <input type="hidden" name="process" id="process" value="HorseMembersEventCompetitionsWise" />
                                <% } else if (type.equalsIgnoreCase("HorseMembersEventCompetitionsAndMembershipTypeWise")){%>
                                <input type="hidden" name="process" id="process" value="HorseMembersEventCompetitionsAndMembershipTypeWise" />
                                <% } %>

                                <% if(type.equalsIgnoreCase("newlyRegHorseMembersMeberShipWise")) { %>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>From Date: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="fromDate" id="fromDate" class="form-control" readonly="true" />
                                                <a onclick="javascript:NewCssCal('fromDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
												<span id="span_astriesk">*</span>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'> To Date: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="toDate" id="toDate" class="form-control" readonly="true" />
                                                <a onclick="javascript:NewCssCal('toDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report type :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="view" id="view" onchange="UpdateSelect();" class="form-control">
                                                    <option value='1'>Graphical</option>
                                                    <option value='2'>Tabular</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Graph types :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
                                                <% if(type.equalsIgnoreCase("horseStatusWise") || type.equalsIgnoreCase("horseMembershipStatusWise") || type.equalsIgnoreCase("newlyRegHorseMembersMeberShipWise") || type.equalsIgnoreCase("HorseMembersEventCompetitionsWise") || type.equalsIgnoreCase("HorseMembersEventCompetitionsAndMembershipTypeWise"))  { %>								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="pie" checked>Pie<br>
                                                </div>

                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="PyramidChart">Pyramid<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="chart">Bar<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="Linechart">Line<br>
                                                </div>
                                                <% } else if(type.equalsIgnoreCase("horseSpecificMembershipAndStatusWise")){%>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="plotformat">PlotFormat<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="chart">Bar<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="cone">Cone<br>
                                                </div>

                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="tube">Tube<br>
                                                </div>
                                                <%} %>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <input type="hidden" name="message" value="xlsToGraph" />

                                </div>

                            </form>

                                <% }else{ %>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>From Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="fromDate" id="fromDate" class="form-control" readonly="true" />
                                                <a onclick="javascript:NewCssCal('fromDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>To date: </label>

                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="toDate" id="toDate" class="form-control" readonly="true" />
                                                <a onclick="javascript:NewCssCal('toDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
								
                                <% if (type.equalsIgnoreCase("horseMembershipStatusWise")||(type.equalsIgnoreCase("horseSpecificMembershipAndStatusWise"))) { %>
                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="status" id="status" class="form-control">
                                                    <option value="Duplicate">Duplicate</option>
                                                    <option value="Merged">Merged</option>
                                                    <option value="Expired">Expired</option>
                                                    <option value="Active">Active</option>
                                                    <option value="Pending">Pending</option>
                                                    <option value="Inactive">Inactive</option>
                                                    <option value="Suspended">Suspended</option>
                                                    <option value="Deceased">Deceased</option>
                                                    <option value="TBD">TBD</option>
                                                    <option value="Retired">Retired</option>
                                                </select>
                                                <span class="asterisk">*</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
								<%  } %>



                                <% if (type.equalsIgnoreCase("horseSpecificMembershipAndStatusWise")) { %>
                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Type: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="membershipid" id="membershipid" class="form-control">
                                                    <option value="A75F797E-5279-4F2C-BC2B-048E88FD9020">Young Event </option>
                                                    <option value="9057F93F-D265-46B3-B5E5-352B275BF191">LIMITED</option>
                                                    <option value="01A46E72-1FBF-412F-8626-3C7CFE48EB57">FUTURE EVENT</option>
                                                    <option value="23967F37-D688-4B20-8662-793AB8F56354">DUPLICATE</option>
                                                    <option value="C3D04478-20DB-434D-A6E9-876FD04609A3">NOT REGISTERED</option>
                                                    <option value="3A1B7858-99B1-456C-AFB9-F220B15654DA">FULL </option>
                                                </select>
                                                <span class="asterisk">*</span>

                                            </div>
                                        </div>
                                    </div>
                                </div>
								<%  } %>
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report type :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="view" id="view" onchange="UpdateSelect();" class="form-control">
                                                    <option value='1'>Graphical</option>
                                                    <option value='2'>Tabular</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Graph types :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
                                                <% if(type.equalsIgnoreCase("horseStatusWise") || type.equalsIgnoreCase("horseMembershipStatusWise") || type.equalsIgnoreCase("newlyRegHorseMembersMeberShipWise") || type.equalsIgnoreCase("HorseMembersEventCompetitionsWise") || type.equalsIgnoreCase("HorseMembersEventCompetitionsAndMembershipTypeWise"))  { %>								<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="pie" checked>Pie<br>
                                                </div>

                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="PyramidChart">Pyramid<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="chart">Bar<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="Linechart">Line<br>
                                                </div>
                                                <% } else if(type.equalsIgnoreCase("horseSpecificMembershipAndStatusWise")){%>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="plotformat">PlotFormat<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="chart">Bar<br>
                                                </div>
                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="cone">Cone<br>
                                                </div>

                                                <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
                                                    <input type="checkbox" name="graph" value="tube">Tube<br>
                                                </div>
                                                <%} %>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Submit</button>
                                    </div>
                                    <input type="hidden" name="message" value="xlsToGraph" />

                                </div>

                            </form>
                                <% }  %>


                               
                        </div>

                        <!--==============================Form Body=================================-->

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

<script language="javascript">

    var cal1 = new calendar2(document.forms['generateHorseMemberReport'].elements['fromDate']);
    cal1.year_scroll = true;
    cal1.time_comp = false;

    var cal2 = new calendar2(document.forms['generateHorseMemberReport'].elements['toDate']);
    cal2.year_scroll = true;
    cal2.time_comp = false;

</script>
