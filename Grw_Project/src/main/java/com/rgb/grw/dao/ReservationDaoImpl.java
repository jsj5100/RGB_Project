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

}
