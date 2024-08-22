//fullcalendar
document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');

	  var calendar = new FullCalendar.Calendar(calendarEl, {
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
	    
	  });

	//달력초기화시 필수
	 calendar.render();
	});
