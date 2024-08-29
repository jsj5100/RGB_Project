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
	
	@Override
	public List<EmpDto> EmpList() {
		return sessionTemplate.selectList(NS+"EmpList");
	}
	

}
