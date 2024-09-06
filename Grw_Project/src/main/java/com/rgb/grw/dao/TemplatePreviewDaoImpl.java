package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.FileDocumentDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.SignDto;
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
	public boolean insertApproval(Map<String, Object> map) {
		List<String> approvalList = (List<String>) map.get("approvalMap");
		int approvalCount = approvalList.size();
		int n = template.insert(NS+"insertApproval", map);
		return (approvalCount == n)?true:false;
	}

	@Override
	public boolean insertReference(Map<String, Object> map) {
		List<String> ccList = (List<String>) map.get("ccMap");
		int ccCount = ccList.size();
		int n = template.insert(NS+"insertReference", map);
		return (ccCount == n)?true:false;
	}

	@Override
	public boolean insertSign(Map<String, Object> map) {
		int n = template.insert(NS+"insertSign", map);
		return (n==1)?true:false;
	}

	@Override
	public Byte[] selectSign(String empNo) {
		return template.selectOne(NS+"selectSign", empNo);
	}

	@Override
	public boolean deleteSign(String empNo) {
		int n = template.delete(NS+"deleteSign", empNo);
		return (n==1)?true:false;
	}

	@Override
	public boolean insertFile(FileDocumentDto dto) {
		int n = template.insert(NS + "insertFile", dto);
		return (n==1)?true:false;
	}

	
	
	
	
	
}
