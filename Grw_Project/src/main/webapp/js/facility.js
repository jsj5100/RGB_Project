//자산 전체 리스트
document.addEventListener('DOMContentLoaded', function() {

	fetch('./fclist/facility.do')
	.then(response => {
		if(!response.ok) {
			throw new Error('response error')
		}
		return response.json();
	})
	.then(data => {
		let fcList = document.getElementById('facility_container');
		if(fcList){
			data.forEach(item => {
				let div = document.createElement('div');
//				console.log(fcList)
				div.textContent = item.fc_name;
//				fcList.append(div);

				div.classList.add('d-flex', 'align-items-center', 'py-2');
				fcList.appendChild(div);
			});
			
		}
		
	})
	.catch(error => {
		console.log('Fetch Error');
	})
});


let dayarry =[]; //날짜 저장
let dayname=[]; //요일명 저장

//당일~12일후 까지 13일간의 기간 테이블
document.addEventListener('DOMContentLoaded', function() {
	
	//조회 날짜 범위 계산하기 오늘을 기점으로 앞으로 9일간의 기간

	//현재날짜
	let today = new Date() 
		
	//9일후의 날짜
	let endday = new Date();
	endday.setDate(today.getDate()+12);
	
	//요일 변환 함수
	function getDayName(day) {	
		const days = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
		return days[day.getDay()];
		} 
	
	for(let d=today; d<=endday; d.setDate(d.getDate()+1)) {
		dayarry.push(d.getDate());
		dayname.push(getDayName(d));
		}
	console.log(dayarry);
	console.log(dayname);

	//daycontainer
	let daylist = document.getElementById('reservation_day_container');
	
	for(i=0; i<dayarry.length; i++) {
		let alink = document.createElement('a');
		let parentli = document.createElement('li')
		
		// 요일 span
        let namespan = document.createElement('span');
        namespan.classList.add('opacity-50', 'fs-7', 'fw-semibold');
        namespan.textContent = dayname[i];
        
        // 날짜 span
        let dayspan = document.createElement('span');
        dayspan.classList.add('fs-6', 'fw-bolder');
        dayspan.textContent = dayarry[i];
        
        // a 태그 설정
        alink.classList.add('nav-link', 'btn', 'd-flex', 'flex-column', 'flex-center', 'rounded-pill', 'min-w-40px', 'me-2', 'py-4', 'btn-active-primary');
        alink.setAttribute('data-bs-toggle', 'tab');
        alink.setAttribute('href', `#kt_schedule_day_${i}`);
        alink.setAttribute('aria-selected', 'false');
        alink.setAttribute('tabindex', '-1');
        alink.setAttribute('role', 'tab');
        
        // a 태그에 span 추가
        alink.append(namespan);
        alink.append(dayspan);
        
        // li 태그 설정
        parentli.classList.add('nav-item', 'me-1');
        parentli.append(alink);
        
        // daylist에 li 추가
        daylist.append(parentli);
        
	}
	
	
//	document.getElementById('kt_schedule_day_0').classList.add('active');
//	document.querySelector('li .nav-link').classList.add('active');

	
})

//전체 일정 조회
document.addEventListener('DOMContentLoaded', function() {
	
	//현재날짜
	let today = new Date() 
		
	//9일후의 날짜
	let endday = new Date();
	endday.setDate(today.getDate()+12);

	//필요한것 날짜(YYYY-MM-DD), 날짜의 요일이므로 형태 변환
	let startDate = today.toISOString().split('T')[0];
	let endDate = endday.toISOString().split('T')[0];

	console.log(startDate, endDate);
	fetch('./booklist/facility.do?'+ new URLSearchParams({
		startDate: startDate,
		endDate:endDate
	}))
	.then(response=>response.json())
	.then(data=>{
		
		data.forEach(item => {
			
			createContents(item);
			reservation(item);
//			console.log('item',item);
		});
		
		//처음 로드 될때 당일 예약일정 보여주기
		let firstTab = document.querySelector('#reservation_day_container .nav-link');
   			if (firstTab) {
        		firstTab.classList.add('active');
       			let firstPane = document.querySelector(`#kt_schedule_day_0`);
        		if (firstPane) {
            		firstPane.classList.add('active');
        	}
   		}
		
	})
	.catch(error=> {
		console.error('Error', error);
	})
});

//예약 일정 콘텐츠 영역
//function createContents(item, index) {
//	
//	for(i=0; i<dayarry.length; i++){
//		
//		let contentContainer = document.getElementById('reservation_content-container');
//		let parentdiv = document.createElement('div'); //제일 최상위박스
//		let bookcontainer = document.createElement('div'); //일정 박스 컨테이너 일정 수만큼 반복
//		let sidebardiv = document.createElement('div'); //옆에그려진 작대기
//		let infodiv = document.createElement('div'); //일정 정보영역
//		let aview  = document.createElement('a'); //view 모달 열어서 정보 자세히보기 창
//		
//		//infodiv 하위
//		let timediv = document.createElement('div'); //시간표기
//		let spantitle = document.createElement('span'); //원래 a태그였는데 변경함
//		let divname = document.createElement('div'); //예약자명
//	
//		
//		//시간형식 변환
//		let startDay = item.bk_stday.slice(5,10).replace('-', '/');
//		let startTime = item.bk_stday.split('T')[1].slice(0, 5);
//		let endDay = item.bk_edday.slice(5,10).replace('-', '/');
//		let endTime = item.bk_edday.split('T')[1].slice(0, 5);
//		
////		console.log(startDay);
////		console.log(startTime);
//	
//		if(new Date(item.bk_stday).getDate()==dayarry[i] || new Date(item.bk_edday).getDate()==dayarry[i]){
//			
//			//시간 박스
//			timediv.classList.add('fs-7','mb-1');
//			//가져온 item.bk_stday 변환하기
//			timediv.textContent=startDay+' '+ startTime + ' ~ '+endDay + ' ' + endTime;
////			console.log(startDay+' '+ startTime + ' ~ '+endDay + ' ' + endTime);
//			
//			//title 작성되는곳
//			spantitle.classList.add('fs-5','fw-bold','text-gray-900','text-hover-primary','mb-2');
//			spantitle.textContent=item.bk_title;
//			
//			//예약자작성
//			divname.classList.add('fs-7','text-muted');
//			divname.textContent=item.bk_name;
//			
//			//일정정보있는 감싸는 상위태그
//			infodiv.classList.add('fw-semibold','ms-5');
//			
//			//사이드바
//			sidebardiv.classList.add('position-absolute','h-100','w-4px','bg-secondary','rounded','top-0','start-0');
//			
//			//view
//			aview.classList.add('btn','btn-light','bnt-active-light-primary','btn-sm');
//			aview.textContent='View';
//			
//			//클래스추가
//			bookcontainer.classList.add('d-flex','flex-stack','position-relative','mt-6');
//			
//			//일정전체컨테이너
//			parentdiv.classList.add('tab-pane','fade','show');
//			parentdiv.setAttribute('id',`kt_schedule_day_${i}`);
//			
//			//조립하기
//			infodiv.append(timediv, spantitle, divname);
//			bookcontainer.append(sidebardiv,infodiv,aview);
//			parentdiv.appendChild(bookcontainer);
//			contentContainer.appendChild(parentdiv);
//			
//		}
//		
//	}
//	
//}

//자산예약현황 날짜별 일정 콘텐츠 영역
function createContents(item, index) {
    for (let i = 0; i < dayarry.length; i++) {
        let contentContainer = document.getElementById('reservation_content-container');
        let parentdiv = document.getElementById(`kt_schedule_day_${i}`);
        
        // parentdiv가 없다면 생성
        if (!parentdiv) {
            parentdiv = document.createElement('div');
            parentdiv.classList.add('tab-pane', 'fade');
            parentdiv.setAttribute('id', `kt_schedule_day_${i}`);
            contentContainer.appendChild(parentdiv);
        }

        // 시간 형식 변환
        let startDay = item.bk_stday.slice(5, 10).replace('-', '/');
        let startTime = item.bk_stday.split('T')[1].slice(0, 5);
        let endDay = item.bk_edday.slice(5, 10).replace('-', '/');
        let endTime = item.bk_edday.split('T')[1].slice(0, 5);

        // 예약 시작일이나 종료일이 해당 날짜와 일치하는지 확인
        if (new Date(item.bk_stday).getDate() == dayarry[i] || new Date(item.bk_edday).getDate() == dayarry[i]) {
            let bookcontainer = document.createElement('div');
            let sidebardiv = document.createElement('div');
            let infodiv = document.createElement('div');
            let timediv = document.createElement('div');
            let titlelink = document.createElement('a');
            let divname = document.createElement('div');
            let aview = document.createElement('a');
            let statediv = document.createElement('div');

            // 시간 표시
            timediv.classList.add('fs-7', 'mb-1');
            timediv.innerHTML = `${startDay} ${startTime} - ${endDay} ${endTime}`;

            // 제목 링크
            titlelink.href = "#";
            titlelink.classList.add('fs-5', 'fw-bold', 'text-gray-900', 'text-hover-primary', 'mb-2');
            titlelink.textContent = item.bk_title;

            // 예약자 정보
            divname.classList.add('fs-7', 'text-muted');
            divname.innerHTML = `예약자 ${item.bk_name}</a>`;

            // 사이드바
            sidebardiv.classList.add('position-absolute', 'h-100', 'w-4px', 'bg-secondary', 'rounded', 'top-0', 'start-0');

            // 보기 버튼
            aview.href = "#";
            aview.classList.add('btn', 'btn-light', 'bnt-active-light-primary', 'btn-sm');
            aview.textContent = 'View';
            
            
            
            //상태 뱃지
//            <div class="badge badge-light-success">Completed</div>
			if(item.bk_state == 'Y') {
				statediv.classList.add('badge','badge-light-success');
				statediv.textContent = '승인';
			} else if (item.bk_state == 'S') {
				statediv.classList.add('badge','badge-light-primary');
				statediv.textContent = '대기';
			} else if(item.bk_state == 'C') { 
				statediv.classList.add('badge','badge-light-warning');
				statediv.textContent = '취소';
			}
			

            // 일정 정보 박스
            infodiv.classList.add('fw-semibold', 'ms-5');
            infodiv.appendChild(timediv);
            infodiv.appendChild(titlelink);
            infodiv.appendChild(divname);

            // 일정 컨테이너
            bookcontainer.classList.add('d-flex', 'flex-stack', 'position-relative', 'mt-6');
            bookcontainer.appendChild(sidebardiv);
            bookcontainer.appendChild(infodiv);
            bookcontainer.appendChild(statediv);
            bookcontainer.appendChild(aview);
            
            // 부모 div에 추가
            parentdiv.appendChild(bookcontainer);
        }
    }
}


//신청현황 조회(처음 로드되었을때 전체 신청내역조회)
function reservation (book) {
	console.log(book);
	
	let contentContainer = document.getElementById('reservation_state_all');
	
			
	let bookcontainer = document.createElement('div');
    let sidebardiv = document.createElement('div');
    let infodiv = document.createElement('div');
    let timediv = document.createElement('div');
    let titlelink = document.createElement('a');
	let divname = document.createElement('div');
    let aview = document.createElement('a');
	let statediv = document.createElement('div');
	let requestTime = document.createElement('div');
	
	// 시간 형식 변환
	let startDay = book.bk_stday.slice(5, 10).replace('-', '/');
	let startTime = book.bk_stday.split('T')[1].slice(0, 5);
	let endDay = book.bk_edday.slice(5, 10).replace('-', '/');
	let endTime = book.bk_edday.split('T')[1].slice(0, 5);
	let regday = book.bk_regdate.slice(5, 10).replace('-', '/');
	let regTime = book.bk_regdate.split('T')[1].slice(0, 5);
	
	//관리자
	if(book.sessionauth == 'FC00A') {
		console.log(book);
			contentContainer.appendChild(bookcontainer);

			let usageTime = document.createElement('div');


            // 시간 표시
            timediv.classList.add('fs-7', 'mb-1');
            timediv.innerHTML = `${startDay} ${startTime} - ${endDay} ${endTime}`;
           	requestTime.innerHTML = `신청시간 : ${regday} ${regTime}`

            // 제목 링크
            titlelink.href = "#";
            titlelink.classList.add('fs-5', 'fw-bold', 'text-gray-900', 'text-hover-primary', 'mb-2');
            titlelink.textContent = book.bk_title;

            // 예약자 정보
            divname.classList.add('fs-7', 'text-muted');
            divname.innerHTML = `신청자 : ${book.bk_name}</a>`;

            // 사이드바
            sidebardiv.classList.add('position-absolute', 'h-100', 'w-4px', 'bg-secondary', 'rounded', 'top-0', 'start-0');

            // 보기 버튼
            aview.href = "#";
            aview.classList.add('btn', 'btn-light', 'bnt-active-light-primary', 'btn-sm');
            aview.textContent = 'View';
            
            //상태 뱃지
//            <div class="badge badge-light-success">Completed</div>
			if(book.bk_state == 'Y') {
				statediv.classList.add('badge','badge-light-success');
				statediv.textContent = '승인';
			} else if (book.bk_state == 'S') {
				statediv.classList.add('badge','badge-light-primary');
				statediv.textContent = '대기';
			} else if(book.bk_state == 'C') { 
				statediv.classList.add('badge','badge-light-warning');
				statediv.textContent = '취소';
			} else {
				statediv.classList.add('badge','badge-light-danger');
				statediv.textContent = '반려';
			}
			
			//시간
			timediv.appendChild(usageTime);
			timediv.appendChild(requestTime);

            // 일정 정보 박스
            infodiv.classList.add('fw-semibold', 'ms-5');
            infodiv.appendChild(timediv);
            infodiv.appendChild(titlelink);
            infodiv.appendChild(divname);

            // 일정 컨테이너
            bookcontainer.classList.add('d-flex', 'flex-stack', 'position-relative', 'mt-6');
            bookcontainer.appendChild(sidebardiv);
            bookcontainer.appendChild(infodiv);
            bookcontainer.appendChild(requestTime);
            bookcontainer.appendChild(statediv);
            bookcontainer.appendChild(aview);
            
		
	} else { //사용자의 신청현황
		if(book.sessionEmp == book.bk_empno) {
			
		} 
	}
}
	
	
