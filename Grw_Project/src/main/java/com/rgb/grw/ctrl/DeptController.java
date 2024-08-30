package com.rgb.grw.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	@PostMapping(value="addDept.do")
	public String insertDept(DeptDto dto, HttpSession session, HttpServletResponse response) throws IOException {
		log.info("부서등록 완료");
		int n = service.insertDept(dto);
		
		
//		int n = 0;
		if (n == 1) {
			return "redirect:deptList.do";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("<script>alert('등록실패'); location.href='./deptList.do';</scrpt>");
			return null;
		}
	}
	
	@GetMapping(value="deptEdit.do")
	public String deptEdit() {
		log.info("부서수정 이동");
		return "deptEdit";
	}


}
