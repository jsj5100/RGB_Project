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

	public String emp_no;			//사원번호
	public String emp_password;
	public String emp_phone;
	public String emp_name;			//이름
	public String emp_email;
	public String emp_gender;
	public String emp_idnum;
	public String emp_joindate;
	public String emp_outdate;
	public String emp_photo;
	public String emp_state;		//재직여부
	public String emp_fulloff;
	public String emp_restoff;
	public String emp_useoff;
	

	public String dep_name;
	public String dep_no;

	public String tier_name;		 //직위
	public String auth_name;		 //
	
}

