package com.rgb.test;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Date;

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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class MyPage_Test {

	@Autowired
	private ApplicationContext context;

	@Autowired
	private SqlSessionTemplate template;

	@Autowired
	private IMyPageDao myPageDao;

	private String emp_no;

	@Before
	public void setUp() {
		emp_no = "000000"; // 테스트할 사원번호 설정
	}

	@Test
	public void testGetMyPageInfo() {
		// 데이터베이스에서 MyPageDto 조회
		MyPageDto myPageDto = myPageDao.getMyPageInfo(emp_no);

		// 조회된 데이터 출력 및 검증
		if (myPageDto != null) {
			System.out.println("사원 사진: " + myPageDto.getEmp_photo());
			System.out.println("사원 이름: " + myPageDto.getEmp_name());
			System.out.println("사원 성별: " + myPageDto.getEmp_gender());
			System.out.println("직급명: " + myPageDto.getTier_name());
			System.out.println("사원 번호: " + myPageDto.getEmp_no());
			System.out.println("부서명: " + myPageDto.getDep_name());
			System.out.println("권한명: " + myPageDto.getAuth_name());
			System.out.println("사원 비밀번호: " + myPageDto.getEmp_password());
			System.out.println("사원 전화번호: " + myPageDto.getEmp_phone());
			System.out.println("사원 이메일: " + myPageDto.getEmp_email());
			System.out.println("사원 입사일: " + new SimpleDateFormat("yyyy-MM-dd").format(myPageDto.getEmp_joindate()));
			System.out.println("사원 주민등록번호: " + myPageDto.getEmp_idnum());

			// Assertions
			assertNotNull("사원 DTO는 null이면 안 됩니다", myPageDto);
			assertEquals("사원 번호가 일치해야 합니다", emp_no, myPageDto.getEmp_no());
			assertNotNull("사원 이름은 null이면 안 됩니다", myPageDto.getEmp_name());
			assertNotNull("사원 성별은 null이면 안 됩니다", myPageDto.getEmp_gender());
			assertNotNull("사원 직급명은 null이면 안 됩니다", myPageDto.getTier_name());
			assertNotNull("사원 부서명은 null이면 안 됩니다", myPageDto.getDep_name());
			assertNotNull("사원 권한명은 null이면 안 됩니다", myPageDto.getAuth_name());
			assertNotNull("사원 비밀번호는 null이면 안 됩니다", myPageDto.getEmp_password());
			assertNotNull("사원 전화번호는 null이면 안 됩니다", myPageDto.getEmp_phone());
			assertNotNull("사원 이메일은 null이면 안 됩니다", myPageDto.getEmp_email());
			assertNotNull("사원 입사일은 null이면 안 됩니다", myPageDto.getEmp_joindate());
			assertNotNull("사원 주민등록번호는 null이면 안 됩니다", myPageDto.getEmp_idnum());
		} else {
			System.out.println("주어진 사원 번호에 대한 데이터가 없습니다.");
			fail("주어진 사원 번호에 대한 데이터가 없습니다.");
		}
	}
}
