$(document).ready(function() {
    let selectedName = "";
    let selectedId = "";
    let selectedDep = "";
    let selectedTierName = "";
    let selectTierNo = "";

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

            // jsTree를 초기화합니다
            $('#jstree').jstree({
                'core': {
                    'data': data
                },
                "plugins" : ["search"]
            }).on('select_node.jstree', function(e, data) {
                if (data.node.parent === '#') {
                    selectedName = "";
                    selectedId = "";
                    selectedDep = "";
                    selectedTierName = "";
                    selectedTierNo = "";
                } else {
                    selectedName = data.node.text;
                    selectedId = data.node.id;
                    selectedDep = data.node.original.dep_name;
                    selectedTierName = data.node.original.tier_name;
                    selectTierNo = data.node.original.tier_no;

                    console.log('Selected Name:', selectedName);
                    console.log('Selected ID:', selectedId);
                    console.log('Selected Department:', selectedDep);
                    console.log('Selected Tier Name:', selectedTierName);
                    console.log('Selected Tier No:', selectTierNo);
                }
            });
        })
        .catch(error => console.error('Error fetching tree data:', error));

    // 순서를 업데이트하는 함수
    function updateRowOrder() {
        const table = document.getElementById('approval-table');
        const rows = table.querySelectorAll('tr[data-node-id]');
        rows.forEach((row, index) => {
            row.querySelector('.order-cell').textContent = index + 2;
        });
    }
	
	//jstree 검색 기능
	$('#search_input').on('keyup', function () {
  	var searchString = $(this).val();
 	 $('#jstree').jstree('search', searchString);
	});
	
    // 'approvalLineButton' 버튼 클릭 시 동작
    document.getElementById('approvalLineButton').addEventListener('click', function() {
        // 테이블의 행 수를 계산합니다 (헤더를 제외한 행 수)
        const table = document.getElementById('approval-table');
        const rows = table.querySelectorAll('tr');
        const rowCount = rows.length - 2; // 헤더와 첫 번째 빈 행 제외

        // 선택된 노드가 유효한지 확인
        if (typeof selectedId === 'undefined' || !selectedId) {
            alert("결재자를 선택해주세요.");
            return;
        }

        // 이미 추가된 노드인지 확인
        const existingRow = table.querySelector(`tr[data-node-id="${selectedId}"]`);
        
        if (existingRow) {
            alert("이미 추가된 결재자입니다.");
            return;
        }

        if (rowCount >= 3) {
            alert("최대 결재자는 4명까지입니다.");
            return; // 더 이상 행 추가하지 않음
        }

        if (selectedName) {
            const newRow = document.createElement('tr');
            newRow.setAttribute('data-node-id', selectedId); // 노드 ID를 데이터 속성으로 저장

            newRow.innerHTML = `
                <td class="approval-td-body">
                    ${selectedName}
                    <button class="remove-button" aria-label="Remove">X</button>
                </td>
                <td class="approval-td-body">${selectedTierName}</td>
                <td class="approval-td-body">${selectedDep}</td>
                <td class="approval-td-body order-cell">순서</td>
                <td class="approval-td-body" style="display:none;">${selectedId}</td>
            `;

            // 테이블에 새로운 행을 추가합니다.
            table.appendChild(newRow);

            // 디버깅을 위한 콘솔 로그
            console.log(newRow.outerHTML);

            // 노드를 비활성화하고 선택 해제
            $('#jstree').jstree('disable_node', selectedId);
            $('#jstree').jstree('deselect_all', true);

            // 포커스 초기화
            $('#jstree').jstree('unselect_all', true);

            // 순서 업데이트
            updateRowOrder();
            
            console.log(selectTierNo);
            if(selectTierNo == 7){
				const nodes = $('#jstree').jstree('get_json');
				console.log(nodes);
				nodes.forEach(node => {
                	console.log(node.children);
            	});
			}
        }
    });
	
	//참조자 지정 버튼
	document.getElementById('ccLineButton').addEventListener('click', function(){
		 // 테이블의 행 수를 계산합니다 (헤더를 제외한 행 수)
        const ccTable = document.getElementById('cc-table');
        const ccRows = ccTable.querySelectorAll('tr');

        // 선택된 노드가 유효한지 확인
        if (typeof selectedId === 'undefined' || !selectedId) {
            alert("참조자를 선택해주세요.");
            return;
        }

        // 이미 추가된 노드인지 확인
        const existingRow = ccTable.querySelector(`tr[data-node-id="${selectedId}"]`);
        if (existingRow) {
            alert("이미 추가된 참조자입니다.");
            return;
        }

        if (selectedName) {
            const newRow = document.createElement('tr');
            newRow.setAttribute('data-node-id', selectedId); // 노드 ID를 데이터 속성으로 저장

            newRow.innerHTML = `
                <td class="approval-td-body">
                    ${selectedName}
                    <button class="remove-button" aria-label="Remove">X</button>
                </td>
                <td class="approval-td-body">${selectedTierName}</td>
                <td class="approval-td-body">${selectedDep}</td>
                <td class="approval-td-body" style="display:none;">${selectedId}</td>
                `;

            // 테이블에 새로운 행을 추가합니다.
            ccTable.appendChild(newRow);

            // 디버깅을 위한 콘솔 로그
            console.log(newRow.outerHTML);

            // 노드를 비활성화하고 선택 해제
            $('#jstree').jstree('disable_node', selectedId);
            $('#jstree').jstree('deselect_all', true);

            // 포커스 초기화
            $('#jstree').jstree('unselect_all', true);

        }
	});
	
	
    // approval 테이블에서 remove-button 클릭 시 행 삭제
    document.getElementById('approval-table').addEventListener('click', function(event) {
        if (event.target && event.target.classList.contains('remove-button')) {
            const button = event.target;
            const row = button.closest('tr');
            if (row) {
                const nodeId = row.getAttribute('data-node-id'); // 저장된 노드 ID를 가져옵니다
                row.remove();

                // 삭제된 노드 ID를 다시 활성화
                if (nodeId) {
                    $('#jstree').jstree('enable_node', nodeId);
                }

                // 순서 업데이트
                updateRowOrder();
            }
        }
    });
    
     document.getElementById('cc-table').addEventListener('click', function(event) {
        if (event.target && event.target.classList.contains('remove-button')) {
            const button = event.target;
            const row = button.closest('tr');
            if (row) {
                const nodeId = row.getAttribute('data-node-id'); // 저장된 노드 ID를 가져옵니다
                row.remove();

                // 삭제된 노드 ID를 다시 활성화
                if (nodeId) {
                    $('#jstree').jstree('enable_node', nodeId);
                }

            }
        }
    });

    document.getElementById('approvalLine-choice').addEventListener('click', function() {
    const approvalLineValueField = document.getElementById('approvalLine-value');
    const approvalLineIdField = document.getElementById('approvalLine-id'); // 새롭게 추가된 id 필드
    const ccLineValueField = document.getElementById('ccLine-value');
    const ccLineLineIdField = document.getElementById('ccLine-id');
    let approvalNamesArray = [];
    let approvalIdsArray = []; // ID 값을 저장할 배열 추가
    let ccNamesArray = [];
    let ccIdsArray = [];

    const approvalTable = document.getElementById('approval-table');
    const ccTable = document.getElementById('cc-table');
    
    const approvalRows = approvalTable.querySelectorAll('tr');
    const ccRows = ccTable.querySelectorAll('tr');

    approvalRows.forEach((row, index) => {
        if (index > 0) { // 첫 번째 행 제외 (헤더 제외)
            const nameCell = row.querySelector('td');
            const idCell = row.querySelector('td:nth-child(5)'); // 숨겨진 ID 셀 선택

            if (nameCell) {
                const textWithoutButton = Array.from(nameCell.childNodes)
                    .filter(node => node.nodeType === Node.TEXT_NODE)
                    .map(node => node.textContent.trim())
                    .join('');
                if (textWithoutButton) {
                    approvalNamesArray.push(textWithoutButton);
                }
            }

            if (idCell) {
                approvalIdsArray.push(idCell.textContent.trim()); // ID 값 저장
            }
        }
    });

    if (approvalNamesArray.length === 0) {
        console.warn('추출된 이름이 없습니다.');
    }

    if (approvalIdsArray.length === 0) {
        console.warn('추출된 ID가 없습니다.');
    }
    
    ccRows.forEach((row, index) => {
        if (index > 0) { // 첫 번째 행 제외 (헤더 제외)
            const nameCell = row.querySelector('td');
            const idCell = row.querySelector('td:nth-child(4)');
            if (nameCell) {
                const textWithoutButton = Array.from(nameCell.childNodes)
                    .filter(node => node.nodeType === Node.TEXT_NODE)
                    .map(node => node.textContent.trim())
                    .join('');
                if (textWithoutButton) {
                    ccNamesArray.push(textWithoutButton);
                }
            }
            if (idCell) {
                ccIdsArray.push(idCell.textContent.trim()); // ID 값 저장
            }
        }
    });

    if (ccNamesArray.length === 0) {
        console.warn('추출된 참조자 이름이 없습니다.');
    }

    const approvalNamesString = approvalNamesArray.join(' -> ');
    const approvalIdsString = approvalIdsArray.join(','); // ID 값을 콤마로 연결
    approvalLineValueField.value = approvalNamesString;
    approvalLineIdField.value = approvalIdsString; // ID 값을 필드에 설정
    
    const ccNamesString = ccNamesArray.join(',');
    const ccIdsString = ccIdsArray.join(',');
    ccLineValueField.value = ccNamesString;
    ccLineLineIdField.value = ccIdsString;
    
    console.log('설정된 결재자 이름:', approvalNamesString);
    console.log('설정된 결재자 ID:', approvalIdsString);
    console.log('설정된 참조자 이름:', ccNamesString);
    console.log('설정된 참조자 ID:', ccIdsString);

    });
});


