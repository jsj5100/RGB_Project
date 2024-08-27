package com.rgb.grw.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.service.TemplatePreviewServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApprovalController {
	
	@Autowired
	private TemplatePreviewServiceImpl serviceImpl;
	
	@GetMapping(value = "/writeDocument.do")
	public String writeDocument(Model model) {
		List<TemplatePreviewDto> lists = serviceImpl.selectTemplate();
		model.addAttribute("lists", lists);
		return "writeDocument";
	}
	
	@GetMapping(value = "/signList.do")
	public String signList() {
		return "signList";
	}
	
	@GetMapping("/api/data.do")
	@ResponseBody
	public List<TemplatePreviewDto> previewContent() {
		serviceImpl.selectTemplate();
		
		return serviceImpl.selectTemplate();
	}
}
