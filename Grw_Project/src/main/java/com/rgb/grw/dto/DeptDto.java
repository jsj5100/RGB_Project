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
	public int seq;
	public String dep_no;
	public String dep_name;
	public String dep_state;
	
	public String emp_no;
	public String emp_name;
	
	
}
