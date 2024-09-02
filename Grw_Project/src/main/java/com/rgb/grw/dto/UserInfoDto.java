package com.rgb.grw.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoDto {

	private String emp_no;
	private String emp_password;
	private String emp_phone;
	private String emp_name;
	private String emp_email;
	private String emp_gender;
	private String emp_idnum;
	private Date emp_joindate;
	private Date emp_outdate;
	private byte[] emp_photo;
	private String emp_state;
	private int emp_fulloff;
	private int emp_restoff;
	private int emp_useoff;
	private String dep_no;
	private String auth_no;
	private String tier_no;
	private String dep_name;
	private String auth_name;
	private String tier_name;
	
	private String emp_photo_url; // 프로필사진 주소
}
