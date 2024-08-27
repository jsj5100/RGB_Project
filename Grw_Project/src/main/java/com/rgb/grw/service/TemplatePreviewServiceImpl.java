package com.rgb.grw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.TemplatePreviewDaoImpl;
import com.rgb.grw.dto.TemplatePreviewDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class TemplatePreviewServiceImpl implements ITemplatePreviewService {
	
	@Autowired
	private final TemplatePreviewDaoImpl previewDaoImpl;
	
	@Override
	public List<TemplatePreviewDto> selectTemplate() {
		log.info("TemplatePreviewServiceImpl");
		return previewDaoImpl.selectTemplate();
	}

}
