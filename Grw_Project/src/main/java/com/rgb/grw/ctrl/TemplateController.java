package com.rgb.grw.ctrl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.TemplateServiceImpl;

@Controller
public class TemplateController {

	@Autowired
	private TemplateServiceImpl templateServiceImpl;
	
	@GetMapping(value = "/templateList.do")
	public String TemplateList(Model model) {
		List<TemplatePreviewDto> lists = templateServiceImpl.selectTemplateList();
		model.addAttribute("lists", lists);	
		System.out.println("lists : "+lists);
		return "templateList";
	}
	
	@GetMapping(value = "/writeTemplate.do")
	public String WriteTemplate(Model model) {
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
		String strDate = simpleDate.format(date);
		model.addAttribute("strDate", strDate);
		
		return "writeTemplate";
	}
	
	@PostMapping(value = "/uploadTemplate.do")
	public String insertBoard1() {
		TemplatePreviewDto templateDto = new TemplatePreviewDto();
		int n = templateServiceImpl.writeTemplate(templateDto);
		return (n>0)?"templateList":"templateList";
	}
	
	
	@GetMapping(value = "/progressDocument.do")
	public String ProgressDocumentList(Model model) {
		return "progressDocument";
	}
	
	@GetMapping(value = "/draftDocument.do")
	public String DraftedDocumentList() {
		return "drafted";
	}
	
	
	@GetMapping(value = "/rejectedDocument.do")
	public String RejectedDocumentList() {
		return "rejectedDocumentList";
	}
	
	@GetMapping(value = "/referenceDocument.do")
	public String ReferenceDocumentList() {
		return "referenceDocumentList";
	}
	
	@GetMapping(value = "/completeDocument.do")
	public String CompleteDocumentList() {
		return "completeDocumentList";
	}
	
	@GetMapping(value = "/signDocument.do")
	public String SignDocumentList() {
		return "signDocumentList";
	}
	
	@GetMapping(value = "/recycleBin.do")
	public String RecycleBinList() {
		return "recycleBinList";
	}
	
	@GetMapping(value = "/temporaryDocumentList.do")
	public String TemporaryDocumentList() {
		return "temporaryDocumentList";
	}
	
	
}
