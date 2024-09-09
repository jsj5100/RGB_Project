package com.rgb.test;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.rgb.grw.dao.IAttendanceDao;
import com.rgb.grw.dto.AttendanceDto;
import com.rgb.grw.service.IAttendanceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class AttendanceService_Test {

	@Autowired
	private ApplicationContext context;

	@Autowired
	private SqlSessionTemplate template;

	@Autowired
	private IAttendanceService attendanceService;

	@Autowired
	private IAttendanceDao attendanceDao;

	private AttendanceDto attendanceDto;
	private String empNo;
	private Date today;

	@Before
	public void setUp() {
		empNo = "000000"; // 테스트할 사원번호 설정
		today = new Date();
		attendanceDto = new AttendanceDto();
		attendanceDto.setEmp_no(empNo);
		attendanceDto.setAtt_intime(today); // 출근 시간 설정
	}

	@Test
	public void testInsertAttendance() {
		int result = attendanceService.insertAttendance(attendanceDto);
		assertEquals("출근 기록 추가 실패", 1, result);
	}

	@Test
	public void testUpdateAttendance() {
		// 먼저 출근 기록을 추가하고
		attendanceService.insertAttendance(attendanceDto);

		// 업데이트 테스트
		attendanceDto.setAtt_outtime(new Date()); // 퇴근 시간 설정
		attendanceDto.setAtt_status("퇴근");
		int result = attendanceService.updateAttendance(attendanceDto);
		assertEquals("출근 기록 업데이트 실패", 1, result);
	}

	@Test
	public void testSelectLatestAttendanceByEmpNo() {
		// 출근 기록 추가
		attendanceService.insertAttendance(attendanceDto);

		// 최신 출근 기록 조회
		AttendanceDto result = attendanceService.selectLatestAttendanceByEmpNo(empNo);
		assertNotNull("최신 출근 기록 조회 실패", result);
		assertEquals("사원 번호 불일치", empNo, result.getEmp_no());
	}

	@Test
	public void testSelectAttendanceForDay() {
		// 출근 기록 추가
		attendanceService.insertAttendance(attendanceDto);

		// 특정 날짜 출근 기록 조회
		List<AttendanceDto> result = attendanceService.selectAttendanceForDay(empNo, today);
		assertNotNull("특정 날짜 출근 기록 조회 실패", result);
		assertFalse("출근 기록이 없습니다", result.isEmpty());
	}

	@Test
	public void testSelectTodayAttendanceByEmpNo() {
		// 출근 기록 추가
		attendanceService.insertAttendance(attendanceDto);

		// 오늘의 출근 기록 조회
		AttendanceDto result = attendanceService.selectTodayAttendanceByEmpNo(empNo);
		assertNotNull("오늘의 출근 기록 조회 실패", result);
		assertEquals("사원 번호 불일치", empNo, result.getEmp_no());
	}

	@Test
	public void testSelectTodayAttendanceStatusByEmpNo() {
		// 출근 기록 추가
		attendanceService.insertAttendance(attendanceDto);

		// 오늘의 출근 상태 조회
		Map<String, String> result = attendanceService.selectTodayAttendanceStatusByEmpNo(empNo);
		assertNotNull("오늘의 출근 상태 조회 실패", result);
		assertTrue("출근 상태가 없습니다", result.containsKey("STATUS"));
	}

	@Test
	public void testSelectMonthlyAttendanceByEmpNo() {
		// 출근 기록 추가
		attendanceService.insertAttendance(attendanceDto);

		// 월별 출근 기록 조회
		List<AttendanceDto> result = attendanceService.selectMonthlyAttendanceByEmpNo(empNo, today);
		assertNotNull("월별 출근 기록 조회 실패", result);
		assertFalse("출근 기록이 없습니다", result.isEmpty());
	}

	@Test
	public void testSelectAllAttendanceForDay() {
		// 출근 기록 추가
		attendanceService.insertAttendance(attendanceDto);

		// 특정 날짜 모든 사원 출근 기록 조회
		List<AttendanceDto> result = attendanceService.selectAllAttendanceForDay(today);
		assertNotNull("특정 날짜 모든 사원 출근 기록 조회 실패", result);
		assertFalse("출근 기록이 없습니다", result.isEmpty());
	}
}
