package com.rgb.grw.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FacilityController {
	
	
	@GetMapping(value = "/facility.do")
	public String calendar(HttpSession session, Model model) {
		Object obj = session.getAttribute("loginDto");
		
//		if(obj == null) {
//			log.info("empno값 확인 : {}", session);
//			return "redirect:/loginServlet.do";
//		} else {
//			return "calendar";
//		}
		
		return "facility";
	}
}
