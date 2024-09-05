package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.DocumentListDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DocumentListDaoImpl implements IDocumentListDao {

	private final String NS = "com.rgb.grw.dao.TemplateDaoImpl.";
	
	@Autowired
	private final SqlSessionTemplate template;
	
	@Override
		public List<DocumentListDto> selectDratfDocumentList() {
			return template.selectList(NS+"selectDraftedList");
		}

	@Override
	public int countMyDocumentList() {
		return template.selectOne(NS+"countMyDocumentList");
	}
	
}
