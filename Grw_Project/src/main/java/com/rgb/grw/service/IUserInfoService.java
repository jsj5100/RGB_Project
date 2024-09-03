package com.rgb.grw.service;

import java.util.Map;

import com.rgb.grw.dto.UserInfoDto;

public interface IUserInfoService {

	public UserInfoDto login(Map<String, Object> map);
	
	// 사용자 검증 메서드
	UserInfoDto validateUser(Map<String, Object> map);
}
