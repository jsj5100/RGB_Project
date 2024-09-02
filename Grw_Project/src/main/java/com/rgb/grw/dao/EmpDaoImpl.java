package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	@Override
	public int addEmp(EmpDto dto) {
		return sessionTemplate.insert(NS+"addEmp", dto);
	}
	

}
