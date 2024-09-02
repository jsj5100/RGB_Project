package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.FacilityDto;
import com.rgb.grw.service.IFacilityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
public class FacilityRestController {
	
	private final IFacilityService service;
	
	@GetMapping(value = "/fclist/facility.do")
	public List<FacilityDto> FacilityList() {
		List<FacilityDto> fcList = new ArrayList<FacilityDto>();
		fcList = service.getFacility();
		
		log.info("시설물 리스트 : {}",fcList);
		
		return fcList;
	}
}
