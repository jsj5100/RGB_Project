package com.rgb.grw.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CalendarController {
	
	@GetMapping(value = "/calendar.do")
	public String calendar(HttpSession session, Model model) {
		log.info("CalendarController list");
		Object obj = session.getAttribute("loginDto");
		
//		if(obj == null) {
//			log.info("empno값 확인 : {}", session);
//			return "redirect:/loginServlet.do";
//		} else {
//			return "calendar";
//		}
		
		return "calendar";
	}
	
	@GetMapping(value = "/facility.do")
	public String facility() {
		log.info("CalendarController list");
		return "facility";
	}

	
	
//	@GetMapping(value = "/calendar.do")
//	public List<CalenderResponseDTO> getEvents(HttpSession session) {
//	    String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
//	    List<CalendarDto> list = service.selectCal(empno);
//	    
//	    List<CalenderResponseDTO> events = new ArrayList<> ();
//	    for(CalendarDto dto : list) {
//	    	events.add(new CalenderResponseDTO(dto.getSd_title(), dto.getSd_start(), dto.getSd_end()));
//	    }
//	    return events; // JSON 형식으로 반환
//	}
	
//	@GetMapping(value = "/calendar.do")
//	public @ResponseBody List<Map<String, Object>> calendar(HttpSession session) {
//	    String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
//	    List<CalendarDto> calList = service.selectCal(empno);
//	    List<Map<String, Object>> calendar = new ArrayList<>();
//	    
//	    for (CalendarDto dto : calList) {
//	        Map<String, Object> event = new HashMap<>();
//	        event.put("title", dto.getSd_title());
//	        event.put("start", dto.getSd_start());
//	        event.put("end", dto.getSd_end());
//	        calendar.add(event);
//	    }
//	    
//	    return calendar; // JSON 형식으로 반환
//	}
}
