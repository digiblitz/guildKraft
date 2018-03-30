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
function clearFileds(){
	var divisionCountValue=document.frmMapLevel.divisionCount.value;
	for(i=1;i<=divisionCountValue;i++){
		var chbxname = "divisionName"+i;
		var age1 = "ageFrom"+i;
		var age2 = "ageTo"+i;
		if(document.getElementById(chbxname).checked==false){
			document.getElementById(age1).value="";
			document.getElementById(age2).value="";
		}
	}
	return true;
}

function forNumbers(str){
	check="abcdefghijklmnopqrstuvwxyz`~!@#$%^&*()-=_+|][{};:,./?><"+"\\"+"\""+"\'";
	f1=1;
	for(j=0;j<str.length;j++){
		if(check.indexOf(str.charAt(j))!=-1){
			f1=0;}}
	if(f1==0){return true;}
	else{return false;}
}

function mapValidate(){
	if(document.frmMapLevel.eventTypeId.value==""){
		alert("Select any one Event Type");
		document.frmMapLevel.eventTypeId.focus();
		return false;
	}
	
	if(document.frmMapLevel.eventLevelId.value==""){
		alert("Select any one Event Level");
		document.frmMapLevel.eventLevelId.focus();
		return false;
	}

	if(document.frmMapLevel.riderAge.value==""){
		alert("Enter Rider Age");
		document.frmMapLevel.riderAge.focus();
		return false;
	}
	
	if(forNumbers(document.frmMapLevel.riderAge.value)){
		alert("Enter valid Rider Age");
		document.frmMapLevel.riderAge.focus();
		return false;
	}

	if(document.frmMapLevel.horseAge.value==""){
		alert("Enter Horse Age");
		document.frmMapLevel.horseAge.focus();
		return false;
	}
	
	if(forNumbers(document.frmMapLevel.horseAge.value)){
		alert("Enter valid Horse Age");
		document.frmMapLevel.horseAge.focus();
		return false;
	}

	if(document.frmMapLevel.horseRank.value!=""){
		if(forNumbers(document.frmMapLevel.horseRank.value)){
			alert("Enter valid Horse Rank");
			document.frmMapLevel.horseRank.focus();
			return false;
		}
	}

	var divisionCountValue=document.frmMapLevel.divisionCount.value;
	var isChecked = false;
	
	for(i=1;i<=divisionCountValue;i++){
		var chbxname = "divisionName"+i;
		var age1 = "ageFrom"+i;
		var age2 = "ageTo"+i;
		if(document.getElementById(chbxname).checked){
			isChecked = true;
			var fromAge= document.getElementById(age1).value;
			var toAge = document.getElementById(age2).value;
			if(fromAge==""){
				alert("Enter Age From Details");
				document.getElementById(age1).focus();
				return false;
			}
			if(toAge==""){
				alert("Enter Age To Details");
				document.getElementById(age2).focus();
				return false;
			}
			if(forNumbers(fromAge)){
				alert("Enter valid Age From Detail");
				document.getElementById(age1).focus();
				return false;
			}
			if(forNumbers(toAge)){
				alert("Enter valid Age To Detail");
				document.getElementById(age2).focus();
				return false;
			}
		}
	}
	if(isChecked==false){
		alert("Check any one of the check box");
		return false;
	}
	return true;
}
