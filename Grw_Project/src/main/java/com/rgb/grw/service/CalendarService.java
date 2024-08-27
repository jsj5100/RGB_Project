package com.rgb.grw.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.ICalendarDao;
import com.rgb.grw.dto.CalendarDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class CalendarService implements ICalendarService {
	
	private final ICalendarDao dao;
	
	
	@Override
	public List<CalendarDto> selectCal(String empno) {
		log.info("CalendaerService selectCal");
//		Map<String, Object> event = new HashMap<String, Object>();
//		List<Map<String, Object>> eventList = new ArrayList<Map<String,Object>>();
		return dao.selectCal(empno);
	}
	
	@Override
	public boolean insertCal(Map<String, Object> map) {
		log.info("Calendar insertCal");
		return dao.insertCal(map);
	}

}
