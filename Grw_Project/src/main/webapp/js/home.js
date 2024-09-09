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
			
//			//날짜 클릭하면 모달창 열기
//			let addModal = new bootstrap.Modal(document.getElementById('kt_modal_add_event'));
//			
//			//모달엘리먼트 bata-bs-whatever 추가하기
//			let modalElement = document.getElementById('kt_modal_add_event');
//    		modalElement.setAttribute('data-bs-whatever', 'add_event');
//    		
//            addModal.show(); //recipient =null반환
//            
//            //클릭한 날짜 보여주기
//            document.getElementById('kt_calendar_datepicker_start_date').value = info.dateStr;
            
            
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

//자산예약 - 데이터테이블스
var table;
$(document).ready(function() {
	
	let tablelist = document.getElementById('table_list');
	if(tablelist) {
		
	
	table = $("#table_list").DataTable({
        "info": false,
        "paging": true, // 페이징 활성화
        "ordering": true, // 정렬 활성화
        "order": [[3, "desc"]], // 4번째 열 대신 3번째 열(신청일 기준)로 변경
        "ajax":{
			"url" :"./booklist/facility.do",
			"type" :"GET",
			"dataSrc" : ""
		},
		"columns":[
			{"data" : "bk_no"},
			//신청자산
			{"data" :"bk_title"},
			
			{ // 사용기간
                "data": null,
                "render": function (data) {
					
					let startDate = data.bk_stday.split(' ')[0]; // 2024-09-09
					let startTime = data.bk_stday.split(' ')[1].slice(0, -3); // 19:00
					
					let endDate = data.bk_edday.split(' ')[0]; // 2024-09-09
					let endTime = data.bk_edday.split(' ')[1].slice(0, -3); // 20:00
					
					startDate = startDate.slice(5); // 09-09
					endDate = endDate.slice(5); // 09-09
					
					return startDate +' ' + startTime + ' ~ ' + endDate +' ' + endTime;
                }
            },
			// 진행상태
             { "data": null, 
                "render": function (data, type, row) {
                    let state;
                    if (row.bk_state === 'S') {
                        state = '신청대기';
                    } else if (row.bk_state === 'C') {
                        state = '신청취소';
                    } else if (row.bk_state === 'Y') {
                        state = '신청수락';
                    } else {
                        state = '반려';
                    }
                    return "<span data-bs-toggle='modal' data-bs-target='#kt_modal_add_schedule'>"+state+"</span>";
//					return state;
                }
            }
            
		],
		
		
        "columnDefs":[
            {"orderable": false, "targets": 0}, // 첫 번째 열은 정렬 불가
            {"target" : 0, "visible":false , "searchable": false}
        ],
        
    	"responsive": {	
        	"details": {
            	"display": DataTable.Responsive.display.modal({
                header: function (row) {
                    var data = row.data();
                    return '예약신청내역';
                }
            }),
            renderer: DataTable.Responsive.renderer.tableAll({
                tableClass: 'table'
            })
        	}
    	},
    	
    });
		table.on('click', 'tbody tr', (e) => {
	    let classList = e.currentTarget.classList;
	 
	    if (classList.contains('selected')) {
	        classList.remove('selected');
	    }
	    else {
	        table.rows('.selected').nodes().each((row) => row.classList.remove('selected'));
	        classList.add('selected');
	    }
	});
	
	}
});