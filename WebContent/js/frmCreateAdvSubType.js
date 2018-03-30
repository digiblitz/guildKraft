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
function advValidate()
{
	//--------------------------------drop down--------------------------------
	if(document.frmCreateAdvSubType.mediaId.selectedIndex == 0 ){
        alert ( "Select a Media Type." );
		document.frmCreateAdvSubType.mediaId.focus();
        return false;
    }
	
	//--------------------------------drop down--------------------------------
	if(document.frmCreateAdvSubType.DispId.selectedIndex == 0 ){
        alert ( "Select a Display Type." );
		document.frmCreateAdvSubType.DispId.focus();
        return false;
    }
	 
	
	//-----------------------------Display Sub-Type Name----------------------------------
	if(document.frmCreateAdvSubType.txtDisplaySubType.value==""){
		alert("Display Sub-Type Name cannot be empty.");
		document.frmCreateAdvSubType.txtDisplaySubType.focus();
		return false;
	}

	if(document.frmCreateAdvSubType.txtDisplaySubType.value.length>80){
		alert("Display Sub-Type Name exceeds the maximum of 80 characters.");
		document.frmCreateAdvSubType.txtDisplaySubType.focus();
		return false;
	}
	
   if(document.frmCreateAdvSubType.txtDisplaySubType.value.indexOf('  ')!==-1){
		alert("Enter valid Display Sub-Type Name.");
		document.frmCreateAdvSubType.txtDisplaySubType.focus();
		return false;
	}
	

	if(document.frmCreateAdvSubType.txtDisplaySubType.value.indexOf(' ')==0){
		alert("Enter valid Display Sub-Type Name.");
		document.frmCreateAdvSubType.txtDisplaySubType.focus();
		return false;
	}
	
	//-------------------------------------Description---------------------------------
	if(document.frmCreateAdvSubType.txtareaDesc.value==""){
		alert("Description cannot be empty");
		document.frmCreateAdvSubType.txtareaDesc.focus();
		return false;
	}

	if(document.frmCreateAdvSubType.txtareaDesc.value.indexOf(' ')==0){
		alert("Please avoid white spaces");
		document.frmCreateAdvSubType.txtareaDesc.focus();
		return false;
	}

	if(document.frmCreateAdvSubType.txtareaDesc.value.length>1024){
		alert("Description should not exceed 1024 characters.");
		document.frmCreateAdvSubType.txtareaDesc.focus();
		return false;
	}

	if(document.frmCreateAdvSubType.txtareaDesc.value.indexOf('  ')!==-1){
		alert("Please avoid white spaces");
		document.frmCreateAdvSubType.txtareaDesc.focus();
		return false;
	}
	//alert('advDispSubTypeInsert');
	return true;
}
