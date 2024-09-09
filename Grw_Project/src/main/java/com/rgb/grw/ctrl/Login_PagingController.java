package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Login_PagingController {

	// 서버 시작 페이지
	@RequestMapping("/")
	public ModelAndView start() {
		return new ModelAndView("home");
	}

	// 메인화면으로 이동
	@GetMapping(value = "/home.do")
	public String home() {
		return "/home";
	}

	// 비밀번호 찾기로 이동
	@GetMapping(value = "/passwordFind.do")
	public String passwordFind() {
		return "login/find_password";
	}

	// 비밀번호 변경으로 이동
	@GetMapping(value = "/passwordChange.do")
	public String passwordChange() {
		return "login/new_password";
	}

	// 휴가 페이지로 이동
	@GetMapping(value = "/empAttendanceList.do")
	public String empAttendanceList() {
		return "/empAttendanceList";
	}

	// 근태 페이지로로 이동
	@GetMapping(value = "/empVacationList.do")
	public String empVacationList() {
		return "/empVacationList";
	}

}
