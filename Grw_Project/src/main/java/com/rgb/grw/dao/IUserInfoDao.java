package com.rgb.grw.dao;

import java.util.Map;

import com.rgb.grw.dto.UserInfoDto;

public interface IUserInfoDao {

	public UserInfoDto login(Map<String, Object> map);
	
	// 사용자 검증 메서드
	public UserInfoDto validateUser(Map<String, Object> map);
}
