package com.rgb.grw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rgb.grw.dao.FacilityDaoImpl;
import com.rgb.grw.dto.FacilityDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class FacilityServiceImpl implements IFacilityService {
	
	private final FacilityDaoImpl dao;
	
	@Override
	public List<FacilityDto> getFacility() {
		log.info("facility getFacility");
		return dao.getFacility();
	}
}
