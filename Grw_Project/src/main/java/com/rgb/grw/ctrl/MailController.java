package com.rgb.grw.ctrl;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IUserInfoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MailController {

	// 메일 라이브러리
	@Autowired
	private JavaMailSender mailSender;

	// 메일보내는 쿼리 가져오기
	@Autowired
	private IUserInfoService userInfoService;

	// 인증 코드와 만료 시간을 저장할 ConcurrentHashMap
	private final ConcurrentHashMap<String, AuthCodeInfo> authCodes = new ConcurrentHashMap<>();

	@PostMapping(value = "/mailSender.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> mailSender(@RequestParam Map<String, String> mailMap, HttpSession session) {
		log.info("mailSender.do 요청 값 : {}", mailMap);

		String email = mailMap.get("email");
		String name = mailMap.get("name");
		String empNo = mailMap.get("emp_no");

		Map<String, Object> response = new HashMap<>();

		if (email == null || email.isEmpty()) {
			log.info("이메일이 제공되지 않았습니다.");
			response.put("success", false);
			response.put("message", "이메일이 제공되지 않았습니다.");
			return response;
		}

		if (name == null || name.isEmpty()) {
			log.info("이름이 제공되지 않았습니다.");
			response.put("success", false);
			response.put("message", "이름이 제공되지 않았습니다.");
			return response;
		}

		if (empNo == null || empNo.isEmpty()) {
			log.info("사원번호가 제공되지 않았습니다.");
			response.put("success", false);
			response.put("message", "사원번호가 제공되지 않았습니다.");
			return response;
		}

		// 사용자 정보 검증
		Map<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("name", name);
		params.put("emp_no", empNo);

		UserInfoDto user = userInfoService.validateUser(params);
		if (user == null) {
			log.info("검증 실패: 사용자 정보가 일치하지 않습니다.");
			response.put("success", false);
			response.put("message", "사용자 정보가 일치하지 않습니다. (이메일, 이름, 사원번호 중 하나 이상이 일치하지 않음)");
			return response;
		}

		// 메일 발송 및 인증 코드 생성
		String setForm = "springjsj@naver.com";
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setForm);
			helper.setTo(email);
			helper.setSubject("SpringMVC_Project_전성진_메일전송 비밀번호 재설정 인증코드 테스트");

			// 랜덤 인증 코드 생성
			Random random = new Random();
			int randomNumber = 100000 + random.nextInt(900000);
			String authCode = String.valueOf(randomNumber);
			log.info("생성된 인증코드: {}", authCode);

			// 메일 내용에 인증코드를 추가하여 설정
			String mailContent = "아래의 인증코드를 입력하여 비밀번호 재설정을 완료하세요.<br><br><strong><span style='font-size:18px;'>인증코드 : "
					+ authCode + "</span></strong>";
			helper.setText(mailContent, true);

			mailSender.send(message);

			// 인증 코드와 만료 시간을 저장
			authCodes.put(email, new AuthCodeInfo(authCode, LocalDateTime.now().plus(5, ChronoUnit.MINUTES)));

			response.put("success", true);
			response.put("message", "인증 메일이 전송되었습니다.");

		} catch (MessagingException e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "인증 메일 전송에 실패했습니다.");
		}

		return response;
	}

	@PostMapping(value = "/verifyAuthCode.do")
	public String verifyAuthCode(@RequestParam String email, @RequestParam String authCode, Model model) {
		AuthCodeInfo info = authCodes.get(email);
		if (info == null) {
			return "login/find_password?error=invalid_email";
		}
		if (!info.getAuthCode().equals(authCode)) {
			return "login/find_password?error=invalid_code";
		}
		if (LocalDateTime.now().isAfter(info.getExpiryTime())) {
			return "login/find_password?error=expired_code";
		}
		// 인증 성공 후 비밀번호 변경 페이지로 리다이렉트
		return "redirect:/passwordChange.do";
	}

	private static class AuthCodeInfo {
		private final String authCode;
		private final LocalDateTime expiryTime;

		public AuthCodeInfo(String authCode, LocalDateTime expiryTime) {
			this.authCode = authCode;
			this.expiryTime = expiryTime;
		}

		public String getAuthCode() {
			return authCode;
		}

		public LocalDateTime getExpiryTime() {
			return expiryTime;
		}
	}
}
