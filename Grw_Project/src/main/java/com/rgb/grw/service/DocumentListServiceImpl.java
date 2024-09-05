package com.rgb.grw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rgb.grw.dao.DocumentListDaoImpl;
import com.rgb.grw.dto.DocumentListDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DocumentListServiceImpl implements IDocumentListService {

	private final DocumentListDaoImpl dao;
	
	@Override
	public List<DocumentListDto> selectDratfDocumentList() {
		return dao.selectDratfDocumentList();
	}
	
	@Override
	public int countMyDocumentList() {
		return dao.countMyDocumentList();
	}
}
