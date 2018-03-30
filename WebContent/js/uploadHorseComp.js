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
function isnotIntegerChk(str){
stringIntCheck="0123456789.";
f2=1;
for(j=0;j<str.length;j++)
{ if(stringIntCheck.indexOf(str.charAt(j))==-1)
 {f2=0;}}
if(f2==0)
{
return true;
}
  else 
  { 
  return false;
  }
}
//======================================================
function myValidate(){

if(document.getElementById("eventType").selectedIndex == 0)
{
	alert("Select a Event Type");
	document.getElementById("eventType").focus();
	return false;
}

eventId=document.getElementById("eventId").value;
	if(eventId.indexOf(' ')==0){
					alert("Enter a valid Event ID");
					document.getElementById("eventId").focus();
					return false;
				}
if(isnotIntegerChk(eventId))
   {
		alert("Enter a valid Event ID");
		document.getElementById("eventId").focus();
		return false;
	}

//================================
eventName=document.getElementById("eventName").value;
if(eventName.indexOf(' ')==0){
					alert("Enter a valid Event Name");
					document.getElementById("eventName").focus();
					return false;
				}

if(document.getElementById("fileUpload").value == "" || document.getElementById("fileUpload").value.indexOf(' ')==0)
{
	alert("Select a File to Upload");
	document.getElementById("fileUpload").focus();
	return false;
}

if(document.getElementById("fileUpload").value != "" && document.getElementById("fileUpload").value.indexOf(' ')!=0)
{
	tmpval = document.getElementById("fileUpload").value.split(".");
	
	//alert("tmpval.length :"+tmpval.length);
	//alert("tmpval[tmpval.length-1] :"+tmpval[tmpval.length-1]);
	
	if(tmpval[tmpval.length-1] != "xls")
	{
		alert("Please Select a Valid MS Excel File to Upload");	
		document.getElementById("fileUpload").focus();
		return false;
	}
	//alert("Select a File to Upload");
	//document.getElementById("fileUpload").focus();
	
}

return true
	}
