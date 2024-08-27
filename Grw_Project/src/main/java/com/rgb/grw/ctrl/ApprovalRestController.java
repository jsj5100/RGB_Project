package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDTO;
import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.service.TemplatePreviewServiceImpl;

@RestController
public class ApprovalRestController {
	
	@Autowired
	private TemplatePreviewServiceImpl serviceImpl;
	
	@GetMapping("/api/data.do")
	public List<TemplatePreviewDto> previewContent(Model model) {
		List<TemplatePreviewDto> lists = serviceImpl.selectTemplate();
		model.addAttribute("lists", lists);
		return lists;
	}
	
	@GetMapping("/jsTree.do")
	public List<JsTreeResponseDTO> getJsTree(){
		List<JsTreeResponseDTO> jsTreeList = new ArrayList<JsTreeResponseDTO>();
		
		List<DeptDto> deptList = serviceImpl.jstreeDep();
		for (DeptDto deptDto : deptList) {
			// id text parent
			jsTreeList.add(new JsTreeResponseDTO(deptDto.getDep_no(), deptDto.getDep_name(), "#"));
		}
		
		List<EmpDto> empList = serviceImpl.jstreeEmp();
		for (EmpDto empDto : empList) {
			jsTreeList.add(new JsTreeResponseDTO(empDto.emp_no, empDto.emp_name, empDto.dep_no));
		}
		return jsTreeList;
	}
}
