package com.rgb.grw.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ApproverDto {
	public String doc_no;
	public String emp_no;
	public int app_procedure;
}
