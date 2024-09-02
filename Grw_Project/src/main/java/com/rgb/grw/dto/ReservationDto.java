package com.rgb.grw.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReservationDto {
	
	private int bk_no;
	private String fc_no;
	private String bk_empno;
	private String bk_title;
	private String bk_content;
	private String bk_stday;
	private String bk_edday;
	private String bk_name;
	private String bk_dep;
	private String bk_state;
	private String bk_apname;
	private String bk_apday;
	private String bk_regdate;
}
