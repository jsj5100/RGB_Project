<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>인증번호 요청페이지</title>
		<link href="./css/password/password.css" rel="stylesheet" type="text/css" />
	</head>
	<%@ include file="./lo_header.jsp"%>
	<!--begin::Body-->
	<body id="kt_body" class="app-blank app-blank">
		<!--begin::Theme mode setup on page load-->
		<script>var defaultThemeMode = "light"; var themeMode; if ( document.documentElement ) { if ( document.documentElement.hasAttribute("data-bs-theme-mode")) { themeMode = document.documentElement.getAttribute("data-bs-theme-mode"); } else { if ( localStorage.getItem("data-bs-theme") !== null ) { themeMode = localStorage.getItem("data-bs-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-bs-theme", themeMode); }</script>
		<!--end::Theme mode setup on page load-->
		<!--begin::Root-->
		<div class="d-flex flex-column flex-root" id="kt_app_root">
			<!--begin::Authentication - Password reset -->
			<div class="d-flex flex-column flex-lg-row flex-column-fluid">
				<!--begin::Body-->
				<div class="d-flex flex-column flex-lg-row-fluid w-lg-50 p-10">
					<!--begin::Form-->
					<div class="d-flex flex-center flex-column flex-lg-row-fluid">
						<!--begin::Wrapper-->
						<div class="w-lg-500px p-10">
							<!--begin::Form-->
							<form class="form w-100" novalidate="novalidate" id="kt_password_reset_form" method="post" action="./mailSender.do">
								<!--begin::Heading-->
								<div class="text-center mb-10">
									<!--begin::Title-->
									<h1 class="text-gray-900 fw-bolder mb-3">암호를 잊으셨습니까 ?</h1>
									<!--end::Title-->
									<!--begin::Link-->
									<div class="text-gray-500 fw-semibold fs-6">비밀번호를 재설정하려면 요구하는 정보를 입력해주세요.</div>
									<!--end::Link-->
								</div>
								<!--begin::Heading-->
								
								<!-- Error / Success Messages -->
								<c:if test="${param.error == 'missing_info'}">
									<div class="alert alert-danger">이메일, 이름 또는 사원번호가 제공되지 않았습니다.</div>
								</c:if>
								<c:if test="${param.error == 'invalid_user'}">
									<div class="alert alert-danger">사용자 정보가 일치하지 않습니다.</div>
								</c:if>
								<c:if test="${param.success == 'true'}">
									<div class="alert alert-success">인증코드가 이메일로 전송되었습니다.</div>
								</c:if>

								<!--begin::Input group-->
								<div class="fv-row mb-8">
									<!--begin::Name-->
									<input type="text" placeholder="이름" name="name" autocomplete="off" class="form-control bg-transparent custom-input" />
								</div>
								<div class="fv-row mb-8">
									<!--begin::Employee Number-->
									<input type="text" placeholder="사원번호" name="emp_no" autocomplete="off" class="form-control bg-transparent custom-input" />
								</div>
								<div class="fv-row mb-8">
									<div class="input-group">
										<!--begin::Email-->
										<input type="text" placeholder="이메일" name="email" autocomplete="off" class="form-control bg-transparent" />
										<button type="submit" id="kt_password_reset_submit" class="btn btn-primary custom-btn">
										    인증코드 요청
										</button>
									</div>
								</div>
								<div class="fv-row mb-8 mail_check_wrap">
									<input type="text" placeholder="인증코드 확인" name="verification_code" autocomplete="off" class="form-control bg-transparent mail_check_input_box" id="mail_check_input_box_false" disabled="disabled"/>
								<!--end::Email-->
								</div>
								<!--begin::Actions-->
								<div class="d-flex flex-wrap justify-content-center pb-lg-0">
									<button type="button" id="kt_password_reset_complete" class="btn btn-primary me-4">
										<!--begin::Indicator label-->
										<span class="indicator-label">완료</span>
										<!--end::Indicator label-->
										<!--begin::Indicator progress-->
										<span class="indicator-progress">잠시만 기다려주세요... 
										<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
										<!--end::Indicator progress-->
									</button>
									<a href="./loginServlet.do" class="btn btn-light">취소</a>
									<a href="./passwordChange.do" class="btn btn-light">임시 다음페이지</a>
								</div>
								<!--end::Actions-->
							</form>
							<!--end::Form-->
						</div>
						<!--end::Wrapper-->
					</div>
					<!--end::Form-->
					<%@ include file="./lo_footer.jsp"%>
				</div>
				<!--end::Body-->
			</div>
			<!--end::Authentication - Password reset-->
		</div>
		<!--end::Root-->
		<!--begin::Javascript-->
		<!--begin::Global Javascript Bundle(mandatory for all pages)-->
		<script src="./assets/plugins/global/plugins.bundle.js"></script>
		<script src="./assets/js/scripts.bundle.js"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Custom Javascript(used for this page only)-->
		<script>
			// Check for success or error messages in URL parameters
			window.onload = function() {
				var urlParams = new URLSearchParams(window.location.search);
				var error = urlParams.get('error');
				var success = urlParams.get('success');

				if (error === 'missing_info') {
					alert('이메일, 이름 또는 사원번호가 제공되지 않았습니다.');
				} else if (error === 'invalid_user') {
					alert('사용자 정보가 일치하지 않습니다.');
				} else if (success === 'true') {
					alert('인증코드가 이메일로 전송되었습니다.');
				}
			};
		</script>
		<!--end::Custom Javascript-->
		<!--end::Javascript-->
	</body>
	<!--end::Body-->
</html>