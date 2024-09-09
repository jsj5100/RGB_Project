<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

</head>
<%@ include file="./lo_header.jsp"%>
<body id="kt_body" class="app-blank app-blank">
	<script>
		var defaultThemeMode = "light";
		var themeMode;
		if (document.documentElement) {
			if (document.documentElement.hasAttribute("data-bs-theme-mode")) {
				themeMode = document.documentElement
						.getAttribute("data-bs-theme-mode");
			} else {
				if (localStorage.getItem("data-bs-theme") !== null) {
					themeMode = localStorage.getItem("data-bs-theme");
				} else {
					themeMode = defaultThemeMode;
				}
			}
			if (themeMode === "system") {
				themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark"
						: "light";
			}
			document.documentElement.setAttribute("data-bs-theme", themeMode);
		}
	</script>
	<div class="d-flex flex-column flex-root" id="kt_app_root">
		<div class="d-flex flex-column flex-lg-row flex-column-fluid">
			<div class="d-flex flex-column flex-lg-row-fluid w-lg-50 p-10">
				<div class="d-flex flex-center flex-column flex-lg-row-fluid">
					<div class="w-lg-500px p-10">
						<form class="form w-100" novalidate="novalidate"
							id="kt_sign_in_form" action="./login" method="post">
							<div class="text-center mb-11">
								<h1 class="text-gray-900 fw-bolder mb-3">Sign In</h1>
								<h2 class="text-gray-900 fw-bolder mb-3">
									<c:out value="${error}" />
								</h2>
								<h2 class="text-gray-900 fw-bolder mb-3">
									<c:out value="${logout}" />
								</h2>
								<div class="text-gray-500 fw-semibold fs-6">로그인</div>
							</div>
							<div class="separator separator-content my-14">
								<span class="w-400px text-gray-500 fw-semibold fs-7">사원번호와
									비밀번호를 입력하세요</span>
							</div>
							<div class="fv-row mb-8">
								<input type="text" id="text" name="username" placeholder="사원번호"
									autocomplete="off" class="form-control bg-transparent" required />
							</div>
							<div class="fv-row mb-3">
								<input type="password" id="password" name="password"
									placeholder="비밀번호" autocomplete="off"
									class="form-control bg-transparent" required />
							</div>
							<div
								class="d-flex flex-stack flex-wrap gap-3 fs-base fw-semibold mb-8">
								<div></div>
								<a href="./passwordFind.do" class="link-primary">비밀번호를
									잊으셨습니까 ?</a>
							</div>
							<div class="d-grid mb-10">
								<button type="submit" id="kt_sign_in_submit"
									class="btn btn-primary" value="login">
									<span class="indicator-label">로그인</span> <span
										class="indicator-progress">잠시만 기다리세요... <span
										class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
								</button>
							</div>
							<div class="text-gray-500 text-center fw-semibold fs-6">
								사원이 아니신가요? <a href="./mailForm.do" class="link-primary">Email</a>
							</div>
							<!-- 	                            CSRF 토큰을 JSP 페이지에 명시적으로 삽입 -->
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}">
						</form>
					</div>
				</div>
				<%@ include file="./lo_footer.jsp"%>
			</div>
		</div>
	</div>
	<script src="./js/general_jsj.js"></script>
</body>
</html>