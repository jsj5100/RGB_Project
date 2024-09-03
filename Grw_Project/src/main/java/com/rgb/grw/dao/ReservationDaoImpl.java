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
	
	//페이징
	@Override
	public int countBook(Map<String, Object> map) {

		return template.selectOne(NS+"countBook",map);
	}
	
	@Override
	public int countBookUser(Map<String, Object> map) {

		return template.selectOne(NS+"countBookUser",map);
	}

}
