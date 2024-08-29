package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.CalendarDto;

public interface ICalendarService {

	public List<CalendarDto> selectCal(Map<String, String> map);
	
	public boolean insertCal(Map<String, Object> map);
	
	public CalendarDto eventDetail(int sd_no);
}
