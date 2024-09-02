package com.rgb.grw.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.service.IEmpService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {

	@Autowired
	private IEmpService service;
	
	//사원리스트
	@GetMapping(value="empList.do")
	public String empList(Model model) {
		List<EmpDto> EmpList = service.EmpList();
		model.addAttribute("EmpList", EmpList);
		log.info("Emp 리스트받기");
		return "empList";
	}
	

	//사원상세 -> 수정페이지(?)
	@GetMapping(value="userView.do")
	public String userView() {
		log.info("유저상세조회 이동");
		return "userView";
	}
	
	//사원등록
	@PostMapping(value="/addEmp.do")
	public String addEmp(EmpDto dto, HttpServletRequest request) {
		log.info("사원등록 완료");
		int n = 0;
		if( n== 1) {
			return "redirect:/empList.do";
		}else {
			return null; 
		}
	}
	
	
}
