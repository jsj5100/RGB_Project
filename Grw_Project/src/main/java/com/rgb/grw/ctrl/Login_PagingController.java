package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Login_PagingController {

	@GetMapping(value = "/home.do")
	public String test() {
		
		return "/home";
	}
	
	@GetMapping(value = "/sign_in.do")
	public String test2() {
	    return "login/sign_in";
	}
	
	@GetMapping(value = "/reset_password.do")
	public String tets3() {
		return "login/reset_password";
	}
	
	@GetMapping(value = "/new_password.do")
	public String test4() {
		return "login/new_password";
	}
	
	@GetMapping(value = "/loginForm.do")
	public String test5() {
		return "login/loginForm";
	}

}
