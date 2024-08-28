package com.rgb.grw.dto;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
@ToString
public class CalendarDto {
	
	private int sd_no;
	private String sd_code;
	private String sd_empno;
	private String sd_start;
	private String sd_end;
	private String sd_regdate;
	private String sd_title;
	private String sd_content;
	private String sd_writer;
	private String sd_editor;
	private String sd_edittime;
	private boolean sd_allday;
}
