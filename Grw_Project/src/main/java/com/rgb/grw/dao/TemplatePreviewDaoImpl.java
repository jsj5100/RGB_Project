package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;
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
		return template.selectList(NS+"selectTemplate");
	}

	@Override
	public List<DeptDto> jstreeDep() {
		return template.selectList(NS+"jstreeDep");
	}

	@Override
	public List<EmpDto> jstreeEmp() {
		return template.selectList(NS+"jstreeEmp");
	}

	
	
}
