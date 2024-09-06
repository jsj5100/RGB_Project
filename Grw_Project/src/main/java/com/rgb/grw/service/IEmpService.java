package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;

public interface IEmpService {
	
	//1. 사원리스트
	public List<EmpDto> EmpList();
	
	
	//2. 사원등록
//	public int addEmp(EmpDto dto);
	
	//3. 사원트리 부서리스트
	public List<DeptDto> treeDept();
	
	//4. 사원트리 사원리스트
	public List<EmpDto> selectDept(EmpDto dto);
	
	//5. 사원등록
	public int insertEmp(Map<String, Object> map);
	
	
	
}


