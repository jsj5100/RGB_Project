window.onload=function(){
	
	const today = new Date();
	const year = today.getFullYear();
	const month = today.getMonth() + 1; 
	const date = today.getDate();
	
	var currentYear = document.getElementById("currentYear");
	currentYear.value = `${year}/${month}/${date}`;
	
	}

