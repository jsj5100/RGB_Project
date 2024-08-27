package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.DeptDto;

public interface IDeptDao {

	public List<DeptDto> DeptList();
	
	public int insertDept(DeptDto dto);
}
