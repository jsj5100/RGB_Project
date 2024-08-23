package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {

	@GetMapping(value="empList.do")
	public String empList() {
		log.info("사원관리 이동");
		return "empList";
	}
	
	@GetMapping(value="userView.do")
	public String userView() {
		log.info("유저상세조회 이동");
		return "userView";
	}
}
