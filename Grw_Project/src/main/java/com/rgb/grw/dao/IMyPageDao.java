package com.rgb.grw.dao;

import java.util.List;

import com.rgb.grw.dto.MyPageDto;
import com.rgb.grw.dto.UserInfoDto;

public interface IMyPageDao {

	// 사원 정보 조회
	public MyPageDto getMyPageInfo(String emp_no);

	// 사원 정보 업데이트
	public int updateEmp(MyPageDto myPageDto);

	// 옵션 정보 조회 (부서, 권한, 직위)
	public List<MyPageDto> getOptions();

	// 사용자 프로필 업데이트
	boolean updateUserProfile(MyPageDto myPageDto);

	// DB 정규화로 인해 필요없어진 기능
	// 부서 정보 업데이트
	// public int updateDep(MyPageDto myPageDto);

	// 권한 정보 업데이트
	// public int updateAuth(MyPageDto myPageDto);

	// 직위 정보 업데이트
	// public int updateTier(MyPageDto myPageDto);

}
