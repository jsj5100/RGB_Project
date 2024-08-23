package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DeptController {

	@GetMapping(value="deptList.do")
	public String deptList() {
		log.info("부서관리 이동");
		return "deptList";
	}
}
