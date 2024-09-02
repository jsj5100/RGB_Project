package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IReservationDao;
import com.rgb.grw.dto.ReservationDto;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements IReservationService {

	private final IReservationDao dao;
	
	@Override
	public List<ReservationDto> getBook(Map<String, Object> map) {
		
		return dao.getBook(map);
	}

}
