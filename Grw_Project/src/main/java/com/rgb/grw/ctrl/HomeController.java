package com.rgb.grw.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.AnswerBoardDto;
import com.rgb.grw.service.IAnswerBoardService;

@Controller
@ResponseBody
public class HomeController {
	
	@Autowired
	private IAnswerBoardService service;
	
	@GetMapping(value = "/sidebar.do")
	public String home() {
		return "sideBar";
	}
}
