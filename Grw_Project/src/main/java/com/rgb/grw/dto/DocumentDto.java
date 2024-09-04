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
@NoArgsConstructor
@AllArgsConstructor
public class DocumentDto {

	private String doc_no;
	private String emp_no;
	private String doc_name;
	private int sta_code;
	private String temp_id;
	private String doc_regdate;
	private String doc_content;
	private String doc_exp;
	private String doc_delflag;
	private String sign_id;
	private String doc_evton;
	private String doc_evtoff;
}
