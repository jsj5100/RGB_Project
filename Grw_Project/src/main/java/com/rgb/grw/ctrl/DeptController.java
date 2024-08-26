package com.rgb.grw.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.service.IDeptService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DeptController {
	
	@Autowired
	private IDeptService service;

//	@GetMapping(value="deptList.do")
//	public String deptList() {
//		log.info("부서관리 이동");
//		return "deptList";
//	}
	
	@GetMapping(value="deptList.do")
	public String DeptList(Model model) {
		List<DeptDto> DeptList = service.DeptList();
		model.addAttribute("DeptList", DeptList);
		log.info("Dept 리스트받기");
		return "deptList";
		
	}
}
