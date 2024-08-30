package com.rgb.grw.service;

import java.util.List;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplatePreviewService {
	
	public List<TemplatePreviewDto> selectTemplate();
	
	public List<DeptDto> jstreeDep();
	
	public List<EmpDto> jstreeEmp();
	
	public List<JsTreeResponseDto> jsTree();
}
