package com.rgb.grw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.TemplateDaoImpl;
import com.rgb.grw.dto.TemplatePreviewDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TemplateServiceImpl implements ITemplateService {

	@Autowired
	private final TemplateDaoImpl templateDaoImpl;
	
	@Override
	public List<TemplatePreviewDto> selectTemplateList() {
		return templateDaoImpl.selectTemplateList();
	}
	
	@Override
	public int writeTemplate(TemplatePreviewDto dto) {
		return templateDaoImpl.writeTemplate(dto);
	}
}
