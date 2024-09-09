<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
.full-height {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.form-container {
	width: 1000px;
	height: 700px;
	border: 1px solid #ddd;
	padding: 20px;
	background-color: #f9f9f9;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.form-container .form-group {
	margin-bottom: 15px;
}
</style>
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
<body>
	<div class="container full-height">
		<div class="form-container">
			<h3 class="text-center">문의하기</h3>
			<form class="form-horizontal" action="./fmailSender.do" method="post">
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
											emailInput.addEventListener(
													'click', function(event) {
														event.preventDefault(); // 클릭을 무시하게 함
													});

											// 폼 제출 시 이메일 값을 변경
											document
													.querySelector('form')
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
			</form>
		</div>
	</div>
	<%@ include file="./lo_footer.jsp"%>
</body>
</html>
