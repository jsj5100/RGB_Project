	package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IEmpDao;
import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;


@Service
public class EmpServiceImpl implements IEmpService {
	
	
	@Autowired
	private IEmpDao dao;	
	
	//1. 사원리스트
	@Override
	public List<EmpDto> EmpList() {
		return dao.EmpList();
	}
	
	//2. 사원등록
//	@Override
//	public int addEmp(EmpDto dto) {
//		return dao.addEmp(dto);
//	}
	
	//3. 사원트리 부서리스트
	@Override
	public List<DeptDto> treeDept() {
		return dao.treeDept();
	}
	
	//4. 사원트리 사원리스트
	@Override
	public List<EmpDto> selectDept(EmpDto dto) {
		return dao.selectDept(dto);
	}
	
	
	@Override
	public int insertEmp(Map<String, Object> map) {
		return dao.insertEmp(map);
	}
	
	
	
}

