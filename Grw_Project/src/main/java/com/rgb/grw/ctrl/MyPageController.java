package com.rgb.grw.ctrl;

import com.rgb.grw.dto.MyPageDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IMyPageService;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@Slf4j
@Controller
public class MyPageController {

	@Autowired
	private IMyPageService myPageService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 마이페이지로 이동
	@GetMapping("/myPage.do")
	public String myPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");

		if (loginDto == null) {
			return "redirect:/loginServlet.do"; // 로그인되어 있지 않은 경우 로그인 페이지로 리다이렉트
		}

		String emp_no = loginDto.getEmp_no();
		MyPageDto myPageDto = myPageService.getMyPageInfo(emp_no);
		List<MyPageDto> optionsList = myPageService.getOptions();

		if (myPageDto != null) {
			if (myPageDto.getEmp_photo() != null) {
				// Convert byte array to Base64 string using commons-codec
				String base64Image = Base64.encodeBase64String(myPageDto.getEmp_photo());
				String Emp_photo_url = "data:image/png;base64," + base64Image;
				myPageDto.setEmp_photo_url(Emp_photo_url);
			}
			model.addAttribute("myPageDto", myPageDto);
			model.addAttribute("optionsList", optionsList);
		} else {
			model.addAttribute("error", "잘못된 사원정보입니다.");
		}

		return "/myPage";
	}

	// 마이페이지 수정으로 이동
	@GetMapping("/myPageEdit.do")
	public String myPageEdit(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");

		if (loginDto == null) {
			return "redirect:/loginServlet.do"; // 로그인되어 있지 않은 경우 로그인 페이지로 리다이렉트
		}

		String emp_no = loginDto.getEmp_no();
		MyPageDto myPageDto = myPageService.getMyPageInfo(emp_no);
		List<MyPageDto> optionsList = myPageService.getOptions();

		if (myPageDto != null) {
			if (myPageDto.getEmp_photo() != null) {
				// Convert byte array to Base64 string using commons-codec
				String base64Image = Base64.encodeBase64String(myPageDto.getEmp_photo());
				String Emp_photo_url = "data:image/png;base64," + base64Image;
				myPageDto.setEmp_photo_url(Emp_photo_url);
			}
			model.addAttribute("myPageDto", myPageDto);
			model.addAttribute("optionsList", optionsList);
		} else {
			model.addAttribute("error", "잘못된 사원정보입니다.");
		}

		return "/myPageEdit";
	}

	// 마이페이지 관리자 수정으로 이동
	@GetMapping("/empPageEdit.do")
	public String empPageEdit(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");

		if (loginDto == null) {
			return "redirect:/loginServlet.do"; // 로그인되어 있지 않은 경우 로그인 페이지로 리다이렉트
		}

		String emp_no = loginDto.getEmp_no();
		MyPageDto myPageDto = myPageService.getMyPageInfo(emp_no);
		List<MyPageDto> optionsList = myPageService.getOptions();

		if (myPageDto != null) {
			if (myPageDto.getEmp_photo() != null) {
				// Convert byte array to Base64 string using commons-codec
				String base64Image = Base64.encodeBase64String(myPageDto.getEmp_photo());
				String Emp_photo_url = "data:image/png;base64," + base64Image;
				myPageDto.setEmp_photo_url(Emp_photo_url);
			}
			model.addAttribute("myPageDto", myPageDto);
			model.addAttribute("optionsList", optionsList);
		} else {
			model.addAttribute("error", "잘못된 사원정보입니다.");
		}

		return "/empPageEdit";
	}

	// 사용자 수정 컨트롤러
	@PostMapping("/updateMyPage.do")
	public String updateMyPage(@RequestParam("emp_no") String emp_no, @RequestParam("tier_no") String tier_no,
			@RequestParam("dep_no") String dep_no, @RequestParam("auth_no") String auth_no,
			@RequestParam("emp_password") String emp_password, @RequestParam("emp_phone") String emp_phone,
			@RequestParam("emp_email") String emp_email, @RequestParam("emp_state") String emp_state,
			@RequestParam(value = "emp_photo", required = false) MultipartFile emp_photo, HttpServletRequest request,
			Model model) {

		// 사용자 정보 업데이트
		MyPageDto myPageDto = new MyPageDto();
		myPageDto.setEmp_no(emp_no);
		myPageDto.setTier_no(tier_no);
		myPageDto.setDep_no(dep_no);
		myPageDto.setAuth_no(auth_no);
		myPageDto.setEmp_password(passwordEncoder.encode(emp_password)); // 비밀번호 암호화
		myPageDto.setEmp_phone(emp_phone);
		myPageDto.setEmp_email(emp_email);
		myPageDto.setEmp_state(emp_state);

		int updateResult = myPageService.updateEmp(myPageDto);

		if (updateResult == 1) {
			model.addAttribute("success", "정보가 성공적으로 업데이트되었습니다.");
		} else {
			model.addAttribute("error", "정보 업데이트에 실패했습니다.");
		}

		// 파일이 업로드된 경우
		if (emp_photo != null && !emp_photo.isEmpty()) {
			try {
				// 새 이미지가 있는 경우 이미지 저장 처리
				byte[] imageBytes = emp_photo.getBytes();
				myPageDto.setEmp_photo(imageBytes); // 새로운 이미지 설정
			} catch (IOException e) {
				e.printStackTrace();
				model.addAttribute("error", "프로필 사진 업로드에 실패했습니다.");
				return "redirect:/myPage"; // 오류 발생 시 리다이렉트 처리
			}
		} else {
			// 이미지가 업로드되지 않은 경우 기존 이미지 유지
			myPageDto.setEmp_photo(myPageDto.getEmp_photo());
		}

		// 사용자 정보를 다시 불러와서 모델에 추가
		MyPageDto updatedDto = myPageService.getMyPageInfo(emp_no);
		if (updatedDto.getEmp_photo() != null) {
			String base64Image = Base64.encodeBase64String(updatedDto.getEmp_photo());
			String empPhotoUrl = "data:image/png;base64," + base64Image;
			updatedDto.setEmp_photo_url(empPhotoUrl);
		}
		List<MyPageDto> optionsList = myPageService.getOptions();

		model.addAttribute("myPageDto", updatedDto);
		model.addAttribute("optionsList", optionsList);

		return "redirect:/myPage.do";
	}

	// 관리자 수정 컨트롤러
	@PostMapping("/updateEmpMyPage.do")
	public String updateEmpMyPage(@RequestParam("emp_no") String emp_no, @RequestParam("tier_no") String tier_no,
			@RequestParam("dep_no") String dep_no, @RequestParam("auth_no") String auth_no,
			@RequestParam("emp_password") String emp_password, @RequestParam("emp_phone") String emp_phone,
			@RequestParam("emp_email") String emp_email, @RequestParam("emp_state") String emp_state,
			@RequestParam(value = "emp_photo", required = false) MultipartFile emp_photo, HttpServletRequest request,
			Model model) {

		// MyPageDto 객체 생성 및 값 설정
		MyPageDto myPageDto = new MyPageDto();
		myPageDto.setEmp_no(emp_no);
		myPageDto.setTier_no(tier_no);
		myPageDto.setDep_no(dep_no);
		myPageDto.setAuth_no(auth_no);
		myPageDto.setEmp_password(passwordEncoder.encode(emp_password)); // 비밀번호 암호화
		myPageDto.setEmp_phone(emp_phone);
		myPageDto.setEmp_email(emp_email);
		myPageDto.setEmp_state(emp_state);

		int updateResult = myPageService.updateEmp(myPageDto);

		if (updateResult == 1) {
			model.addAttribute("success", "정보가 성공적으로 업데이트되었습니다.");
		} else {
			model.addAttribute("error", "정보 업데이트에 실패했습니다.");
		}

		// 파일이 업로드된 경우
		if (emp_photo != null && !emp_photo.isEmpty()) {
			try {
				// 새 이미지가 있는 경우 이미지 저장 처리
				byte[] imageBytes = emp_photo.getBytes();
				myPageDto.setEmp_photo(imageBytes); // 새로운 이미지 설정
			} catch (IOException e) {
				e.printStackTrace();
				model.addAttribute("error", "프로필 사진 업로드에 실패했습니다.");
				return "redirect:/myPage"; // 오류 발생 시 리다이렉트 처리
			}
		} else {
			// 이미지가 업로드되지 않은 경우 기존 이미지 유지
			myPageDto.setEmp_photo(myPageDto.getEmp_photo());
		}

		// 사용자 정보를 다시 불러와서 모델에 추가
		MyPageDto updatedDto = myPageService.getMyPageInfo(emp_no);
		if (updatedDto.getEmp_photo() != null) {
			String base64Image = Base64.encodeBase64String(updatedDto.getEmp_photo());
			String empPhotoUrl = "data:image/png;base64," + base64Image;
			updatedDto.setEmp_photo_url(empPhotoUrl);
		}
		List<MyPageDto> optionsList = myPageService.getOptions();

		model.addAttribute("myPageDto", updatedDto);
		model.addAttribute("optionsList", optionsList);

		return "redirect:/myPage.do";
	}
}
