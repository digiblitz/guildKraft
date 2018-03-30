//
//Copyright: 2018 digiBlitz Foundation
//
//License: digiBlitz Public License 1.0 (DPL) 
//Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
//
//Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
//
//Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
//
//"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
//
/*  Javascript Document 
******************************************************************************************************************
	Product Name: Integrated Enterprise Dashboard - Association / Club V0.5
	Organization: digiBlitz Technologies (P) Ltd.
    Created by: K.N.Sathish
    Created Date: 07/08/2006  
*****************************************************************************************************************
*/
/* -------------------------------------------------------
	System Date
---------------------------------------------------------*/

var isn1=null;
var isn2=false;
today=new Date();

// Build an array initializer
function isnArray() {
 argnr=isnArray.arguments.length;
 for (var i=0;i<argnr;i++) {
  this[i+1] = isnArray.arguments[i];
  }
 }
// And months and day arrays
var isnMonths=new isnArray("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");
var isnDays= new isnArray("SUN","MON","TUE","WED","THU","FRI","SAT");


/* -------------------------------------------------------
Trapping or disabling the rightclick menu.
---------------------------------------------------------*/

function norightmenu(){
document.oncontextmenu = function(){return false}
}

/* -------------------------------------------------------
 Bookmark a site or page
---------------------------------------------------------*/
//var bookmarkurl="http://www.useventing.com"

var bookmarkurl=window.location.href;
var bookmarktitle="Site Tile";

function addbookmark(){
	if (document.all)
	window.external.AddFavorite(bookmarkurl,bookmarktitle);
}

/* -------------------------------------------------------
 Detecting User's Operating System
---------------------------------------------------------*/

function checkOS() {
  if(navigator.userAgent.indexOf('IRIX') != -1)
    { var OpSys = "Irix"; }
  else if((navigator.userAgent.indexOf('Win') != -1) &&
  (navigator.userAgent.indexOf('95') != -1))
    { var OpSys = "Windows95"; }
  else if(navigator.userAgent.indexOf('Win') != -1)
    { var OpSys = "Windows3.1 or NT"; }
  else if(navigator.userAgent.indexOf('Mac') != -1)
    { var OpSys = "Macintosh"; }
  else { var OpSys = "other"; }
  return OpSys;
}

/* -------------------------------------------------------
 Detecting User's Browser & OS
---------------------------------------------------------*/
var BrowserDetect = {
	init: function init () {
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data) {
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString) {
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{	// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 	// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};
BrowserDetect.init()


/* -------------------------------------------------------
 Swapping Stylesheets
---------------------------------------------------------*/
var csstype="external";
var IECSS='css/core-ie.css';
var IESVNCSS='css/core-iesvn.css';
var FFCSS='css/core-mff.css'; 

if (csstype=="external"){
	if(BrowserDetect.browser == "Explorer"){
		//alert(BrowserDetect.browser);
		if(BrowserDetect.version == "7.0"){
			//alert("Your have been detected using Internet "+BrowserDetect.browser+" "+BrowserDetect.version );
			//alert("IE 7.0 is not supported. For best experience, use Internet Explorer 5.5 or 6.0!");

                //alert("Your have been detected using Internet "+BrowserDetect.browser+" "+BrowserDetect.version+" "+"it's not supported. For best experience, use Internet Explorer 5.5 or 6.0!" );
              
			document.write('<link rel="stylesheet" type="text/css" href="'+ (IESVNCSS) +'" />');
		}else{
			document.write('<link rel="stylesheet" type="text/css" href="'+ (IECSS) +'" />');
		}
	}else if(BrowserDetect.browser == "Firefox"){
		/*alert("Your have been detected using "+BrowserDetect.browser+" "+BrowserDetect.version );
		alert("Your browser is not supported. For best experience, use Internet Explorer 5.5 or 6.0!");
		history.back(-1);*/
		document.write('<link rel="stylesheet" type="text/css" href="'+ (FFCSS) +'" />');
	}
}

function loginIeDetect()
{
if (csstype=="external"){
	if(BrowserDetect.browser == "Explorer"){
		//alert(BrowserDetect.browser);
		if(BrowserDetect.version == "7.0"){
			//alert("Your have been detected using Internet "+BrowserDetect.browser+" "+BrowserDetect.version );
			//alert("IE 7.0 is not supported. For best experience, use Internet Explorer 5.5 or 6.0!");

                //alert("Your have been detected using Internet "+BrowserDetect.browser+" "+BrowserDetect.version+" "+"it's not supported. For best experience, use Internet Explorer 5.5 or 6.0!" );

                alert("Hi !! For you to have a best user experience, please use Internet Explorer 5.5 or 6.0.\nThis version of our application might not provide you with a smooth user experience.\n Internet Explorer 7.0 would be facilitated very soon.");
			

			//document.write('<link rel="stylesheet" type="text/css" href="'+ (IESVNCSS) +'" />');
		}else{
			//document.write('<link rel="stylesheet" type="text/css" href="'+ (IECSS) +'" />');
		}
	}else if(BrowserDetect.browser == "Firefox"){
		/*alert("Your have been detected using "+BrowserDetect.browser+" "+BrowserDetect.version );
		alert("Your browser is not supported. For best experience, use Internet Explorer 5.5 or 6.0!");
		history.back(-1);*/
		document.write('<link rel="stylesheet" type="text/css" href="'+ (FFCSS) +'" />');
	}
}

}
/* -------------------------------------------------------
 Image Preloading
---------------------------------------------------------*/

imgPrArr=new Array()
function imgPreload(imgP){
	imgPrArrT=(imgP+",").split(",");
	for (i in imgPrArrT){
		if (imgPrArrT[i]!=""){
			imgPrArr[imgPrArrT[i]]=new Image();
			imgPrArr[imgPrArrT[i]].src=imgPrArrT[i];
			}
		}
	}
imgPreload("images/i1_2.gif, images/i2_2.gif, images/i3_2.gif");

/* -------------------------------------------------------
 OnMouseOver showing big images of thumbnails.
---------------------------------------------------------*/
/*
ns4=(navigator.appName.indexOf("Netscape")>=0 && !document.getElementById)? 1 : 0;
ie4=(document.all && !document.getElementById)? 1 : 0;
ie5=(document.getElementById && document.all)? 1 : 0;
ns6=(document.getElementById && navigator.appName.indexOf("Netscape")>=0 )? 1: 0;
w3c=(document.getElementById)? 1 : 0;

wid=(ie4||ie5)?window.document.body.clientWidth-20:window.innerWidth-36;


if(ns4){document.write ('<layer name="di1"></layer>')}else{document.write ('<div id="di1" style="position:absolute;z-index:100" ></div>')}

outd=""

if(w3c)div1=document.getElementById('di1')
if(ie4)div1=document.all['di1']
if(ns4)div1=document.layers['di1']

function move_div(x,y){
	if (isNaN(x+y))return
	if(ns4){div1.moveTo(x,y)}else{div1.style.left=x+'px';div1.style.top=y+'px';}
}

function write_div(text){
	if(ns4){
		div1.document.open();
		div1.document.write(text);
		div1.document.close();
	}
	else {div1.innerHTML=text;}
}
 
function big(n){
ondiv=n
		write_div("<a href=javascript:void(0) onmouseout='big_hide()' onmouseover='ondiv=1'><img border=0 name=ib src="+n+"></a>");
		move_div(x,y)
}

function big_hide(){
	ondiv=0;
	t3=window.setTimeout('big_hide2()',100)
}

function big_hide2(){
if (ondiv==0){
	write_div("");
	move_div(-1000,-1000)}
}

y=x=0
function dragIt(evt){if(ie4||ie5){x=window.event.clientX+document.body.scrollLeft; y=window.event.clientY+document.body.scrollTop}else {x=evt.pageX ; y=evt.pageY }}

document.onmousemove = dragIt
if(ns4){document.captureEvents( Event.MOUSEMOVE )}

//<td width="20%" align=center><a href="javascript:void(0)" onmouseover="big('images/i1_2.gif')" onmouseout="big_hide()"><img border="0" name=i1 src="images/i1.gif" width="50" height="50"></a></td>//
*/
/* -------------------------------------------------------
 HLC Related Scripts
---------------------------------------------------------*/

function initCondition(){
	//alert("got in!");
	document.getElementById('parta').style.display = "block";
	document.getElementById('partb').style.display = "none";
	document.getElementById('partc').style.display = "none";
	document.getElementById('partd').style.display = "none"; 
	document.getElementById('parte').style.display = "none";
}

function initConditionTwo(){
	//alert("got in!");
	document.getElementById('parta').style.display = "block";
	document.getElementById('partb').style.display = "none";
	document.getElementById('partc').style.display = "none";
	document.getElementById('partd').style.display = "none"; 
}

function initConditionHorse(){
	//alert("got in!");
	document.getElementById('parta').style.display = "block";
	document.getElementById('partb').style.display = "none";
}

function initConditionMember(){
	//alert("got in!");
	document.getElementById('parta').style.display = "block";
	document.getElementById('partb').style.display = "none";
}

function expandColl(divId){
	if(document.getElementById(divId).style.display == "none"){
			document.getElementById(divId).style.display = "block";	
	}else {
			document.getElementById(divId).style.display = "none";	
	} 
}

function getStyleObject(objectId) {
		  // checkW3C DOM, then MSIE 4, then NN 4.
		  //
		  if(document.getElementById && document.getElementById(objectId)) {
				return document.getElementById(objectId).style;
		   } else if (document.all && document.all(objectId)) {  
				return document.all(objectId).style;
		   } else if (document.layers && document.layers[objectId]) { 
				return document.layers[objectId];
		   } else {
				return false;
		   }
}



function hideImgDiv(divid)	{
	var srcElement = document.getElementById(divid);
    if(srcElement != null) {
         srcElement.style.display='none';
  		}	
	}	
				
function showImgDiv(divid)	{
	var srcElement = document.getElementById(divid);
    if(srcElement != null) {
       srcElement.style.display='block';
  		}	
	}	
	
	
function switchDiv(divID){
			//alert("hi");
		  var styleObj = getStyleObject(divID);
		  
		  if (styleObj){
			//hideAll();
			changeObjectDisplay(divID, "block");
		  }
		  else {
		  	document.getElementById(divId).style.display = "none";
			alert("sorry, this only works in browsers that do Dynamic HTML");
		  }
}

function changeObjectDisplay(objectId, newDisplay) {
			var styleObject = getStyleObject(objectId);
			if (styleObject) {
				styleObject.display = newDisplay;
				return true;
			} else {
				return false;
			}
}

function dispVal(selBx, txtBx){
	var sBx = selBx;
	var tBx = txtBx;
	var el = document.forms[0].elements;
		for (i=0; i < el.length; i++) {
				if (el[i].name == sBx) {
					if (document.getElementById(sBx).value != null) {
						document.getElementById(tBx).value = document.getElementById(sBx).value;
					}
				}
		}
}


function show(rowId){	
		if(document.getElementById(rowId).style.display == "none"){
			document.getElementById(rowId).style.display = "block";
		}
		else{
			document.getElementById(rowId).style.display = "none";
		}
	}


function hide(rowId){	
	if(document.getElementById(rowId).style.display == "block"){
		document.getElementById(rowId).style.display = "none";
	}
	else{
		document.getElementById(rowId).style.display = "block";
	}
}


function disableRad(radBtnId,txtBxId,radVal){
		if(document.getElementById(radBtnId).value == radVal){
			document.getElementById(txtBxId).disabled = false;
			document.getElementById(txtBxId).value = "";
			document.getElementById(txtBxId).focus();
		}
		else{
			document.getElementById(txtBxId).disabled = true;
			document.getElementById(txtBxId).value = " Disabled";
		}
}	

/* -------------------------------------------------------
 	Swapping Classes For Menus
---------------------------------------------------------*/

var selected_id = null;
var dom = document.getElementById;

function swapIt(id, newclass) {
	if (dom) {
		if(selected_id != id) {
			el = document.getElementById(id);
			el.className = newclass;
			el.style.cursor = "hand";
			el.style.cursor = "pointer";
		}
	}
}

function down (id,oldclass,newclass){
	if (dom) {
		if(selected_id != null) {
			document.getElementById(selected_id).className = oldclass;
		}
		el.className = newclass;
		selected_id = id;
	}
}


function naviTab(tab_id,tabLen){
	//alert("tab_id" + tab_id);
	//alert("tabLen" + tabLen);
	
	  for(i=1; i<=tabLen; i++){
			tdId = document.getElementById("tabData"+i);
			divId = document.getElementById("part"+i);
			
			if(tab_id==i){
			  tdId.className="tabHighlight";
			  tdId.style.borderBottom="0px solid #FFFFFF";
			  divId.style["display"]="block";
			  divId.style["visibility"]="visible";
			}
			else{
			  tdId.className="tabLowlight";
			  tdId.style.borderBottom="1px solid #5CA6AC";
			  divId.style["display"]="none";
			  divId.style["visibility"]="hidden";
			}
	  }
}


function naviSubTab(tab2_id){
	  for(i=1; i<=6; i++){
			tdId2 = document.getElementById("tabData2"+i);
			divId = document.getElementById("section"+i);
			
			if(tab2_id==i){
			  tdId2.className="tabHighlight2";
			  tdId2.style.borderBottom="0px solid #FFFFFF";
			  divId.style["display"]="block";
			  divId.style["visibility"]="visible";
			}
			else{
			  tdId2.className="tabLowlight2";
			  tdId2.style.borderBottom="1px solid #486B6E";
			  divId.style["display"]="none";
			  divId.style["visibility"]="hidden";
			}
	  }
}

function LinkSwap(link_id){
	  for(i=1; i<=6; i++){
			linkId = document.getElementById("link"+i);
			if(link_id==i){
			  linkId.className="linkFour";
			  break;
			}
			else{
			  linkId.className="linkSix";;
			  break;
			}
	  }
}

/* -------------------------------------------------------
 	Div Control For Homepage
---------------------------------------------------------*/

var mod = new Array("Membership", "Events & Meetings", "Sponsorship", "Advertisement", "Inventory", "Accounts", "Messaging & Groups", "Role Management");
var dom = document.getElementById;

function subDeptInit(){
	for(i=1; i<=mod.length; i++){
		dom("subDept" + i).style.display = "none";
		dom("module").innerHTML = mod[i-(mod.length)];
		if(i==1){
			dom("subDept1").style.display = "block";
		}
	}
}

function deptTab(tabu_id){
	  for(i=1; i<=mod.length; i++){
			tdId_home = document.getElementById("tabHomeData"+i);
			divId_home = document.getElementById("subDept"+i);
			
			if(tabu_id==i){
			  divId_home.style["display"]="block";
			  divId_home.style["visibility"]="visible";
			  dom("module").innerHTML = mod[i-1];
			}
			else{
			  divId_home.style["display"]="none";
			  divId_home.style["visibility"]="hidden";
			}
	  }
}

//Start:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
function formValidate(obj)
{

	vFlag = false;
	/*for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			if(obj.elements[i].value=="")
			{
				alert("Please enter valid "+parent.document.getElementById('text'+i).value);
				obj.elements[i].focus();
				return false;
			}

			if((obj.elements[i].value.indexOf(' ') == 0) || (obj.elements[i].value.lastIndexOf(' ') == (obj.elements[i].value.length-1)))
			{

				obj.elements[i].value = obj.elements[i].value.trim();
				alert("Leading and Trailing spaces in "+obj.elements[i].name+" will be trimmed.");
				obj.elements[i].focus();
				return false;

			}

			if(isnotAlpha(obj.rolename.value)){
				alert("Please enter valid Role Name");
				obj.rolename.focus();
				return false;
			}
		}

		if(obj.elements[i].type=='radio')
		{
			if(document.getElementById(obj.name).status1.checked==false && document.getElementById(obj.name).status2.checked==false)
			{
				alert("Please choose "+obj.elements[i].name);
				return false;
			}
		}



	}*/

	if(obj.rolename.value==""){
		alert("Please enter valid Role");
		obj.rolename.focus();
		return false;
	}

	if((obj.rolename.value.length >80 )){
		alert("Role cannot have more than 80 characters");
		obj.rolename.focus();
		return false;
	}

	/*if((obj.rolename.value.indexOf('  ')!=-1)||(obj.rolename.value.indexOf(' ')==0)){
		alert("Please enter valid Role Name");
		obj.rolename.focus();
		return false;
	}*/

	if(isnotAlpha(obj.rolename.value)){
		alert("Please enter valid Role");
		obj.rolename.focus();
		return false;
	}

	if(obj.roledesc.value=="")
        {
		alert(" Please enter valid Description");
		obj.roledesc.focus();
		return false;
	}

	if((obj.roledesc.value.length >250 )){
		alert("Description cannot have more than 250 characters");
		obj.roledesc.focus();
		return false;
	}


	/*if((obj.roledesc.value.indexOf('  ')!=-1)||(obj.roledesc.value.indexOf(' ')==0)){
		alert("Please enter Valid Role Description");
		obj.roledesc.focus();
		return false;
	}



	if((obj.rolename.value.indexOf(' ') == 0) || (obj.rolename.value.lastIndexOf(' ') == (obj.rolename.value.length-1)))
	{
		obj.rolename.value = obj.rolename.value.trim();
		alert("Leading and Trailing spaces will be trimmed, Please Submit again");
		obj.rolename.focus();
		return false;
	}

	if((obj.roledesc.value.indexOf(' ') == 0) || (obj.roledesc.value.lastIndexOf(' ') == (obj.roledesc.value.length-1)))
	{
		obj.roledesc.value = obj.roledesc.value.trim();
		alert("Leading and Trailing spaces will be trimmed. Please Submit again");
		obj.roledesc.focus();
		return false;
	}*/
	if(obj.viewId.selectedIndex==0 )
    {
		alert("Please select any one of the View");
		return false;
    }
	if(obj.masterId.selectedIndex==0 )
    {
		alert("Please select any one of the Group");
		return false;
    }

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			if((obj.elements[i].value.indexOf('	') == 0) || (obj.elements[i].value.lastIndexOf('	') == (obj.elements[i].value.length-1)) ||
				(obj.elements[i].value.indexOf(' ') == 0) || (obj.elements[i].value.lastIndexOf(' ') == (obj.elements[i].value.length-1)))
			{
				obj.elements[i].value = obj.elements[i].value.trim();
				//obj.elements[i].focus();
				vFlag = true;
			}
		}
	}

	if(vFlag==true)
	{
		alert("Leading and Trailing spaces will be trimmed. Please Submit again");
		return false;
	}


	if(document.getElementById(obj.name).status1.checked==false && document.getElementById(obj.name).status2.checked==false){
		alert("Please choose the Status");
        return false;
	}

return true;

}

function clearFields(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.elements[i].value = "";
		}

		if(obj.elements[i].type=='radio')
		{
			obj.elements[i].checked = false;
		}
		 if(obj.elements[i].type=='select-one')
        {

            obj.elements[i].value = "";
        }
	}
}
//End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011
