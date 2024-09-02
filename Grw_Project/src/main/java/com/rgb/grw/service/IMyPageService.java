package com.rgb.grw.service;

import java.util.List;

import com.rgb.grw.dto.MyPageDto;
import com.rgb.grw.dto.UserInfoDto;

public interface IMyPageService {

	// 사원 조회
	public MyPageDto getMyPageInfo(String emp_no);

	// 사원 수정
	public int updateEmp(MyPageDto myPageDto);

	// 옵션조회
	public List<MyPageDto> getOptions();

	// 사용자 프로필 업데이트
	boolean updateUserProfile(MyPageDto myPageDto);

	// DB 정규화로 인해 필요없어진 기능
	// public int updateDep(MyPageDto myPageDto);

	// public int updateAuth(MyPageDto myPageDto);

	// public int updateTier(MyPageDto myPageDto);

}
