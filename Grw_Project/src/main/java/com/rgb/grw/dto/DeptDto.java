package com.rgb.grw.dto;


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
public class DeptDto {
	private int seq;
	private String dep_no;
	private String dep_name;
	private String dep_state;
	
	private String emp_no;
	private String emp_name;
	private TierDto tierDto;
	private String tier_no;
	
	private String auth_no;
	private String auth_name;
	
	
}
