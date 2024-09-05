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
		boolean insertSuccess = dao.insertReservation(map);
		
		if (insertSuccess) {

			boolean searchSuccess = dao.serchReservation(map);

	        if (!searchSuccess) {
	            throw new RuntimeException("선예약시간 있음");
	        }
	    }

	    return insertSuccess;
	}
	
	@Override
	public boolean serchReservation(Map<String, Object> map) {
		
		return dao.serchReservation(map);
	}
	
	//관리자 승인 / 반려
	@Override
	public boolean updateBook(Map<String, Object> map) {
		
		return dao.updateBook(map);
	}
	
	//사용자 취소
	@Override
	public boolean cancelBook(Map<String, Object> map) {
		return dao.cancelBook(map);
	}
	
	//예약내역 상세
	@Override
	public ReservationDto getBookInfo(Map<String, Object> map) {
		
		return dao.getBookInfo(map);
	}
}
