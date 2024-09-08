package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.TemplateDto;

public interface ITemplateDao {

	public List<TemplateDto> selectTemplateList();
	
	public int writeTemplate(TemplateDto dto);
		
	public int deleteTemplate(String temp_id);
	
	public int modifyTemplate(TemplateDto dto);
	
	public TemplateDto selectDetailBoard(String temp_id);
	
}
