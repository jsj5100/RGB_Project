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

		if(session.getAttribute("loginDto") == null) {
			return "redirect:/loginServlet.do";
			
		}
		
//		if(obj == null) {
//			log.info("empno값 확인 : {}", session);
//			return "redirect:/loginServlet.do";
//		} else {
//			return "calendar";
//		}
		
		return "calendar";
	}
}
