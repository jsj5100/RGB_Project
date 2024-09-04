package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rgb.grw.dto.FacilityDto;
import com.rgb.grw.dto.PagingDto;
import com.rgb.grw.dto.ReservationDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IFacilityService;
import com.rgb.grw.service.IReservationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class FacilityController {
	
	private final IFacilityService service;
	private final IReservationService reservice;
	
	@GetMapping(value = "/facility.do")
	public String calendar(HttpSession session, Model model,@RequestParam(defaultValue="1") int page, @RequestParam(defaultValue="5") int countList) {
		String empno = ((UserInfoDto) session.getAttribute("loginDto")).getEmp_no();
		String auth = ((UserInfoDto) session.getAttribute("loginDto")).getAuth_no();
		
		
		Calendar today = Calendar.getInstance();
		//오늘 날짜
		Date startDate = today.getTime();
		//12일 후 날짜
		today.add(Calendar.DAY_OF_MONTH, 12);
		Date endDate = today.getTime();
		
		List<FacilityDto> list = service.getFacility();
		model.addAttribute("fclist", list);
		
		log.info("list 출력 {}",list);
		
		if(empno == null) {
			log.info("empno값 확인 : {}", empno);
			return "redirect:/loginServlet.do";
			
		} else {
			
		 Map<String, Object> pageParams = new HashMap<String, Object>();
		    pageParams.put("startDate", startDate);
		    pageParams.put("endDate", endDate);
		    pageParams.put("bk_empno", empno);
		    
		List<ReservationDto> rlist = new ArrayList<ReservationDto>();
		
		if(auth.equals("FC00A")) {
			//예약목록 조회(관리자)
			rlist =reservice.getBook(pageParams);
		    	
		    } else {
		    
		    //사용자	
		    rlist=reservice.getBookUser(pageParams);
		    	
		    }
		
		//예약목록 조회(5개 페이징)
//		for(ReservationDto dto : rlist) {
//			
//			String stday = dto.getBk_stday().replace(" ", "T");
//			dto.setBk_stday(stday);
//			
//			String edday = dto.getBk_edday().replace(" ", "T");
//			dto.setBk_edday(edday);
//			
//			String regday = dto.getBk_regdate().replace(" ", "T");
//			dto.setBk_regdate(regday);
//			
//			dto.setSessionEmp(empno);
//			
//			dto.setSessionauth(auth);
//			
//			if(!(dto.getBk_apday()==null)) {
//				
//				String apday = dto.getBk_apday().replace(" ", "T");
//				dto.setBk_apday(apday);
//			}
//			
//		}
		
		List<ReservationDto> allbooklist = new ArrayList<ReservationDto>();
		allbooklist = reservice.getAllBook(pageParams);
		
		//결과를 PagingDto에서 실행
//		paging.setContent(rlist);
		
		log.info("booklist 리스트 {}", rlist);
	    
		model.addAttribute("booklist", rlist);
		model.addAttribute("abooklist", allbooklist);
		
		
		
	    
	    return "facility";
		}
	}
}
