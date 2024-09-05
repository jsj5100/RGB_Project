package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.DocumentListDto;

public interface IDocumentListDao {

	public List<DocumentListDto> selectDratfDocumentList();
	
	public int countMyDocumentList();
}
