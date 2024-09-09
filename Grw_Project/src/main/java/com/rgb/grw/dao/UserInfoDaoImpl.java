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
	public UserInfoDto login(String userid) {
		log.info("UserInfoDaoImpl 사용자 검증 로그인: " + userid);
		return session.selectOne(NS + "login", userid);
	}

	@Override
	public UserInfoDto validateUser(Map<String, Object> map) {
		log.info("UserInfoDaoImpl 사용자 검증: " + map);
		return session.selectOne(NS + "validateUser", map);
	}

	@Override
	public int updatePw(Map<String, Object> map) {
		log.info("UserInfoDaoImpl 사용자 검증: " + map);
		return session.update(NS + "updatePw", map);
	}

	// 세션로그인(사용안함)
//	@Override
//	public UserInfoDto login(Map<String, Object> map) {
//		log.info("UserInfoDaoImpl 로그인: " + map);
//		return session.selectOne(NS + "login", map);
//	}

}
