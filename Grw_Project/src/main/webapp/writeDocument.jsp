<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<style type="text/css">
	.content-div{
		margin-top: 50px;
	}
	table {
            border-spacing: 0 5px;
            border-collapse: collapse;
            border: 1px solid #ccc;
            width: 100%;
        }
        
    tr{
    	height: 50px;
    }
    
    td {
    	padding: 10px;
    	text-align: left;
    }
    .border-td{
		border: 1px solid #ccc;    
    }
</style>
<title>전자결재 문서 작성</title>
</head>
<%@include file="./header.jsp"%>
<body>
	<div style="padding-left: 80px; margin-top: 10px;" id="kt_app_content"
		class="app-content flex-column-fluid">
		<div style="padding-left: 80px;" id="kt_app_content_container"
			class="app-container container-xxl">
			<div class="card">
				<div class="card-body">
					<form action="./" method="post">
						<div class="container">
								<table>
									<tr>
										<td class="border-td" colspan="4">
											<input id="selectTemplate" type="button" value="양식 선택">
										</td>
									</tr>
									
									<tr>
										<td class="border-td">제목</td>
										<td class="border-td" colspan="3"><input type="text"></td>
									</tr>
									
									<tr>
										<td class="border-td">결재라인 지정</td>
										<td class="border-td" colspan="3"><input type="text"></td>
									</tr>
									
									<tr>
										<td class="border-td">참조자</td>
										<td class="border-td" colspan="3"><input type="text"></td>
									</tr>
									
									<tr>
										<td class="border-td">결재유형</td>
										<td class="border-td" colspan="3"><input type="text"></td>
									</tr>
									
									<tr>
										<td class="border-td">기안일</td>
										<td class="border-td"><input type="text"></td>
										<td class="border-td">마감기한 설정</td>
										<td class="border-td"><input type="text"></td>
									</tr>
									
									<tr>
										<td class="border-td">파일 첨부</td>
										<td class="border-td" colspan="3"><input type="file"></td>
									</tr>
								</table>
							<div class="content-div">
								<div id="editor"></div>	
							</div>

							<div class="content-div" style="float: right;">
								<input type="submit" value="작성하기"> 
								<input type="button" value="임시저장"> 
								<input type="button" value="미리보기">
								<input type="button" value="취소">
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
