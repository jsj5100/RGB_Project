package com.rgb.grw.service;

import java.util.List;

import com.rgb.grw.dto.DocumentListDto;

public interface IDocumentListService {

	public List<DocumentListDto> selectDratfDocumentList();
	
	public int countMyDocumentList();
}
