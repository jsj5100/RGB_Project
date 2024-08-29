package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.CalendarDto;

public interface ICalendarService {

	public List<CalendarDto> selectCal(String empno);
	
	public boolean insertCal(Map<String, Object> map);
}
