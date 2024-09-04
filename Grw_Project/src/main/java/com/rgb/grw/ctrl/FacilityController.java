package com.rgb.grw.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rgb.grw.dto.FacilityDto;
import com.rgb.grw.service.IFacilityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FacilityController {
	
	private final IFacilityService service;
	
	@GetMapping(value = "/facility.do")
	public String calendar(HttpSession session, Model model) {
		Object obj = session.getAttribute("loginDto");
		
		List<FacilityDto> list = service.getFacility();
		model.addAttribute("fclist", list);
		
		log.info("list 출력 {}",list);
//		model.addAttribute("fcDto" , )
		
		if(obj == null) {
			log.info("empno값 확인 : {}", session);
			return "redirect:/loginServlet.do";
		} else {
			return "facility";
		}
		
//		return "facility";
	}
}
