package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplatePreviewService {
	
	public List<TemplatePreviewDto> selectTemplate();
	
	public List<JsTreeResponseDto> jsTree();
	
	public boolean insertDocument(Map<String, Object> map);
}
