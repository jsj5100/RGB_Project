package com.rgb.grw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rgb.grw.dao.DocumentListDaoImpl;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.DocumentListDto;
import com.rgb.grw.dto.StroageDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DocumentListServiceImpl implements IDocumentListService {

	private final DocumentListDaoImpl dao;
	
	@Override
	public List<DocumentListDto> selectDratfDocumentList(String emp_name) {
		return dao.selectDratfDocumentList(emp_name);
	}
	
	@Override
	public List<DocumentListDto> selectProgressDocumentList(String emp_no) {
		return dao.selectProgressDocumentList(emp_no);
	}
	
	@Override
	public List<DocumentListDto> selectSignDocumentList(String emp_no) {
		return dao.selectSignDocumentList(emp_no);
	}

	@Override
	public String selectEmpname(String doc_no) {
		return dao.selectEmpname(doc_no);
	}

	@Override
	public int approval(String emp_no, String doc_no) {
		return dao.approval(emp_no, doc_no);
	}
	
	@Override
	public int rejection(String emp_no, String doc_no, String rejectComment) {
		return dao.rejection(emp_no, doc_no, rejectComment);
	}
	
	@Override
	public List<DocumentListDto> selectRejectionDocumentList(String emp_name) {
		return dao.selectRejectionDocumentList(emp_name);
	}
	
	@Override
	public int deleteDocument(String doc_no) {
		return dao.deleteDocument(doc_no);
	}
	
	@Override
	public List<DocumentListDto> selectRecycleBinList(String emp_name) {
		return dao.selectRecycleBinList(emp_name);
	}
	
	@Override
	public int restoreDocument(String doc_no) {
		return dao.restoreDocument(doc_no);
	}
	
	@Override
	public List<DocumentListDto> referenceDocumentList(String emp_no) {
		return dao.referenceDocumentList(emp_no);
	}
	
	@Override
	public int deleteRefferenceDocument(String emp_no, String doc_no) {
		return dao.deleteRefferenceDocument(emp_no, doc_no);
	}
	
	@Override
	public List<DocumentListDto> progressDocumentList(String emp_no) {
		return dao.progressDocumentList(emp_no);
	}
	
	@Override
	public List<DocumentListDto> ingDocumentList(String emp_no) {
		return dao.ingDocumentList(emp_no);
	}
	
	@Override
	public int writeStorage(DocumentDto dto) {
		return dao.writeStorage(dto);
	}
	
	@Override
	public List<DocumentDto> selectStorage(String emp_no) {
		return dao.selectStorage(emp_no);
	}
	
	@Override
	public int deleteStroageDocument(String emp_no, String storage_no) {
		return dao.deleteStroageDocument(emp_no, storage_no);
	}
}
	