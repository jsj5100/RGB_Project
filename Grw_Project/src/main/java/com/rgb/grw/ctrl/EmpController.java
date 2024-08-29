package com.rgb.grw.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.service.IEmpService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {

	@Autowired
	private IEmpService service;
	
	@GetMapping(value="empList.do")
	public String empList(Model model) {
		List<EmpDto> EmpList = service.EmpList();
		model.addAttribute("EmpList", EmpList);
		log.info("Emp 리스트받기");
		return "empList";
	}
	

	
	@GetMapping(value="userView.do")
	public String userView() {
		log.info("유저상세조회 이동");
		return "userView";
	}
	
	
	
}
