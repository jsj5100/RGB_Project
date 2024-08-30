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
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class JsTreeResponseDto {

	private String id;
	private String text;
	private String parent;
	
	private String dep_name;
	private String tier_name;
	private String tier_no;
	
}
