package com.rgb.grw.ctrl;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.TemplatePreviewServiceImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApprovalController {
	
	@Autowired
	private TemplatePreviewServiceImpl serviceImpl;
	
	@Autowired
	private SqlSessionTemplate template;
	
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
	
	@PostMapping(value = "/documentBox.do")
	public String documentBox(DocumentDto docDto, ApproverDto appDto, ReferrerDto refDto,
								String approvalLine, String ccLine, String tempId, HttpSession session) {
		
		UserInfoDto loginDto = (UserInfoDto)session.getAttribute("loginDto");		
		log.info("문서 이름 : " + docDto.getDoc_name());
		log.info("ckEditor 콘텐츠 : " + docDto.getDoc_content());
		log.info("기안일 : " + docDto.getDoc_regdate());
		log.info("마감일 : " + docDto.getDoc_exp());
		log.info("결재자 라인 : " + approvalLine);
		log.info("참조자 라인 : " + ccLine);
		log.info("템플릿 번호 : " + tempId);
		
		String[] aLine = approvalLine.split(",");
		String[] cLine = ccLine.split(",");
		
		for(int i = 0; i < aLine.length; i++) {
			log.info(aLine[i]);
			appDto.setEmp_no(aLine[i]);
			int n = i + 1;
			appDto.setApp_procedure(n);
			serviceImpl.insertApproval(appDto);
		}
		
		for(int i = 0; i < cLine.length; i++) {
			log.info(cLine[i]);
			refDto.setEmp_no(cLine[i]);
		}
		
		docDto.setEmp_no(loginDto.getEmp_no());
		docDto.setTemp_id(tempId);
		docDto.setDoc_regdate(docDto.getDoc_regdate());
		docDto.setDoc_exp(docDto.getDoc_exp());
		docDto.setDoc_evton(docDto.getDoc_evton());
		docDto.setDoc_evtoff(docDto.getDoc_evtoff());
		docDto.setDoc_content(docDto.getDoc_content());
		docDto.setDoc_name(docDto.getDoc_name());
		
		boolean docBoolean = serviceImpl.insertDocument(docDto);
		boolean appBoolean = serviceImpl.insertApproval(appDto);
		boolean refBoolean = serviceImpl.insertReference(refDto);
		
		if(docBoolean && appBoolean && refBoolean == true) {
			return "redirect:/draftDocument.do";
		}else {
			return "redirect:/writeDocument.do";
		}
	}
	
	
}
