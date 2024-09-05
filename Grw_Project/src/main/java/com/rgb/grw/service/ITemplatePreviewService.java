package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.SignDto;
import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplatePreviewService {
	
	public List<TemplatePreviewDto> selectTemplate();
	
	public List<JsTreeResponseDto> jsTree();
	
	public boolean insertDocument(DocumentDto dto);
	
	public boolean insertApproval(Map<String, Object> map);
		
	public boolean insertReference(Map<String, Object> map);
	
	public boolean processDocument(DocumentDto dto, Map<String, Object> approvalMaps, Map<String, Object> ccMaps);
	
	public boolean insertSign(Map<String, Object> map);
	
	public Byte[] selectSign(String empNo);
	
	public boolean deleteSign(String empNo);
}
