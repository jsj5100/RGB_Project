	package com.rgb.grw.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rgb.grw.dto.DocumentListDto;
import com.rgb.grw.dto.TemplateDto;
import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.DocumentListServiceImpl;
import com.rgb.grw.service.TemplateServiceImpl;

@Controller
public class TemplateController {

	@Autowired
	private TemplateServiceImpl templateServiceImpl;
	
	@Autowired
	private DocumentListServiceImpl documentListServiceImpl;
	
	@GetMapping(value = "/templateList.do")
	public String TemplateList(Model model) {
		List<TemplateDto> lists = templateServiceImpl.selectTemplateList();
		model.addAttribute("lists", lists);	
		return "templateList";
	}
	
	@GetMapping(value = "/writeTemplate.do")
	public String WriteTemplate(Model model, HttpServletRequest request) {
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
		String strDate = simpleDate.format(date);
		model.addAttribute("strDate", strDate);
		
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		String writeName = loginDto.getEmp_name();
		model.addAttribute("writeName", writeName);
		return "writeTemplate";
	}
	
	@PostMapping("/uploadTemplate.do")
	public String handleFormSubmit(@RequestParam("temp_title") String title,
									@RequestParam("temp_content") String content,
									@RequestParam("img_value") String img_value,
									@RequestParam("temp_writename") String temp_writeName, TemplateDto dto, Model model) {
		int n = templateServiceImpl.writeTemplate(dto);
		System.out.println("temp_title : "+title);
		System.out.println("temp_content : "+content);
		System.out.println("img_value : "+img_value);
		model.addAttribute("temp_writeName", temp_writeName);
	    return (n>0)?"redirect:/templateList.do":"redirect:/writeTemplate.do";
	}

	@PostMapping("/deleteTemplate.do")
	public String deleteTemplate(@RequestParam("temp_id") String id, HttpServletResponse response) throws IOException {
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
		int n = templateServiceImpl.deleteTemplate(id);
	    if (n == 1) {
	    	alert.println("<script>alert('삭제되었습니다.'); location.href='./templateList.do'</script>");
	    	
	    } 
	    	alert.println("<script>alert('삭제실패했습니다.'); location.href='./templateList.do'</script>");
	    	alert.flush();
	    	return "";
	}

//	@GetMapping(value = "/getOneTemplate.do")
//	public String modifyBoardForm(String seq, HttpSession session, Model model) {
//		UserInfoDto loginDto = (UserInfoDto)session.getAttribute("loginDto");
//		TemplateDto dto = TemplateServiceImpl.class
//		if(dto.getId().equals(loginDto.getId())) {
//			model.addAttribute("dto", dto);
//			return "modifyBoardForm";			
//		}else {
//			return "redirect:/loginSerlvet.do";
//		}
//	}
	
	
	@GetMapping(value = "/progressDocument.do")
	public String ProgressDocumentList(Model model) {
		return "progressDocument";
	}
	
	@GetMapping(value = "/draftDocument.do")
	public String DraftedDocumentList(Model model) {
		List<DocumentListDto> lists = documentListServiceImpl.selectDratfDocumentList();
		model.addAttribute("draftLists", lists);
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
	public String SignDocumentList(Model model) {
		List<DocumentListDto> lists = documentListServiceImpl.selectDratfDocumentList();
		model.addAttribute("draftLists", lists);
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
