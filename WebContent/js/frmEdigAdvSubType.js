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
function editValidate()
{
	//--------------------------------drop down--------------------------------
	if(document.frmEditAdvSubType.mediaType.selectedIndex == 0 ){
        alert ( "Please select a Media Type." );
		document.frmEditAdvSubType.mediaType.focus();
        return false;
    }
	if(document.frmEditAdvSubType.displayType.selectedIndex == 0 ){
        alert ( "Please select a display Type." );
		document.frmEditAdvSubType.displayType.focus();
        return false;
    }
  
	//-----------------------------Display Sub-Type Name----------------------------------
	if(document.frmEditAdvSubType.txtDisplaySubType.value==""){
		alert(" Display Sub-Type Name cannot be empty.");
		document.frmEditAdvSubType.txtDisplaySubType.focus();
		return false;
	}

	if(document.frmEditAdvSubType.txtDisplaySubType.value.length>80){
		alert("Display Sub-Type Name exceeds the maximum of 80 characters.");
		document.frmEditAdvSubType.txtDisplaySubType.focus();
		return false;
	}
	
   if(document.frmEditAdvSubType.txtDisplaySubType.value.indexOf('  ')!==-1){
		alert("Enter valid Display Sub-Type Name.");
		document.frmEditAdvSubType.txtDisplaySubType.focus();
		return false;
	}
	

	if(document.frmEditAdvSubType.txtDisplaySubType.value.indexOf(' ')==0){
		alert("Enter valid Display Sub-Type Name.");
		document.frmEditAdvSubType.txtDisplaySubType.focus();
		return false;
	}
	
	//-------------------------------------Description---------------------------------
	if(document.frmEditAdvSubType.txtAreaDesc.value==""){
		alert("Description cannot be empty");
		document.frmEditAdvSubType.txtAreaDesc.focus();
		return false;
	}

	if(document.frmEditAdvSubType.txtAreaDesc.value.indexOf(' ')==0){
		alert("Please avoid white spaces");
		document.frmEditAdvSubType.txtAreaDesc.focus();
		return false;
	}

	if(document.frmEditAdvSubType.txtAreaDesc.value.length>1024){
		alert("Description exceeds the maximum of 1024 characters.");
		document.frmEditAdvSubType.txtAreaDesc.focus();
		return false;
	}

	if(document.frmEditAdvSubType.txtAreaDesc.value.indexOf('  ')!==-1){
		alert("Please avoid white spaces");
		document.frmEditAdvSubType.txtAreaDesc.focus();
		return false;
	}
	//alert('advDispSubTypeInsert');
	return true;
}// JavaScript Document
