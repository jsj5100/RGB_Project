package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rgb.grw.dao.TemplatePreviewDaoImpl;
import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.DocSignImgDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.DocumentListDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.FileDocumentDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
import com.rgb.grw.dto.SignDto;
import com.rgb.grw.dto.TemplatePreviewDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class TemplatePreviewServiceImpl implements ITemplatePreviewService {

	private final TemplatePreviewDaoImpl previewDaoImpl;
	
	@Override
	public List<TemplatePreviewDto> selectTemplate() {
		return previewDaoImpl.selectTemplate();
	}

	@Override
	public List<JsTreeResponseDto> jsTree() {
		return previewDaoImpl.jsTree();
	}

	@Override
	public boolean insertDocument(DocumentDto dto) {
		return previewDaoImpl.insertDocument(dto);
	}

	@Override
	public boolean insertApproval(Map<String, Object> map) {
		return previewDaoImpl.insertApproval(map);
	}

	@Override
	public boolean insertReference(Map<String, Object> map) {
		return previewDaoImpl.insertReference(map);
	}

	@Override
	@Transactional
	public boolean processDocument(DocumentDto dto, Map<String, Object> approvalMaps, Map<String, Object> ccMaps,
									FileDocumentDto fileDto) {
	
			boolean insertDoc = previewDaoImpl.insertDocument(dto);
			approvalMaps.put("doc_no", dto.getDoc_no());
			boolean insertApp = previewDaoImpl.insertApproval(approvalMaps);
			ccMaps.put("doc_no", dto.getDoc_no());
			boolean insertCc = previewDaoImpl.insertReference(ccMaps);
			boolean insertFile = true;
			
			 if (fileDto != null) {
			        fileDto.setDoc_no(dto.getDoc_no());
			        insertFile = previewDaoImpl.insertFile(fileDto);
			    }
			
			return (insertDoc && insertApp && insertCc && insertFile)?true:false;
			

		
	}

	@Override
	public boolean insertSign(Map<String, Object> map) {
		return previewDaoImpl.insertSign(map);
	}

	@Override
	public Byte[] selectSign(String empNo) {
		return previewDaoImpl.selectSign(empNo);
	}

	@Override
	public boolean deleteSign(String empNo) {
		return previewDaoImpl.deleteSign(empNo);
	}

	@Override
	public boolean insertFile(FileDocumentDto dto) {
		return previewDaoImpl.insertFile(dto);
	}

	@Override
	public List<DocumentListDto> selectApprovalSignList(Map<String, Object> map) {
		return previewDaoImpl.selectApprovalSignList(map);
	}

	@Override
	public List<DocumentListDto> completeApprovalDocument(Map<String, Object> map) {
		return previewDaoImpl.completeApprovalDocument(map);
	}

	@Override
	public DocumentListDto detailApprovalDocument(Map<String, Object> map) {
		return previewDaoImpl.detailApprovalDocument(map);
	}

	@Override
	public List<DocSignImgDto> comDocSignImg(Map<String, Object> map) {
		return previewDaoImpl.comDocSignImg(map);
	}

	

	
}
