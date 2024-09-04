package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.dto.UserInfoDto;
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
	
	@GetMapping("/choiceApprovalLine.do")
	public List<JsTreeResponseDto> getJsTree(){
		List<JsTreeResponseDto> deptJstreeList = serviceImpl.jsTree();
		return deptJstreeList;
	}
	
	@PostMapping("/saveSignatureSign.do")
	public Map<String, Object> saveSignatureSign(@RequestBody Map<String, String> request, HttpSession session){
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		String image = request.get("image");
		
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("sign_img", image);
		response.put("emp_no", loginDto.getEmp_no());
		
		boolean success = serviceImpl.insertSign(response);
		return response;
	}
}
