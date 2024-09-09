package com.rgb.grw.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rgb.grw.dto.AttendanceDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AttendanceDaoImpl implements IAttendanceDao {

	@Autowired
	private SqlSession session;

	private final String NS = "com.rgb.grw.dao.AttendanceDaoImpl.";

	@Override
	public int insertAttendance(AttendanceDto attendanceDto) {
		log.info("AttendanceDaoImpl 출근 기록 추가: " + attendanceDto);
		return session.insert(NS + "insertAttendance", attendanceDto);
	}

	@Override
	public int updateAttendance(AttendanceDto attendanceDto) {
		log.info("AttendanceDaoImpl 출근 기록 업데이트: " + attendanceDto);
		return session.update(NS + "updateAttendance", attendanceDto);
	}

	@Override
	public AttendanceDto selectLatestAttendanceByEmpNo(String empNo) {
		log.info("AttendanceDaoImpl 최신 출근 기록 조회: " + empNo);
		return session.selectOne(NS + "selectLatestAttendanceByEmpNo", empNo);
	}

	@Override
	public List<AttendanceDto> selectAttendanceForDay(String empNo, Date date) {
		log.info("AttendanceDaoImpl 특정 날짜 출근 기록 조회: " + empNo + ", " + date);
		Map<String, Object> params = Map.of("empNo", empNo, "date", date);
		return session.selectList(NS + "selectAttendanceForDay", params);
	}

	@Override
	public AttendanceDto selectTodayAttendanceByEmpNo(String empNo) {
		log.info("AttendanceDaoImpl 오늘의 출근 기록 조회: " + empNo);
		return session.selectOne(NS + "selectTodayAttendanceByEmpNo", empNo);
	}

	@Override
	public Map<String, String> selectTodayAttendanceStatusByEmpNo(String empNo) {
		log.info("AttendanceDaoImpl 오늘의 출근 상태 조회: " + empNo);
		return session.selectOne(NS + "selectTodayAttendanceStatusByEmpNo", empNo);
	}

	@Override
	public List<AttendanceDto> selectMonthlyAttendanceByEmpNo(String empNo, Date date) {
		log.info("AttendanceDaoImpl 월별 출근 기록 조회: " + empNo + ", " + date);
		Map<String, Object> params = Map.of("empNo", empNo, "date", date);
		return session.selectList(NS + "selectMonthlyAttendanceByEmpNo", params);
	}

	@Override
	public List<AttendanceDto> selectAllAttendanceForDay(Date date) {
		log.info("AttendanceDaoImpl 특정 날짜 모든 사원 출근 기록 조회: " + date);
		return session.selectList(NS + "selectAllAttendanceForDay", date);
	}
}
