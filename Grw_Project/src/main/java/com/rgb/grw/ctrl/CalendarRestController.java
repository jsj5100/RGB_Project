package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.CalendarDto;
import com.rgb.grw.service.ICalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
public class CalendarRestController {

	private final ICalendarService service;
	
	@GetMapping(value = "/events/calendar.do")
	public List<Map<String, Object>> calendar(HttpSession session, @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
//	    String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
		String empno = "000000";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("empno", empno);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
	    List<CalendarDto> calList = service.selectCal(map);
	    List<Map<String, Object>> events = new ArrayList<>();
	    
	    for (CalendarDto dto : calList) {
	        Map<String, Object> event = new HashMap<>();
	        event.put("id", dto.getSd_no());
	        event.put("title", dto.getSd_title());
	        event.put("description", dto.getSd_content());
	        event.put("start", dto.getSd_start());
	        event.put("end", dto.getSd_end());
	        event.put("allDay", dto.isSd_allday());
	        
	        
	        String color;
	        //그룹 id 별로 컬러 설정 변경해주기
	        switch (dto.getSd_code()) {
			case "S00" :
				color = "#CB6F18";
				break;
			case "S01" :
				color = "#8EA499";
				break;
			case "S02" :
				color = "#FCB31E";
				break;
				
			default:
				color = "#123C38" ;
				
			}
	        
	        event.put("color", color);
	        
	        System.out.println(event);
	        
	        events.add(event);
	    }
	    log.info("data: {}", events);
	    return events; // JSON 형식으로 반환
	}
	
//	@PostMapping(value = "/events/calendar.do")
//	public List<Map<String, Object>> calendar(HttpSession session , @RequestBody Map<String, Object> map) {
////	    String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
//		String empno = "000000";
//	    List<CalendarDto> calList = service.selectCal(empno);
//	    List<Map<String, Object>> events = new ArrayList<>();
//	    
//	    for (CalendarDto dto : calList) {
//	        Map<String, Object> event = new HashMap<>();
//	        event.put("id", dto.getSd_no());
//	        event.put("title", dto.getSd_title());
//	        event.put("description", dto.getSd_content());
//	        event.put("start", dto.getSd_start());
//	        event.put("end", dto.getSd_end());
//	        event.put("allDay", dto.isSd_allday());
//	        
//	        
//	        String color;
//	        //그룹 id 별로 컬러 설정 변경해주기
//	        switch (dto.getSd_code()) {
//			case "S00" :
//				color = "#CB6F18";
//				break;
//			case "S01" :
//				color = "#8EA499";
//				break;
//			case "S02" :
//				color = "#FCB31E";
//				break;
//				
//			default:
//				color = "#123C38" ;
//				
//			}
//	        
//	        event.put("color", color);
//	        
//	        System.out.println(event);
//	        
//	        events.add(event);
//	    }
//	    log.info("data: {}", events);
//	    return events; // JSON 형식으로 반환
//	}
	
	@PostMapping(value = "/addevent/calendar.do")
	public boolean addEvent(HttpSession session, @RequestBody Map<String, Object> map) {
//		String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
//		String writer = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_name();
		String empno = "000000";
		String writer="테스트";
//		List<CalendarDto> event = new ArrayList<CalendarDto>();
		
		//map으로 받은값을 calendarDto
//		CalendarDto dto = new CalendarDto();
//		
//		dto.setSd_empno(empno);
//		dto.setSd_title((String) map.get("title"));
//		dto.setSd_content((String) map.get("description"));
//		dto.setSd_code((String) map.get("groupId"));
//		dto.setSd_allDay((boolean) map.get("allDay"));
//		dto.setSd_start((String) map.get("start"));
//		dto.setSd_writer(writer);
		
		Map<String, Object> dtoMap = new HashMap<String, Object>();
		
		dtoMap.put("sd_empno", empno);
		dtoMap.put("sd_title", map.get("title"));
		dtoMap.put("sd_content",map.get("description"));
		dtoMap.put("sd_code", map.get("groupId"));
		dtoMap.put("sd_allDay", map.get("allDay"));
		dtoMap.put("sd_start", map.get("start"));
		dtoMap.put("sd_end", map.get("end"));
		dtoMap.put("sd_writer", writer);
		dtoMap.put("sd_allday", map.get("allDay"));
		
		return service.insertCal(dtoMap);
		
		
//        // 요청 본문에서 JSON 데이터가 Map으로 전달됩니다.
//        String start = (String) map.get("start");
//        String end = (String) map.get("end");
//        String title = (String) map.get("title");
//        String description = (String) map.get("description");
//        String groupId = (String) map.get("groupId");
//        Boolean isAllDay = (Boolean) map.get("isAllDay");
//
//        // 데이터 유효성 검사
//        if (title == null || title.trim().isEmpty()) {
//            throw new IllegalArgumentException("제목을 입력해주세요");
//        }
//        if (start == null || end == null) {
//            throw new IllegalArgumentException("시작과 종료 시간을 입력해주세요");
//        }
//
//        // 시작 시간과 종료 시간 비교
//        try {
//            Date startDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(start);
//            Date endDateTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(end);
//            if (startDateTime.after(endDateTime)) {
//                throw new IllegalArgumentException("시작 시간보다 종료 시간이 이전입니다");
//            }
//        } catch (ParseException e) {
//            throw new IllegalArgumentException("시간 형식이 올바르지 않습니다");
//        }
//
//        // 데이터 처리 로직 (예: 데이터베이스 저장 등)
//        // 예를 들어: eventService.saveEvent(start, end, title, description, groupId, isAllDay);
//
//        // 처리 성공시 true 반환
//        return true;
		
	}
	
	
//	@GetMapping(value = "/events/calendar.do")
//	public List<CalenderResponseDTO> getEvents(HttpSession session) {
//	    // String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
//	    List<CalendarDto> list = service.selectCal("000000");
//	    
//	    List<CalenderResponseDTO> events = new ArrayList<>();
//	    for (CalendarDto dto : list) {
//	        events.add(new CalenderResponseDTO(dto.getSd_title(), dto.getSd_start(), dto.getSd_end()));
//	    }
//	    log.info("data: {}", events);
//	    return events; // JSON 형식으로 반환
//	}
	
	@GetMapping(value = "/eventDetail/calendar.do")
	public CalendarDto eventDto(HttpSession session, @RequestParam("eventNo") int eventNo) {
		CalendarDto event = new CalendarDto();
		int sd_no = eventNo;
		event = service.eventDetail(sd_no);
		return event;
	}

	@PostMapping(value="/delEvent/calendar.do")
	public boolean delEvent(@RequestBody Map<String, Integer> map) {
		int eventNo = map.get("eventNo").intValue();
		
		return service.delEvent(eventNo);
	}
	
}
