<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./css/template/template.css">
</head>
<%@include file="./header.jsp"%>
<body>
	<div style="padding-left: 80px; margin-top: 10px;" id="kt_app_content"
		class="app-content flex-column-fluid">
		<div style="padding-left: 80px;" id="kt_app_content_container"
			class="app-container container-xxl">
			<div class="card">
				<div class="card-body">
					<form action="./uploadTemplate.do" method="post"
						enctype="multipart/form-data">
						<div>
							<table>
								<tr>
									<td class="border-td text-center">카테고리</td>
									<td style="width: 250px; text-align: center;" class="border-td">
										<select style="width: 200px;" name="img_value">
											<option style="text-align: center;" value="휴가">휴가</option>
											<option style="text-align: center;" value="지출">지출</option>
											<option style="text-align: center;" value="일정">일정</option>
									</select>
									</td>
									<td class="border-td text-center">작성일자</td>
									<td class="border-td"><input type="text"
										name="temp_regdate" readonly="readonly" value="${strDate}">
									</td>
									<td class="border-td text-center">작성자</td>
									<td class="border-td"><input type="text"
										name="temp_writename" readonly="readonly" value="${writeName}">
									</td>
								</tr>
								<tr>
									<td class="border-td text-center">제목</td>
									<td class="border-td" colspan="5"><input type="text"
										name="temp_title" placeholder="제목 작성" value="${titl}"></td>
								</tr>
								<tr>
									<td class="border-td text-center">파일 첨부</td>
									<td class="border-td" colspan="5"><input type="file"
										name="file"></td>
								</tr>
							</table>
							<textarea name="temp_content" id="editor"></textarea>
							<div class="form-actions">
								<input type="submit" value="작성" class="btn btn-primary">
								<input type="button" value="취소" class="btn btn-danger">
							</div>
						</div>
					</form>


				</div>
			</div>
		</div>



	</div>
	<%@include file="./footer.jsp"%>
</body>
</html>