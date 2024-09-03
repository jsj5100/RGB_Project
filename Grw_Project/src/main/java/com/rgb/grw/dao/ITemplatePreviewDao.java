package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplatePreviewDao {
	
	//템플릿 조회
	public List<TemplatePreviewDto> selectTemplate();
	
	//결재라인 jstree
	public List<JsTreeResponseDto> jsTree();
	
	//문서작성 
	public boolean insertDocument(DocumentDto dto);
	
	//결재라인
	public boolean insertApproval(ApproverDto dto);
	
	//참조자 라인
	public boolean insertReference(ReferrerDto dto);
}
