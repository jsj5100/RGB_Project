package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.DeptDto;

public interface IDeptDao {

	public List<DeptDto> deptList();
	
	public int insertDept(DeptDto dto);
	
	public List<DeptDto> deptEdit();
}
