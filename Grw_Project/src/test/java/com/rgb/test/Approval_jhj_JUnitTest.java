package com.rgb.test;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.TemplatePreviewDto;
import com.rgb.grw.service.TemplatePreviewServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class Approval_jhj_JUnitTest {
	
	@Autowired
	private TemplatePreviewServiceImpl templatePreviewServiceImpl;
	
//	@Test
	public void test() {
		List<TemplatePreviewDto> lists = templatePreviewServiceImpl.selectTemplate();
		assertNotEquals(0, lists.size());
	}

//	@Test
	public void jstreeDepEmpTier_Test() {
		List<JsTreeResponseDto> lists = templatePreviewServiceImpl.jsTree();
		assertNotEquals(0, lists.size());
		for (JsTreeResponseDto deptDto : lists) {
			System.out.println(deptDto);
		}
	}
	
	@Test
	public void test_insertDocument() {
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("temp_id", "D001");
		insertMap.put("docfile_id", "D001");
		insertMap.put("doc_regdate", "2024-10-01 00:00:00");
		insertMap.put("doc_content", "ASDFASDF");
		insertMap.put("doc_exp", "2024-10-01 00:00:00");
		insertMap.put("sign_id", "ASDFASFD");
		insertMap.put("doc_evton", "2024-10-01 00:00:00");
		insertMap.put("doc_evtoff", "2024-10-01 00:00:00");
		boolean n = templatePreviewServiceImpl.insertDocument(insertMap);
		assertEquals(true, n);
	}
}
