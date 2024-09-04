package com.rgb.grw.ctrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rgb.grw.dto.PagingDto;
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
	
	/**
	 * 전체 예약목록을 조회 페이징 처리하여 관리자 조회
	 * @param session HTTP 세션에서 관리자 권한과 empno를 받아옴
	 * @param startDate 시작날짜
	 * @param endDate 끝 날짜
	 * @param page 현재 페이지
	 * @param countList 페이지당 게시글 수 
	 * @return 페이징된 예약 목록
	 */
	@GetMapping(value="/booklist/facility.do")
	public PagingDto<ReservationDto> booklist (HttpSession session, @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate
			,@RequestParam(defaultValue="1") int page, @RequestParam(defaultValue="5") int countList) {
		log.info("start Date:{}", startDate);
	    // 세션에서 loginDto 가져오기
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    
	    String sessionEmp = loginDto.getEmp_no();
	    String sessionauth = loginDto.getAuth_no();
	    log.info("sessionEmp: {}", sessionEmp);
	    
	    //페이징 파라미터 설정
	    Map<String, Object> pageParams = new HashMap<String, Object>();
	    pageParams.put("page", page);
	    pageParams.put("countList", countList);
	    pageParams.put("startDate", startDate);
	    pageParams.put("endDate", endDate);
	    pageParams.put("bk_empno", sessionEmp);
	    log.info("Page value: {}", page);
	    int totalCount;
	    
	    //세션 auth 값으로 관리자 사용자의 총 예약글 수 분리
	    
	    if(sessionauth.equals("FC00A")) {
	    	
	    	//전체 예약 수 조회
	    	totalCount=service.countBook(pageParams);
	    	
	    } else {
	    	
	    	//사용자 예약게시글 만큼만 조회
	    	totalCount = service.countBookUser(pageParams);
	    	
	    }
	    
	    //페이징 정보 생성
	    PagingDto<ReservationDto> paging = new PagingDto<ReservationDto>(page, countList, totalCount, page);
	    
		Map<String, Object> bmap = new HashMap<String, Object>();
		bmap.put("first", (page-1)*countList+1);
		bmap.put("last", page*countList);
		bmap.put("startDate", startDate);
		bmap.put("endDate", endDate);
		bmap.put("bk_empno", sessionEmp);
		
		log.info("GetMapping 매핑 실행{}", bmap);
	    
	    
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		
		if(sessionauth.equals("FC00A")) {
			//예약목록 조회(관리자)
			list =service.getBook(bmap);
		    	
		    } else {
		    
		    //사용자	
		    list=service.getBookUser(bmap);
		    	
		    }
		
		//예약목록 조회
		
		
		for(ReservationDto dto : list) {
			
			String stday = dto.getBk_stday().replace(" ", "T");
			dto.setBk_stday(stday);
			
			String edday = dto.getBk_edday().replace(" ", "T");
			dto.setBk_edday(edday);
			
			String regday = dto.getBk_regdate().replace(" ", "T");
			dto.setBk_regdate(regday);
			
			dto.setSessionEmp(sessionEmp);
			
			dto.setSessionauth(sessionauth);
			
			if(!(dto.getBk_apday()==null)) {
				
				String apday = dto.getBk_apday().replace(" ", "T");
				dto.setBk_apday(apday);
			}
			
		}
		
		//결과를 PagingDto에서 실행
		paging.setContent(list);
		
		log.info("booklist 리스트 {}", list);
		
		return paging;
	}
	
	
	/**
	 * 페이징 처리없이 날짜값만으로 예약전체정보가져오기
	 * @param session empno 값 받기
	 * @param startDate 오늘
	 * @param endDate 12일 후
	 * @return
	 */
	@GetMapping(value="/bookalllist/facility.do")
	public List<ReservationDto> bookalllist (HttpSession session, @RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
		
	    // 세션에서 loginDto 가져오기
	    UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
	    
	    String sessionEmp = loginDto.getEmp_no();
	    String sessionauth = loginDto.getAuth_no();
	    log.info("sessionEmp: {}", sessionEmp);
	    
	   
		Map<String, Object> bmap = new HashMap<String, Object>();
		bmap.put("startDate", startDate);
		bmap.put("endDate", endDate);
		
		log.info("GetAMapping 매핑 실행{}", bmap);
		
		//예약목록 조회
		List<ReservationDto> list = service.getAllBook(bmap);
		
		
		for(ReservationDto dto : list) {
			
			String stday = dto.getBk_stday().replace(" ", "T");
			dto.setBk_stday(stday);
			
			String edday = dto.getBk_edday().replace(" ", "T");
			dto.setBk_edday(edday);
			
			String regday = dto.getBk_regdate().replace(" ", "T");
			dto.setBk_regdate(regday);
			
			dto.setSessionEmp(sessionEmp);
			
			dto.setSessionauth(sessionauth);
			
			if(!(dto.getBk_apday()==null)) {
				
				String apday = dto.getBk_apday().replace(" ", "T");
				dto.setBk_apday(apday);
			}
			
		}
		
		log.info("전체 일정 리스트 {}", list);
		
		return list;
	}
	
	/**
	 * 자산예약신청하기
	 * @param map (fc_no,bk_empno,bk_title,bk_content,bk_stday,bk_edday,bk_name,bk_dep)
	 * @return 성공하면 true 실패하면 false
	 */
	@PostMapping(value="/addreservation/facility.do")
	public boolean insertReservation(HttpSession session, @RequestBody Map<String, Object>map) {
		
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");
		
		String bk_empno = loginDto.getEmp_no();
		String bk_name = loginDto.getEmp_name();
		String bk_dep = loginDto.getDep_no();
		
		Map<String, Object> rmap = new HashMap<String, Object>();
		
		rmap.put("bk_empno", bk_empno);
		rmap.put("bk_name", bk_name);
		rmap.put("bk_dep", bk_dep);
		rmap.put("fc_no", map.get("fc_no"));
		rmap.put("bk_content", map.get("bk_content"));
		rmap.put("bk_title", map.get("bk_title"));
		rmap.put("bk_stday", map.get("bk_stday"));
		rmap.put("bk_edday", map.get("bk_edday"));
		
		
		System.out.println(rmap);
		
		
		
		return service.insertReservation(rmap);
	}
}



