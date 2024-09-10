<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>메일 작성화면</title>
<%@ include file="./lo_header.jsp"%>
<script>
	// 폼 제출 시 분류 선택을 제목 앞에 추가
	$(document).ready(function() {
		$('form').on('submit', function() {
			var category = $('#category option:selected').text();
			var title = $('#title').val();

			// 분류가 이미 제목에 붙어있지 않으면 붙이기
			if (!title.startsWith(category)) {
				$('#title').val(category + ' ' + title);
			}
		});
	});

	$(document).ready(function() {
		var status = new URLSearchParams(window.location.search).get('status');

		if (status === "success") {
			alert("이메일이 성공적으로 전송되었습니다.");
		} else if (status === "error") {
			alert("이메일 전송에 실패하였습니다. 다시 시도해주세요.");
		}
	});
</script>
</head>
<body id="kt_body" class="app-blank app-blank">
<script>var defaultThemeMode = "light"; var themeMode; if ( document.documentElement ) { if ( document.documentElement.hasAttribute("data-bs-theme-mode")) { themeMode = document.documentElement.getAttribute("data-bs-theme-mode"); } else { if ( localStorage.getItem("data-bs-theme") !== null ) { themeMode = localStorage.getItem("data-bs-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-bs-theme", themeMode); }</script>
		<!-- 왼쪽 레이아웃 추가 -->
		<div class="d-flex flex-column flex-root" id="kt_app_root">
			<div class="d-flex flex-column flex-lg-row flex-column-fluid">
				<!-- 왼쪽 영역 추가 -->
				<div
					class="d-flex flex-lg-row-fluid w-lg-50 bgi-size-cover bgi-position-center"
					style="background-image: url(./img/jsj1.jpg)">
					<!-- Content -->
					<div class="d-flex flex-column flex-center p-6 p-lg-10 w-100">
						<h1
							class="d-none d-lg-block text-white fs-2qx fw-bold text-center mb-7">GDJ_81
							RGB PROJECT</h1>
						<div class="d-none d-lg-block text-white fs-base text-center">조홍준,
							명대홍, 양승, 김유진, 전성진</div>
					</div>
				</div>
				<div class="d-flex flex-column flex-lg-row-fluid w-lg-50 p-10">
					<div class="d-flex flex-center flex-column flex-lg-row-fluid">
						<div class="w-lg-500px p-10">
							<h3 class="text-center">문의하기</h3>
							<form class="form-horizontal" action="./fmailSender.do"
								method="post">
								<div class="form-group">
									<label class="control-label" for="email">TO:</label> <input
										type="email" class="form-control" id="email"
										value="springjsj@naver.com" placeholder="관리자" name="email"
										readonly style="pointer-events: none;">
									<script>
										document
												.addEventListener(
														"DOMContentLoaded",
														function() {
															const emailInput = document
																	.getElementById('email');

															// '관리자'라는 텍스트를 표시
															emailInput.value = "관리자";

															// 클릭 이벤트 막기
															emailInput
																	.addEventListener(
																			'click',
																			function(
																					event) {
																				event
																						.preventDefault(); // 클릭을 무시하게 함
																			});

															// 폼 제출 시 이메일 값을 변경
															document
																	.querySelector(
																			'form')
																	.addEventListener(
																			'submit',
																			function() {
																				emailInput.value = "springjsj@naver.com";
																			});
														});
									</script>
								</div>
								<div class="form-group">
									<label class="control-label" for="category">분류:</label> <select
										id="category" class="form-control" name="category"
										style="height: 50px; resize: vertical;">
										<option value="사원번호 문의">[사원번호 문의]</option>
										<option value="이메일 문의">[이메일 문의]</option>
										<option value="비밀번호 문의">[비밀번호 문의]</option>
										<option value="기타 문의">[기타 문의]</option>
									</select>
								</div>
								<div class="form-group">
									<label class="control-label" for="title">제목:</label> <input
										type="text" class="form-control" id="title"
										placeholder="문의 제목을 작성해주세요." name="title">
								</div>
								<div class="form-group">
									<textarea class="form-control" name="content"
										placeholder="문의 내용을 작성해 주세요."
										style="height: 300px; resize: vertical;"></textarea>
								</div>
								<div class="form-group text-center">
									<input type="submit" class="btn btn-success" value="메일 보내기">
									<button type="button" class="btn btn-danger"
										onclick="location.href='./loginServlet.do'">취소</button>
								</div>
								<!-- CSRF 토큰 추가 -->
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}">
							</form>
						</div>
					</div>
	<%@ include file="./lo_footer.jsp"%>
				</div>
			</div>
		</div>
</body>
</html>
