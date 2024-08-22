package com.rgb.grw.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.UserInfoDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class UserInfoDaoImpl implements IUserInfoDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.rgb.grw.dao.UserInfoDaoImpl.";
	
	@Override
	public UserInfoDto login(Map<String, Object> map) {
		log.info("UserInfoDaoImpl 로그인: " + map);
		return session.selectOne(NS+"login", map);
	}
}
