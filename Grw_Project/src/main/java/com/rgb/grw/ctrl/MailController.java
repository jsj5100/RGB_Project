package com.rgb.grw.ctrl;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IUserInfoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private IUserInfoService userInfoService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 인증코드 전송 내용
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

	private final ConcurrentHashMap<String, AuthCodeInfo> authCodes = new ConcurrentHashMap<>();

	// 이메일 전송 컨트롤러
	@PostMapping(value = "/mailSender.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> mailSender(@RequestParam Map<String, String> mailMap, HttpSession session) {
		log.info("Received mailSender.do request with parameters: {}", mailMap);

		String emp_email = mailMap.get("emp_email");
		String emp_name = mailMap.get("emp_name");
		String emp_no = mailMap.get("emp_no");

		Map<String, Object> response = new HashMap<>();

		if (emp_email == null || emp_email.isEmpty()) {
			log.warn("Email is missing.");
			response.put("success", false);
			response.put("message", "이메일이 제공되지 않았습니다.");
			return response;
		}

		if (emp_name == null || emp_name.isEmpty()) {
			log.warn("Name is missing.");
			response.put("success", false);
			response.put("message", "이름이 제공되지 않았습니다.");
			return response;
		}

		if (emp_no == null || emp_no.isEmpty()) {
			log.warn("Employee number is missing.");
			response.put("success", false);
			response.put("message", "사원번호가 제공되지 않았습니다.");
			return response;
		}

		Map<String, Object> params = new HashMap<>();
		params.put("emp_email", emp_email);
		params.put("emp_name", emp_name);
		params.put("emp_no", emp_no);

		UserInfoDto user = userInfoService.validateUser(params);
		if (user == null) {
			log.warn("User validation failed for email: {}", emp_email);
			response.put("success", false);
			response.put("message", "사용자 정보가 일치하지 않습니다.");
			return response;
		}
		log.info("Received mailSender.do request with parameters: {}", mailMap);

		String setFrom = "springjsj@naver.com";
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setFrom);
			helper.setTo(emp_email);
			helper.setSubject("비밀번호 재설정 인증코드");

			Random random = new Random();
			int randomNumber = 100000 + random.nextInt(900000);
			String authCode = String.valueOf(randomNumber);
			log.info("Generated authentication code: {}", authCode);

			String mailContent = "아래의 인증코드를 입력하여 비밀번호 재설정을 완료하세요.<br><br><strong><span style='font-size:18px;'>인증코드 : "
					+ authCode + "</span></strong>";
			helper.setText(mailContent, true);

			mailSender.send(message);

			authCodes.put(emp_email, new AuthCodeInfo(authCode, LocalDateTime.now().plus(5, ChronoUnit.MINUTES)));

			// 이메일 전송에 성공하면 emp_no를 세션에 저장
			session.setAttribute("emp_no", emp_no);
			log.info("Stored emp_no in session: {}", emp_no);

			response.put("success", true);
			response.put("message", "인증 메일이 전송되었습니다.");
		} catch (MessagingException e) {
			log.error("Failed to send authentication email.", e);
			response.put("success", false);
			response.put("message", "인증 메일 전송에 실패했습니다.");
		}

		return response;
	}

	// 인증코드 인증 컨트롤러
	@PostMapping(value = "/verifyAuthCode.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> verifyAuthCode(@RequestParam String email, @RequestParam String authCode,
			@RequestParam String emp_no, HttpServletRequest request) {
		Map<String, Object> response = new HashMap<>();
		AuthCodeInfo info = authCodes.get(email);

		// 인증 코드가 이메일에 등록되지 않았을 때
		if (info == null) {
			log.warn("No authentication code found for email: {}", email);
			response.put("success", false);
			response.put("message", "이메일이 등록되지 않았습니다.");
			return response;
		}

		// 인증 코드가 일치하지 않을 때
		if (!info.getAuthCode().equals(authCode)) {
			log.warn("Invalid authentication code for email: {}", email);
			response.put("success", false);
			response.put("message", "인증 코드가 올바르지 않습니다.");
			return response;
		}

		// 인증 코드가 만료되었을 때
		if (LocalDateTime.now().isAfter(info.getExpiryTime())) {
			log.warn("Authentication code expired for email: {}", email);
			response.put("success", false);
			response.put("message", "인증 코드가 만료되었습니다.");
			return response;
		}

		// 인증 성공 시, emp_no를 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("emp_no", emp_no); // 세션에 emp_no 저장

		// 성공 메시지 및 리다이렉션 경로 설정
		response.put("success", true);
		response.put("redirect", request.getContextPath() + "/passwordChange.do");
		return response;
	}

	// 비밀번호 변경 컨트롤러
	@PostMapping(value = "/changePassword.do", produces = "application/json")
	@ResponseBody
	public Map<String, Object> changePassword(@RequestBody Map<String, String> requestBody,
			HttpServletRequest request) {
		Map<String, Object> response = new HashMap<>();

		// Extract data from the request body
		String emp_password = requestBody.get("emp_password");
		String emp_no = requestBody.get("emp_no");

		// 사원번호 세션이 없다면
		if (emp_password == null || emp_no == null) {
			response.put("success", false);
			response.put("message", "사원번호 세션이 잘못되었습니다.");
			return response;
		}

		// 비밀번호 양식 설정
		if (emp_password.length() < 4) {
			response.put("success", false);
			response.put("message", "비밀번호는 최소 6자리 이상이어야 합니다.");
			return response;
		}

		// 비밀번호 암호화(시큐리티 사용)
		String encryptedPassword = passwordEncoder.encode(emp_password);

		// 변경 데이터 준비
		Map<String, Object> map = new HashMap<>();
		map.put("emp_no", emp_no);
		map.put("emp_password", encryptedPassword);

		// 비밀번호 업데이트 서비스 호출
		int isUpdated = userInfoService.updatePw(map);

		// 비밀번호 업데이트 성공 여부 확인
		if (isUpdated > 0) {
			// 성공 응답
			response.put("success", true);
			response.put("message", "비밀번호가 성공적으로 변경되었습니다.");
			response.put("redirect", request.getContextPath() + "/loginServlet.do");
		} else {
			// 실패 응답
			response.put("success", false);
			response.put("message", "비밀번호 변경에 실패했습니다. 사원번호 세션이 잘못되었습니다.");
		}

		return response;
	}

	// 관리자에게 이메일 보내기 문의
	@GetMapping(value = "/mailForm.do")
	public String mailForm() {
		return "login/mailForm";
	}

	// 관리자에게 이메일 보내기 문의내용 작성
	@PostMapping(value = "/fmailSender.do")
	public String mailSender(@RequestParam Map<String, String> mailMap, Model model) {
		log.info("fmailSender.do 요청 값 : {}", mailMap);

		String setForm = "springjsj@naver.com";
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setForm);
			helper.setTo(mailMap.get("email"));
			helper.setSubject(mailMap.get("title"));
			helper.setEncodeFilenames(true);
			helper.setText(mailMap.get("content"), true);

			mailSender.send(message);
			return "redirect:/mailForm.do?status=success";
		} catch (MessagingException e) {
			e.printStackTrace();
			return "redirect:/mailForm.do?status=error";
		}
	}

}
