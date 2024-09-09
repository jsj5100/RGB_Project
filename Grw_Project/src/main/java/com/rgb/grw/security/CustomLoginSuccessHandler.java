package com.rgb.grw.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.bind.annotation.GetMapping;

import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IUserInfoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private IUserInfoService userInfoService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("login Success");

		List<String> roleNames = new ArrayList<String>();

		/*
		 * Spring Security의 Authentication 객체에서 사용자의 권한(authority) 정보를 추출하여 roleNames
		 * 리스트에 추가 authentication.getAuthorities()는 현재 사용자의 권한을 나타내는 컬렉션을 반환 ex) //
		 * ["ROLE_USER"],["ROLE_ADMIN"]
		 */
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		log.info("ROLE NAME : {}", roleNames);
		
		// 로그인한 사용자의 정보를 가져와서 세션에 저장
        String username = authentication.getName();  // 사용자 이름(ID)
        UserInfoDto loginDto = userInfoService.login(username);  // 사용자 정보 조회
        HttpSession session = request.getSession();
        session.setAttribute("loginDto", loginDto);  // 세션에 사용자 정보 저장

		// 권한사용은 안하지만 부여하여 사용 가능한 기능
//		// 시스템 관리자 로그인 시
//		if (roleNames.contains("SYSADMIN")) {
//			response.sendRedirect("./system.do");
//			return;
//		}
//
//		// 관리자 로그인 시
//		if (roleNames.contains("ADMIN")) {
//			response.sendRedirect("./admin.do");
//			return;
//		}
//
//		// 사용자 로그인 시
//		if (roleNames.contains("USER")) {
//			response.sendRedirect("./member.do");
//			return;
//		}

		response.sendRedirect("./home.do");
	}

}
