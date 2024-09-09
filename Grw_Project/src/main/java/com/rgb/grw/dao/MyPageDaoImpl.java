package com.rgb.grw.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.MyPageDto;
import com.rgb.grw.dto.UserInfoDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MyPageDaoImpl implements IMyPageDao {

	@Autowired
	private SqlSessionTemplate session;

	private final String NS = "com.rgb.grw.dao.MyPageDaoImpl.";

	// 사원 조회
	@Override
	public MyPageDto getMyPageInfo(String emp_no) {
		log.info("MyPageDaoImpl 로그인: " + emp_no);
		return session.selectOne(NS + "MyPage", emp_no);
	}

	// 사원 수정
	@Override
	public int updateEmp(MyPageDto myPageDto) {
		log.info("MyPageDaoImpl 사원 정보 업데이트: " + myPageDto.getEmp_no());
		return session.update(NS + "updateEmp", myPageDto);
	}

	// 옵션 조회
	@Override
	public List<MyPageDto> getOptions() {
		log.info("MyPageDaoImpl 옵션 정보 조회");
		return session.selectList(NS + "getOptions");
	}

	// 프로필 업데이트
	@Override
	public boolean updateUserProfile(MyPageDto myPageDto) {
		int count = session.update(NS + "updateUserProfile", myPageDto);
		return count > 0;
	}

	// DB 정규화로 인해 필요없어진 기능
//	@Override
//	public int updateDep(MyPageDto myPageDto) {
//		log.info("MyPageDaoImpl 부서 정보 업데이트: " + myPageDto.getEmp_no());
//		return session.update(NS + "updateDep", myPageDto);
//	}
//
//	@Override
//	public int updateAuth(MyPageDto myPageDto) {
//		log.info("MyPageDaoImpl 권한 정보 업데이트: " + myPageDto.getEmp_no());
//		return session.update(NS + "updateAuth", myPageDto);
//	}
//
//	@Override
//	public int updateTier(MyPageDto myPageDto) {
//		log.info("MyPageDaoImpl 직위 정보 업데이트: " + myPageDto.getEmp_no());
//		return session.update(NS + "updateTier", myPageDto);
//	}

}
