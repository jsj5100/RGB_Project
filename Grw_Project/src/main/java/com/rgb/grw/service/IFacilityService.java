package com.rgb.grw.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.rgb.grw.dto.FacilityDto;

public interface IFacilityService {
	
	public List<FacilityDto> getFacility();
}
