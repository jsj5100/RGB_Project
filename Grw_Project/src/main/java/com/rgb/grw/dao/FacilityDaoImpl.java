package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.FacilityDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class FacilityDaoImpl implements IFacilityDao {

	private final SqlSessionTemplate template;
	
	private String NS = "com.rgb.grw.dao.FacilityDaoImpl.";
	
	@Override
	public List<FacilityDto> getFacility() {
		return template.selectList(NS+"getFacility");
	}
}
