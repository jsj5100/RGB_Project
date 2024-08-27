package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.TemplatePreviewDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class TemplatePreviewDaoImpl implements ITemplatePreviewDao {
	
	private final String NS = "com.rgb.grw.dao.TemplateDaoImpl.";
	
	@Autowired
	private final SqlSessionTemplate template;
	
	@Override
	public List<TemplatePreviewDto> selectTemplate() {
		log.info("selectTemplate LIst 확인");
		return template.selectList(NS+"selectTemplate");
	}
	
}
