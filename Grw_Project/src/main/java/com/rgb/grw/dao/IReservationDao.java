package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.ReservationDto;

public interface IReservationDao {
	
	List<ReservationDto> getBook(Map<String,Object> map);
	List<ReservationDto> getBookUser(Map<String,Object> map);
	List<ReservationDto> getAllBook(Map<String,Object> map);
	
	//Paging
	public int countBook(Map<String, Object> map);
	public int countBookUser(Map<String, Object> map);
}
