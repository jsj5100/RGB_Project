package com.rgb.grw.ctrl;

import java.util.ArrayList;
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
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.ICalendarService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
public class CalendarRestController {

	private final ICalendarService service;
	
	//이벤트 전체조회
	@GetMapping(value = "/events/calendar.do")
	public List<Map<String, Object>> calendar(HttpSession session, @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
	    String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
//		String empno = "000000";
		
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
	
	//이벤트 등록
	@PostMapping(value = "/addevent/calendar.do")
	public boolean addEvent(HttpSession session, @RequestBody Map<String, Object> map) {
//		String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
//		String writer = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_name();
		String empno = "000000";
		String writer="테스트";
		
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
	
	//상세조회
	@GetMapping(value = "/eventDetail/calendar.do")
	public CalendarDto eventDto(HttpSession session, @RequestParam("eventNo") int eventNo) {
		CalendarDto event = new CalendarDto();
		int sd_no = eventNo;
		event = service.eventDetail(sd_no);
		return event;
	}
	
	//삭제
	@PostMapping(value="/delEvent/calendar.do")
	public boolean delEvent(@RequestBody Map<String, Integer> map) {
		int eventNo = map.get("eventNo").intValue();
		
		return service.delEvent(eventNo);
	}
	
	//이벤트 수정
	@PostMapping(value="/modifyEvent/calendar.do")
	public boolean modifyEvent(HttpSession session,@RequestBody Map<String, Object> map) {
		
		Map<String, Object> dtoMap = new HashMap<String, Object>();
		String sd_editor = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_name();
		
		dtoMap.put("sd_code", map.get("groupId"));
		dtoMap.put("sd_start", map.get("start"));
		dtoMap.put("sd_end", map.get("end"));
		dtoMap.put("sd_title", map.get("title"));
		dtoMap.put("sd_content", map.get("description"));
		dtoMap.put("sd_editor", sd_editor);
		dtoMap.put("sd_allday", map.get("allday"));
		dtoMap.put("sd_no", map.get("eventNo"));
		
		return service.modifyEvent(dtoMap);
	}
	
}
