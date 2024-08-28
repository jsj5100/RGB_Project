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
	private String emp_photo;
	private String emp_state;
	private Integer emp_fulloff;
	private Integer emp_restoff;
	private Integer emp_useoff;
	private Integer dep_no;
	private Integer auth_no;
	private Integer tier_no;

}
