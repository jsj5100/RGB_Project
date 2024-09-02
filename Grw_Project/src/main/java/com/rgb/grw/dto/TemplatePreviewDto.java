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
public class TemplatePreviewDto {

	private String temp_id;
	private String temp_title;
	private String temp_content;
	private Date temp_regdate;
	private Date temp_editdate;
	private String img_value;
}
