<%@page import="java.util.List"%>
<%@page import="com.rgb.grw.dto.MyPageDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리자수정 페이지</title>
<%@include file="./header.jsp"%>
</head>

<%
// request 객체에서 데이터 가져오기
MyPageDto myPageDto = (MyPageDto) request.getAttribute("myPageDto");
List<MyPageDto> optionsList = (List<MyPageDto>) request.getAttribute("optionsList");

String formattedDate = "";
if (myPageDto != null) {
	Date empJoinDate = myPageDto.getEmp_joindate();
	if (empJoinDate != null) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
		formattedDate = formatter.format(empJoinDate);
	} else {
		formattedDate = "-";
	}
} else {
	formattedDate = "-";
}
%>

<body>
	<div id="kt_app_content" class="app-content flex-column-fluid">
		<div id="kt_app_content_container" class="app-container container-xxl"
			style="padding-top: 15px">
			<div class="card">
				<div class="card-body">
					<form action="updateMyPage.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="emp_no"
							value="<%=myPageDto != null ? myPageDto.getEmp_no() : ""%>">
						<div class="card card-flush mb-9" id="kt_user_profile_panel">
							<div class="card-header rounded-top bgi-size-cover h-200px"
								style="background-position: 100% 50%; background-image: url('assets/media/misc/profile-head-bg.jpg')"></div>
							<div class="card-body mt-n19">
								<div class="m-0">
									<div class="symbol symbol-125px symbol-lg-150px symbol-fixed position-relative mt-n3">
								    <!-- 미리보기 영역 -->
								    <div class="d-flex flex-stack align-items-center pb-4">
								        <div class="symbol symbol-125px symbol-lg-150px symbol-fixed position-relative">
								            <img id="previewImage" src="<%= myPageDto != null && myPageDto.getEmp_photo_url() != null ? myPageDto.getEmp_photo_url() : "" %>" alt="프로필사진" class="border border-white border-4" style="border-radius: 20px;">
								        </div>
								    </div>
								    
								    <!-- 파일 업로드 및 버튼 -->
								    <div class="mt-3">
								        <input type="file" id="reviewImageFileInput" name="emp_photo" accept="image/*" multiple value="<%=myPageDto != null ? myPageDto.getEmp_photo_url() : ""%>">
								        <div id="buttonContainer" style="display: none; margin-top: 10px;">
								            <button type="button" id="upload_button" class="btn btn-primary">프로필 변경</button>
								            <button type="button" id="delete_button" class="btn btn-danger">취소</button>
								        </div>
								    </div>
								</div>
									<div class="d-flex flex-stack flex-wrap align-items-end">
										<div class="d-flex flex-column">
											<div class="d-flex align-items-center mb-2">
												<a href="#"
													class="text-gray-800 text-hover-primary fs-1 fw-bolder me-1"><%=myPageDto != null ? myPageDto.getEmp_name() : ""%></a>
												<span class="fw-bold text-gray-600 fs-8 mb-2 d-block"><%=myPageDto != null ? myPageDto.getEmp_gender() : ""%></span>
											</div>
											<select name="tier_no"
												class="custom-select-wrapper form-select custom-select form-control form-control-solid mb-3 mb-lg-0"
												style="background-color: white; color: black; border: 1px solid #ccc; width: 100%; max-width: 200px;">
												<%
												if (optionsList != null) {
													for (MyPageDto option : optionsList) {
														if ("직위".equals(option.getType())) {
													String selected = option.getValue().equals(myPageDto.getTier_no()) ? "selected" : "";
												%>
												<option value="<%=option.getValue()%>" <%=selected%>><%=option.getName()%></option>
												<%
												}
												}
												}
												%>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="d-flex flex-stack fs-4 py-3">
							<div class="fw-bold rotate collapsible" data-bs-toggle="collapse"
								href="#kt_user_view_details" role="button" aria-expanded="false"
								aria-controls="kt_user_view_details">
								Details <span class="ms-2 rotate-180"> <i
									class="ki-duotone ki-down fs-3"></i>
								</span>
							</div>
						</div>
						<div class="separator"></div>
						<div id="kt_user_view_details" class="collapse show">
							<div class="pb-5 fs-6">
								<div class="fw-bold mt-5">사원번호</div>
								<div class="text-gray-600"><%=myPageDto != null ? myPageDto.getEmp_no() : ""%></div>
								<div class="fw-bold mt-5">부서</div>
								<select name="dep_no"
									class="custom-select-wrapper form-select custom-select form-control form-control-solid mb-3 mb-lg-0"
									style="background-color: white; color: black; border: 1px solid #ccc; width: 100%; max-width: 200px;">
									<%
									if (optionsList != null) {
										for (MyPageDto option : optionsList) {
											if ("부서".equals(option.getType())) {
										String selected = option.getValue().equals(myPageDto.getDep_no()) ? "selected" : "";
										out.println(
												"<option value=\"" + option.getValue() + "\" " + selected + ">" + option.getName() + "</option>");
											}
										}
									}
									%>
								</select>
								<div class="fw-bold mt-5">권한</div>
								<select name="auth_no"
									class="custom-select-wrapper form-select custom-select form-control form-control-solid mb-3 mb-lg-0"
									style="background-color: white; color: black; border: 1px solid #ccc; width: 100%; max-width: 200px;">
									<%
									if (optionsList != null) {
										for (MyPageDto option : optionsList) {
											if ("권한".equals(option.getType())) {
										String selected = option.getValue().equals(myPageDto.getAuth_no()) ? "selected" : "";
										out.println(
												"<option value=\"" + option.getValue() + "\" " + selected + ">" + option.getName() + "</option>");
											}
										}
									}
									%>
								</select>

								<div class="fw-bold mt-5">비밀번호</div>
								<div id="kt_new_password_form" class="border border-dashed rounded min-w-50px py-3 px-4 mx-2 mb-3" style="width: 500px;" data-kt-password-meter="true">
								    <div class="fw-bold mt-5">새 비밀번호</div>
								    <input type="password" name="emp_password" class="border border-2 rounded py-2 px-3 form-control" style="width: 300px;" placeholder="새 비밀번호" autocomplete="off">
								    <div class="d-flex align-items-center mb-3 mt-2" data-kt-password-meter-control="highlight">
								        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
								        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
								        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px me-2"></div>
								        <div class="flex-grow-1 bg-secondary bg-active-success rounded h-5px"></div>
								    </div>
								    <div class="text-muted">비밀번호는 영문 대/소문자 및 숫자 조합으로 8~16자리로 설정하세요.</div>
								    <div class="fw-bold mt-5">비밀번호 확인</div>
								    <input type="password" name="emp_password_confirm" class="border border-2 rounded py-2 px-3 form-control" style="width: 300px;" placeholder="비밀번호 확인">
								</div>
							</div>

						<div class="fw-bold mt-5">주민등록번호</div>
						<div class="text-gray-600">${myPageDto.emp_idnum}******</div>

						<div class="fw-bold mt-5">전화번호</div>
						<input type="text" name="emp_phone" value="<%=myPageDto != null ? myPageDto.getEmp_phone() : ""%>"
							class="form-control form-control-solid" style="width: 300px;">

						<div class="fw-bold mt-5">이메일</div>
						<input type="email" name="emp_email"
							value="<%=myPageDto != null ? myPageDto.getEmp_email() : ""%>"
							class="form-control form-control-solid" style="width: 300px;">

						<div class="fw-bold mt-5">입사일</div>
						<div class="text-gray-600"><%= formattedDate %></div>
						<div class="fw-bold mt-5">재직여부</div>
						<input type="text" name="emp_state" value="<%=myPageDto != null ? myPageDto.getEmp_state() : ""%>"
							class="form-control form-control-solid min-w-50px py-3 px-4 mx-2 mb-3" style="width: 300px;">
						</div>
						<div class="text-center pt-10">
							<button onclick="location.href='./myPage.do'" type="reset"
								class="btn btn-light me-3" data-kt-users-modal-action="cancel">수정취소</button>
							<button type="submit" class="btn btn-primary"
								data-kt-users-modal-action="submit">
								<span class="indicator-label">수정완료</span> <span
									class="indicator-progress">등록중... <span
									class="spinner-border spinner-border-sm align-middle ms-2"></span>
								</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script src="./assets/js/custom/authentication/reset-password/new-password_jsj.js"></script>
<script src="./js/photoUpload.js"></script>
</body>

<%@ include file="./footer.jsp"%>
</html>
