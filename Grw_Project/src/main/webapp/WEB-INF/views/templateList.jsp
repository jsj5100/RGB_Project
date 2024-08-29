<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./header.jsp"%>
<title>Insert title here</title>
</head>
<body>


	<div style="padding-left: 80px; margin-top: 10px;" id="kt_app_content"
		class="app-content flex-column-fluid">
		<div style="padding-left: 80px;" id="kt_app_content_container"
			class="app-container container-xxl">
			<div style="width: 100%; height: auto; margin-top: 10px;"
				class="card">
				<div class="card-header border-0 pt-5">
					<h3 class="card-title align-items-start flex-column">
						<span class="card-label fw-bold fs-3 mb-1">양식리스트</span>
					</h3>
					<div class="card-title"></div>
					<div class="card-toolbar">
						<a href="./writeTemplate.do" class="btn btn-sm btn-primary"
							style="margin-right: 10px;"> <img
							style="width: 30px; padding-right: 5px;"
							src="./assets/images/document.svg"> 양식작성
						</a>
						<div class="d-flex align-items-center position-relative my-1">
							<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
								<span class="path1"></span> <span class="path2"></span>
							</i> <input type="text" data-kt-user-table-filter="search"
								class="form-control form-control-solid w-250px ps-13"
								placeholder="양식명 검색">
						</div>
					</div>
				</div>
				<div class="card-body pt-3 pb-1" style="width: auto;">
					<div class="table-responsive">
						<table class="table align-middle gs-0 gy-4">
							<thead>
								<tr class="border-0">
									<th class="p-0 min-w-100px"></th>
									<th class="p-0 min-w-100px"></th>
									<th class="p-0 min-w-100px"></th>
									<th class="p-0 min-w-100px"></th>

									<th class="p-0 min-w-100px text-end"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img style="margin-left: 10px;"
										src="./assets/images/whiteimg.png"></td>
									<td style="width: 100px; text-align: center;"><p
											class="text-gray-800 fw-bold d-block mb-1 fs-6">양식번호</p></td>
									<td class="text-end">
										<p style="text-align: center; margin: 0px;">
											<b class="text-gray-800 fw-bold d-block mb-1 fs-6">양식명</b>
										</p>
									</td>
									<td class="text-end">
										<p class="text-gray-800 fw-bold d-block mb-1 fs-6"
											style="pointer-events: none; text-align: center;">작성일자</p>
									</td>
									<td style="width:200px;"></td>
								</tr>
								
								<c:forEach var="list" items="${lists}">
								<tr>
									<td style="width: 60px;">
										<c:if test="${list.img_value eq 'VACATION'}">
										<div class="symbol symbol-45px me-5">
											<img style="margin-left: 10px; width:45px; height:45px;"
												src="./assets/images/vacation.png">
										</div>
										</c:if>
										
										<c:if test="${list.img_value eq 'EXPENSE'}">
										<div class="symbol symbol-45px me-5">
											<img style="margin-left: 10px; width:45px; height:45px;"
												src="./assets/images/expense.png">
										</div>
										</c:if>
										
									</td>
									<td style="width: 100px; text-align: center;">
										<p class="text-gray-800 fw-bold d-block mb-1 fs-6">${list.temp_id}</p>

									</td>
									<td class="text-end"><a id="abn" href="#" onclick="modalTitle('${list.temp_title}')"
										data-bs-toggle="modal" data-bs-target="#kt_modal_select_location"
										class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6"
										style="text-align: center;">${list.temp_title}</a></td>
									<td class="text-end">
										<p style="text-align: center;"
											class="text-gray-800 fw-bold d-block mb-1 fs-6">${list.temp_regdate}</p>
									</td>
									<td style="text-align: center;"><input type="button"
										class="btn btn-primary" value="수정" style="margin-right: 10px;">
										<input type="button" class="btn btn-danger" value="삭제"></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
			<!-- 모달창 -->
			<div class="modal fade" id="kt_modal_select_location" tabindex="-1"
			style="display: none;" aria-hidden="true">
			<div class="modal-dialog mw-1000px">
				<div class="modal-content">
					<div class="modal-header">
						<h2 id="modalTitle"></h2>
					</div>
					<div class="modal-body">
						<div class="container">
							<div class="form-list">
								<h2>양식 목록</h2>
								
							</div>

							<div class="form-preview">
							
							</div>
						</div>
					</div>
					<div class="modal-footer d-flex justify-content-end">
						<button type="button" id="kt_modal_select_location_button"
							class="btn btn-primary" data-bs-dismiss="modal">적용</button>
						<a href="#" class="btn btn-active-light me-5"
							data-bs-dismiss="modal">취소</a>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	<%@include file="./footer.jsp"%>
</body>
<script type="text/javascript">
	function modalTitle(titl){
		document.getElementById('modalTitle').innerHTML= titl;
	}
</script>
</html>