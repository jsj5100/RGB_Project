package com.rgb.grw.ctrl;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CalendarController {
	public String list() {
		log.info("CalendarController list");
		return "calendar";
	}
}
