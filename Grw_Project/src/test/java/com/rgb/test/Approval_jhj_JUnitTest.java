package com.rgb.test;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.function.FailableObjDoubleConsumer;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rgb.grw.dto.ApproverDto;
import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.DocumentDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.dto.JsTreeResponseDto;
import com.rgb.grw.dto.ReferrerDto;
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
	
//	@Test
	public void test_insertDocument() {
		DocumentDto dto = new DocumentDto();
		dto.setEmp_no("000000");
		dto.setTemp_id("D001");
		dto.setDoc_regdate("2024-10-01");
		dto.setDoc_content("ASDFASDF");
		dto.setDoc_exp("2024-10-01");
		dto.setDoc_evton("2024-10-01");
		dto.setDoc_evtoff("2024-10-01");
		dto.setDoc_name("안녕하세요");
		boolean n = templatePreviewServiceImpl.insertDocument(dto);
		assertEquals(true, n);
	}
	
//	@Test
	public void test_insertApproval() {
		Map<String, Object> approvalMap = new HashMap<>();
        approvalMap.put("approvalMap", List.of("EMP001", "EMP002", "EMP003"));
        approvalMap.put("doc_no", "DOC123");
		boolean n = templatePreviewServiceImpl.insertApproval(approvalMap);
		assertEquals(true, n);
	}
	
//	@Test
	public void test_insertReferrer() {
		Map<String, Object> ccMap = new HashMap<>();
		ccMap.put("ccMap", List.of("EMP001", "EMP002", "EMP003"));
		ccMap.put("doc_no", "DOC123");
		boolean n = templatePreviewServiceImpl.insertReference(ccMap);
		assertEquals(true, n);
	}
	
//	@Test
	public void test_processDocument() {
		DocumentDto dto = new DocumentDto();
		dto.setEmp_no("000000");
		dto.setTemp_id("D001");
		dto.setDoc_regdate("2024-10-01");
		dto.setDoc_content("ASDFASDF");
		dto.setDoc_exp("2024-10-01");
		dto.setDoc_evton("2024-10-01");
		dto.setDoc_evtoff("2024-10-01");
		dto.setDoc_name("안녕하세요");
		
		Map<String, Object> approvalMap = new HashMap<>();
        approvalMap.put("approvalMap", List.of("EMP001", "EMP002", "EMP003"));
        approvalMap.put("doc_no", "DOC123");
        
        Map<String, Object> ccMap = new HashMap<>();
		ccMap.put("ccMap", List.of("EMP001", "EMP002", "EMP003"));
		ccMap.put("doc_no", "DOC123");
        
		templatePreviewServiceImpl.processDocument(dto, approvalMap, ccMap);
	}
	
		@Test
		public void test_selectSign() {
			String emp_no = "000000";
			templatePreviewServiceImpl.selectSign(emp_no);
		}
}
