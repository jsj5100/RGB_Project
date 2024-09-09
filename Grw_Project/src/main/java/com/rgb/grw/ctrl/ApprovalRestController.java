package com.rgb.grw.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.DocSignImgDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.TemplatePreviewServiceImpl;

@RestController
public class ApprovalRestController {
	
	@Autowired
	private TemplatePreviewServiceImpl serviceImpl;
	
	@GetMapping("/docSignImg.do")
	public List<DocSignImgDto> signImg(HttpSession session){
		DocSignImgDto doc_no = (DocSignImgDto)session.getAttribute("doc_no");
		System.out.println("문서 넘버 : " + doc_no);
		Map<String, Object> imgDocMap = new HashMap<String, Object>();
		imgDocMap.put("doc_no", "D155");
		List<DocSignImgDto> lists = serviceImpl.comDocSignImg(imgDocMap);
		return lists;
	}
	
	//양식 리스트 
	@GetMapping("/api/data.do")
	public List<TemplatePreviewDto> previewContent() {
		List<TemplatePreviewDto> lists = serviceImpl.selectTemplate();
		return lists;
	}
	
	//문서 작성 화면의 결재자 지정 jstree
	@GetMapping("/choiceApprovalLine.do")
	public List<JsTreeResponseDto> getJsTree(){
		List<JsTreeResponseDto> deptJstreeList = serviceImpl.jsTree();
		  for (JsTreeResponseDto node : deptJstreeList) {
		        // 'text'와 'tier_name'을 결합하여 'text' 필드를 업데이트
		        String combinedText = node.getText();
		        if (node.getTier_name() != null && !node.getTier_name().isEmpty()) {
		            combinedText += " (" + node.getTier_name() + ")";
		        }
		        node.setText(combinedText);
		    }
		return deptJstreeList;
	}
	
	//사인 저장
	@PostMapping("/saveSignatureSign.do")
	public Map<String, Object> saveSignatureSign(@RequestBody Map<String, String> request, HttpSession session){
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		
		String base64Image = request.get("image").split(",")[1];
		
		byte[] imageData = Base64Utils.decodeFromString(base64Image);
		
		Map<String, Object> response = new HashMap<String, Object>();
		response.put("sign_img", imageData);
		response.put("emp_no", loginDto.getEmp_no());
		
		boolean success = serviceImpl.insertSign(response);
		System.out.println(success);
		
		return response;
	}

	
	
}
