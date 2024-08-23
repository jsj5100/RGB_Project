package com.rgb.grw.dto;

import java.sql.Date;

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
public class AttendanceDto {
    private String att_no;
    private Date att_intime;
    private Date att_outtime;
    private Integer att_worktime;
    private Integer att_basetime;
}
