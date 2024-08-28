package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.CalendarDto;

public interface ICalendarDao {
	
	public List<CalendarDto> selectCal(String empno);
	public boolean insertCal(Map<String, Object> map);
	
}
