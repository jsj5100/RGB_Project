package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Login_PagingController {

	@GetMapping(value = "/home.do")
	public String test() {
		return "/home";
	}
	
	@GetMapping(value = "/login.do")
	public String test2() {
	    return "login/login";
	}
	
	@GetMapping(value = "/passwordFind.do")
	public String tets3() {
		return "login/find_password";
	}
	
	@GetMapping(value = "/passwordChange.do")
	public String test4() {
		return "login/new_password";
	}

}
