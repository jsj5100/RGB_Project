$(document).ready(function() {
	// Fetch tree data from the server
	fetch('http://localhost:8080/Grw_Project/choiceApprovalLine.do') // 서버에서 트리 데이터를 가져오는 URL
		.then(response => {
			if (!response.ok) {
				throw new Error("네트워크 응답이 올바르지 않습니다.");
			}
			return response.json();
		})
		.then(data => {
			console.log(data);
			console.log(data[0].id);
			// Initialize jsTree with checkbox plugin
			$('#jstree').jstree({
				'core': {
					'data': data
				}
			}).on('select_node.jstree', function(e, data) {

				if (data.node.parent === '#') {
					selectedNodeText = "";
				} else {
					selectedNodeText = data.node.text;
				}


			});
		})
		.catch(error => console.error('Error fetching tree data:', error));

	$('#approvalLineButton').click(function() {
		if (selectedNodeText) {
			$('#selectedNodeText').append('<p>' + selectedNodeText + '</p>');
		}
	});
});