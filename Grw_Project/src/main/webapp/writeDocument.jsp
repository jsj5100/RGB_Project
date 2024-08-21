<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.0.0/ckeditor5.css">
<title>전자결재 문서 작성</title>
</head>
<%@include file="./header.jsp"%>
<body>
	<div style="padding-left:80px; margin-top:10px;" id="kt_app_content" class="app-content flex-column-fluid">
		<div style="padding-left:80px;" id="kt_app_content_container" class="app-container container-xxl">
			<div class="card">
				<div class="card-body">
					<div>
					<table>
						<tr>
							<td><input type="button" value="양식 선택"></td>
						</tr>
						<tr>
							<td>결재라인 지정</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>참조자</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>결재유형</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>마감기한 설정</td>
							<td><input type="text"></td>
						</tr>
						<tr>
							<td>파일 첨부</td>
							<td><input type="file"></td>
						</tr>
					</table>
					</div>
					<div >
						<h1>CKEditor 위치</h1>
					</div>
					<div>
						<input type="button" value="작성하기">
						<input type="button" value="임시저장">
						<input type="button" value="미리보기">
						<input type="button" value="취소">
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="./footer.jsp"%>
</body>
</html>
