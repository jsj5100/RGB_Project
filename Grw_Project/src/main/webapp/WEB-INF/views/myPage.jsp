<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rgb.grw.dto.MyPageDto" %>
<%@ page import="com.rgb.grw.dto.UserInfoDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 페이지</title>
<style>
.masked-password {
	display: inline-block;
	position: relative;
	color: black; /* 마스크 문자 색상 */
}
</style>
<%@ include file="./header.jsp"%>
</head>

<%
// 세션에서 로그인한 사용자 정보를 가져온다
MyPageDto myPageDto = (MyPageDto) request.getAttribute("myPageDto");

// 입사일을 포맷팅
String formattedDate = "";
if (myPageDto != null) {
	Date empJoinDate = myPageDto.getEmp_joindate();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일");
	formattedDate = formatter.format(empJoinDate);
} else {
	formattedDate = "-";
}

// 로그인한 사용자와 요청된 사용자 정보가 같은지 확인
boolean isSameUser = (loginDto != null && myPageDto != null && loginDto.getEmp_no().equals(myPageDto.getEmp_no()));

// 요청된 사용자의 권한이 "인사관리자"인지 확인
boolean isAdmin = (myPageDto != null && "인사관리자".equals(myPageDto.getAuth_name()));
%>

<body>
    <div id="kt_app_content" class="app-content flex-column-fluid">
        <div id="kt_app_content_container" class="app-container container-xxl" style="padding-top: 15px">
            <div class="card">
                <div class="card-body">
                    <div class="card card-flush mb-9" id="kt_user_profile_panel">
                        <div class="card-header rounded-top bgi-size-cover h-200px" 
                             style="background-position: 100% 50%; background-image: url('assets/media/misc/profile-head-bg.jpg')"></div>
                        <div class="card-body mt-n19">
                            <div class="m-0">
                                <div class="d-flex flex-stack align-items-end pb-4 mt-n19">
                                    <div class="symbol symbol-125px symbol-lg-150px symbol-fixed position-relative mt-n3">
                                        <img src="<%= myPageDto.getEmp_photo_url() %>" alt="image"
                                             class="border border-white border-4" style="border-radius: 20px">
                                        <div class="position-absolute translate-middle bottom-0 start-100 ms-n1 mb-9 bg-success rounded-circle h-15px w-15px"></div>
                                    </div>
                                </div>
                                <div class="d-flex flex-stack flex-wrap align-items-end">
                                    <div class="d-flex flex-column">
                                        <div class="d-flex align-items-center mb-2">
                                            <a href="#" class="text-gray-800 text-hover-primary fs-1 fw-bolder me-1">
                                                ${myPageDto.emp_name}
                                            </a>
                                            <span class="fw-bold text-gray-600 fs-8 mb-2 d-block">
                                                ${myPageDto.emp_gender}
                                            </span>
                                        </div>
                                        <div class="d-flex align-items-center flex-wrap fw-semibold fs-7 pe-2">
                                            <div id=tierBadge class="badge badge-lg d-inline">
                                                ${myPageDto.tier_name}
                                            </div>
                                        </div>
										<script>
										    document.addEventListener("DOMContentLoaded", function() {
										        const tierBadge = document.getElementById("tierBadge");
										        const tierName = tierBadge.textContent.trim();
										
										        switch (tierName) {
										            case "사원":
										                tierBadge.classList.add("badge-light-primary");
										                break;
										            case "주임":
										                tierBadge.classList.add("badge-light-info");
										                break;
										            case "대리":
										                tierBadge.classList.add("badge-light-secondary");
										                break;
										            case "과장":
										                tierBadge.classList.add("badge-light-danger");
										                break;
										            case "차장":
										                tierBadge.classList.add("badge-light-warning");
										                break;
										            case "부장":
										                tierBadge.classList.add("badge-light-info");
										                break;
										            case "대표":
										                tierBadge.classList.add("badge-light-success");
										                break;
										            default:
										                tierBadge.classList.add("badge-light-secondary"); // 기본 스타일
										                break;
										        }
										    });
										</script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex flex-stack fs-4 py-3 justify-content-between">
                        <div class="fw-bold rotate collapsible" data-bs-toggle="collapse"
                             href="#kt_user_view_details" role="button" aria-expanded="false"
                             aria-controls="kt_user_view_details">
                            Details <span class="ms-2 rotate-180"> <i class="ki-duotone ki-down fs-3"></i></span>
                        </div>
                        <div class="d-flex">
                            <%-- 수정 버튼: 로그인한 사용자와 요청된 사용자가 동일할 때 표시 --%>
                            <% if (isSameUser) { %>
                                <span data-bs-toggle="tooltip" data-bs-trigger="hover"
                                      data-bs-original-title="Edit customer details"
                                      data-kt-initialized="1">
                                    <a href="./myPageEdit.do" class="btn btn-sm btn-light-primary me-2" data-bs-toggle="modal">수정</a>
                                </span>
                            <% } %>
                            
                            <%-- 관리자 수정 버튼: 요청된 사용자의 권한이 "인사관리자"일 때 표시 --%>
                            <% if (isAdmin) { %>
                                <span data-bs-toggle="tooltip" data-bs-trigger="hover"
                                      data-bs-original-title="Edit customer details"
                                      data-kt-initialized="1">
                                    <a href="./empPageEdit.do" class="btn btn-sm btn-light-danger" data-bs-toggle="modal">관리자 수정</a>
                                </span>
                            <% } %>
                        </div>
                    </div>

                    <div class="separator"></div>
                    <div id="kt_user_view_details" class="collapse show">
                        <div class="pb-5 fs-6">
                            <div class="fw-bold mt-5">사원번호</div>
                            <div class="text-gray-600">${myPageDto.emp_no}</div>
                            <div class="fw-bold mt-5">부서</div>
                            <div class="border border-dashed rounded min-w-50px py-3 px-4 mx-2 mb-3">
                                부서코드
                                <div class="text-gray-600">${myPageDto.dep_no}</div><br>
                                부서명
                                <div class="text-gray-600">${myPageDto.dep_name}</div>
                            </div>
                            <div class="fw-bold mt-5">권한</div>
                            <div class="border border-dashed rounded min-w-50px py-3 px-4 mx-2 mb-3">
                                권한코드
                                <div class="text-gray-600">${myPageDto.auth_no}</div><br>
                                권한명
                                <div class="text-gray-600">${myPageDto.auth_name}</div>
                            </div>
                            <div class="fw-bold mt-5">비밀번호</div>
                            <div class="text-gray-600 masked-password" data-password="<%= myPageDto.getEmp_password() %>"></div>
                            <div class="fw-bold mt-5">주민등록번호</div>
                            <div class="text-gray-600">${myPageDto.emp_idnum}******</div>
                            <div class="fw-bold mt-5">전화번호</div>
                            <div class="text-gray-600">${myPageDto.emp_phone}</div>
                            <div class="fw-bold mt-5">Email</div>
                            <div class="text-gray-600">${myPageDto.emp_email}</div>
                            <div class="fw-bold mt-5">입사일</div>
                            <div class="text-gray-600">${formattedDate}</div>
                            <div class="fw-bold mt-5">재직여부</div>
                            <div class="text-gray-600">${myPageDto.emp_state}</div>
                        </div>
                    </div>
                    <div class="text-center pt-10">
                        <button onclick="location.href='./home.do'" type="reset" class="btn btn-light me-3" data-kt-users-modal-action="cancel">메인화면</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	document.querySelectorAll('.masked-password').forEach(function(el) {
		const password = el.getAttribute('data-password');
		const maskedPassword = '*'.repeat(password.length);
		el.textContent = maskedPassword;
	});
</script>
<%@ include file="./footer.jsp"%>
</html>
