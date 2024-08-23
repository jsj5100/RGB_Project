package com.rgb.grw.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TemplateController {

	@GetMapping(value = "/draft.do")
	public String TemplateList(Model model) {
		return "DocumentList";
	}
	
	
}
