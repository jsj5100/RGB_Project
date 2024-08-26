package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.rgb.grw.dto.DeptDto;

@Service
public class DeptDaoImpl implements IDeptDao {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private final String NS ="com.rgb.grw.dao.DeptDaoImpl.";
	
	
	
	@Override
	public List<DeptDto> DeptList() {
		return sessionTemplate.selectList(NS+"DeptList");
	}

}
