package com.rgb.grw.service;

import java.util.List;

import com.rgb.grw.dto.TemplateDto;
import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplateService {

	public List<TemplateDto> selectTemplateList();
	
	public int writeTemplate(TemplateDto dto);
	
	public TemplateDto getOneTemplate(String temp_id);
}
