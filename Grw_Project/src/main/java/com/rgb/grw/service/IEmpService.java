package com.rgb.grw.service;

import java.util.List;

import com.rgb.grw.dto.EmpDto;

public interface IEmpService {
	
	//1. 사원리스트
	public List<EmpDto> EmpList();
	
	
	//2. 사원등록
	public int addEmp(EmpDto dto);

}
