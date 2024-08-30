package com.rgb.grw.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class EmpDto {

	private String emp_no;			//사원번호
	private String emp_password;
	private String emp_phone;
	private String emp_name;			//이름
	private String emp_email;
	private String emp_gender;
	private String emp_idnum;
	private String emp_joindate;
	private String emp_outdate;
	private String emp_photo;
	private String emp_state;		//재직여부
	private String emp_fulloff;
	private String emp_restoff;
	private String emp_useoff;
	

	private String dep_name;
	private String dep_no;

	private String tier_name;		 //직위
	private String auth_name;		 //
	private TierDto tDto;			//홍준님꺼
}

