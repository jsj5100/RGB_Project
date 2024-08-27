package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public List<Map<String, Object>> calendar(HttpSession session) {
//	    String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
	    List<CalendarDto> calList = service.selectCal("000000");
	    List<Map<String, Object>> events = new ArrayList<>();
	    
	    for (CalendarDto dto : calList) {
	        Map<String, Object> event = new HashMap<>();
	        event.put("title", dto.getSd_title());
	        event.put("start", dto.getSd_start());
	        event.put("end", dto.getSd_end());
	        event.put("allDay", "true");
	        
	        System.out.println(event);
	        
	        events.add(event);
	    }
	    log.info("data: {}", events);
	    return events; // JSON 형식으로 반환
	}
	
	@PostMapping(value = "/addevent/calendar.do")
	public List<CalendarDto> addEvent(HttpSession session) {
//		String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
		
		List<CalendarDto> event = new ArrayList<CalendarDto>();
		
		return event;
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
}
