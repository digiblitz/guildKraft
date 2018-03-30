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
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);     
				document.getElementById('showLobs').style.display="block";
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		  
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
 
 
  function displayProcDomList() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response  
       var xmlDoc = req.responseXML.documentElement;
	   var xRows= xmlDoc.getElementsByTagName('entry');
	    var objDDL = document.getElementById("domProcId");  
	    objDDL.innerHTML="";	
		
			var rootObj=document.createElement("option");	
		var attrib=document.createAttribute("value");	
			attrib.value="";
		rootObj.setAttributeNode(attrib);	
		newtext=document.createTextNode('Select One');
		rootObj.appendChild(newtext);
		objDDL.appendChild(rootObj);
		
	    for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);  
				document.getElementById('showProDom').style.display="block";   
			 }catch(e){
				objDDL.add(option,-1);
			 }
		  }
		  
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }
 
 //------------------------------ Ajax Script for Views and Grps loading-------------------------
 
 
var reqs;
  
function retrieveURLs(methodName,param) {  
  if(param.value.length>0 && param.value!="") {
 
 var paramName = param.name;
  var urls = null;

 viewPntId=document.getElementById("viewPntId").value;
//alert(document.getElementById("viewPntId").value);
     urls = "UsrSignupAjax.html?cmd="+escape(methodName)+"&viewPntId="+escape(viewPntId)+"&lobId="+escape(param.value);   
  
      if (window.XMLHttpRequest) {
           reqs = new XMLHttpRequest();
		   
       } else if (window.ActiveXObject) {
           reqs = new ActiveXObject("Microsoft.XMLHTTP");
       }
     
           reqs.onreadystatechange = displayViewGrpList;
		 
           
       reqs.open("GET", urls, true);
       reqs.send(null);

    } else { 
		
	    setToDefault('grpId');
       
    }
  }  
  
  
  function displayViewGrpList() {

    if (reqs.readyState == 4) { // Complete
      if (reqs.status == 200) { // OK response  
	  
       var xmlDoc = reqs.responseXML.documentElement;
	   var viewXmlDoc = xmlDoc.getElementsByTagName('issueType')[0];
	   var grpXmlDoc = xmlDoc.getElementsByTagName('displayType')[0];
	   
	    fillDropDownViewTag(viewXmlDoc,'viewId');
	   fillDropDownGrpTag(grpXmlDoc,'grpId');
	  
      } else {
        alert("Problem: " + reqs.statusText);
      }
    }
  }
  
  
  function fillDropDownGrpTag(xmlDoc,objName){

        var xRows= xmlDoc.getElementsByTagName('entry');	   
		var objDDL = document.getElementById(objName);          	          
		objDDL.innerHTML="";	       
			
		
		var rootObj=document.createElement("option");	
		var attrib=document.createAttribute("value");	
			attrib.value="";
		rootObj.setAttributeNode(attrib);	
		newtext=document.createTextNode('Select One');
		rootObj.appendChild(newtext);
		objDDL.appendChild(rootObj);
			
	    for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);   
				document.getElementById('showGrps').style.display="block";     
			 }catch(e){
				objDDL.add(option,-1);
			 }
      }
}
  
  function fillDropDownViewTag(xmlDoc,objNames){

        var xRows= xmlDoc.getElementsByTagName('entry');	   
		var objDDL = document.getElementById(objNames);          	          
		objDDL.innerHTML="";	       
		var rootObj=document.createElement("option");	
		var attrib=document.createAttribute("value");	
			attrib.value="";
		rootObj.setAttributeNode(attrib);	
		newtext=document.createTextNode('Select One');
		rootObj.appendChild(newtext);
		objDDL.appendChild(rootObj);
	    for (var i=0; i<xRows.length; i++) {
			var nameNodes = xRows[i].getElementsByTagName("optionValue");
			var valueNodes = xRows[i].getElementsByTagName("optionText");
			if (nameNodes.length > 0 && valueNodes.length > 0) {
			  var theValue = nameNodes[0].firstChild.nodeValue;
			  var theText = valueNodes[0].firstChild.nodeValue;          
			}
			var option = new Option(theText,theValue);
			 try {
				objDDL.add(option,null);   
				document.getElementById('showViews').style.display="block";  
			 }catch(e){
				objDDL.add(option,-1);
			 }
      }
}
  
 
 
 
 function setToDefault(objName){
    var currObj = document.getElementById(objName);
    currObj.innerHTML="";
	var rootObj =  document.createElement("option");
	var attrib = document.createAttribute("value");
    attrib.value="";
	rootObj.setAttributeNode(attrib);
    newtext=document.createTextNode('Select One');
    rootObj.appendChild(newtext);
    currObj.appendChild(rootObj);

  }
  
 
  
  
  //------------------------------ Ajax Script for Duplicate Checking-------------------------
 
 
var requ;
  
function retrieveURLD(methodName,param) {  
  if(param.value.length>0 && param.value!="") {
 
 var paramName = param.name;
  var urlsd = null;
var artifacId=null; 
		viewPntId=document.getElementById("viewPntId").value;
		lobId=document.getElementById("lobId").value;
		viewId=document.getElementById("viewId").value;
		grpId=document.getElementById("grpId").value;
		domProcId=document.getElementById("domProcId").value;
		articnt=document.getElementById("artiCnt").value;
		
		for(k=0;k<articnt;k++){
		if(document.getElementById("artiFact"+k)!=null && document.getElementById("artiFact"+k).checked==true){
		artifacId =document.getElementById("artiFact"+k).value
		}
		}
	 


 urlsd = "UsrSignupAjax.html?cmd="+escape(methodName)+"&viewPntId="+escape(viewPntId)+"&lobId="+escape(lobId)+"&viewId="+escape(viewId)+"&grpId="+escape(grpId)+"&domProcId="+escape(domProcId)+"&artifactId="+escape(artifacId);   
  
      if (window.XMLHttpRequest) {
           requ = new XMLHttpRequest();
		   
       } else if (window.ActiveXObject) {
           requ = new ActiveXObject("Microsoft.XMLHTTP");
       }
     
           requ.onreadystatechange = displayExistsStatus;
		 
           
       requ.open("GET", urlsd, true);
       requ.send(null);

    } 
  }  
  
  
  function displayExistsStatus() {
	if (requ.readyState == 4) { // Complete
		if (requ.status == 200) { // OK response  
			var arnameXML = requ.responseXML.getElementsByTagName("outValue")[0]; 
			var arnameText = arnameXML.childNodes[0].nodeValue; 		
			
			 updateHTML(arnameXML); 
			
		} 
		else {
			alert("Problem: " + requ.statusText);
		}
	}
}
  
  
   function updateHTML(arnameXML) 
    { 
        //The node valuse will give actual data 
        var arnameText = arnameXML.childNodes[0].nodeValue; 

		if(arnameText != "false")
		{
			alert("Records are already Mapped. Choose another set");
			articnt=document.getElementById("artiCnt").value;
		
		for(d=0;d<articnt;d++){
		if(document.getElementById("artiFact"+d)!=null){
		document.getElementById("artiFact"+d).checked=false;
		}
		}
		}
		      
    } 
	
	function myValidate(){
	if(document.getElementById("viewPntId").value=="")
{alert("Select View points");
 document.getElementById("viewPntId").focus();
 return false;}
	
/*	
if(document.getElementById("lobId").value=="")
{alert("Select any LOBs");
 document.getElementById("lobId").focus();
 return false;}	
 
 if(document.getElementById("viewId").value=="")
{alert("Select any View");
 document.getElementById("viewId").focus();
 return false;}	
 
 
 if(document.getElementById("grpId").value!="")
{
 if(document.getElementById("domProcId").value=="")
{
alert("Select any Domain/Process");
 document.getElementById("domProcId").focus();
return false;
}

 }	*/
	
	
	articnt=document.getElementById("artiCnt").value;
		
		for(d=0;d<articnt;d++){
		if(document.getElementById("artiFact"+d)!=null){
			
		if((document.getElementById("artiFact"+d).checked==false) && (document.getElementById("uploads"+d).value=="")){
			
			
	alert("Check the artifact(s)");	
	document.getElementById("artiFact"+d).focus();		
	 
	 return false;
		}
		if((document.getElementById("artiFact"+d).checked==true) && (document.getElementById("uploads"+d).value==""))
			{
		
			alert("Artifact File cannot be empty");	

			 return false;
			}
		}


	}
	
	
	 return true;
}
	
