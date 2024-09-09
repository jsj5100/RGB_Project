package com.rgb.grw.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<DeptDto> DeptList = service.deptList();
		model.addAttribute("DeptList", DeptList);
		log.info("Dept 리스트받기");
		return "deptList";
		
	}
	
	@PostMapping(value="addDept.do")
	public String insertDept(HttpSession session, @RequestParam Map<String, Object> map) {
		log.info("부서등록 완료");
		
		
		Map<String, Object> dtoMap = new HashMap<String, Object>();
		
		dtoMap.put("depNo", map.get("depNo"));
		dtoMap.put("depName", map.get("depName"));
		
		int n = service.insertDept(dtoMap);
		
//		int n = 0;
		 
		/*if (n == 1) {
			return "redirect:deptList.do";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("<script>alert('등록실패'); location.href='./deptList.do';</scrpt>");
			return null;
		}*/
		return "redirect:deptList.do";
	}
	
	@GetMapping(value="deptEdit.do")
	public String deptEdit(Model model) {
		List<DeptDto> depList = service.deptList();
		List<DeptDto> depEdit = service.deptEdit();
		model.addAttribute("deptList", depList);
		model.addAttribute("depEdit", depEdit);
		log.info("부서수정 이동");
		return "deptEdit";
	}
	
	
	@GetMapping(value="deptAuth.do")
	public String deptAuth(Model model) {
		List<DeptDto> depList = service.deptList();
		List<DeptDto> depEdit = service.deptEdit();
		model.addAttribute("deptList", depList);
		model.addAttribute("depEdit", depEdit);
		log.info("부서수정 이동");
		return "deptAuth";
	}
}

