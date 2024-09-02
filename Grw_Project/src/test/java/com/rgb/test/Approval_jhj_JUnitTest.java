package com.rgb.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rgb.grw.dto.DeptDto;
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

	@Test
	public void jstreeDepEmpTier_Test() {
		List<JsTreeResponseDto> lists = templatePreviewServiceImpl.jsTree();
//		assertNotEquals(0, lists.size());
		for (JsTreeResponseDto deptDto : lists) {
			System.out.println(deptDto);
		}
	}
}
