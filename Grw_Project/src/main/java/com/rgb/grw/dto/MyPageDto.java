package com.rgb.grw.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Data
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MyPageDto {
	private byte[] emp_photo; // 프로필사진
	private String emp_name; // 이름
	private String emp_no; // 사원번호
	private String emp_password; // 비밀번호
	private String emp_gender; // 성별
	private String emp_phone; // 전화번호
	private String emp_email; // 이메일
	private String emp_idnum; // 주민등록번호
	private Date emp_joindate; // 입사날짜
	private Date emp_outdate; // 퇴사날짜
	private String emp_state; // 재직여부
	private String tier_no; // 직위코드_조인
	private String tier_name; // 직위명_조인
	private String dep_no; // 부서코드_조인
	private String dep_name; // 부서명_조인
	private String auth_no; // 권한코드_조인
	private String auth_name; // 권한명_조인
	private String emp_photo_url; // 프로필사진 주소

	// 부서,권한,직우의 옵션화
	private String value; // 옵션 값
	private String name; // 옵션 노출값
	private String type; // 옵션 타입 (부서, 권한, 직위)
}
