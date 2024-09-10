package com.rgb.grw.dao;

import java.util.List;
import java.util.Map;

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
	public List<DeptDto> deptList() {
		return sessionTemplate.selectList(NS+"DeptList");
	}
	
	@Override
	public int insertDept(Map<String, Object> map) {
		return sessionTemplate.insert(NS+"insertDept", map);
	}
	
	@Override
	public List<DeptDto> deptEdit() {
		return sessionTemplate.selectList(NS+"deptEdit");
	}
	
	@Override
	public int deptDel(Map<String, Object> map) {
		return sessionTemplate.update(NS+"deptDel", map);
	}
	
	@Override
	public DeptDto deptDetail(String Depno) {
		return sessionTemplate.selectOne(NS+"deptDetail", Depno);
	}
	
}


