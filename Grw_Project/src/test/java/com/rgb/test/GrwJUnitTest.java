package com.rgb.test;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.commons.dbcp.BasicDataSource;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rgb.grw.dto.AnswerBoardDto;
import com.rgb.grw.service.IAnswerBoardService;

import lombok.RequiredArgsConstructor;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class GrwJUnitTest {

	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Test
	public void test() {
		BasicDataSource dataSource = context.getBean("dataSource",BasicDataSource.class);
		System.out.println("driver : " + dataSource.getDriverClassName());
		System.out.println("url : " + dataSource.getUrl());
		System.out.println("username : "+dataSource.getUsername());
		System.out.println("password : "+dataSource.getPassword());
	}
	
	@Test
	public void daoTest() {
		List<AnswerBoardDto> lists = template.selectList("com.rgb.grw.dao.AnswerBoardDaoImpl.selectBoard");
		assertNotEquals(0, lists.size());
	}
	

}
