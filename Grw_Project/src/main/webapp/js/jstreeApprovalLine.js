$(document).ready(function() {
	// 서버에서 트리 데이터를 가져옵니다
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
			// jsTree를 초기화합니다
			$('#jstree').jstree({
				'core': {
					'data': data
				}
			}).on('select_node.jstree', function(e, data) {
				if (data.node.parent === '#') {
					selectedName = "";
					selectedId = "";
				} else {
					selectedName = data.node.text;
					selectedId = data.node.id;
				}
			});
		})
		.catch(error => console.error('Error fetching tree data:', error));

	// 'approvalLineButton' 버튼 클릭 시 동작
	document.getElementById('approvalLineButton').addEventListener('click', function() {
		// 테이블의 행 수를 계산합니다 (헤더를 제외한 행 수)
		const table = document.getElementById('approval-table');
		const rows = table.querySelectorAll('tr');
		const rowCount = rows.length - 2; // 헤더와 첫 번째 빈 행 제외

		if (rowCount >= 3) {
			alert("최대 결재자는 4명까지입니다.");
			return; // 더 이상 행 추가하지 않음
		}

		if (typeof selectedName !== 'undefined' && selectedName) {
			const newRow = document.createElement('tr');

			newRow.innerHTML = `
                <td class="approval-td-body">
                    ${selectedName}
                    <button class="remove-button" aria-label="Remove">X</button>
                </td>
                <td class="approval-td-body">직급</td>
                <td class="approval-td-body">소속</td>
                <td class="approval-td-body">순서</td>
            `;

			// 테이블에 새로운 행을 추가합니다.
			table.appendChild(newRow);

			// 디버깅을 위한 콘솔 로그
			console.log(newRow.outerHTML);

			$('#jstree').jstree('disable_node', selectedId);
			$('#jstree').jstree('deselect_all', true);
		}
	});

	// 테이블에서 remove-button 클릭 시 행 삭제
	document.getElementById('approval-table').addEventListener('click', function(event) {
		if (event.target && event.target.classList.contains('remove-button')) {
			const button = event.target;
			const row = button.closest('tr');
			if (row) {
				row.remove();
			}
		}

		$('#jstree').jstree('enable_node', selectedId);
	});

	document.getElementById('approvalLine-choice').addEventListener('click', function() {
//		// 1. 테이블을 가져옵니다
//		const table = document.getElementById('approval-table');
//
//		// 2. 모든 <tr> 요소를 가져옵니다
//		const rows = table.querySelectorAll('tr');
//
//		// 3. 읽어올 <tr> 인덱스를 배열로 정의합니다 (0-based index)
//		const rowIndexes = [2, 3, 4]; // 3번째, 4번째, 5번째 <tr>의 인덱스
//
//		// 4. 반복문을 사용하여 각 <tr>의 1번째 <td> 텍스트를 읽어옵니다
//		rowIndexes.forEach(index => {
//			if (rows[index]) { // 해당 인덱스에 <tr> 요소가 있는지 확인
//				const firstTd = rows[index].querySelectorAll('td')[0]; // 1번째 <td> 요소
//				if (firstTd) { // <td> 요소가 있는지 확인
//					// <td> 내의 텍스트 노드와 버튼 노드를 분리하여 텍스트만 추출
//					let textContent = Array.from(firstTd.childNodes)
//						.filter(node => node.nodeType === Node.TEXT_NODE) // 텍스트 노드만 필터링
//						.map(node => node.textContent.trim()) // 텍스트 추출 및 공백 제거
//						.join(' '); // 텍스트를 공백으로 구분하여 결합
//
//					console.log(`${index + 1}th row, 1st td:`, textContent); // 결과 출력
//					var approvalLineValue = document.getElementById('approvalLine-value').value;
//					approvalLineValue.innerHTML = textContent;
//				} else {
//					console.warn(`${index + 1}th row, 1st td: <td> not found`);
//				}
//			} else {
//				console.warn(`${index + 1}th row not found`);
//			}
//		});
	});


});
