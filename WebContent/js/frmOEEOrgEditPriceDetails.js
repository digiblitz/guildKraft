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
function myValidate(){
	var eventLvlValue=document.getElementById('noChampSize').value;
	//alert(eventLvlValue);
	if(eventLvlValue!=0){
	var flag=true;
for(var k=1;k<=eventLvlValue;k++){
	var chName = "txtDue"+k;
	var afterdueDt = "txtAfterDue"+k;
	var depAmt = "txtDepAmt"+k;
	
		if(document.getElementById(chName).value!=""){
			flag=false;
		}
		if(document.getElementById(chName).value!="" && document.getElementById(chName).value!=0){
		if(!Number(document.getElementById(chName).value)){
			alert("Enter Valid Due Date Price");
			document.getElementById(chName).focus();
return false;
		}
		}

		if(document.getElementById(chName).value!=""){
		if(document.getElementById(afterdueDt).value==""){
			alert("Enter After Due Date Price");
			document.getElementById(afterdueDt).focus();
return false;

		}
		}	
		if(document.getElementById(afterdueDt).value!="" && document.getElementById(afterdueDt).value!=0){
		if(!Number(document.getElementById(afterdueDt).value)){
			alert("Enter Valid After Due Date Price");
			document.getElementById(afterdueDt).focus();
return false;

		}
		}
		
		if(document.getElementById(depAmt).value!="" && document.getElementById(depAmt).value!=0){
		if(!Number(document.getElementById(depAmt).value)){
			alert("Enter Valid Deposit Amount");
			document.getElementById(depAmt).focus();
return false;

		}
		}
	}
if(flag){
alert("Enter Any Due Date Price");
document.getElementById(chName).focus();
return false;
}
}


var champVal=document.getElementById('champSize').value;
	//alert(champVal);
	if(champVal!=0){
	var flag=true;
for(var k=1;k<=champVal;k++){
	var chName1 = "txtDueC"+k;
	var afterdueDt1 = "txtAfterDueC"+k;
	var depAmt1 = "txtDepAmtC"+k;
		if(document.getElementById(chName1).value!=""){
			flag=false;
		}
		if(document.getElementById(chName1).value!="" && document.getElementById(chName1).value!=0){
		if(!Number(document.getElementById(chName1).value)){
			alert("Enter Valid Due Date Price in Championship Details");
			document.getElementById(chName1).focus();
return false;

		}
		}
		
		if(document.getElementById(chName1).value!=""){
		if(document.getElementById(afterdueDt1).value==""){
			alert("Enter After Due Date Price in Championship Details");
			document.getElementById(afterdueDt1).focus();
return false;

		}
		}
		
		if(document.getElementById(afterdueDt1).value!="" && document.getElementById(afterdueDt1).value!=0){
		if(!Number(document.getElementById(afterdueDt1).value)){
			alert("Enter Valid After Due Date Price in Championship Details");
			document.getElementById(afterdueDt1).focus();
return false;

		}
		}
		
		if(document.getElementById(depAmt1).value!="" && document.getElementById(depAmt1).value!=0){
		if(!Number(document.getElementById(depAmt1).value)){
			alert("Enter Valid Deposit Amount in Championship Details");
			document.getElementById(depAmt1).focus();
return false;

		}
		}
	}
if(flag){
alert("Enter Any one Due Date Price in Championship Details");
document.getElementById(chName1).focus();
return false;
}

}
	return true;
}
