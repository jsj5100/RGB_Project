package com.rgb.grw.service;

import java.util.Map;

import com.rgb.grw.dto.UserInfoDto;

public interface IUserInfoService {

	public UserInfoDto login(Map<String, Object> map);
}
