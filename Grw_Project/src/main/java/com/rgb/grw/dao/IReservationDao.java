package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.ReservationDto;

public interface IReservationDao {
	
	List<ReservationDto> getBook(Map<String,Object> map);
}
