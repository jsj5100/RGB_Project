package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.TemplatePreviewDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TemplateDaoImpl implements ITemplateDao {

	private final String NS = "com.rgb.grw.dao.TemplateDaoImpl.";
	
	@Autowired
	private final SqlSessionTemplate template;
	
	@Override
	public List<TemplatePreviewDto> selectTemplateList() {
		return template.selectList(NS+"selectTemplateList");
	}

}
