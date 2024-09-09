package com.rgb.grw.ctrl;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SecurityErrorController {

	// 시큐리티 에러 컨트롤러
	@GetMapping("/accessError.do")
	public String accessDenied(Authentication auth, Model model) {
		log.info("시큐리티에러 : {}", auth);

		model.addAttribute("msg", "시큐리티에러");
		return "accessError";
	}

}
