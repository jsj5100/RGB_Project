// 선택한 ID를 저장할 전역 변수
let selectedId = null;

window.onload = function() {
    // CKEditor 4 초기화
    let editorInstance;
    CKEDITOR.replace('editor', {
        allowedContent: true
    });

    CKEDITOR.instances.editor.on('instanceReady', function() {
        editorInstance = CKEDITOR.instances.editor;
    });

    document.getElementById('template-modal-choice').addEventListener('click', function() {
        if (editorInstance) {
            const previewContent = document.getElementById('preview-content').innerHTML;
            editorInstance.setData(previewContent);
        } else {
            console.error('Editor instance not initialized.');
        }

        // 선택한 ID가 있을 때 tempId 입력 필드에 설정
        if (selectedId) {
            console.log('Setting tempId to:', selectedId); // 디버깅을 위한 로그
            document.getElementById('temp-id').value = selectedId;
        } else {
            console.error('No item selected.');
        }
    });
};

// 전역 변수로 데이터를 저장
let data = [];

// API에서 데이터 가져오기
async function fetchData() {
    try {
        let response = await fetch('http://localhost:8080/Grw_Project/api/data.do');
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        data = await response.json();
        renderList();
    } catch (error) {
        console.error('There was a problem with the fetch operation:', error);
        data = [];
    }
}

// 데이터 항목 렌더링
function renderList() {
    const dataList = document.getElementById('dataList');
    dataList.innerHTML = '';
    data.forEach(item => {
        const li = document.createElement('li');
        li.textContent = item.temp_title;
        li.setAttribute('data-id', item.temp_id);
        dataList.appendChild(li);
    });
}

// ID로 내용 가져오기
function getContentById(id) {
    const item = data.find(d => d.temp_id === id);
    return item ? item.temp_content : 'Not found';
}

// ID로 제목 가져오기
function getTitleById(id) {
    const item = data.find(d => d.temp_id === id);
    return item ? item.temp_title : 'Not found';
}

// 클릭한 항목에 따라 뷰 업데이트
function updateView(id) {
    const content = getContentById(id);
    document.getElementById('preview-content').innerHTML = content;
}

// 클릭한 항목에 따라 승인 타입 업데이트
function updateApprovalType(id) {
    const title = getTitleById(id);
    document.getElementById('approval-type').value = title;
}

// 리스트 아이템 클릭 시 이벤트 리스너
document.addEventListener('DOMContentLoaded', async () => {
    await fetchData();

    const dataList = document.getElementById('dataList');
    dataList.addEventListener('click', (event) => {
        if (event.target.tagName === 'LI') {
            selectedId = event.target.getAttribute('data-id'); // 선택한 ID 저장
            console.log('Selected ID:', selectedId); // 디버깅을 위한 로그
            updateView(selectedId);
            updateApprovalType(selectedId);
        }
    });
});
