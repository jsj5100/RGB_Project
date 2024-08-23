package com.rgb.grw.ctrl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IUserInfoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {

	@Autowired
	private IUserInfoService service;

	@PostMapping(value = "/loginServlet.do")
	public String login(@RequestParam Map<String, Object> map, HttpServletRequest request) {
		log.info("로그인 시도: {}", map);

		// 서비스 호출하여 로그인 시도
		UserInfoDto loginDto = service.login(map);

		// 로그인 성공 여부 확인
		if (loginDto != null && loginDto.getEmp_no() != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginDto", loginDto);
			return "redirect:/home.do"; //성공시 메인페이지
		} else {
			request.setAttribute("loginError", "사원번호나 비밀번호가 틀렸습니다.");
			return "login/login"; // 실패시 로그인 페이지
		}
	}

	@GetMapping(value = "/loginServlet.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "login/login";
	}
}
