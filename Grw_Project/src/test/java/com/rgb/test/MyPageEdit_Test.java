package com.rgb.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rgb.grw.dao.IMyPageDao;
import com.rgb.grw.dto.MyPageDto;
import com.rgb.grw.service.IMyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MyPageEdit_Test {

	@Autowired
	private ApplicationContext context;

	@Autowired
	private SqlSessionTemplate template;

	@Autowired
	private IMyPageDao myPageDao;

	@Autowired
	private IMyPageService myPageService;

	private String emp_no; // 사원 번호
	private MyPageDto myPageDto; // 사원 정보 DTO

	@Before
	public void setUp() {
		emp_no = "101010"; // 테스트할 사원 번호 설정

		// 기존 데이터 조회
		myPageDto = myPageDao.getMyPageInfo(emp_no);

		// 기존 데이터가 없으면 테스트 x
		if (myPageDto == null) {
			throw new RuntimeException("주어진 사원 번호에 대한 데이터가 없습니다.");
		}

		// 업데이트 할 데이터 설정
		myPageDto.setEmp_name("업데이트");
		myPageDto.setEmp_phone("010-1234-5678");
		myPageDto.setEmp_email("updated@example.com");
		myPageDto.setEmp_password("1111");
		myPageDto.setDep_no("HR001"); // 부서 번호로 설정
		myPageDto.setAuth_no("HR00A"); // 권한 번호로 설정
		myPageDto.setTier_no("T001"); // 직위 번호로 설정

		log.info("setUp 사원번호 설정");
		log.info("testUpdateEmp 사원번호 업데이트 :{},{},{},{},{},{},{}" + myPageDto.getEmp_name(), myPageDto.getEmp_phone(),
				myPageDto.getEmp_phone(), myPageDto.getEmp_password(), myPageDto.getDep_no(), myPageDto.getAuth_no(),
				myPageDto.getTier_no());
	}

	@Test
	public void testUpdateEmp() {
		// 사원 정보 업데이트
		int result = myPageDao.updateEmp(myPageDto);

		// 업데이트 결과 1 : 성공
		assertEquals("사원 정보 업데이트가 성공해야 합니다.", 1, result);

		// 업데이트된 데이터 조회
		MyPageDto updatedDto = myPageDao.getMyPageInfo(emp_no);

		// 업데이트된 데이터가 null x
		assertNotNull("업데이트된 사원 정보가 null이 아니어야 합니다.", updatedDto);
	}

	@Test
	public void testGetOptions() {
		// 옵션 정보 조회
		List<MyPageDto> options = myPageDao.getOptions();

		// 옵션 정보가 null이 아니고, 비어있지 않은지 확인
		assertNotNull("옵션 정보가 null이 아니어야 합니다.", options);
		assertFalse("옵션 정보 리스트가 비어있지 않아야 합니다.", options.isEmpty());

		// 조회된 첫 번째 옵션 정보를 확인 (예시로 확인)
		MyPageDto firstOption = options.get(0);
		assertNotNull("첫 번째 옵션 정보가 null이 아니어야 합니다.", firstOption.getValue());
		assertNotNull("첫 번째 옵션 타입이 null이 아니어야 합니다.", firstOption.getType());

		// 전체 옵션 리스트를 로그에 출력
		for (MyPageDto option : options) {
			System.out.println("옵션 값: " + option.getValue() + ", 타입: " + option.getType());
		}
	}

//	@Test
//	public void testUpdateDep() {
//		// 부서 정보 업데이트
//		int result = myPageDao.updateDep(myPageDto);
//
//		// 업데이트 결과 1 : 성공
//		assertEquals("부서 정보 업데이트가 성공해야 합니다.", 1, result);
//
//		// 업데이트된 데이터 조회
//		MyPageDto updatedDto = myPageDao.getMyPageInfo(emp_no);
//
//		// 업데이트된 부서 번호가 기대한 값과 일치하는지 확인
//		assertEquals("업데이트된 부서 번호가 일치해야 합니다.", "D001", updatedDto.getDep_no());
//		
//		log.info("testUpdateDep 부서 업데이트");
//	}
//	@Test
//	public void testUpdateAuth() {
//		// 권한 정보 업데이트
//		int result = myPageDao.updateAuth(myPageDto);
//
//		// 업데이트 결과 1 : 성공
//		assertEquals("권한 정보 업데이트가 성공해야 합니다.", 1, result);
//
//		// 업데이트된 데이터 조회
//		MyPageDto updatedDto = myPageDao.getMyPageInfo(emp_no);
//
//		// 업데이트된 권한 번호가 기대한 값과 일치하는지 확인
//		assertEquals("업데이트된 권한 번호가 일치해야 합니다.", "A001", updatedDto.getAuth_no());
//		
//		log.info("testUpdateDep 권한 업데이트");
//	}
//	@Test
//	public void testUpdateTier() {
//		// 직위 정보 업데이트
//		int result = myPageDao.updateTier(myPageDto);
//
//		// 업데이트 결과 1 : 성공
//		assertEquals("직위 정보 업데이트가 성공해야 합니다.", 1, result);
//
//		// 업데이트된 데이터 조회
//		MyPageDto updatedDto = myPageDao.getMyPageInfo(emp_no);
//
//		// 업데이트된 직위 번호가 기대한 값과 일치하는지 확인
//		assertEquals("업데이트된 직위 번호가 일치해야 합니다.", "T001", updatedDto.getTier_no());
//		
//		log.info("testUpdateTier 직위 업데이트");
//	}

}
