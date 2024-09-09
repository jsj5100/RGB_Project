package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import com.rgb.grw.dto.DeptDto;

public interface IDeptService {

	public List<DeptDto> deptList();
	
	public int insertDept(Map<String, Object> map);
	
	public List<DeptDto> deptEdit();
	
	public int  deptDel(Map<String, Object> map);
}


