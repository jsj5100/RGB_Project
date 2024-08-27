window.onload=function(){
	
	const today = new Date();
	const year = today.getFullYear();
	const month = today.getMonth() + 1; 
	const date = today.getDate();
	
	var currentYear = document.getElementById('currentYear');
	currentYear.value = `${year}/${month}/${date}`;
}
	
//	document.getElementById('selectTemplate').addEventListener('click', function(){
//		document.getElementById('preview-content').innerHTML='';
//	});

// Global variable to store the fetched data
        let data = []; // 데이터를 저장할 전역 변수를 정의합니다.

        // Function to fetch data from an API
        async function fetchData() {
            try {
                let response = await fetch('http://localhost:8080/Grw_Project/api/data.do'); // API에서 데이터를 비동기적으로 가져옵니다. (여기서 URL을 본인의 API 엔드포인트로 대체해야 합니다)
                if (!response.ok) {
                    throw new Error('Network response was not ok'); // 응답이 실패하면 에러를 던집니다.
                }
                data = await response.json(); // 응답 데이터를 JSON 형식으로 파싱하여 전역 변수에 저장합니다.
                console.log(data[0].temp_content);
                renderList(); // 데이터를 성공적으로 가져온 후 리스트를 렌더링합니다.
            } catch (error) {
                console.error('There was a problem with the fetch operation:', error); // 데이터 가져오기 중 에러가 발생하면 콘솔에 에러를 출력합니다.
                data = []; // 데이터를 빈 배열로 설정하여 에러 상태를 처리합니다.
            }
        }

        // Function to render the list of items
        function renderList() {
            const dataList = document.getElementById('dataList'); // dataList 요소를 선택합니다.
            dataList.innerHTML = ''; // 기존 리스트 항목을 지웁니다.
            data.forEach(item => { // 데이터의 각 항목에 대해 리스트 항목을 생성합니다.
                const li = document.createElement('li'); // 새로운 리스트 항목(li)을 생성합니다.
                li.textContent = item.temp_title; // 리스트 항목에 항목 제목을 설정합니다.
                li.setAttribute('data-id', item.temp_id); // 리스트 항목에 data-id 속성을 설정하여 항목 ID를 저장합니다.
                dataList.appendChild(li); // 리스트 항목을 dataList에 추가합니다.
            });
        }

        // Function to get content by ID
        function getContentById(id) {
            const item = data.find(d => d.temp_id === id); // 데이터에서 ID에 해당하는 항목을 찾습니다.
            return item ? item.temp_content : 'Not found'; // 해당 항목이 있으면 콘텐츠를 반환하고, 없으면 'Not found'를 반환합니다.
        }

        // Update view div based on clicked item
        function updateView(id) {
            const content = getContentById(id); // ID를 기반으로 콘텐츠 정보를 가져옵니다.
            document.getElementById('preview-content').innerHTML = content; // view 요소의 HTML 내용을 업데이트하여 콘텐츠를 표시합니다.
        }

        // Event listener for clicks on list items
        document.addEventListener('DOMContentLoaded', async () => {
            await fetchData(); // 문서가 완전히 로드된 후 데이터를 비동기적으로 가져옵니다.
            
            const dataList = document.getElementById('dataList'); // dataList 요소를 선택합니다.
            dataList.addEventListener('click', (event) => { // 리스트 항목을 클릭했을 때 실행되는 클릭 이벤트 리스너를 추가합니다.
                if (event.target.tagName === 'LI') { // 클릭된 요소가 'LI'인지 확인합니다.
                    const id = event.target.getAttribute('data-id'); // 클릭된 항목의 data-id 속성 값을 가져옵니다.
                    updateView(id); // 선택된 항목의 ID를 기반으로 뷰를 업데이트합니다.
                }
            });
        });
        
        
	


