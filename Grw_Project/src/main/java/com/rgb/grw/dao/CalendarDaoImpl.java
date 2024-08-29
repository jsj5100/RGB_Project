package com.rgb.grw.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.CalendarDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@RequiredArgsConstructor
public class CalendarDaoImpl implements ICalendarDao {
	
	private  final SqlSessionTemplate sqlTemplate;
	
	private final String NS = "com.rgb.grw.dao.CalendarDaoImpl.";
	
	@Override
	public List<CalendarDto> selectCal(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlTemplate.selectList(NS+"selectCal", map);
	}

	@Override
	public boolean insertCal(Map<String, Object> map) {
		return sqlTemplate.insert(NS+"insertCal", map)>0?true:false;
	}
	
	@Override
	public CalendarDto eventDetail(int sd_no) {
		return sqlTemplate.selectOne(NS+"eventDetail", sd_no);
	}
}