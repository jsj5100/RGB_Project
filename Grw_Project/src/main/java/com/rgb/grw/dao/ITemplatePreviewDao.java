package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.FileDocumentDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.SignDto;
import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplatePreviewDao {
	
	//템플릿 조회
	public List<TemplatePreviewDto> selectTemplate();
	
	//결재라인 jstree
	public List<JsTreeResponseDto> jsTree();
	
	//문서작성 
	public boolean insertDocument(DocumentDto dto);
	
	//결재라인
	public boolean insertApproval(Map<String, Object> map);
	
	//참조자 라인
	public boolean insertReference(Map<String, Object> map);
	
	//서명 사인 저장
	public boolean insertSign(Map<String, Object> map);
	
	//서명 조회
	public Byte[] selectSign(String empNo);
	
	//서명 삭제
	public boolean deleteSign(String empNo);
	
	//문서 파일 업로드 
	public boolean insertFile(FileDocumentDto dto);
}
