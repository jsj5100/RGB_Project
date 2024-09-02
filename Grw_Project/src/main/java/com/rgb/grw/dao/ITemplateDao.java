package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.TemplateDto;

public interface ITemplateDao {

	public List<TemplateDto> selectTemplateList();
	
	public int writeTemplate(TemplateDto dto);
	
	public TemplateDto getOneTemplate(String temp_id);
}
