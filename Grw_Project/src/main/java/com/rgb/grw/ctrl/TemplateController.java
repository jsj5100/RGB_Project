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

import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.DocumentListDto;
import com.rgb.grw.dto.StroageDto;
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
	
	@GetMapping(value = "/modifyTemplate.do")	
	public String modifyTemplate(Model model, HttpServletRequest request, @RequestParam("temp_id") String temp_id) {
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
		String strDate = simpleDate.format(date);
		model.addAttribute("strDate", strDate);
		
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		String writeName = loginDto.getEmp_name();
		model.addAttribute("writeName", writeName);
		
		TemplateDto lists = templateServiceImpl.selectDetailBoard(temp_id);
		model.addAttribute("lists", lists);
		
		return "modifyTemplate";
	}
	
	@PostMapping(value = "/modifyTemplate.do")
	public String modifyTemplate1(@RequestParam("temp_title") String title,
									@RequestParam("temp_content") String content,
									@RequestParam("img_value") String img_value,
									@RequestParam("temp_writename") String temp_writeName,
									@RequestParam("temp_id") String temp_id, TemplateDto dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
		int n = templateServiceImpl.modifyTemplate(dto);
		if (n == 1) {
	    	alert.println("<script>alert('수정되었습니다.'); location.href='./templateList.do'</script>");
	    	
	    } 
	    	alert.println("<script>alert('수정실패했습니다.'); location.href='./templateList.do'</script>");
	    	alert.flush();
		return "";
	}

	
	@GetMapping(value = "/draftDocument.do")
	public String DraftedDocumentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		String emp_name = loginDto.getEmp_name();
		
		List<DocumentListDto> list = documentListServiceImpl.selectDratfDocumentList(emp_name);
		model.addAttribute("list", list);
		return "drafted";
	}
	
	
	@GetMapping(value = "/rejectedDocument.do")
	public String RejectedDocumentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		String emp_name = loginDto.getEmp_name();
		
		List<DocumentListDto> list = documentListServiceImpl.selectRejectionDocumentList(emp_name);
		model.addAttribute("lists", list);
		return "rejectedDocumentList";
	}
	
	@PostMapping(value = "/deleteDocument.do")
	public String deleteDocument(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("doc_no") String doc_no) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
		int n = documentListServiceImpl.deleteDocument(doc_no);
		if (n == 1) {
	    	alert.println("<script>alert('삭제되었습니다.'); location.href='./rejectedDocument.do'</script>");
	    	
	    } 
	    	alert.println("<script>alert('삭제실패했습니다.'); location.href='./rejectedDocument.do'</script>");
	    	alert.flush();
		return "rejectedDocumentList";
	}
	
	@PostMapping(value = "/deleteDocument1.do")
	public String deleteDocument1(Model model, HttpServletRequest request, HttpServletResponse response, @RequestParam("doc_no") String doc_no) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
		int n = documentListServiceImpl.deleteDocument(doc_no);
		if (n == 1) {
	    	alert.println("<script>alert('삭제되었습니다.'); location.href='./draftDocument.do'</script>");
	    	
	    } 
	    	alert.println("<script>alert('삭제실패했습니다.'); location.href='./draftDocument.do'</script>");
	    	alert.flush();
		return "drafted";
	}
	
	@GetMapping(value = "/signDocument.do")
	public String SignDocumentList(Model model, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no(); // login session

	    List<DocumentListDto> list = documentListServiceImpl.selectSignDocumentList(emp_no);
	    model.addAttribute("lists", list);
	    
	    return "signDocumentList";
	}

	@PostMapping(value = "/approval.do")
	public String approvalButton(HttpServletRequest request, HttpServletResponse response, @RequestParam("doc_no") String doc_no) throws IOException {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no(); // login session
	    
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
		
		int n = documentListServiceImpl.approval(emp_no, doc_no);
		if(n==1) {
			alert.println("<script>alert('승인되었습니다.'); location.href='./signDocument.do'</script>");
		}
		alert.println("<script>alert('취소되었습니다.'); location.href='./signDocument.do'</script>");
    	alert.flush();
    	return "signDocumentList";
	}

	@PostMapping(value = "/rejection.do")
	public String rejectionButton(HttpServletRequest request, HttpServletResponse response, @RequestParam("doc_no") String doc_no, @RequestParam("rejectComment") String rejectComment) throws IOException {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no();
	    
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
	    
		int n = documentListServiceImpl.rejection(emp_no, doc_no, rejectComment);
		if(n==1) {
			alert.println("<script>alert('반려되었습니다.'); location.href='./signDocument.do'</script>");
		}
		alert.println("<script>alert('취소되었습니다.'); location.href='./signDocument.do'</script>");
    	alert.flush();
    	return "signDocumentList";
	}
	
//	@GetMapping(value = "/signDocument.do")
//	public String SignDocumentList(Model model) {
//		List<DocumentListDto> lists = documentListServiceImpl.selectDratfDocumentList();
//		model.addAttribute("draftLists", lists);
//		return "signDocumentList";
//	}
	
	@GetMapping(value = "/recycleBin.do")
	public String RecycleBinList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_name = loginDto.getEmp_name();
		
	    List<DocumentListDto> list = documentListServiceImpl.selectRecycleBinList(emp_name);
	    model.addAttribute("lists", list);
		return "recycleBinList";
	}
	
	@PostMapping(value = "/restoration.do")
	public String RestoreDocument(HttpServletResponse response, @RequestParam("doc_no") String doc_no) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
		
		int n = documentListServiceImpl.restoreDocument(doc_no);
		if(n==1) {
			alert.println("<script>alert('복구되었습니다.'); location.href='./recycleBin.do'</script>");
		}
		alert.println("<script>alert('복구실패했습니다.'); location.href='./recycleBin.do'</script>");
    	alert.flush();
    	return "recycleBinList";
	}
	
	@GetMapping(value = "/referenceDocument.do")
	public String ReferenceDocumentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no();
	    
	    List<DocumentListDto> list = documentListServiceImpl.referenceDocumentList(emp_no);
	    model.addAttribute("lists", list);
		return "referenceDocumentList";
	}
	
	@PostMapping(value = "/deleteRefferenceDocument.do")
	public String deleteRefference(@RequestParam("doc_no") String doc_no, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no();
	    
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
	    
	    int n = documentListServiceImpl.deleteRefferenceDocument(emp_no, doc_no);
	    if(n==1) {
			alert.println("<script>alert('삭제되었습니다.'); location.href='./referenceDocument.do'</script>");
		}
		alert.println("<script>alert('삭제실패했습니다.'); location.href='./referenceDocument.do'</script>");
    	alert.flush();
    	return "referenceDocumentList";
	}
	
	@GetMapping(value = "/completeDocument.do")
	public String progressDocumentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no();
	    
	    List<DocumentListDto> list = documentListServiceImpl.progressDocumentList(emp_no);
	    model.addAttribute("lists", list);
		return "completeDocumentList";
	}
	
	@GetMapping(value = "/progressDocument.do")
	public String ingDocumentList1(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no();
	    
	    List<DocumentListDto> list = documentListServiceImpl.ingDocumentList(emp_no);
	    model.addAttribute("lists", list);
		return "progressDocument";
	}
	
	@PostMapping(value = "/writeStorage.do")
	public String writeStorage(@ModelAttribute DocumentDto dto, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
		
		int n = documentListServiceImpl.writeStorage(dto);
		if(n==1) {
			alert.println("<script>alert('임시저장 되었습니다.'); location.href='./temporaryDocumentList.do'</script>");
		}
		alert.println("<script>alert('임시저장 실패하였습니다.'); location.href='./writeDocument.do'</script>");
    	alert.flush();
    	return "temporaryDocumentList";
	}
	
	@GetMapping(value = "/temporaryDocumentList.do")
	public String TemporaryDocumentList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		String emp_no = loginDto.getEmp_no();
		
		List<DocumentDto> list = documentListServiceImpl.selectStorage(emp_no);
		model.addAttribute("lists", list);
		return "temporaryDocumentList";
	}
	
	@PostMapping(value = "/deleteStorageDocument.do")
	public String deleteStorageDocument(@RequestParam("storage_no2") String storage_no, HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    String emp_no = loginDto.getEmp_no();
	    
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter alert = response.getWriter();
	    
	    int n = documentListServiceImpl.deleteStroageDocument(emp_no, storage_no);
	    if(n==1) {
			alert.println("<script>alert('삭제되었습니다.'); location.href='./referenceDocument.do'</script>");
		}
		alert.println("<script>alert('삭제실패했습니다.'); location.href='./referenceDocument.do'</script>");
    	alert.flush();
    	return "temporaryDocumentList";
	}
	
	
}
