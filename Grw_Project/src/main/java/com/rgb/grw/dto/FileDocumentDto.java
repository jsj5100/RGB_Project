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
public class FileDocumentDto {

	public String fdoc_no;
	public String doc_no;
	public long fdoc_size;
	public String fdoc_title;
	public String fdoc_path;
	public String fdoc_stname;
}
