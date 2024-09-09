package com.rgb.grw.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rgb.grw.dto.DeptDto;
import com.rgb.grw.dto.EmpDto;
import com.rgb.grw.service.IEmpService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmpController {

	@Autowired
	private IEmpService service;
	
	//사원리스트
	@GetMapping(value="empList.do")
	public String empList(Model model) {
		List<EmpDto> EmpList = service.EmpList();
		model.addAttribute("EmpList", EmpList);
		log.info("Emp 리스트받기");
		return "empList";
	}
	

	//사원상세 -> 수정페이지(?)
	@GetMapping(value="userView.do")
	public String userView() {
		log.info("유저상세조회 이동");
		return "userView";
	}
	
	
	
	//트리 부서리스트
	@GetMapping(value="treeDept.do")
	@ResponseBody
	public List<DeptDto> treeDept(Model model) {
		List<DeptDto> treeDept = service.treeDept();
		log.info("트리 부서리스트");
		return treeDept;
	}
	
	@GetMapping(value="selectDept.do")
	@ResponseBody
	//트리 사원리스트
	public List<EmpDto> selectDept(EmpDto dto){
		return service.selectDept(dto);
	}
		
	
	
	
	//사원등록
//	@PostMapping(value="/addEmp.do")
//	public String addEmp(EmpDto dto, HttpServletRequest request) {
//		log.info("사원등록 완료");
//		int n = 0;
//		if( n== 1) {
//			return "redirect:/empList.do";
//		}else {
//			return null; 
//		}
//	}
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@PostMapping(value = "addEmp.do")
    public String insertDept(HttpSession session, @RequestParam Map<String, Object> map) {
        log.info("사원등록 완료");

        Map<String, Object> dtoMap = new HashMap<String, Object>();

        // 비밀번호 암호화
        String rawPassword = (String) map.get("userPw");
        String encodedPassword = passwordEncoder.encode(rawPassword);

        dtoMap.put("empName", map.get("userName"));
        dtoMap.put("empNo", map.get("userNo"));
        dtoMap.put("empPw", encodedPassword); // 암호화된 비밀번호 저장
        dtoMap.put("empEmail", map.get("userEmail"));
        dtoMap.put("depName", map.get("deptSelect"));
        dtoMap.put("empIdno", map.get("userIdnum"));
        dtoMap.put("empGender", map.get("userGender"));
        dtoMap.put("empJoin", map.get("userJoin"));
        dtoMap.put("empTier", map.get("userTier"));
        dtoMap.put("empAuth", map.get("userAuth"));
        dtoMap.put("empState", map.get("userState"));

        int n = service.insertEmp(dtoMap);

        return "redirect:empList.do";
    }
	
	
	
}



