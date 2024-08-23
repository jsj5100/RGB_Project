package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Login_PagingController {

	@GetMapping(value = "/home.do")
	public String home() {
		return "/home";
	}
	
	@GetMapping(value = "/passwordFind.do")
	public String passwordFind() {
		return "login/find_password";
	}
	
	@GetMapping(value = "/passwordChange.do")
	public String passwordChange() {
		return "login/new_password";
	}
	
	@GetMapping(value = "/myPage.do")
	public String myPage() {
		return "/myPage";
	}
	
	@GetMapping(value = "/empAttendanceList.do")
	public String empAttendanceList() {
		return "/empAttendanceList";
	}
	
	@GetMapping(value = "/empVacationList.do")
	public String empVacationList() {
		return "/empVacationList";
	}

}
