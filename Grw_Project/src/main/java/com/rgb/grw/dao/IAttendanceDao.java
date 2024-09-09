package com.rgb.grw.dao;

import com.rgb.grw.dto.AttendanceDto;
import org.apache.ibatis.annotations.Param;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface IAttendanceDao {

	// 출근 기록을 추가
	public int insertAttendance(AttendanceDto attendanceDto);

	// 출근 기록을 업데이트
	public int updateAttendance(AttendanceDto attendanceDto);

	// 특정 사원의 최신 출근 기록을 조회
	public AttendanceDto selectLatestAttendanceByEmpNo(String empNo);

	// 특정 날짜의 출근 기록을 조회
	public List<AttendanceDto> selectAttendanceForDay(@Param("empNo") String empNo, @Param("date") Date date);

	// 오늘의 출근 기록을 조회
	public AttendanceDto selectTodayAttendanceByEmpNo(String empNo);

	// 오늘의 출근 상태를 조회
	public Map<String, String> selectTodayAttendanceStatusByEmpNo(String empNo);

	// 특정 사원의 월별 출근 기록을 조회
	public List<AttendanceDto> selectMonthlyAttendanceByEmpNo(@Param("empNo") String empNo, @Param("date") Date date);

	// 특정 날짜의 모든 사원들의 출근 기록을 조회
	public List<AttendanceDto> selectAllAttendanceForDay(Date date);
}
