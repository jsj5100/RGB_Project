package com.rgb.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbcp.BasicDataSource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rgb.grw.dao.ICalendarDao;
import com.rgb.grw.dto.CalendarDto;
import com.rgb.grw.service.ICalendarService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class Calenar_JUnitTest {
	
	@Autowired
	private  ApplicationContext context;
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Autowired
	private ICalendarService service;
	
//	@Test
	public void test() {
		BasicDataSource dataSource = context.getBean("dataSource",BasicDataSource.class);
		System.out.println("driver : " + dataSource.getDriverClassName());
		System.out.println("url : " + dataSource.getUrl());
		System.out.println("username : "+dataSource.getUsername());
		System.out.println("password : "+dataSource.getPassword());
	}
	
	//일정조회
//	@Test
	public void selectCalTest() {
		Map<String, String> selectMap = new HashMap<String, String>();
		selectMap.put("empNo", "000000");
		List<CalendarDto> lists = service.selectCal(selectMap);
		assertNotEquals(0,lists.size());
	}
	
	
	//일정상세조회
//	@Test
	public void eventDetailTest() {
		int sd_no = 1;
		CalendarDto detailDto = new CalendarDto();
		detailDto = service.eventDetail(sd_no);
		System.out.println(detailDto);
	}
//	@Test
	public void modifyEventTest() {
		Map<String, Object> modifyMap = new HashMap<String, Object>();
		modifyMap.put("sd_no", "2");
		modifyMap.put("sd_code", "S01");
		modifyMap.put("sd_start", "2024-08-01 00:00:00");
		modifyMap.put("sd_end", "2024-08-01 10:00:00");
		modifyMap.put("sd_title", "JUnit Test");
		modifyMap.put("sd_content", "Test용 수정");
		modifyMap.put("sd_editor", "테스트");
		modifyMap.put("sd_allday", "true");
		boolean b = service.modifyEvent(modifyMap);
		assertEquals(true, b);
	}
//	@Test
	public void delEventTest() {
		boolean result=service.delEvent(4);
		assertEquals(true, result);
	}
	
	@Test
	public void insertEventTest() {
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("sd_code","S02");
		insertMap.put("sd_empno","222222");
		insertMap.put("sd_start","2024-10-01 00:00:00");
		insertMap.put("sd_end","2024-08-01 10:00:00");
		insertMap.put("sd_title","테스트의 무한반복");
		insertMap.put("sd_content","반복되는 짱구의..?");
		insertMap.put("sd_writer","김유신");
		insertMap.put("sd_allday", false);
		
		boolean result = service.insertCal(insertMap);
		assertEquals(true, result);
	}
}
