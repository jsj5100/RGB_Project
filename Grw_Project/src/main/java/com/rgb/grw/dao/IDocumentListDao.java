package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.DocumentListDto;
import com.rgb.grw.dto.StroageDto;

public interface IDocumentListDao {

	public List<DocumentListDto> selectDratfDocumentList(String emp_name);
	
	public List<DocumentListDto> selectProgressDocumentList(String emp_no);
	
	public List<DocumentListDto> selectSignDocumentList(String emp_no);
	
	public String selectEmpname(String doc_no);
	
	public int approval(String emp_no, String doc_no);
	
	public int rejection(String emp_no, String doc_no, String rejectComment);
	
	public List<DocumentListDto> selectRejectionDocumentList(String emp_name);
	
	public int deleteDocument(String doc_no);
	
	public List<DocumentListDto> selectRecycleBinList(String emp_name);
	
	public int restoreDocument(String doc_no);
	
	public List<DocumentListDto> referenceDocumentList(String emp_no);
	
	public int deleteRefferenceDocument(String emp_no, String doc_no);
	
	public List<DocumentListDto> progressDocumentList(String emp_no);
	
	public List<DocumentListDto> ingDocumentList(String emp_no);
	
	public int writeStorage(DocumentDto dto);
	
	public List<DocumentDto> selectStorage(String emp_no);
	
	public int deleteStroageDocument(String emp_no, String storage_no);
}
