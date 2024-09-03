package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.TemplatePreviewDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TemplatePreviewDaoImpl implements ITemplatePreviewDao {
	
	private final String NS = "com.rgb.grw.dao.TemplatePreviewDaoImpl.";
	
	@Autowired
	private final SqlSessionTemplate template;
	
	//문서작성시 미리보기 화면
	@Override
	public List<TemplatePreviewDto> selectTemplate() {
		return template.selectList(NS+"selectTemplate");
	}
	
	//결재라인 jstree 화면
	@Override
	public List<JsTreeResponseDto> jsTree() {
		return template.selectList(NS+"jsTree");
	}

	@Override
	public boolean insertDocument(DocumentDto dto) {
		int n = template.insert(NS+"insertDocument", dto);
		return (n==1)?true:false;
	}

	@Override
	public boolean insertApproval(ApproverDto dto) {
		int n = template.insert(NS+"insertApproval", dto);
		return (n==1)?true:false;
	}

	@Override
	public boolean insertReference(ReferrerDto dto) {
		int n = template.insert(NS+"insertReference", dto);
		return (n==1)?true:false;
	}
	
	
	
	
	
}
