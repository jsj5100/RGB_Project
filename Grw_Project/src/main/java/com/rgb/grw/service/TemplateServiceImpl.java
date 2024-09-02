package com.rgb.grw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.TemplateDaoImpl;
import com.rgb.grw.dto.TemplateDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TemplateServiceImpl implements ITemplateService {

	@Autowired
	private final TemplateDaoImpl templateDaoImpl;
	
	@Override
	public List<TemplateDto> selectTemplateList() {
		return templateDaoImpl.selectTemplateList();
	}
	
	@Override
	public int writeTemplate(TemplateDto dto) {
		return templateDaoImpl.writeTemplate(dto);
	}
	
	@Override
	public TemplateDto getOneTemplate(String temp_id) {
		return templateDaoImpl.getOneTemplate(temp_id);
	}
}
