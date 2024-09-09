package com.rgb.grw.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.DocumentListDto;
import com.rgb.grw.dto.FileDocumentDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.SignDto;
import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.TemplatePreviewServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApprovalController {
	
	@Autowired
	private TemplatePreviewServiceImpl serviceImpl;
	
	//사인이 필요한 문서 조회 화면
	@GetMapping(value = "/approvalDocument.do")
	public String signDocumentList(HttpSession session, Model model) {
		UserInfoDto loginDto =  (UserInfoDto)session.getAttribute("loginDto");
		if(loginDto == null) {
			return "redirect:/loginServlet.do";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("emp_no", loginDto.getEmp_no());
		List<DocumentListDto> lists = serviceImpl.selectApprovalSignList(map);
		
		model.addAttribute("lists", lists);
		
		return "approvalDocumentList";
	}
	
	
	//문서 작성화면
	@GetMapping(value = "/writeDocument.do")
	public String writeDocument(Model model, HttpSession session) {
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		if(loginDto == null) {
			return "redirect:/loginServlet.do";
		}
		List<TemplatePreviewDto> lists = serviceImpl.selectTemplate();
		model.addAttribute("lists", lists);
		return "writeDocument";
	}
	
	//사인함
	@GetMapping(value = "/signList.do")
	public String signList(HttpSession session, Model model) {
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		if(loginDto == null) {
			return "redirect:/loginServlet.do";
		}
		String emp_no = loginDto.getEmp_no();
		Byte[] signImgByteArray = serviceImpl.selectSign(emp_no);
		
		if(signImgByteArray == null) {
			model.addAttribute("signImg", "");
			return "signList";
		}
		
		byte[] signImg = new byte[signImgByteArray.length];
		for(int i = 0; i < signImgByteArray.length; i++) {
			signImg[i] = signImgByteArray[i];
		}
		
		String base64SignImg = Base64.getEncoder().encodeToString(signImg);
		System.out.println("base64로 변경된 이미지 " + base64SignImg);
		model.addAttribute("signImg",base64SignImg);
		return "signList";
	}
	
	//문서 작성 후 전송
	@PostMapping(value = "/documentBox.do")
	public String documentBox(DocumentDto docDto, String approvalLine, String ccLine, 
								String tempId, HttpSession session, @RequestParam MultipartFile uploadZip,
								HttpServletRequest req) {

	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    if(loginDto == null) {
			return "redirect:/loginServlet.do";
		}
	    
	    log.info("문서 이름 : " + docDto.getDoc_name());
	    log.info("ckEditor 콘텐츠 : " + docDto.getDoc_content());
	    log.info("기안일 : " + docDto.getDoc_regdate());
	    log.info("마감일 : " + docDto.getDoc_exp());
	    log.info("결재자 라인 : " + approvalLine);
	    log.info("참조자 라인 : " + ccLine);
	    log.info("템플릿 번호 : " + tempId);
	    
	    
	    docDto.setEmp_no(loginDto.getEmp_no());
	    docDto.setTemp_id(tempId);
	    docDto.setDoc_regdate(docDto.getDoc_regdate());
	    docDto.setDoc_exp(docDto.getDoc_exp());
	    docDto.setDoc_evton(docDto.getDoc_evton());
	    docDto.setDoc_evtoff(docDto.getDoc_evtoff());
	    docDto.setDoc_content(docDto.getDoc_content());
	    docDto.setDoc_name(docDto.getDoc_name());
	    


	    List<String> approvalLists = Arrays.asList(approvalLine.split(","));
	    List<String> ccLists = Arrays.asList(ccLine.split(","));
	    
	    Map<String, Object> approvalMap = new HashMap<String,Object>();
	    approvalMap.put("doc_no", docDto.getDoc_no());
	    approvalMap.put("approvalMap", approvalLists);
	    
	    Map<String, Object> ccMap = new HashMap<String,Object>();
	    ccMap.put("doc_no", docDto.getDoc_no());
	    ccMap.put("ccMap", ccLists);
	    
	    FileDocumentDto fileDto = null;
	    
	    if(uploadZip != null && !uploadZip.isEmpty()) {
	    	String path = req.getSession().getServletContext().getRealPath("resources");
		    log.info("path : " + path);
		    String root = path + "\\uploadFiles";
		    
		    File file = new File(root);
		    
		    if(!file.exists()) {
		    	file.mkdirs();
		    }
		    
		    String originalFileName = uploadZip.getOriginalFilename();
		    
		    String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		    String storedFileName = UUID.randomUUID().toString() + ext;
		    
		    File changeFile = new File(root + "\\" + storedFileName);
		    
		    fileDto = new FileDocumentDto();
		    fileDto.setDoc_no(docDto.getDoc_no());
		    fileDto.setFdoc_path(root);
		    fileDto.setFdoc_size(uploadZip.getSize());
		    fileDto.setFdoc_title(originalFileName);
		    fileDto.setFdoc_stname(storedFileName);
		    
			try {
				uploadZip.transferTo(changeFile);
				log.info("파일 업로드 성공");
			} catch (IllegalStateException | IOException e) {
				log.info("파일 업로드 실패");
				e.printStackTrace();
			}
	    }
	    

	    
	    boolean processDocBoolean = serviceImpl.processDocument(docDto, approvalMap, ccMap, fileDto);

	    

	    if (processDocBoolean) {
	        return "redirect:/draftDocument.do";
	    } else {
	        return "redirect:/writeDocument.do";
	    }
	}
	
	@PostMapping(value = "/deleteSign.do")
	public String deleteSign(HttpSession session) {
		UserInfoDto loginDto = (UserInfoDto)session.getAttribute("loginDto");
		String empNo = loginDto.getEmp_no();
		boolean delSign = serviceImpl.deleteSign(empNo);
		return "redirect:/signList.do";
	}
	
	
}
