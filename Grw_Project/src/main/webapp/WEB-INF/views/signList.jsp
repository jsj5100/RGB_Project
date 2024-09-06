<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
<script type="text/javascript" src="./js/signaturePad.js"></script>
<title>서명관리</title>
<style type="text/css">
.outer-container {
	width: 500px;
	height: 400px;
	border: 1px solid #ccc;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
}

.inner-container {
	width: 300px;
	height: 300px;
	border: 1px solid #ccc;
	padding: 10px;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.inner-box {
	width: 100%;
	height: 200px;
	border: 1px solid #ccc;
	margin-top: 20px;
	box-sizing: border-box;
}

.actions {
	margin-top: 20px;
	text-align: center;
	display: flex; /* 플렉스박스를 사용하여 한 줄에 나란히 배치 */
	justify-content: center; /* 가운데 정렬 */
	gap: 10px; /* 버튼 사이에 간격 추가 */
}

#signature-pad-div {
	border: 1px solid #ccc;
	width: 950px;
	height: 450px;
	position: relative;
}

#signature-pad-div canvas {
	position: absolute;
	left: 0;
	top: 0;
}

.inner-box img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
	/* or 'cover' if you want the image to cover the div */
}
</style>
</head>
<%@include file="./header.jsp"%>
<body>
	<div style="padding-left: 80px; margin-top: 10px;" id="kt_app_content"
		class="app-content flex-column-fluid">
		<div style="padding-left: 80px;" id="kt_app_content_container"
			class="app-container container-xxl">
			<div class="card">
				<div class="card-body">
					<div class="outer-container">
						<div class="inner-container">
							<p>보유중인 서명</p>
							<div class="inner-box">
								<c:if test="${signImg != null && !signImg.isEmpty()}">
									<img src="data:image/png;base64,${signImg}" alt="Sign-Image" />
								</c:if>
								<c:if test="${signImg == null || signImg.isEmpty()}">
									<img src="data:image/png;base64,${signImg}" alt="Sign-Image"
										style="display: none;" />
								</c:if>
							</div>
							<div class="actions">
								<c:if test="${signImg == null || signImg.isEmpty()}">
									<input type="submit" value="서명 등록" class="btn btn-primary"
										data-bs-toggle="modal"
										data-bs-target="#kt_modal_select_location"
										style="display: inline;">
								</c:if>
								
								<c:if test="${signImg != null && !signImg.isEmpty()}">
									<form id="delete-sign-form" action="./deleteSign.do" method="post">
										<input type="submit" value="서명 삭제" class="btn btn-primary" onsubmit="delSignCheck()">
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 서명등록 모달창 -->
		<div class="modal fade" id="kt_modal_select_location" tabindex="-1"
			style="display: none;" aria-hidden="true">
			<!--begin::Modal dialog-->
			<div class="modal-dialog mw-1000px">
				<!--begin::Modal content-->
				<div class="modal-content">
					<!--begin::Modal header-->
					<div class="modal-header">
						<!--begin::Title-->
						<h2>서명 작성</h2>
					</div>
					<!--end::Modal header-->
					<!--begin::Modal body-->
					<div class="modal-body">
						<div id="signature-pad-div">
							<canvas></canvas>
						</div>
					</div>
					<!--end::Modal body-->
					<!--begin::Modal footer-->
					<div class="modal-footer d-flex justify-content-end">
						<input type="button" id="saveSign" value="저장"
							class="btn btn-primary" data-bs-dismiss="modal"> <input
							type="button" id="clearSign" value="지우기" class="btn btn-primary">
						<a href="#" class="btn btn-active-light me-5"
							data-bs-dismiss="modal">취소</a>
					</div>
					<!--end::Modal footer-->
				</div>
				<!--end::Modal content-->
			</div>
			<!--end::Modal dialog-->
		</div>
		<!-- 서명수정 모달창 -->
		<div class="modal fade" id="kt_modal_modify" tabindex="-1"
			style="display: none;" aria-hidden="true">
			<!--begin::Modal dialog-->
			<div class="modal-dialog mw-1000px">
				<!--begin::Modal content-->
				<div class="modal-content">
					<!--begin::Modal header-->
					<div class="modal-header">
						<!--begin::Title-->
						<h2>서명 작성</h2>
					</div>
					<!--end::Modal header-->
					<!--begin::Modal body-->
					<div class="modal-body">
						<div id="signature-pad-div">
							<canvas></canvas>
						</div>
					</div>
					<!--end::Modal body-->
					<!--begin::Modal footer-->
					<div class="modal-footer d-flex justify-content-end">
						<input type="button" id="saveSign" value="저장"
							class="btn btn-primary" data-bs-dismiss="modal"> <input
							type="button" id="clearSign" value="지우기" class="btn btn-primary">
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
</html>