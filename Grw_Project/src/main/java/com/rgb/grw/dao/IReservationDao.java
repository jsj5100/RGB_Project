package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.ReservationDto;

public interface IReservationDao {
	
	public List<ReservationDto> getBook(Map<String,Object> map);
	
	public List<ReservationDto> getBookUser(Map<String,Object> map);
	
	public List<ReservationDto> getAllBook(Map<String,Object> map);
	
	public boolean insertReservation(Map<String,Object> map);
	
	public boolean serchReservation(Map<String, Object> map);
	
	public boolean updateBook(Map<String, Object> map);
	
	public boolean cancelBook(Map<String, Object> map);
	
	public ReservationDto getBookInfo(Map<String, Object>map);
	
	//Paging
	public int countBook(Map<String, Object> map);
	
	public int countBookUser(Map<String, Object> map);
}
