package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApprovalController {
	
	@GetMapping(value = "/writeDocument.do")
	public String writeDocument() {
		return "writeDocument";
	}
	
	@GetMapping(value = "/signList.do")
	public String signList() {
		return "signList";
	}
}
