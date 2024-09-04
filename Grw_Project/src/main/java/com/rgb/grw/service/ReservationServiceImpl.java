package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public List<ReservationDto> getAllBook(Map<String, Object> map) {

		return dao.getAllBook(map);
	}
	
	@Override
	public List<ReservationDto> getBookUser(Map<String, Object> map) {
		
		return dao.getBookUser(map);
	}
	
	@Override
	public int countBook(Map<String, Object> map) {
		
		return dao.countBook(map);
	}
	
	@Override
	public int countBookUser(Map<String, Object> map) {
	
		return dao.countBookUser(map);
	}
	
	@Transactional(isolation = Isolation.SERIALIZABLE)
	@Override
	public boolean insertReservation(Map<String, Object> map) {
		
		return dao.insertReservation(map);
	}
}
