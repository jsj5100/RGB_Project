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
public class StroageDto {

	private String storage_name;
	private String storage_regdate;
	private String storage_content;
	private String storage_exp;
	private String storage_delflag;
	private String storage_evton;
	private String storage_evtoff;
	private String temp_id;
	private String storage_no;
	private String emp_no;
	private String emp_name;

}
