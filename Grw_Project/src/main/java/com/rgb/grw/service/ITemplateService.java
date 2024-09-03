package com.rgb.grw.service;

import java.util.List;

import com.rgb.grw.dto.TemplateDto;
import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplateService {

	public List<TemplateDto> selectTemplateList();
	
	public int writeTemplate(TemplateDto dto);
	
	public int deleteTemplate(String temp_id);
	
	public int modifyTemplate(TemplateDto dto);
}
