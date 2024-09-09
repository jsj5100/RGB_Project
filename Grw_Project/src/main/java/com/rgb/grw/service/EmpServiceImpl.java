	package com.rgb.grw.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IEmpDao;
import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;


@Service
public class EmpServiceImpl implements IEmpService {
	
	
	@Autowired
	private IEmpDao dao;	
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
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
		// 비밀번호 암호화
        String rawPassword = (String) map.get("empPw");
        String encodedPassword = passwordEncoder.encode(rawPassword);
        
        // 암호화된 비밀번호로 map 업데이트
        map.put("empPw", encodedPassword);

        return dao.insertEmp(map);
	}
	
	
	
}

