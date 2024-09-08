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
public class DocumentListDto {

	private String doc_no;
	private String doc_name;
	private String emp_name;
	private String doc_regdate;
	private String doc_exp;
	private String img_value;
	private String doc_content;
	private String emp_no;
	private String approve;
}
