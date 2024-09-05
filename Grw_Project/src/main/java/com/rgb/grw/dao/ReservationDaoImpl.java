package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.ReservationDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@RequiredArgsConstructor
public class ReservationDaoImpl implements IReservationDao {

	private final SqlSessionTemplate template;
	
	private String NS = "com.rgb.grw.dao.ReservationDaoImpl.";
	@Override
	public List<ReservationDto> getBook(Map<String, Object> map) {
		
		return template.selectList(NS+"getBook",map);
	}
	
	@Override
	public List<ReservationDto> getAllBook(Map<String, Object> map) {
		return template.selectList(NS+"getAllBook",map);
	}
	
	@Override
	public List<ReservationDto> getBookUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return template.selectList(NS+"getBookUser",map);
	}
	
	//페이징(관리자 totalpage)
	@Override
	public int countBook(Map<String, Object> map) {

		return template.selectOne(NS+"countBook",map);
	}
	
	//페이징(사용자 totalpage)
	@Override
	public int countBookUser(Map<String, Object> map) {

		return template.selectOne(NS+"countBookUser",map);
	}
	
	//예약등록신청
	@Override
	public boolean insertReservation(Map<String, Object> map) {

		return template.insert(NS+"insertReservation",map)>0?true:false;
	}
	
	//예약시간 확인 검사
	@Override
	public boolean serchReservation(Map<String, Object> map) {
		
		int n = template.selectOne(NS+"serchReservation",map);
		
		return n>0?false:true;
	}
	
	//관리자 승인
	@Override
	public boolean updateBook(Map<String, Object> map) {
		return template.update(NS+"updateBook",map)>0?true:false;
	}
	
	//사용자 수정
	@Override
	public boolean cancelBook(Map<String, Object> map) {
		return template.update(NS+"modifyBook",map)>0?true:false;
	}
	
	//예약 내용 상세
	@Override
	public ReservationDto getBookInfo(Map<String, Object> map) {
		
	return template.selectOne(NS+"ReservationDto",map);
	}
}
