<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>비밀번호 변경 페이지</title>
	</head>
	<%@ include file="./lo_header.jsp"%>
	<!--begin::Body-->
	<body id="kt_body" class="app-blank app-blank">
		<!--begin::Theme mode setup on page load-->
		<script>var defaultThemeMode = "light"; var themeMode; if ( document.documentElement ) { if ( document.documentElement.hasAttribute("data-bs-theme-mode")) { themeMode = document.documentElement.getAttribute("data-bs-theme-mode"); } else { if ( localStorage.getItem("data-bs-theme") !== null ) { themeMode = localStorage.getItem("data-bs-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-bs-theme", themeMode); }</script>
		<!--end::Theme mode setup on page load-->
		<!--begin::Root-->
		<div class="d-flex flex-column flex-root" id="kt_app_root">
			<!--begin::Authentication - New password -->
			<div class="d-flex flex-column flex-lg-row flex-column-fluid">
				<!--begin::Body-->
				<div class="d-flex flex-column flex-lg-row-fluid w-lg-50 p-10">
					<!--begin::Form-->
					<div class="d-flex flex-center flex-column flex-lg-row-fluid">
						<!--begin::Wrapper-->
						<div class="w-lg-500px p-10">
							<!--begin::Form-->
							<form class="form w-100" novalidate="novalidate" id="kt_new_password_form" data-kt-redirect-url="./loginServlet.do" action="#">
								<!--begin::Heading-->
								<div class="text-center mb-10">
									<!--begin::Title-->
									<h2 class="text-gray-900 fw-bolder mb-3">인증에 성공하셨습니다!</h2>
									<h1 class="text-gray-900 fw-bolder mb-3">비밀번호 변경</h1>
									<!--end::Title-->
									<!--begin::Link-->
									<div class="text-gray-500 fw-semibold fs-6">비밀번호를 이미 재설정하셨나요 ? 
									<a href="./loginServlet.do" class="link-primary fw-bold">로그인</a></div>
									<!--end::Link-->
								</div>
								<!--begin::Heading-->
								<!--begin::Input group-->
								<div class="fv-row mb-8" data-kt-password-meter="true">
									<!--begin::Wrapper-->
									<div class="mb-1">
										<!--begin::Input wrapper-->
										<div class="position-relative mb-3">
											<input class="form-control bg-transparent" type="password" placeholder="비밀번호" name="password" autocomplete="off" />
											<span class="btn btn-sm btn-icon position-absolute translate-middle top-50 end-0 me-n2" data-kt-password-meter-control="visibility">
												<i class="ki-duotone ki-eye-slash fs-2"></i>
												<i class="ki-duotone ki-eye fs-2 d-none"></i>
											</span>
										</div>
										<!--end::Input wrapper-->
										<!--begin::Meter-->
										<div class="d-flex align-items-center mb-3" data-kt-password-meter-control="highlight">
											<div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
											<div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
											<div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
											<div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px"></div>
										</div>
										<!--end::Meter-->
									</div>
									<!--end::Wrapper-->
									<!--begin::Hint-->
									<div class="text-muted">비밀번호는 영문 대/소문자 및 숫자 조합으로 8~16자리로 설정하세요.</div>
									<!--end::Hint-->
								</div>
								<!--end::Input group=-->
								<!--end::Input group=-->
								<div class="fv-row mb-8">
									<!--begin::Repeat Password-->
									<input type="password" placeholder="비밀번호 확인" name="confirm-password" autocomplete="off" class="form-control bg-transparent" />
									<!--end::Repeat Password-->
								</div>
								<!--end::Input group=-->
								<!--begin::Input group=-->
								<div class="fv-row mb-8">
									<label class="form-check form-check-inline">
										<input class="form-check-input" type="checkbox" name="toc" value="1" />
										<span class="form-check-label fw-semibold text-gray-700 fs-6 ms-1">동의합니다 &amp; 
										<a href="#" class="ms-1 link-primary">조건 및 약관</a>.</span>
									</label>
								</div>
								<!--end::Input group=-->
								<!--begin::Action-->
								<div class="d-grid mb-10">
									<button type="button" id="kt_new_password_submit" class="btn btn-primary">
										<!--begin::Indicator label-->
										<span class="indicator-label" onclick="location.href='./loginServlet.do'">확인</span>
										<!--end::Indicator label-->
										<!--begin::Indicator progress-->
										<span class="indicator-progress">잠시만 기대라세요... 
										<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
										<!--end::Indicator progress-->
									</button>
								</div>
								<!--end::Action-->
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
			<!--end::Authentication - New password-->
		</div>
		<!--end::Root-->
		<!--begin::Javascript-->
		<!--begin::Global Javascript Bundle(mandatory for all pages)-->
		<script src="./assets/plugins/global/plugins.bundle.js"></script>
		<script src="./assets/js/scripts.bundle.js"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Custom Javascript(used for this page only)-->
<!-- 		<script src="./assets/js/custom/authentication/reset-password/new-password.js"></script> -->
		<script src="./assets/js/custom/authentication/reset-password/new-password_jsj.js"></script>
		<!--end::Custom Javascript-->
		<!--end::Javascript-->
	</body>
	<!--end::Body-->
</html>