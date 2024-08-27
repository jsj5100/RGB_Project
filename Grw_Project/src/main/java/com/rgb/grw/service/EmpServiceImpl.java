package com.rgb.grw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IEmpDao;
import com.rgb.grw.dto.EmpDto;


@Service
public class EmpServiceImpl implements IEmpService {
	
	
	@Autowired
	private IEmpDao dao;	
	
	@Override
	public List<EmpDto> EmpList() {
		return dao.EmpList();
	}
	

}
