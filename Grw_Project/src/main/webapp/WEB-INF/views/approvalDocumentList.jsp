<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./header.jsp"%>
<title>Insert title here</title>
<style>
.hidden {
	display: none;
}

.rejection-container {
	display: flex;
	align-items: center;
}

.rejection-content {
	display: flex;
	align-items: center;
	width: 100%;
}

.rejection-comment {
	flex: 1;
	margin-right: 10px;
}

.rejection-container form {
	margin: 0;
}
</style>
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
						<span class="card-label fw-bold fs-3 mb-1">결재함</span>
					</h3>
					<div class="card-title">
						<!--begin::Search-->
						<div class="d-flex align-items-center position-relative my-1">
							<i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
								<span class="path1"></span> <span class="path2"></span>
							</i> <input type="text" data-kt-user-table-filter="search"
								class="form-control form-control-solid w-250px ps-13"
								placeholder="이름, 사번검색">
						</div>
						<!--end::Search-->
					</div>
				</div>
				<div class="card-body pt-3 pb-1">
					<div id="kt_table_users_wrapper"
						class="dataTables_wrapper dt-bootstrap4 no-footer">
						<div class="table-responsive">
							<table class="table align-middle gs-0 gy-4">
								<thead>
									<tr class="border-0">
										<th class="p-0 min-w-100px"></th>
										<th class="p-0 min-w-100px"></th>
										<th class="p-0 min-w-100px"></th>
										<th class="p-0 min-w-100px"></th>
										<th class="p-0 min-w-50px"></th>
										<th class="p-0 min-w-100px text-end"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${lists}">
										<c:if test="${list.approve != 'Y'}">
											<tr>
												<td>
													<div class="d-flex align-items-center">
														<div class="symbol symbol-45px me-5">
															<img
																style="margin-left: 10px; width: 45px; height: 45px;"
																src="./assets/images/vacation.png">
														</div>
														<div style="flex: 0 0 25px;"></div>
														<div class="symbol symbol-45px me-5">
															<p class="text-gray-800 fw-bold mb-1 fs-6">${list.doc_no}</p>
														</div>
													</div>
												</td>
												<td class="text-end"><a href="#" data-title="asdfd"
													data-content="<p>adg</p>" onclick="showModal(this)"
													class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6"
													style="text-align: center;" data-bs-toggle="modal"
													data-bs-target="#kt_modal_select_location">${list.doc_name}</a>
													<span class="text-gray-500 fw-semibold d-block fs-7"
													style="text-align: center;">${list.doc_regdate}</span></td>
												<td class="text-end"><a href="#"
													style="text-align: center;"
													class="text-gray-800 fw-bold text-hover-primary d-block mb-1 fs-6">${list.emp_name}</a>
												</td>
												<td class="text-end">
													<p style="text-align: center;"
														class="text-gray-800 fw-bold d-block mb-1 fs-6">${list.doc_exp}</p>
												</td>
												<td class="text-end" style="text-align: center;">
													<form id="form_${list.doc_no}" action="./approval.do"
														method="post">
														<input type="hidden" name="doc_no" value="${list.doc_no}" />
														<input class="btn btn-success" type="button" value="승인"
															onclick="submitForm('form_${list.doc_no}')">
													</form>
												</td>


												<td class="text-end" style="text-align: center;"><input
													class="btn btn-danger rejection-button" type="button"
													onclick="toggleRejectionContainer(this)" value="반려">
												</td>
											</tr>
											<tr class="rejection-row hidden">
												<td colspan="6">
													<div class="rejection-container">
														<form id="form1_${list.doc_no}" action="./rejection.do" method="post">
														<input class="rejection-comment" name="rejectComment"
															type="text" placeholder="반려 멘트를 입력하세요"
															style="width: 1100px;">
															<input type="hidden" name="doc_no" value="${list.doc_no}" />
															<input class="btn btn-primary" type="button" value="제출"
																onclick="submitForm1('form1_${list.doc_no}')">
														</form>
													</div>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="kt_modal_select_location" tabindex="-1"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog mw-1000px">
					<div class="modal-content">
						<div class="modal-header">
							<h2 id="modalTitle"></h2>
						</div>
						<div class="modal-body">
							<div id="modalContent"></div>
						</div>
						<div class="modal-footer d-flex justify-content-end">
							<form action="./modifyTemplate.do" method="get">
								<input type="submit" id="kt_modal_select_location_button"
									class="btn btn-primary" data-bs-dismiss="modal" value="수정">
								<a href="#" class="btn btn-active-light me-5"
									data-bs-dismiss="modal">취소</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./footer.jsp"%>
</body>
<script type="text/javascript">
	function showModal(element) {
		var title = element.getAttribute('data-title');
		var content = element.getAttribute('data-content');

		document.getElementById('modalTitle').textContent = title;
		document.getElementById('modalContent').innerHTML = content;
	}

	function toggleRejectionContainer(button) {
		// Find the closest row
		let row = button.closest('tr');
		// Find the next row which should be the rejection row
		let rejectionRow = row.nextElementSibling;

		if (rejectionRow && rejectionRow.classList.contains('rejection-row')) {
			// Toggle visibility
			rejectionRow.classList.toggle('hidden');
		}
	}

	function submitForm(formId) {
		document.getElementById(formId).submit();
	}
	
	function submitForm1(formId1) {
		document.getElementById(formId1).submit();
	}

</script>

</html>
