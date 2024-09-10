document.addEventListener('DOMContentLoaded', function(){
	const signBox = document.getElementById('innerSignBox');
//	const signBox = document.getElementsByTagName('table')[0];
//	const tbody = signBox.getElementsByTagName('tbody')[0];
//	const firstTr = tbody.children[0];
//	const newRow = document.createElement('tr');
//	newRow 
//	console.log(signBox);
//	console.log(tbody);
//	console.log(firstTr);
	
	
	fetch('http://localhost:8080/Grw_Project/docSignImg.do')
		.then(response => {
			if (!response.ok) {
                throw new Error("네트워크 응답이 올바르지 않습니다.");
            }
            return response.json();
		})
		.then(data => {
			console.log(data);
			console.log(data.length);
			let content = '';
			for(let i = 0; i < data.length; i++){
				content += `<div class="sign-box">
								<div class= "inner-name-box">${data[i].emp_name}</div>
								<div class="inner-sign-box">
									<img src="data:image/png;base64, ${data[i].base64_img} ">
								</div>
							</div>`

			}
				signBox.innerHTML = content;
		})
		.catch(error => console.error('Error fetching tree data:', error));
});