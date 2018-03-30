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
					document.frmEventRequestReg.name.value="";
					document.frmEventRequestReg.address.value="";
					document.frmEventRequestReg.city.value="";
					document.frmEventRequestReg.phone.value="";
					document.frmEventRequestReg.fax.value="";
					document.frmEventRequestReg.email.value="";
										
					details();
				}

            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
	
//----------------------------------------------

var httpRequestDet;

function details()
{

if(document.frmEventRequestReg.orgnaizerId.value!="" && document.frmEventRequestReg.orgnaizerId.value.indexOf(' ')!=0)
	{

   rid=document.frmEventRequestReg.orgnaizerId.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "RiderInfoAjaxAction.html?rid="+rid; 

        if (window.ActiveXObject) 
        { 
            httpRequestDet = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequestDet = new XMLHttpRequest(); 
        } 
     
        httpRequestDet.open("GET", url, true); 
        
        httpRequestDet.onreadystatechange =processRequest; 
        httpRequestDet.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processRequest() 
    { 
   
        if (httpRequestDet.readyState == 4) 
        { 
            if(httpRequestDet.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequestDet.responseXML.getElementsByTagName("salutation")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateDet(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequestDet.status +":"+ httpRequestDet.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateDet(salutationXML) 
    { 

        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 
        var rdetails=new Array();
        rdetails=null;
        rdetails=salutationText.split("#");
      
	  // alert("rdetails[6] :"+rdetails[6]);
	  		
	    if(rdetails[1]==NaN || rdetails[1]==undefined || rdetails[1]==null || rdetails[1]=="null")
        {
        document.frmEventRequestReg.name.value="NA";
        }else
        document.frmEventRequestReg.name.value=rdetails[1];

        if(rdetails[5]==NaN || rdetails[5]==undefined || rdetails[5]==null || rdetails[5].length==0 || rdetails[5]=="null")
        {
        document.frmEventRequestReg.address.value="NA";
        }else
        document.frmEventRequestReg.address.value=rdetails[5];

        if(rdetails[7]==NaN || rdetails[7]==undefined || rdetails[7]==null || rdetails[7]=="null")
        {
        document.frmEventRequestReg.city .value="NA";
        }else
        document.frmEventRequestReg.city .value=rdetails[7]; 

        if(rdetails[10]==NaN || rdetails[10]==undefined || rdetails[10]==null || rdetails[10]=="null")
        {
        document.frmEventRequestReg.phone.value="NA";
        }else
        document.frmEventRequestReg.phone.value=rdetails[10];

        if(rdetails[12]==NaN || rdetails[12]==undefined || rdetails[12]==null || rdetails[12]=="null")
        {
        document.frmEventRequestReg.email.value="NA";
        }else
        document.frmEventRequestReg.email.value=rdetails[12];
		
		if(rdetails[13]==NaN || rdetails[13]==undefined || rdetails[13]==null || rdetails[13]=="null" || rdetails[13]=="")
        {
        document.frmEventRequestReg.fax.value="NA";
        }else
        document.frmEventRequestReg.fax.value=rdetails[13];

    } 

//=======================================================for Area Zip Validation =========================================
var arHttpRequest1;
function areaDetials(){
	if(document.frmEventRequestReg.zipCode.value!="" && document.frmEventRequestReg.zipCode.value.indexOf(" ")!=0)
	{
    var zip=document.frmEventRequestReg.zipCode.value;
	var areaId = document.frmEventRequestReg.selState.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
            
        var url = "./annualAjax.html?method=areaZipValidation&stateId="+areaId+"&zip="+zip; 

        if (window.ActiveXObject) 
        { 
            arHttpRequest1 = new ActiveXObject("Microsoft.XMLHTTP"); 
           
        } 
        else if (window.XMLHttpRequest) 
        { 
            arHttpRequest1 = new XMLHttpRequest(); 
        } 
     
        arHttpRequest1.open("POST", url, true); 
        
        arHttpRequest1.onreadystatechange = function() {validStatus(); } ; 
        arHttpRequest1.send(null); 
   	} 

}
function validStatus(){
	if (arHttpRequest1.readyState == 4) 
        { 
            if(arHttpRequest1.status == 200) 
            { 
                //get the XML send by the servlet 
                 var arnameXML = arHttpRequest1.responseXML.getElementsByTagName("AreaDetails")[0]; 
				 
				 if(arnameXML != null ){
					 validateDet(arnameXML);
				 }else{
                // var arnameText = arnameXML.childNodes[0].nodeValue;
					 alert("Enter a valid Zipcode");
					 document.frmEventRequestReg.zipCode.value="";
					 document.frmEventRequestReg.areaId.value="";
					 document.frmEventRequestReg.areaTxt.value="";
					 document.frmEventRequestReg.zipCode.focus();
					 return false;		 
				 } 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequestDet.status +":"+ httpRequestDet.statusText); 
            } 
        } 
}
function validateDet(salutationXML){
	
		var salutationText = salutationXML.childNodes[0].nodeValue; 
        var areaDetails=new Array();
        areaDetails=null;
		
        areaDetails=salutationText.split("#");
      
	  
	  		
	    if(areaDetails[0]==NaN || areaDetails[0]==undefined || areaDetails[0]==null || areaDetails[0]=="null")
        {
        document.frmEventRequestReg.areaId.value="NA";
        }else
        document.frmEventRequestReg.areaId.value=areaDetails[0];

        if(areaDetails[1]==NaN || areaDetails[1]==undefined || areaDetails[1]==null || areaDetails[1].length==0 || areaDetails[1]=="null")
        {
        document.frmEventRequestReg.areaTxt.value="NA";
        }else
        document.frmEventRequestReg.areaTxt.value=areaDetails[1];
}
//=========================================================for Sub Level Selection for Event Type=======
function selectLevels(){
	if(document.frmEventRequestReg.eventType.value!="" && document.frmEventRequestReg.eventType.selectedIndex!=0)
	{
    var eventType=document.frmEventRequestReg.eventType.value;
	

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
            
        var url = "./annualAjax.html?method=eventType&eventTypeId="+eventType; 

        if (window.ActiveXObject) 
        { 
            arHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
           
        } 
        else if (window.XMLHttpRequest) 
        { 
            arHttpRequest = new XMLHttpRequest(); 
        } 
     
        arHttpRequest.open("POST", url, true); 
        
        arHttpRequest.onreadystatechange = function() {subLevelStatus(); } ; 
        arHttpRequest.send(null); 
   	} 
	
}
/*function subLevelStatus(){
	if (arHttpRequest.readyState == 4) 
        { 
            if(arHttpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var arnameXML = arHttpRequest.responseXML.getElementsByTagName("size")[0]; 
				 
				 if(arnameXML==null || arnameXML==""){
					 alert("Select a Event Type");					 
					 return false;
				 }
                 var arnameText = arnameXML.childNodes[0].nodeValue;
				 		 
				 subLevelDet(arnameXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ arHttpRequest.status +":"+ arHttpRequest.statusText); 
            } 
        } 
}
function subLevelDet(salutationXML){
	
		var salutationText = salutationXML.childNodes[0].nodeValue; 
        var levelDetails=new Array();
        levelDetails=null;
		for(var i = 0; i<Number(salutationText);i++){
			var subLevelXML = arHttpRequest.responseXML.getElementsByTagName("SubLevelDetails")[i];
			subLevelText = subLevelXML.childNodes[0].nodeValue;
        	levelDetails=subLevelText.split("#");
			if(levelDetails!=null){
      		var mapTypeId = levelDetails[0];
			var levelId = levelDetails[1];
			var eventLevelCode = levelDetails[2];
			var eventLevelName = levelDetails[3];
			addCheckbox(mapTypeId,eventLevelCode);
			}
		}
}

function subLevelStatus(){
	if (arHttpRequest.readyState == 4) 
        { 
            if(arHttpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var arnameXML = arHttpRequest.responseXML//.documentElement; 
				 
				 if(arnameXML==null || arnameXML==""){
					 alert("Select a Event Type");					 
					 return false;
				 }
                 //var arnameText = arnameXML.childNodes[0].nodeValue;
				 //alert(arnameText);		 
				 subLevelDet(arnameXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ arHttpRequest.status +":"+ arHttpRequest.statusText); 
            } 
        } 
}
function subLevelDet(salutationXML){
		alert(salutationXML);
		var salutationText = arHttpRequest.responseXML.getElementsByTagName("SubLevelDetails").length; 
        var levelDetails=new Array();
        levelDetails=null;
		for(var i = 0; i<Number(salutationText);i++){
			var subLevelXML = arHttpRequest.responseXML.getElementsByTagName("SubLevelDetails")[i];
			//subLevelText = subLevelXML.childNodes[0].nodeValue;
        	//levelDetails=subLevelText.split("#");
			if(levelDetails!=null){
      		var mapTypeId = subLevelXML.getElementsByTagName("MapId")[0].childNodes[0].nodeValue//.firstChild.data;
			//var levelId = levelDetails[1];
			var eventLevelCode = subLevelXML.getElementsByTagName("Levelcode")[0].childNodes[0].nodeValue//firstChild.data;
			//var eventLevelName = levelDetails[3];
			addCheckbox(mapTypeId,eventLevelCode);
			}
		}
}


function addCheckbox( mapTypeId,eventLevelCode){
	var tbl = document.getElementById('tblGrid');
	var lastRow = document.frmEventRequestReg.eventCount.value;
	var iteration = eval(lastRow)+1;
	var row = tbl.insertRow(lastRow);
	
	var cellRight = row.insertCell(0);	
	var el = document.createElement('input');
	el.setAttribute('type', 'checkbox');
	el.setAttribute('name', 'eventLevels');
	el.setAttribute('id', 'eventLevels');
	e1.setAttribute('value',''+mapTypeId);
	//el.setAttribute('class', 'fonts_3');
	cellRight.appendChild(el);
	
	var cellLeft = row.insertCell(1);
	var textNode = document.createTextNode(eventLevelCode);
	cellLeft.appendChild(textNode);

	
	document.frmEventRequestReg.eventCount.value = iteration;
}
*/
