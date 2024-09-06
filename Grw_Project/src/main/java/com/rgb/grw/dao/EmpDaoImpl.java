package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;
@Service
public class EmpDaoImpl implements IEmpDao {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private final String NS ="com.rgb.grw.dao.EmpDaoImpl.";

	
	//1. 리스트목록
	@Override
	public List<EmpDto> EmpList() {
		return sessionTemplate.selectList(NS+"EmpList");
	}
	
	//2. 사원등록
//	@Override
//	public int addEmp(EmpDto dto) {
//		return sessionTemplate.insert(NS+"addEmp", dto);
//	}
	
	//3. 사원 트리 부서리스트
	@Override
	public List<DeptDto> treeDept() {
		return sessionTemplate.selectList(NS+"treeDept");
	}
	
	//4. 사원 트리 사원리스트
	@Override
	public List<EmpDto> selectDept(EmpDto dto) {
		return sessionTemplate.selectList(NS+"selectDept", dto);
	}
	
	//5. 사원등록
	@Override
	public int insertEmp(Map<String, Object> map) {
		return sessionTemplate.insert(NS+"insertEmp", map);
	}

}
