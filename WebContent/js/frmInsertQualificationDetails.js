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
function insertValidate(){
	var eventSize = document.getElementById('eventSize').value;
	var flag = true;
	for(var i=0; i<eventSize; i++){
		
		var levelRank = document.getElementById('levelRank'+i).value;
		var minAge = document.getElementById('minAge'+i).value;
		var maxAge = document.getElementById('maxAge'+i).value;
		var qPeriod = document.getElementById('qPeriod'+i).value;
		var minRank = document.getElementById('minRank'+i).value;
		var minCount = document.getElementById('minCount'+i).value;
		var maxRank = document.getElementById('maxRank'+i).value;
		var jumpPenalties = document.getElementById('jumpPenalties'+i).value;
		var timePenalties = document.getElementById('timePenalties'+i).value;
		var membershipLevel = document.getElementById('membershipLevel'+i).value;
		var amateurStatus = document.getElementById('amateurStatus'+i);
		
		if(document.getElementById('tmpEventLevel'+i).checked){
			flag = false;
		}
		if(document.getElementById('tmpEventLevel'+i).checked){
			if(levelRank=="" && minAge=="" && maxAge=="" && qPeriod=="" && minRank=="" && minCount=="" && maxRank=="" && jumpPenalties=="" && timePenalties=="" && membershipLevel=="" && amateurStatus.checked==false){
				alert("All the Values Can't be Empty");
				document.getElementById('levelRank'+i).focus();
				return false;
			}
			if(levelRank!=""){
				if(!Number(levelRank)){
					alert("Enter valid Event Level Rank");
					document.getElementById('levelRank'+i).focus();
					return false;
				}
			}
			if(minAge!=""){
				if(!Number(minAge)){
					alert("Enter valid Minimum Age");
					document.getElementById('minAge'+i).focus();
					return false;
				}
			}
			if(maxAge!=""){
				if(!Number(maxAge)){
					alert("Enter valid Maximum Age");
					document.getElementById('maxAge'+i).focus();
					return false;
				}
			}
			if(minAge!="" && maxAge!="" && minAge>maxAge){
				alert("Minimum Age Can't Exceed Maximum Age");
				document.getElementById('minAge'+i).focus();
				return false;
			}
			if(qPeriod!=""){
				if(!Number(qPeriod)){
					alert("Enter valid Qualification Level");
					document.getElementById('qPeriod'+i).focus();
					return false;
				}
			}
			if(minRank!=""){
				if(!Number(minRank)){
					alert("Enter valid Minimum Rank");
					document.getElementById('minRank'+i).focus();
					return false;
				}
			}
			if(minCount!=""){
				if(!Number(minCount)){
					alert("Enter valid Minimum Count");
					document.getElementById('minCount'+i).focus();
					return false;
				}
			}
			if(maxRank!=""){
				if(!Number(maxRank)){
					alert("Enter valid Maximum Rank");
					document.getElementById('maxRank'+i).focus();
					return false;
				}
			}
			if(minRank!="" && maxRank!="" && minRank>maxRank){
				alert("Minimum Rank Can't Exceed Maximum Rank");
				document.getElementById('minRank'+i).focus();
				return false;
			}
			if(jumpPenalties!=""){
				if(!Number(jumpPenalties)){
					alert("Enter valid Jump Penalties");
					document.getElementById('jumpPenalties'+i).focus();
					return false;
				}
			}
			if(timePenalties!=""){
				if(!Number(timePenalties)){
					alert("Enter valid Time Penalties");
					document.getElementById('timePenalties'+i).focus();
					return false;
				}
			}
		}
	}
	if(flag){
		alert("Please Check Any Event Level");
		return false;
	}
	return true;
}

function editValidate(){
	var eventSize = document.getElementById('qualiSize').value;
	var flag = true;
	for(var i=0; i<eventSize; i++){
		
		var levelRank = document.getElementById('levelRank'+i).value;
		var minAge = document.getElementById('minAge'+i).value;
		var maxAge = document.getElementById('maxAge'+i).value;
		var qPeriod = document.getElementById('qPeriod'+i).value;
		var minRank = document.getElementById('minRank'+i).value;
		var minCount = document.getElementById('minCount'+i).value;
		var maxRank = document.getElementById('maxRank'+i).value;
		var jumpPenalties = document.getElementById('jumpPenalties'+i).value;
		var timePenalties = document.getElementById('timePenalties'+i).value;
		var membershipLevel = document.getElementById('membershipLevel'+i).value;
		var amateurStatus = document.getElementById('amateurStatus'+i);
		
		if(document.getElementById('eventLevelId'+i).checked){
			flag = false;
		}
		if(document.getElementById('eventLevelId'+i).checked){
			if(levelRank=="" && minAge=="" && maxAge=="" && qPeriod=="" && minRank=="" && minCount=="" && maxRank=="" && jumpPenalties=="" && timePenalties=="" && membershipLevel=="" && amateurStatus.checked==false){
				alert("All the Values Can't be Empty");
				document.getElementById('levelRank'+i).focus();
				return false;
			}
			if(levelRank!=""){
				if(!Number(levelRank)){
					alert("Enter valid Event Level Rank");
					document.getElementById('levelRank'+i).focus();
					return false;
				}
			}
			if(minAge!=""){
				if(!Number(minAge)){
					alert("Enter valid Minimum Age");
					document.getElementById('minAge'+i).focus();
					return false;
				}
			}
			if(maxAge!=""){
				if(!Number(maxAge)){
					alert("Enter valid Maximum Age");
					document.getElementById('maxAge'+i).focus();
					return false;
				}
			}
			if(minAge!="" && maxAge!="" && minAge>maxAge){
				alert("Minimum Age Can't Exceed Maximum Age");
				document.getElementById('minAge'+i).focus();
				return false;
			}
			if(qPeriod!=""){
				if(!Number(qPeriod)){
					alert("Enter valid Qualification Level");
					document.getElementById('qPeriod'+i).focus();
					return false;
				}
			}
			if(minRank!=""){
				if(!Number(minRank)){
					alert("Enter valid Minimum Rank");
					document.getElementById('minRank'+i).focus();
					return false;
				}
			}
			if(minCount!=""){
				if(!Number(minCount)){
					alert("Enter valid Minimum Count");
					document.getElementById('minCount'+i).focus();
					return false;
				}
			}
			if(maxRank!=""){
				if(!Number(maxRank)){
					alert("Enter valid Maximum Rank");
					document.getElementById('maxRank'+i).focus();
					return false;
				}
			}
			if(minRank!="" && maxRank!="" && minRank>maxRank){
				alert("Minimum Rank Can't Exceed Maximum Rank");
				document.getElementById('minRank'+i).focus();
				return false;
			}
			if(jumpPenalties!=""){
				if(!Number(jumpPenalties)){
					alert("Enter valid Jump Penalties");
					document.getElementById('jumpPenalties'+i).focus();
					return false;
				}
			}
			if(timePenalties!=""){
				if(!Number(timePenalties)){
					alert("Enter valid Time Penalties");
					document.getElementById('timePenalties'+i).focus();
					return false;
				}
			}
		}
	}
	if(flag){
		alert("Please Check Any Event Level");
		return false;
	}
	return true;
}
