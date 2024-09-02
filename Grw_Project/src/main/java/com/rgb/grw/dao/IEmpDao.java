package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.EmpDto;

public interface IEmpDao {
	
	public List<EmpDto> EmpList();

	public int addEmp(EmpDto dto);
}
