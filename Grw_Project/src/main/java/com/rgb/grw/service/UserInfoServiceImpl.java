package com.rgb.grw.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IUserInfoDao;
import com.rgb.grw.dto.UserInfoDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserInfoServiceImpl implements IUserInfoService {

	@Autowired
	private IUserInfoDao dao;
	
	@Override
	public UserInfoDto login(Map<String, Object> map) {
		log.info("로그인 서비스 : {}", map);
		return dao.login(map);
	}

}
