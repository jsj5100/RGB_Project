package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rgb.grw.dao.TemplatePreviewDaoImpl;
import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
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
	public boolean processDocument(DocumentDto dto, Map<String, Object> approvalMaps, Map<String, Object> ccMaps) {
		try {
			boolean insertDoc = previewDaoImpl.insertDocument(dto);
			if(!insertDoc) {
				 throw new RuntimeException("Document insertion failed");
			}
			
			boolean insertApp = previewDaoImpl.insertApproval(approvalMaps);
			if(!insertApp) {
				 throw new RuntimeException("Approval insertion failed");
			}
			
			boolean insertCc = previewDaoImpl.insertReference(ccMaps);
			
			if(!insertCc) {
				 throw new RuntimeException("cc insertion failed");
			}
			
			return true;
			
		} catch (Exception e) {
			throw new RuntimeException("Transaction failed, rolling back.", e);
		}
		
	}

	@Override
	public boolean insertSign(Map<String, Object> map) {
		return previewDaoImpl.insertSign(map);
	}

	
}
