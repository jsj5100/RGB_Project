<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.rgb.grw.dto.UserInfoDto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>비밀번호 변경 페이지</title>
<link rel="stylesheet" href="./assets/plugins/global/plugins.bundle.css">
<link rel="stylesheet" href="./assets/css/styles.bundle.css">
<%@ include file="./lo_header.jsp"%>
</head>
<body id="kt_body" class="app-blank app-blank">
<script>var defaultThemeMode = "light"; var themeMode; if ( document.documentElement ) { if ( document.documentElement.hasAttribute("data-bs-theme-mode")) { themeMode = document.documentElement.getAttribute("data-bs-theme-mode"); } else { if ( localStorage.getItem("data-bs-theme") !== null ) { themeMode = localStorage.getItem("data-bs-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-bs-theme", themeMode); }</script>
	<div class="d-flex flex-column flex-root" id="kt_app_root">
		<div class="d-flex flex-column flex-lg-row flex-column-fluid">
			<!-- 왼쪽 레이아웃 -->
			<div
				class="d-flex flex-lg-row-fluid w-lg-50 bgi-size-cover bgi-position-center"
				style="background-image: url(./img/jsj1.jpg)">
				<!--begin::Content-->
				<div class="d-flex flex-column flex-center p-6 p-lg-10 w-100">
					<h1
						class="d-none d-lg-block text-white fs-2qx fw-bold text-center mb-7">GDJ_81
						RGB PROJECT</h1>
					<div class="d-none d-lg-block text-white fs-base text-center">
						조홍준, 명대홍, 양승, 김유진, 전성진</div>
				</div>
			</div>
			<!-- 오른쪽 레이아웃 -->
			<div class="d-flex flex-column flex-lg-row-fluid w-lg-50 p-10">
				<div class="d-flex flex-center flex-column flex-lg-row-fluid">
					<div class="w-lg-500px p-10">
						<form class="form w-100" novalidate="novalidate"
							id="kt_new_password_form">
							<div class="text-center mb-10">
								<h2 class="text-gray-900 fw-bolder mb-3">인증에 성공하셨습니다!</h2>
								<h1 class="text-gray-900 fw-bolder mb-3">비밀번호 변경</h1>
								<div class="text-gray-500 fw-semibold fs-6">
									비밀번호를 이미 재설정하셨나요 ? <a href="./loginServlet.do"
										class="link-primary fw-bold">로그인</a>
								</div>
							</div>
							<div class="fv-row mb-8" data-kt-password-meter="true">
								<div class="mb-1">
									<div class="position-relative mb-3">
										<input class="form-control bg-transparent" type="password"
											placeholder="비밀번호" name="emp_password" autocomplete="off" />
										<span
											class="btn btn-sm btn-icon position-absolute translate-middle top-50 end-0 me-n2"
											data-kt-password-meter-control="visibility"> <i
											class="ki-duotone ki-eye-slash fs-2"></i> <i
											class="ki-duotone ki-eye fs-2 d-none"></i>
										</span>
									</div>
									<div class="d-flex align-items-center mb-3"
										data-kt-password-meter-control="highlight">
										<div
											class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
										<div
											class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
										<div
											class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
										<div
											class="flex-grow-1 bg-secondary bg-active-success rounded h-5px"></div>
									</div>
								</div>
								<div class="text-muted">비밀번호는 영문, 숫자, 특수문자를 포함하여 8자리 이상이어야
									합니다.</div>
							</div>
							<div class="fv-row mb-8">
								<input type="password" placeholder="비밀번호 확인"
									name="confirm_password" autocomplete="off"
									class="form-control bg-transparent" />
							</div>
							<div class="fv-row mb-8">
								<label class="form-check form-check-inline"> <input
									class="form-check-input" type="checkbox" name="toc" value="1" />
									<span
									class="form-check-label fw-semibold text-gray-700 fs-6 ms-1">동의합니다
										&amp; <a href="#" class="ms-1 link-primary">조건 및 약관</a>.
								</span>
								</label>
							</div>
							<div class="d-grid mb-10">
								<button type="submit" id="kt_new_password_submit"
									class="btn btn-primary">
									<span class="indicator-label">확인</span> <span
										class="indicator-progress">잠시만 기다려 주세요... <span
										class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
								</button>
							</div>
							<!-- CSRF 토큰을 JSP 페이지에 명시적으로 삽입 -->
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}">
							<!-- emp_no를 hidden 필드로 추가 -->
							<input type="hidden" name="emp_no" value="${sessionScope.emp_no}">
						</form>
					</div>
				</div>
				<%@ include file="./lo_footer.jsp"%>
			</div>
		</div>
	</div>
	<script src="./js/new-password_jsj.js"></script>
</body>
</html>
