package com.rgb.grw.ctrl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	@PostMapping(value = "/mailSender.do")
	public String mailSender(@RequestParam Map<String, String> mailMap) {
		log.info("mailSender.do 요청 값 : {}", mailMap);

		String email = mailMap.get("email");
		String name = mailMap.get("name");
		String empNo = mailMap.get("emp_no");

		if (email == null || email.isEmpty() || name == null || name.isEmpty() || empNo == null || empNo.isEmpty()) {
			log.info("이메일, 이름 또는 사원번호가 제공되지 않았습니다.");
			return "login/find_password";
		}

		// 사용자 정보 검증
		Map<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("name", name);
		params.put("emp_no", empNo);

		// 자신의 메일 주소가 필수적으로 입력
		String setForm = "springjsj@naver.com";

		// 메일 내용을 전송하기 위한 객체 MimeMessage
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setFrom(setForm);
			helper.setTo(email);
			helper.setSubject("비밀번호 재설정 인증코드");

			// 랜덤변수_인증코드 6자리 처리
			Random random = new Random();
			int randomNumber = 100000 + random.nextInt(900000);
			String authCode = String.valueOf(randomNumber);
			log.info("생성된 인증코드: {}", authCode);

			// 메일 내용에 인증코드를 추가하여 설정
			String mailContent = "아래의 인증코드를 입력하여 비밀번호 재설정을 완료하세요.<br><br>인증코드: " + authCode;
			helper.setText(mailContent, true);

			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}

		return "login/find_password";
	}
}
