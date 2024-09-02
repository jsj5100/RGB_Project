package com.rgb.grw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rgb.grw.dao.IMyPageDao;
import com.rgb.grw.dto.MyPageDto;
import com.rgb.grw.dto.UserInfoDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements IMyPageService {

	@Autowired
	private IMyPageDao myPageDao;

	// 사원 조회
	@Override
	public MyPageDto getMyPageInfo(String emp_no) {
		return myPageDao.getMyPageInfo(emp_no);
	}

	// 사원 수정
	@Override
	public int updateEmp(MyPageDto myPageDto) {
		if (myPageDto != null) {
			// 사원 정보 조회
			MyPageDto existingEmployee = myPageDao.getMyPageInfo(myPageDto.getEmp_no());

			if (myPageDto.getEmp_password() == null || myPageDto.getEmp_password().isEmpty()) {
				// 비밀번호 입력이 없는 경우 기존 비밀번호 유지
				myPageDto.setEmp_password(existingEmployee.getEmp_password());
			}

			int result = myPageDao.updateEmp(myPageDto);
			if (result == 0) {
				throw new RuntimeException("사원 정보 업데이트 실패: " + myPageDto.getEmp_no());
			}
			return result; // 성공 시 반환
		} else {
			throw new IllegalArgumentException("사원 DTO가 null입니다.");
		}
	}

	// 옵션 조회
	@Override
	public List<MyPageDto> getOptions() {
		return myPageDao.getOptions();
	}

	// 프로필 업데이트
	@Override
	public boolean updateUserProfile(MyPageDto myPageDto) {
		log.info("사용자 프로필 업데이트 : {}", myPageDto);
		return myPageDao.updateUserProfile(myPageDto);
	}

	// DB 정규화로 인해 필요없어진 기능
//	@Override
//	public int updateDep(MyPageDto myPageDto) {
//		if (myPageDto != null) {
//			int result = myPageDao.updateDep(myPageDto);
//			if (result == 0) {
//				throw new RuntimeException("부서 정보 업데이트 실패: " + myPageDto.getEmp_no());
//			}
//			return result; // 성공 시 반환
//		} else {
//			throw new IllegalArgumentException("사원 DTO가 null입니다.");
//		}
//	}
//
//	@Override
//	public int updateAuth(MyPageDto myPageDto) {
//		if (myPageDto != null) {
//			int result = myPageDao.updateAuth(myPageDto);
//			if (result == 0) {
//				throw new RuntimeException("권한 정보 업데이트 실패: " + myPageDto.getEmp_no());
//			}
//			return result; // 성공 시 반환
//		} else {
//			throw new IllegalArgumentException("사원 DTO가 null입니다.");
//		}
//	}
//
//	@Override
//	public int updateTier(MyPageDto myPageDto) {
//		if (myPageDto != null) {
//			int result = myPageDao.updateTier(myPageDto);
//			if (result == 0) {
//				throw new RuntimeException("직위 정보 업데이트 실패: " + myPageDto.getEmp_no());
//			}
//			return result; // 성공 시 반환
//		} else {
//			throw new IllegalArgumentException("사원 DTO가 null입니다.");
//		}
//	}

}
