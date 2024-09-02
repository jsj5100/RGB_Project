package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.ReservationDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
public class ReservationRestController {
	
	private final IReservationService service;

	@GetMapping(value="/booklist/facility.do")
	public List<ReservationDto> bookList(HttpSession session, 
						@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
		
		String bk_empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
		String st_index="1";
		String end_index="5";
		
		Map<String, Object> bmap = new HashMap<String, Object>();
		bmap.put("bk_empno", bk_empno);
		bmap.put("startDate", startDate);
		bmap.put("endDate", endDate);
		bmap.put("st_index", st_index);
		bmap.put("end_index", end_index);
		
		log.info("GetMapping 매핑 실행{}", bmap);
		List<ReservationDto> list = service.getBook(bmap);
		
		for(ReservationDto dto : list) {
			
			String stday = dto.getBk_stday().replace(" ", "T");
			dto.setBk_stday(stday);
			
			String edday = dto.getBk_edday().replace(" ", "T");
			dto.setBk_edday(edday);
			
			String regday = dto.getBk_regdate().replace(" ", "T");
			dto.setBk_regdate(regday);
			
			if(!(dto.getBk_apday()==null)) {
				
				String apday = dto.getBk_apday().replace(" ", "T");
				dto.setBk_apday(apday);
			}
			
		}
		
		log.info("수정 리스트 {}", list);
//		List<Map<String, Object>> blist = new ArrayList<Map<String,Object>>();
//		
//		for(ReservationDto dto : list) {
//			List<ReservationDto> booklist = new ArrayList<ReservationDto>();
//			
//		}
		
		return list;
	}
	

}
