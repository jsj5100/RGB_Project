package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.TemplateDto;
import com.rgb.grw.dto.TemplatePreviewDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TemplateDaoImpl implements ITemplateDao {

	private final String NS = "com.rgb.grw.dao.TemplateDaoImpl.";
	
	@Autowired
	private final SqlSessionTemplate template;
	
	@Override
	public List<TemplateDto> selectTemplateList() {
		return template.selectList(NS+"selectTemplateList");
	}

	@Override
	public int writeTemplate(TemplateDto dto) {
		return template.insert(NS+"writeTemplate", dto);
	}
	
	@Override
	public TemplateDto getOneTemplate(String temp_id) {
		return template.selectOne(NS+"getOneTemplate", temp_id);
	}
}
