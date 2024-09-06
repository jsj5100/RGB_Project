package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;

public interface IEmpDao {
	
	
	//사원리스트
	public List<EmpDto> EmpList();

	//사원등록-수정
//	public int addEmp(EmpDto dto);
	
	//트리 사원
	public List<DeptDto> treeDept();
	
	//트리 부서
	public List<EmpDto> selectDept(EmpDto dto);
	
	//사원등록
	public int insertEmp(Map<String, Object> map);
}

