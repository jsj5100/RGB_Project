package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.TemplatePreviewDto;

public interface ITemplateDao {

	public List<TemplatePreviewDto> selectTemplateList();
}
