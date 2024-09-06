package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.rgb.grw.dao.IReservationDao;
import com.rgb.grw.dto.ReservationDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		try {
	        // 예약 중복 확인
	        boolean isDuplicate = dao.serchReservation(map);
	        
	        // 중복된 예약이 있으면 예외 발생
	        if (isDuplicate) {
	            throw new RuntimeException("중복된 예약이 존재합니다.");
	        }
	        
	        boolean insertSuccess = dao.insertReservation(map);
	        log.info("insertSuccess {}", insertSuccess);
	        return insertSuccess;
	        
	    } catch (Exception e) {
	        e.printStackTrace(); 
	        throw new RuntimeException("예약 삽입 중 오류 발생", e);
	    }
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
