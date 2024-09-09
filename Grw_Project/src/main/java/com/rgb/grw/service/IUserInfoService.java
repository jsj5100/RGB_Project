package com.rgb.grw.service;

import java.util.Map;

import com.rgb.grw.dto.UserInfoDto;

public interface IUserInfoService {

	// 시큐리티 로그인
	public UserInfoDto login(String userid);

	// 사용자 검증 메서드
	UserInfoDto validateUser(Map<String, Object> map);

	// 비밀번호 변경
	public int updatePw(Map<String, Object> map);

	// 세션로그인(사용안함)
//	UserInfoDto login(Map<String, Object> map);
}
