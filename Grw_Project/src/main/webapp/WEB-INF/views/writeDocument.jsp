<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
<link rel="stylesheet" href="./css/template/template.css">
<style type="text/css">
	 .jstree-checkbox {
            display: none;
        }
        /* 자식 노드에만 체크박스를 표시합니다. */
        .jstree-node.jstree-open > .jstree-checkbox {
            display: block;
        }
</style>
<title>전자결재 문서 작성</title>
</head>
<%@include file="./header.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
									<td class="border-td" colspan="3"><input id="approvalLine-value"  type="text"
										readonly="readonly" data-bs-toggle="modal"
										data-bs-target="#approvalLineBtn" placeholder="결재라인을 지정해주세요"></td>
								</tr>
								<tr>
									<td class="border-td text-center">참조자</td>
									<td class="border-td" colspan="3"><input type="text" placeholder="결재라인에서 참조자를 지정해주세요"
										readonly="readonly"></td>
								</tr>
								<tr>
									<td class="border-td text-center">결재유형</td>
									<td class="border-td" colspan="3"><input id="approval-type" type="text" placeholder="양식을 선택하여 결재유형을 지정해주세요"
										readonly="readonly"></td>
								</tr>
								<tr>
									<td class="border-td text-center">기안일</td>
									<td class="border-td"><input type="text"
										readonly="readonly" id=currentYear></td>
									<td class="border-td text-center">마감기한 설정</td>
									<td class="border-td"><input id="choiceDeadline" type="text"></td>
								</tr>
								<tr>
									<td class="border-td text-center">파일 첨부</td>
									<td class="border-td" colspan="3"><input type="file">
									</td>
								</tr>
							</table>
							<textarea id="editor"></textarea>

							<div class="form-actions">
								<input type="submit" value="작성하기" class="btn btn-primary">
								<input type="button" value="임시저장" class="btn btn-primary">
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
								<ul id="dataList">
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
						<button type="button" id="template-modal-choice"
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
							<div class="top-div">검색기능</div>

							<!-- Bottom Divs -->
							<div class="bottom-divs">
								<!-- Left Div -->
								<div class="left-div">
									<div class="div-header">
										<span>부서명</span>
									</div>
									<div class="div-content" style="padding-left: 0px;">
										<div id="jstree"></div>
									</div>
								</div>

								<!-- Right Divs Container -->
								<div class="right-divs">
									<div class="right-div">
										<div class="div-header">
											<span>결재자</span>
									    </div>
										<div id="selectedNodeText" class="div-content">
											<table id="approval-table" style="margin-top: 0px;">
												<tr>
													<td class="approval-td-header">결재자</td>
													<td class="approval-td-header">직급</td>
													<td class="approval-td-header">소속</td>
													<td class="approval-td-header">순서</td>
												</tr>
												<tr>
													<td class="approval-td-body">
<%-- 														<%loginDto.getEmp_name()%> --%>
													</td>
													<td class="approval-td-body">
<%-- 														<%loginDto.get%> --%>
													</td>
													<td class="approval-td-body">
<%-- 														<%loginDto.get %> --%>
													</td>
													<td class="approval-td-body">1</td>
												</tr>
												
											</table>
										</div>
									</div>
									<div class="right-div">
										<div class="div-header	">
											<span>참조자</span>
										</div>
										<div class="div-content" style="overflow: auto;">
											<table id="cc-table" style="margin-top: 0px;">
												<tr>
													<td class="approval-td-header">참조자</td>
													<td class="approval-td-header">직급</td>
													<td class="approval-td-header">소속</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								
							</div>
							<div class="center-button">
									<input id="approvalLineButton" type="button" value="결재선 지정" class="btn btn-primary">
									<input id="ccLineButton" type="button" value="참조자 지정" class="btn btn-primary">
							</div>
						</div>
					</div>
					<!--end::Modal body-->
					<!--begin::Modal footer-->
					<div class="modal-footer d-flex justify-content-end">
						<button type="button" id="approvalLine-choice"
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

const today = new Date();
const year = today.getFullYear();
const month = today.getMonth() + 1;
const date = today.getDate();

const formattedToday = today.toISOString().split('T')[0];

var currentYear = document.getElementById('currentYear');
currentYear.value = formattedToday;

$("#choiceDeadline").flatpickr({
	  dateFormat: "Y-m-d",
	  minDate: formattedToday,
	  onChange: function(selectedDates, dateStr, instance) {
	  	selectedStartDate1 = dateStr
	  	console.log('선택한 마감 날짜: ', dateStr);
	  }
	 });
	
</script>
<script type="text/javascript" src="./js/jstreeApprovalLine.js"></script>
<script type="text/javascript" src="./js/choiceCalendar.js"></script>

</html>
