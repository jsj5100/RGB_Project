<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="./js/templateModal.js"></script>
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
					<form action="./uploadTemplate.do" method="post" enctype="multipart/form-data">
						<div>
							<table>
								<tr>
									<td class="border-td text-center">카테고리</td>
									<td style="width:250px; text-align:center;" class="border-td">
										<select style="width:200px;" name="img_value">
											<option style="text-align:center;" value="휴가">휴가</option>
											<option style="text-align:center;" value="지출">지출</option>
											<option style="text-align:center;" value="일정">일정</option>
										</select>
									</td>
									<td class="border-td text-center">작성일자</td>
									<td class="border-td">
										<input type="text" name="temp_regdate" readonly="readonly" value="${strDate}">
									</td>
								</tr>
								<tr>
									<td class="border-td text-center">제목</td>
									<td class="border-td" colspan="3">
										<input type="text" name="temp_title" placeholder="제목 작성">
									</td>
								</tr>
								<tr>
									<td class="border-td text-center">파일 첨부</td>
									<td class="border-td" colspan="3"><input type="file">
									</td>
								</tr>
							</table>
							<div id="editor"></div>

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
<script type="text/javascript">
	ClassicEditor
		.create( document.querySelector( '#editor' ))
		.catch( error => {
		  console.error( error );
	} );
	
</script>
</html>