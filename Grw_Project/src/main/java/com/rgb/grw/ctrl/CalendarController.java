package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CalendarController {
	
	@GetMapping(value = "/calendar.do")
	public String calendar() {
		log.info("CalendarController list");
		return "calendar";
	}
}
