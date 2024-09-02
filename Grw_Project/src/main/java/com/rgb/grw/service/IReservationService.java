package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.ReservationDto;

public interface IReservationService {

	List<ReservationDto> getBook(Map<String,Object> map);
}
