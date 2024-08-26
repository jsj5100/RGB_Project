package com.rgb.grw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IDeptDao;
import com.rgb.grw.dto.DeptDto;
@Service
public class DeptServiceImpl implements IDeptService {

	
	@Autowired
	private IDeptDao dao;
	
	@Override
	public List<DeptDto> DeptList() {
		return dao.DeptList();
	}
}
