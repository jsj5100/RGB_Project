package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.CalendarDto;
import com.rgb.grw.dto.UserInfoDto;
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
	    String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
	    List<CalendarDto> calList = service.selectCal(empno);
	    List<Map<String, Object>> events = new ArrayList<>();
	    
	    for (CalendarDto dto : calList) {
	        Map<String, Object> event = new HashMap<>();
	        event.put("title", dto.getSd_title());
	        event.put("description", dto.getSd_content());
	        event.put("start", dto.getSd_start());
	        event.put("end", dto.getSd_end());
	        event.put("allDay", dto.isSd_allday());
	        
	        
	        String color;
	        //그룹 id 별로 컬러 설정 변경해주기
	        if(dto.getSd_code().equals("S00")) {
	        	color = "#CB6F18";
	        } else if(dto.getSd_code().equals("S01")) {
	        	color = "#8EA499";
	        } else {
	        	color = "#FCB31E";
	        }
	        
				
	        event.put("color", color);
	        
	        
	        
	        System.out.println(event);
	        
	        events.add(event);
	    }
	    log.info("data: {}", events);
	    return events; // JSON 형식으로 반환
	}
	
	@PostMapping(value = "/addevent/calendar.do")
	public boolean addEvent(HttpSession session, @RequestBody Map<String, Object> map) {
		String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
		String writer = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_name();
//		String empno = "000000";
//		String writer="이수빈";
//		List<CalendarDto> event = new ArrayList<CalendarDto>();
		
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
		
	}
}