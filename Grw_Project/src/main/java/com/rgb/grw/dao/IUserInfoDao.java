package com.rgb.grw.dao;

import java.util.Map;

import com.rgb.grw.dto.UserInfoDto;

public interface IUserInfoDao {

	public UserInfoDto login(Map<String, Object> map);
	
}
