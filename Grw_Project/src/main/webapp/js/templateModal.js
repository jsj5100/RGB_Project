window.onload=function(){
	
	const today = new Date();
	const year = today.getFullYear();
	const month = today.getMonth() + 1; 
	const date = today.getDate();
	
	var currentYear = document.getElementById('currentYear');
	currentYear.value = `${year}/${month}/${date}`;
	
	document.getElementById('previewTemlate').addEventListener('click',function(){
		fetch('http://localhost:8080/Grw_Project/api/data.do')	
			.then((res) => {
				if(!res.ok){
					console.log(res);
					throw new Error("오류입니다." + res.status);
				}
				return res.json();
			})
			.then((data) => {
				document.getElementById("preview-content").innerHTML = data.tem;
			})
			.catch((error) => {
				console.error('There was a problem with the fetch operation:', error);
			})
	});
}
	


