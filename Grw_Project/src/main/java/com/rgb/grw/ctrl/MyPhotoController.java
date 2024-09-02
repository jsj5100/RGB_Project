package com.rgb.grw.ctrl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.rgb.grw.dto.MyPageDto;
import com.rgb.grw.dto.UserInfoDto;
import com.rgb.grw.service.IMyPageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MyPhotoController {

	@Autowired
	private IMyPageService myPageService;

	// 파일 업로드 일반방식
	@PostMapping(value = "/upload.do")
	public String fileupload(HttpServletRequest request, Model model, @RequestParam List<MultipartFile> file,
			String desc) {
		log.info("fileupload 파일 사이즈 : {}", file.size());
		log.info("전송 form요소 text : {}", desc);

		for (MultipartFile f : file) {
			log.info("파일의 이름 : {}", f.getOriginalFilename());
			String originFileName = f.getOriginalFilename();
			String saveFileName;

			if (originFileName != null && originFileName.contains(".")) {
				saveFileName = UUID.randomUUID().toString()
						.concat(originFileName.substring(originFileName.indexOf(".")));
			} else {
				saveFileName = UUID.randomUUID().toString();
			}

			log.info("기존 파일명 : {}", originFileName);
			log.info("저장 파일명 : {}", saveFileName);

			InputStream inputStream = null;
			OutputStream outputStream = null;
			String path = "";

			try {
				// 1. 파일을 읽는다
				inputStream = f.getInputStream();

				// 2) 저장 위치를 만든다
				path = WebUtils.getRealPath(request.getSession().getServletContext(), "/JSJ/storage");
				log.info("저장경로 path : {}", path);

				// 3) 파일 저장 위치
				File storage = new File(path);
				if (!storage.exists()) {
					storage.mkdirs();
				}

				// 4) 저장 파일
				File newFile = new File(path + "/" + saveFileName);
				if (!newFile.exists()) {
					newFile.createNewFile();
				}

				// 5) 읽은 파일을 써주기(저장)
				outputStream = new FileOutputStream(newFile);

				// 6) 파일을 읽어서 대상파일에 써줌
				int read = 0;
				byte[] b = new byte[(int) f.getSize()];
				while ((read = inputStream.read(b)) != -1) {
					outputStream.write(b, 0, read);
				}

			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (inputStream != null) {
						inputStream.close();
					}
					if (outputStream != null) {
						outputStream.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			model.addAttribute("originFileName", originFileName);
			model.addAttribute("saveFileName", saveFileName);
			model.addAttribute("path", path);
		}

		return "uploadFile";
	}

	// 파일 업로드 Ajax방식
	@PostMapping(value = "/uploadAjax.do", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map<String, String>> fileUploadAjax(HttpServletRequest request,
			@RequestParam List<MultipartFile> file, String desc) throws FileNotFoundException {
		log.info("fileUploadAjax 파일 업로드");
		Map<String, String> map = new HashMap<>();
		map.put("isc", "true");

		HttpSession session = request.getSession();
		UserInfoDto loginDto = (UserInfoDto) session.getAttribute("loginDto");

		String emp_no = loginDto.getEmp_no();
		MyPageDto myPageDto = myPageService.getMyPageInfo(emp_no);

		for (MultipartFile f : file) {
			log.info("파일의 이름 : {}", f.getOriginalFilename());
			String originFileName = f.getOriginalFilename();
			String saveFileName;

			if (originFileName != null && originFileName.contains(".")) {
				saveFileName = UUID.randomUUID().toString()
						.concat(originFileName.substring(originFileName.indexOf(".")));
			} else {
				saveFileName = UUID.randomUUID().toString();
			}

			log.info("기존 파일명 : {}", originFileName);
			log.info("저장 파일명 : {}", saveFileName);

			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/JSJ/profile/" + emp_no);
			log.info("저장경로 path : {}", path);

			File storage = new File(path);
			if (!storage.exists()) {
				storage.mkdirs();
			}

			File newFile = new File(path + "/" + saveFileName);
			try (InputStream inputStream = f.getInputStream();
					OutputStream outputStream = new FileOutputStream(newFile)) {

				int read = 0;
				byte[] b = new byte[(int) f.getSize()];
				while ((read = inputStream.read(b)) != -1) {
					outputStream.write(b, 0, read);
				}

				// 이미지 데이터를 byte[]로 변환하여 저장
				byte[] imageBytes = f.getBytes();
				myPageDto.setEmp_photo(imageBytes); // 이 부분에서 byte[] 데이터를 설정

				// 서비스나 DAO를 통해 데이터베이스에 myPageDto를 저장
				myPageService.updateUserProfile(myPageDto);

			} catch (IOException e) {
				e.printStackTrace();
				map.put("isc", "false");
			}
		}

		return new ResponseEntity<>(map, HttpStatus.OK);
	}

}
