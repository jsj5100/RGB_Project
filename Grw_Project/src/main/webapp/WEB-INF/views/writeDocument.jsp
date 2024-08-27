<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="./js/templateModal.js"></script>
<link rel="stylesheet" href="./css/template/template.css">

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
						<div>
							<table>
								<tr>
									<td class="border-td" colspan="4"><input
										id="selectTemplate" type="button" value="양식 선택"
										class="btn btn-primary" data-bs-toggle="modal"
										data-bs-target="#kt_modal_select_location"></td>
								</tr>
								<tr>
									<td class="border-td text-center">제목</td>
									<td class="border-td" colspan="3"><input type="text"
										placeholder="제목을 입력해주세요"></td>
								</tr>
								<tr>
									<td class="border-td text-center">결재라인 지정</td>
									<td class="border-td" colspan="3"><input type="text"
										readonly="readonly" data-bs-toggle="modal"
										data-bs-target="#approvalLineBtn" placeholder="결재라인을 지정해주세요"></td>
								</tr>
								<tr>
									<td class="border-td text-center">참조자</td>
									<td class="border-td" colspan="3"><input type="text"
										readonly="readonly"></td>
								</tr>
								<tr>
									<td class="border-td text-center">결재유형</td>
									<td class="border-td" colspan="3"><input type="text"
										readonly="readonly"></td>
								</tr>
								<tr>
									<td class="border-td text-center">기안일</td>
									<td class="border-td"><input type="text"
										readonly="readonly" id=currentYear></td>
									<td class="border-td text-center">마감기한 설정</td>
									<td class="border-td"><input type="text"></td>
								</tr>
								<tr>
									<td class="border-td text-center">파일 첨부</td>
									<td class="border-td" colspan="3"><input type="file">
									</td>
								</tr>
							</table>
							<div id="editor"></div>

							<div class="form-actions">
								<input type="submit" value="작성하기" class="btn btn-primary">
								<input type="button" value="임시저장" class="btn btn-primary">
								<input type="button" value="미리보기" class="btn btn-primary">
								<input type="button" value="취소" class="btn btn-primary">
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>

		<!-- 양식 선택 모달창 -->
		<div class="modal fade" id="kt_modal_select_location" tabindex="-1"
			style="display: none;" aria-hidden="true">
			<!--begin::Modal dialog-->
			<div class="modal-dialog mw-1000px">
				<!--begin::Modal content-->
				<div class="modal-content">
					<!--begin::Modal header-->
					<div class="modal-header">
						<!--begin::Title-->
						<h2>양식 선택</h2>
						<!--end::Title-->
						<!--begin::Close-->
						<!--end::Close-->
					</div>
					<!--end::Modal header-->
					<!--begin::Modal body-->
					<div class="modal-body">
						<div class="container">
							<!-- Form List -->
							<div class="form-list">
								<h2>양식 목록</h2>
								<ul>
									<c:forEach var="template" items="${lists}">
										<li><a id="previewTemlate">${template.temp_title}</a></li>
									</c:forEach>
								</ul>
							</div>

							<!-- Form Preview -->
							<div class="form-preview">
								<h2>미리보기</h2>
								<div id="preview-content">
									<p>Select a form to preview.</p>
								</div>
							</div>
						</div>
					</div>
					<!--end::Modal body-->
					<!--begin::Modal footer-->
					<div class="modal-footer d-flex justify-content-end">
						<button type="button" id="kt_modal_select_location_button"
							class="btn btn-primary" data-bs-dismiss="modal">적용</button>
						<a href="#" class="btn btn-active-light me-5"
							data-bs-dismiss="modal">취소</a>
					</div>
					<!--end::Modal footer-->
				</div>
				<!--end::Modal content-->
			</div>
			<!--end::Modal dialog-->
		</div>
		
		<!-- 결재라인 선택 모달창 -->
		<div class="modal fade" id="approvalLineBtn" tabindex="-1"
			style="display: none;" aria-hidden="true">
			<!--begin::Modal dialog-->
			<div class="modal-dialog mw-1000px">
				<!--begin::Modal content-->
				<div class="modal-content">
					<!--begin::Modal header-->
					<div class="modal-header">
						<!--begin::Title-->
						<h2>결재라인 선택</h2>
						<!--end::Title-->
						<!--begin::Close-->

					</div>
					<!--end::Modal header-->
					<!--begin::Modal body-->
					<div class="modal-body">
						<div class="container-approvalLine">
							<div class="top-div">Top Div - Full Width</div>

							<!-- Bottom Divs -->
							<div class="bottom-divs">
								<!-- Left Div -->
								<div class="left-div">
									<div class="div-header">
										<span>부서명</span>
									</div>
									<div class="div-content">
										<span>아무부서</span>
									</div>
								</div>

								<!-- Right Divs Container -->
								<div class="right-divs">
									<div class="right-div">
										<div class="div-header">
											<span>결재자</span>
									    </div>
										<div class="div-content">asd</div>
									</div>
									<div class="right-div">
										<div class="div-header	">
											<span>참조자</span>
										</div>
										<div class="div-content">asd</div>
									</div>
								</div>
								
							</div>
							<div class="center-button">
									<input type="button" value="결재선 지정" class="btn btn-primary">
									<input type="button" value="참조자 지정" class="btn btn-primary">
							</div>
						</div>
					</div>
					<!--end::Modal body-->
					<!--begin::Modal footer-->
					<div class="modal-footer d-flex justify-content-end">
						<button type="button" id="kt_modal_select_location_button"
							class="btn btn-primary" data-bs-dismiss="modal">적용</button>
						<a href="#" class="btn btn-active-light me-5"
							data-bs-dismiss="modal">취소</a>
					</div>
					<!--end::Modal footer-->
				</div>
				<!--end::Modal content-->
			</div>
			<!--end::Modal dialog-->
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
