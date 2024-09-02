window.onload = function() {

    // Initialize CKEditor 4
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
    });
};

// Global variable to store the fetched data
let data = [];

// Function to fetch data from an API
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

// Function to render the list of items
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

// Function to get content by ID
function getContentById(id) {
    const item = data.find(d => d.temp_id === id);
    return item ? item.temp_content : 'Not found';
}

// Function to get title by ID
function getTitleById(id) {
    const item = data.find(d => d.temp_id === id);
    return item ? item.temp_title : 'Not found';
}

// Update view div based on clicked item
function updateView(id) {
    const content = getContentById(id);
    document.getElementById('preview-content').innerHTML = content;
}

// Update approval type with title based on ID
function updateApprovalType(id) {
    const title = getTitleById(id);
    document.getElementById('approval-type').value = title;
}

// Event listener for clicks on list items
document.addEventListener('DOMContentLoaded', async () => {
    await fetchData();

    const dataList = document.getElementById('dataList');
    dataList.addEventListener('click', (event) => {
        if (event.target.tagName === 'LI') {
            const id = event.target.getAttribute('data-id');
            updateView(id);
            updateApprovalType(id);
        }
    });
});
