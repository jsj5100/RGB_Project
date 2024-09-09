package com.rgb.grw.service;

import com.rgb.grw.dto.AttendanceDto;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IAttendanceService {

	// 출근 기록 추가
	public int insertAttendance(AttendanceDto attendanceDto);

	// 출근 기록 업데이트
	public int updateAttendance(AttendanceDto attendanceDto);

	// 특정 사원의 최신 출근 기록 조회
	public AttendanceDto selectLatestAttendanceByEmpNo(String empNo);

	// 특정 날짜의 출근 기록 조회
	public List<AttendanceDto> selectAttendanceForDay(String empNo, Date date);

	// 오늘의 출근 기록 조회
	public AttendanceDto selectTodayAttendanceByEmpNo(String empNo);

	// 오늘의 출근 상태 조회
	public Map<String, String> selectTodayAttendanceStatusByEmpNo(String empNo);

	// 특정 사원의 월별 출근 기록 조회
	public List<AttendanceDto> selectMonthlyAttendanceByEmpNo(String empNo, Date date);

	// 특정 날짜의 모든 사원 출근 기록 조회
	public List<AttendanceDto> selectAllAttendanceForDay(Date date);
}
