var calendar;

//events로 항시 조회할 fetchdata 값을 받아서 넣을 전역변수
let calendarData = [];
var selectedEventId=null;

//풀캘린더 달력
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('kt_calendar_app');
    var googleAPI_key = 'AIzaSyASz5EnPZfBWfKLT2tCtxvF7M6Gcp7vKJ4';
    
    calendar = new FullCalendar.Calendar(calendarEl, {
        googleCalendarApiKey: googleAPI_key,
        locales: 'ko',
        timeZone: 'local',
        initialView: 'dayGridMonth',
        eventLimit: true, //하루셀에 표시되는 이벤트 숫자 조절
        views: {
			dayGridMonth: {
				//월간 이벤트수 제한
				eventLimit:3
			}	
		},
        editable: true,
        dayMaxEvents: true,
        selectable: true,
        headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        eventSources: [
            {
                googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                className: 'koHolidays',
                color: '#ff0000',
                textColor: '#FFFFFF',
                editable: false
            },
            {
				events: selectEvents	
			}
        ],
        
        dateClick: function(info) {
			
			//날짜 클릭하면 모달창 열기
			let addModal = new bootstrap.Modal(document.getElementById('kt_modal_add_event'));
			
			//모달엘리먼트 bata-bs-whatever 추가하기
			let modalElement = document.getElementById('kt_modal_add_event');
    		modalElement.setAttribute('data-bs-whatever', 'add_event');
    		
            addModal.show(); //recipient =null반환
            
            //클릭한 날짜 보여주기
            document.getElementById('kt_calendar_datepicker_start_date').value = info.dateStr;
            
            
        },
        eventClick: function(info) {
			
			//상세일정 모달창 열기
			let modal = new bootstrap.Modal(document.getElementById('kt_modal_view_event'));
			modal.show();
			
			//클릭한 event의 id값
            selectedEventId = info.event.id;
        	
        	console.log(selectedEventId);
            detailEvent(selectedEventId);
        	
        	
        	
        }
        
    });

    // 달력 초기화 시 필수
    calendar.render();
});

//addEvent 모달이 열리고 닫힐때 이벤트
document.addEventListener('DOMContentLoaded', function () { 
    // 모달 요소 선택
    var addmodalElement = document.getElementById('kt_modal_add_event');

    // 모달이 닫힐 때 호출될 함수
    function resetModalContent() {
        // 모든 input 요소들을 찾고 초기화
        document.querySelectorAll('#kt_modal_add_event input').forEach(function(input) {
           	if(input.type=='checkbox') {
				input.checked=false;	//체크박스는 안되서 if문으로 걸어줌
			} else {
	            input.value = ''; // 각 input의 값을 빈 문자열로 설정
			}
            
        });
        //셀렉트요소도 있으니까
        document.querySelectorAll('#kt_modal_add_event select').forEach(function(select) {
			select.selectedIndex=0;
		})
        
    }

    // 모달이 닫힐 때 resetModalContent 함수를 호출합니다.
    addmodalElement.addEventListener('hidden.bs.modal', function () {
        resetModalContent();
    });

});


//allday 체크여부에 따라 시간설정
document.addEventListener('DOMContentLoaded', function() {
    // allDay checkbox의 상태가 변경될 때 호출되는 이벤트 핸들러
    document.getElementById('kt_calendar_datepicker_allday').addEventListener('change', function() {
        let isAllDay = document.getElementById('kt_calendar_datepicker_allday').checked;
        console.log(isAllDay);
        
        let startTimeInput = document.getElementById('kt_calendar_datepicker_start_time');
        let endTimeInput = document.getElementById('kt_calendar_datepicker_end_time');
        let startDate = document.getElementById('kt_calendar_datepicker_start_date').value;

        if (isAllDay) {
            startTimeInput.disabled = true;
            endTimeInput.disabled = true;
            document.getElementById('kt_calendar_datepicker_end_date').value = startDate;
            startTimeInput.value = '';  
            endTimeInput.value = '';  
        } else {
            startTimeInput.disabled = false;
            endTimeInput.disabled = false;
        }
    });
});


//일정조회
function selectEvents (fetchInfo, successCallback, failureCallback) {
//	console.log('111')
	const startDate = fetchInfo.start; // 현재 뷰의 시작 날짜
	const endDate = fetchInfo.end;
	
	//달력의 시간값 잘 들어오는지 확인
//	console.log(startDate);
//	console.info(endDate);
	
	fetch('./events/calendar.do?' + new URLSearchParams({
	 
		startDate: startDate.toISOString().split('T')[0],
		endDate: endDate.toISOString().split('T')[0]
		
     	}))
		.then(response => {
			if(!response.ok) {
				throw new Error('HTTP error')
			}
			return response.json()
		})
		.then(data => {
			calendarData = data;
			successCallback(calendarData);
			console.log(calendarData);
		})
		.catch(error => {
			failureCallback();
		});
};

//일정추가
function addEvents() {
		
	let start1 = document.getElementById('kt_calendar_datepicker_start_date').value;
	let start2 = document.getElementById('kt_calendar_datepicker_start_time').value;

	let end1 = document.getElementById('kt_calendar_datepicker_end_date').value;
	let end2 = document.getElementById('kt_calendar_datepicker_end_time').value;
	let start, end 

	let title = document.getElementById('kt_calendar_event_name').value;
	let description = document.getElementById('kt_calendar_event_description').value;
	
	
	//일정제목이 비어있는 경우 체크
	if(title==" "||title=="") {
		alert('제목을 입력해주세요');
		return;
	}
	
	let groupId = document.getElementById('kt_calendar_event_location').value;
// 	console.log(groupId)
	//그룹id 미설정시
	if(groupId==""){
		alert('일정구분해주세요');
		return;
	}
	
	let isAllDay = document.getElementById('kt_calendar_datepicker_allday').checked;
	
	//allDay 체크여부에따른 설정시 시간
	if(isAllDay) {
		start = start1;
		end = end1;
	}else {
		start = start1 + ' ' + start2+':00';
		end= end1 + ' ' + end2+':00';
	}
	
	let startDateTime = new Date(start)
	let endDateTime = new Date(end)
	
	//시간미설정시 
	if(startDateTime=='' || endDateTime=='') {
		alert('시간을 설정해주세요');
	}
	
	console.log('Start', start);
	console.log('End', end);
	console.log('StartDateTime', startDateTime)
	console.log('EndDateTime',endDateTime)
	
	//시작시간보다 종료시간이 앞선 경우
	if(startDateTime>endDateTime) {
		alert('시간 설정이 잘못되었습니다. 다시 설정해주세요');
		return;
	}
	if(description=" " || description==null) {
		description='내용없음';
	}
	
			
	let data = {
		start: start,
		end: end,
		title: title,
		description: description,
		groupId: groupId,
		allDay: isAllDay
	};
	
	//fetch
    fetch('./addevent/calendar.do', { 
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {//성공하면 실행
    	
		console.log('Success:', data);
		let modal = bootstrap.Modal.getInstance(document.getElementById('kt_modal_add_event'));
		modal.hide();
       
		calendar.refetchEvents()
    	
    })
    .catch(error => {
        console.error('Error:', error);
    });
	
}


//일정상세조회
async function detailEvent(eventNo) {
	// +more 버튼 눌러서 드롭박스 열린 상태에서 일정 클릭 시 드롭박스 닫기
	var morePopover = document.querySelector('.fc-popover');
		if (morePopover) {
			morePopover.style.display = 'none';
		}
		
		
		try{
			const response = await fetch('./eventDetail/calendar.do?' + new URLSearchParams({ 
            	eventNo: eventNo
        	}));	
			
			if (!response.ok) {
				throw new Error(`에러났다: ${response.status}`);
			}
			
			const text = await response.text(); //text로 받기
			
			try {
				let data = JSON.parse(text);  // JSON 변환
				console.log("Received data:", data);
                    
				//가져온 값으로 값설정
				let allDayBadge = document.getElementById('allDayBadge');
				
				if (data.sd_allday) {
					allDayBadge.classList.remove('d-none');
				} else {
					allDayBadge.classList.add('d-none');
				}
				
				document.getElementById('event_detail_title').textContent = data.sd_title;
				document.getElementById('event_detail_description').innerHTML = data.sd_content;
				document.getElementById('event_detail_startdate').textContent = data.sd_start;
				document.getElementById('event_detail_enddate').textContent = data.sd_end;
                    
				let element = document.getElementById('codeBadge');
                    
				// 기본 배경 색상 클래스를 제거
				element.classList.remove('bg-primary', 'bg-secondary', 'bg-success', 'bg-danger', 'bg-warning', 'bg-info', 'bg-light', 'bg-dark');
                    
				if (data.sd_code === 'S00') {
				
					document.getElementById('event_detail_location').textContent = '전사';
					element.classList.add('bg-dark');
				
				} else if (data.sd_code === 'S01') {
					
					document.getElementById('event_detail_location').textContent = '개인';
					element.classList.add('bg-info');
				
				} else {
					
					document.getElementById('event_detail_location').textContent = '부서';
					element.classList.add('bg-warning');
				
				}
				
				calendarData = data;
                    
			} catch(e) {
				console.error('JSON Parsing error');
			}
		}
		catch(error) {
			console.error('Error:', error);
		}	
}

//일정 삭제하기
document.addEventListener('DOMContentLoaded', function () {
	
    var deleteBox = document.getElementById('kt_modal_view_event_delete');
    
    if (deleteBox) {
        // 삭제 아이콘에 이벤트걸기
        deleteBox.addEventListener('click', function () {
            let data = { eventNo: selectedEventId };
            console.log('selectedEventId', data);
            
			fetch('./delEvent/calendar.do', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
                    body: JSON.stringify(data)
			})
			.then(response => {
			if (!response.ok) {
				throw new Error(`HTTP error : ${response.status}`);
			}
				return response.json();
			})
			.then(data => {
				console.log('Success:', data);
				calendar.refetchEvents();
			})
			.catch(error => {
				console.error('Error:', error);
			});
            
        });
    } else {
        console.log('클릭안됨');
    }
});



//이벤트 추가 수정 창 스위칭하기
document.addEventListener('DOMContentLoaded', function () {
    // 모달 요소 선택
    let addEditModel = document.getElementById('kt_modal_add_event');
    let registerButton = document.getElementById('kt_modal_add_event_submit');
    let editButton = document.getElementById('kt_modal_add_event_edit');
    
    // 모달이 열릴 때 실행될 이벤트 리스너
    addEditModel.addEventListener('show.bs.modal', function (event) {
		console.log(calendarData);
	    
        // 클릭된 버튼을 참조
        let button = event.relatedTarget;

        // data-bs-whatever의 값을 참조
        let recipient;
        if (button) { //일정추가 버튼을 누르고 추가하는경우
            recipient = button.getAttribute('data-bs-whatever');
        } else { //이벤트 클릭 or 데이트 클릭
            recipient = null;
        }

        // 모달 제목 요소 선택
        let modalHead = addEditModel.querySelector('#kt_modal_head');
        let modalTitle = addEditModel.querySelector('#kt_calendar_event_name');
		let modalDescription = addEditModel.querySelector('#kt_calendar_event_description');
		let modalAllday = addEditModel.querySelector('#kt_calendar_datepicker_allday');
		let modalStartDate = addEditModel.querySelector('#kt_calendar_datepicker_start_date');
		let modalStartTime = addEditModel.querySelector('#kt_calendar_datepicker_start_time');
		let modalEndDate = addEditModel.querySelector('#kt_calendar_datepicker_end_date');
		let modalEndTime = addEditModel.querySelector('#kt_calendar_datepicker_end_time');
		let modalGroupId = addEditModel.querySelector('#kt_calendar_event_location');
		
		let editSubmit = document.getElementById('kt_modal_add_event_submit'); //이벤트 스위칭용
		
        // recipient 값에 따라 모달 제목을 변경
        if (recipient === 'edit_event') {
            modalHead.textContent = '일정 수정';
            modalTitle.value = calendarData.sd_title;
            modalDescription.value = calendarData.sd_content;
            modalAllday.checked = calendarData.sd_allday;
            
            
            //날짜와 시간으로 값 나누기
            let startDate = calendarData.sd_start.split(' ');
            let endDate = calendarData.sd_end.split(' ');
            
            let [startDatePart, startTimePart] = startDate;
            let [endDatePart, endTimePart] = endDate;
            
            if(calendarData.sd_allday) {
				//allday
				modalStartDate.value=startDatePart;
				modalStartTime.value='';
				modalEndDate.value=endDatePart;
				modalEndTime.value=endTimePart='';
				
			} else {
				
				modalStartDate.value=startDatePart;
				modalStartTime.value=startTimePart.slice(0,5);
				modalEndDate.value=endDatePart;
				modalEndTime.value=endTimePart.slice(0,5);;
				
			}
            
            //그룹 코드값
            for(let i=1; i<modalGroupId.options.length; i++) {
				if(modalGroupId.options[i].value === calendarData.sd_code) {
					modalGroupId.selectedIndex = i;
					break;
			}
			console.log(selectedIndex);
			
			//등록버튼 -> 수정버튼
       		registerButton.style.display = 'none';
            editButton.style.display = 'block';
		}
            
        } else {
			//수정버튼 -> 등록버튼
            modalHead.textContent = '일정 추가';
			registerButton.style.display = 'block';
            editButton.style.display = 'none';
        }
    });
});


//일정 수정하기
function editEvents() {
	let start1 = document.getElementById('kt_calendar_datepicker_start_date').value;
	let start2 = document.getElementById('kt_calendar_datepicker_start_time').value;

	let end1 = document.getElementById('kt_calendar_datepicker_end_date').value;
	let end2 = document.getElementById('kt_calendar_datepicker_end_time').value;
	let start, end 

	let title = document.getElementById('kt_calendar_event_name').value;
	let description = document.getElementById('kt_calendar_event_description').value;
	
	
	//일정제목이 비어있는 경우 체크
	if(title==" "||title=="") {
		alert('제목을 입력해주세요');
		return;
	}
	
	let groupId = document.getElementById('kt_calendar_event_location').value;
// 	console.log(groupId)
	//그룹id 미설정시
	if(groupId==""){
		alert('일정구분해주세요');
		return;
	}
	
//	관리자제외 전사게시판 수정 금지(권한 테이블 보고 수정하기)
//	if(groupId=="S00") {
//		alert('수정권한이 없습니다')
//	}
	
	let isAllDay = document.getElementById('kt_calendar_datepicker_allday').checked;
	
	//allDay 체크여부에따른 설정시 시간
	if(isAllDay) {
		start = start1;
		end = end1;
	}else {
		start = start1 + ' ' + start2+':00';
		end= end1 + ' ' + end2+':00';
	}
	
	let startDateTime = new Date(start)
	let endDateTime = new Date(end)
	
	console.log('Start', start);
	console.log('End', end);
	console.log('StartDateTime', startDateTime)
	console.log('EndDateTime',endDateTime)
	
	//시작시간보다 종료시간이 앞선 경우
	if(startDateTime>endDateTime) {
		alert('시간 설정이 잘못되었습니다. 다시 설정해주세요');
		return;
	}
	if(description=" " || description==null) {
		description='내용없음';
	}
	
			
	let data = {
		start: start,
		end: end,
		title: title,
		description: description,
		groupId: groupId,
		allday: isAllDay,
		eventNo: selectedEventId
	};
	
	console.log(data)
	//fetch
    fetch('./modifyEvent/calendar.do', { 
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {//성공하면 실행
    	
		console.log('Success:', data);
		let modal = bootstrap.Modal.getInstance(document.getElementById('kt_modal_add_event'));
		modal.hide();
       
		calendar.refetchEvents()
    	
    })
    .catch(error => {
        console.error('Error:', error);
    });
}