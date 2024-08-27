<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Department and Employees</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
</head>
<body>
	<h1>Department and Employees</h1>
	<div id="jstree"></div>

	<script>
	
// 	$('#jstree').jstree({ 'core' : {
// 	    'data' : [
// 	       { "id" : "001", "parent" : "#", "text" : "영업팀" },
// 	       { "id" : "002", "parent" : "#", "text" : "개발팀" },
// 	       { "id" : "003", "parent" : "001", "text" : "홍길동" },
// 	       { "id" : "004", "parent" : "001", "text" : "강감찬" },
// 	    ]
// 	} });
	  window.onload=function(){
		  $(function() {
		         fetch('http://localhost:8080/Grw_Project/jsTree.do') // 서버에서 트리 데이터를 가져오는 URL
		             .then(response => response.json())
		             .then(data => {
		            	 console.log(data);
		                 $('#jstree').jstree({
		                     'core': {
		                         'data': data
		                     }
		                 });
		             })
		             .catch(error => console.error('Error fetching tree data:', error));
		     });
	  }
	</script>
</body>
</html>
