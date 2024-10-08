//fullcalendar
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('kt_calendar_app');
	  var googleAPI_key = 'AIzaSyASz5EnPZfBWfKLT2tCtxvF7M6Gcp7vKJ4';
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
		
		googleCalendarApiKey : googleAPI_key, //구글 캘린더 키 입력
		locales: 'ko',
	    initialView: 'dayGridMonth', //처음 로드 될 때 보이는 출력 형태(월)
	    editable: true,
	    selectable:true,
	    headerToolbar: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	    },
	    events: [
	      {
	        title: 'Long Event',
	        start: '2024-08-07',
	        end: '2024-08-10'
	      },
	      {
	        title: 'Click for Google',
	        url: 'https://google.com/',
	        start: '2024-08-28'
	      }
	    ],
	   eventSources:[
			{
				googleCalendarId:'ko.south_korea#holiday@group.v.calendar.google.com',											
				className:'koHolidays',						
				color:'#ff0000',
				textColor:'#FFFFFF',
				editable: false
			},
							
		],
	dateClick:function(info) {
		var addModal = new bootstrap.Modal(document.getElementById('kt_modal_add_event'));
                    addModal.show();
	},	
	 eventClick: function(info) {
		var modal = new bootstrap.Modal(document.getElementById('kt_modal_view_event'));
                    modal.show();
//	    alert('Event: ' + info.event.title);
//	    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
//	    alert('View: ' + info.view.type);
	    }
	  });
	//달력초기화시 필수
	 calendar.render();
	});
	