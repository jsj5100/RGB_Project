package com.rgb.grw.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.DocumentListDto;
import com.rgb.grw.dto.StroageDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DocumentListDaoImpl implements IDocumentListDao {

	private final String NS = "com.rgb.grw.dao.TemplateDaoImpl.";
	
	@Autowired
	private final SqlSessionTemplate template;
	
	@Override
		public List<DocumentListDto> selectDratfDocumentList(String emp_name) {
        return template.selectList(NS+"selectDraftedList", emp_name);
		}
	
	@Override
	public List<DocumentListDto> selectProgressDocumentList(String emp_no) {
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("emp_no", emp_no);
		return template.selectList(NS+"selectProgressList", params);
	}
	
	@Override
	public List<DocumentListDto> selectSignDocumentList(String emp_no) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("emp_no", emp_no);
		return template.selectList(NS+"signDocumentList", params);
	}
	
	@Override
	public String selectEmpname(String doc_no) {
		return template.selectOne(NS+"selectSignDocumentList", doc_no);
	}
	
	@Override
	public int approval(String emp_no, String doc_no) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("doc_no", doc_no);
		params.put("emp_no", emp_no);
		return template.update(NS+"approval", params);
	}
	
	@Override
	public int rejection(String emp_no, String doc_no, String rejectComment) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("doc_no", doc_no);
		params.put("emp_no", emp_no);
		params.put("rejectComment", rejectComment);
		return template.update(NS+"rejection", params);
	}
	
	@Override
	public List<DocumentListDto> selectRejectionDocumentList(String emp_name) {
		return template.selectList(NS+"rejectionDocumentList", emp_name);
	}

	@Override
	public int deleteDocument(String doc_no) {
		return template.delete(NS+"deleteDocument", doc_no);
	}
	
	@Override
	public List<DocumentListDto> selectRecycleBinList(String emp_name) {
		return template.selectList(NS+"selectRecycleList", emp_name);
	}
	
	@Override
	public int restoreDocument(String doc_no) {
		return template.update(NS+"restoreDocument", doc_no);
	}
	
	@Override
	public List<DocumentListDto> referenceDocumentList(String emp_no) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("emp_no", emp_no);
		return template.selectList(NS+"referenceDocumentList", params);
	}
	
	@Override
	public int deleteRefferenceDocument(String emp_no, String doc_no) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("emp_no", emp_no);
		params.put("doc_no", doc_no);
		return template.delete(NS+"deleteRefferenceDocument", params);
	}
	
	@Override
	public List<DocumentListDto> progressDocumentList(String emp_no) {
		return template.selectList(NS+"progressDocumentList", emp_no);
	}
	
	@Override
	public List<DocumentListDto> ingDocumentList(String emp_no) {
		return template.selectList(NS+"ingDocumentList", emp_no);
	}
	
	@Override
	public int writeStorage(DocumentDto dto) {
		return template.insert(NS+"writeStorage", dto);
	}
	
	@Override
	public List<DocumentDto> selectStorage(String emp_no) {
		return template.selectList(NS+"selectStorage", emp_no);
	}
	
	@Override
	public int deleteStroageDocument(String emp_no, String storage_no) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("emp_no", emp_no);
		params.put("storage_no", storage_no);
		return template.delete(NS+"deleteStorageDocument", params);
	}
	
}
