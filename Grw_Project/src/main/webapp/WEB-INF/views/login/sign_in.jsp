<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 페이지</title>
		
	</head>
	<%@ include file="./lo_header.jsp"%>
	<!--begin::Body-->
	<body id="kt_body" class="app-blank app-blank">
		<!--begin::Theme mode-->
		<script>var defaultThemeMode = "light"; var themeMode; if ( document.documentElement ) { if ( document.documentElement.hasAttribute("data-bs-theme-mode")) { themeMode = document.documentElement.getAttribute("data-bs-theme-mode"); } else { if ( localStorage.getItem("data-bs-theme") !== null ) { themeMode = localStorage.getItem("data-bs-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-bs-theme", themeMode); }</script>
		<!--end::Theme mode-->
		<!--begin::Root-->
	    <div class="d-flex flex-column flex-root" id="kt_app_root">
	        <!--begin::Authentication - Sign-in -->
	        <div class="d-flex flex-column flex-lg-row flex-column-fluid">
	            <!--begin::Body-->
	            <div class="d-flex flex-column flex-lg-row-fluid w-lg-50 p-10">
	                <!--begin::Form-->
	                <div class="d-flex flex-center flex-column flex-lg-row-fluid">
	                    <!--begin::Wrapper-->
	                    <div class="w-lg-500px p-10">
	                        <!--begin::Form-->
	                        <form class="form w-100" novalidate="novalidate" id="kt_sign_in_form" action="./loginServlet.do" method="post">
	                            <!--begin::Heading-->
	                            <div class="text-center mb-11">
	                                <!--begin::Title-->
	                                <h1 class="text-gray-900 fw-bolder mb-3">Sign In</h1>
	                                <!--end::Title-->
	                                <!--begin::Subtitle-->
	                                <div class="text-gray-500 fw-semibold fs-6">로그인</div>
	                                <!--end::Subtitle-->
	                            </div>
	                            <!--end::Heading-->
	                            <!--begin::Separator-->
	                            <div class="separator separator-content my-14">
	                                <span class="w-400px text-gray-500 fw-semibold fs-7">사원번호와 비밀번호를 입력하세요</span>
	                            </div>
	                            <!--end::Separator-->
	                            <!--begin::Input group-->
	                            <div class="fv-row mb-8">
	                                <!--begin::Employee Number-->
	                                <input type="text" id="emp_no" name="emp_no" placeholder="사원번호" autocomplete="off" class="form-control bg-transparent" required />
	                                <!--end::Employee Number-->
	                            </div>
	                            <!--end::Input group-->
	                            <div class="fv-row mb-3">
	                                <!--begin::Password-->
	                                <input type="password" id="emp_password" name="emp_password" placeholder="비밀번호" autocomplete="off" class="form-control bg-transparent" required />
	                                <!--end::Password-->
	                            </div>
	                            <!--end::Input group-->
	                            <!--begin::Wrapper-->
	                            <div class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-8">
	                                <div></div>
	                                <!--begin::Link-->
	                                <a href="./reset_password.do" class="link-primary">비밀번호를 잊으셨습니까 ?</a>
	                                <!--end::Link-->
	                            </div>
	                            <!--end::Wrapper-->
	                            <!--begin::Submit button-->
	                            <div class="d-grid mb-10">
	                                <button type="submit" id="kt_sign_in_submit" class="btn btn-primary" value="login">
	                                    <!--begin::Indicator label-->
	                                    <span class="indicator-label">로그인</span>
	                                    <!--end::Indicator label-->
	                                    <!--begin::Indicator progress-->
	                                    <span class="indicator-progress">잠시만 기다리세요...
	                                    <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
	                                    <!--end::Indicator progress-->
	                                </button>
	                            </div>
	                            <!--end::Submit button-->
	                            <!--begin::Sign up-->
	                            <div class="text-gray-500 text-center fw-semibold fs-6">사원이 아니신가요? 
	                            <a href="#" class="link-primary">Email</a></div>
	                            <!--end::Sign up-->
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
	        <!--end::Authentication - Sign-in-->
	    </div>
	    <!--end::Root-->
		<!--begin::Global Javascript Bundle(mandatory for all pages)-->
		<script src="./assets/plugins/global/plugins.bundle.js"></script>
		<script src="./assets/js/scripts.bundle.js"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Custom Javascript(used for this page only)-->
<!-- 		<script src="./assets/js/custom/authentication/sign-in/general.js"></script> -->
		<script src="./assets/js/custom/authentication/sign-in/general_jsj.js"></script>
		<!--end::Custom Javascript-->
		<!--end::Javascript-->
	</body>
	<!--end::Body-->
</html>