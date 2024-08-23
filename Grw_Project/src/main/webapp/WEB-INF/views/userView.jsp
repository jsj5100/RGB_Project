<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="./header.jsp"%>
</head>

<body>
<!--     <div class="d-flex flex-column flex-lg-row"> -->
<!--         begin::Sidebar -->
<!--         <div class="flex-column flex-lg-row-auto w-lg-250px w-xl-350px mb-10"> -->
<!--             begin::Card -->
<!--             <div class="card mb-5 mb-xl-8"> -->
<!--                 begin::Card body -->
                
<!--                 end::Card body -->
<!--             </div> -->
<!--             end::Card -->
<!--             begin::Connected Accounts -->
            
<!--             end::Connected Accounts -->
<!--         </div> -->
<!--         end::Sidebar -->
<!--         begin::Content -->
        
<!--         end::Content -->
<!--     </div> -->


<div id="kt_app_content" class="app-content flex-column-fluid"> <!-- box centering -->
		<!--begin::Content container-->
		<div id="kt_app_content_container" class="app-container container-xxl">
			<!--begin::Card-->
			<div class="card">
			
	<div class="card-body">
                    <!--begin::Summary-->
                    <!--begin::User Info-->
                    <div class="d-flex flex-center flex-column py-5">
                        <!--begin::Avatar-->
                        <div class="symbol symbol-100px symbol-circle mb-7">
                            <img src="assets/media/avatars/300-6.jpg" alt="image">
                        </div>
                        <!--end::Avatar-->
                        <!--begin::Name-->
                        <a href="#" class="fs-3 text-gray-800 text-hover-primary fw-bold mb-3">아비게일</a>
                        <!--end::Name-->
                        <!--begin::Position-->
                        <div class="mb-9">
                            <!--begin::Badge-->
                            <div class="badge badge-lg badge-light-primary d-inline">대표</div>
                            <!--begin::Badge-->
                        </div>
                        <!--end::Position-->
                        <!--begin::Info-->
                        <!--begin::Info heading-->
                        
                        <!--end::Info heading-->
                        <div class="d-flex flex-wrap flex-center">
                            <!--begin::Stats-->
                            
                            <!--end::Stats-->
                            <!--begin::Stats-->
                            
                            <!--end::Stats-->
                            <!--begin::Stats-->
                            
                            <!--end::Stats-->
                        </div>
                        <!--end::Info-->
                    </div>
                    <!--end::User Info-->
                    <!--end::Summary-->
                    <!--begin::Details toggle-->
                    <div class="d-flex flex-stack fs-4 py-3">
                        <div class="fw-bold rotate collapsible" data-bs-toggle="collapse" href="#kt_user_view_details" role="button" aria-expanded="false" aria-controls="kt_user_view_details">Details 
                        <span class="ms-2 rotate-180">
                            <i class="ki-duotone ki-down fs-3"></i>
                        </span></div>
                        <span data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-original-title="Edit customer details" data-kt-initialized="1">
                            <a href="#" class="btn btn-sm btn-light-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_update_details">수정</a>
                        </span>
                    </div>
                    <!--end::Details toggle-->
                    <div class="separator"></div>
                    <!--begin::Details content-->
                    <div id="kt_user_view_details" class="collapse show">
                        <div class="pb-5 fs-6">
                            <!--begin::Details item-->
                            <div class="fw-bold mt-5">이름</div>
                            <div class="text-gray-600">홍길동</div>
                            <!--begin::Details item-->
                           
                            <!--begin::Details item-->
<!--                             <div class="fw-bold mt-5">Address</div> -->
<!--                             <div class="text-gray-600">101 Collin Street,  -->
<!--                             <br>Melbourne 3000 VIC -->
<!--                             <br>Australia</div> -->
                            <!--begin::Details item-->
                            <!--begin::Details item-->
                            <div class="fw-bold mt-5">재직여부</div>
                            <div class="text-gray-600">Y</div>
                            <!--begin::Details item-->
                            <!--begin::Details item-->
                            <div class="fw-bold mt-5">비밀번호</div>
                            <div class="text-gray-600">********</div>
                            <!--begin::Details item-->
                            <!--begin::Details item-->
                            <div class="fw-bold mt-5">권한</div>
                            <div class="text-gray-600">인사관리자</div>
                            <!--begin::Details item-->
                            <!--begin::Details item-->
                             <div class="fw-bold mt-5">Email</div>
                             <div class="text-gray-600">
                                 <a href="#" class="text-gray-600 text-hover-primary">info@keenthemes.com</a>
                             </div>
                            <!--begin::Details item-->
                            <!--begin::Details item-->
                            <div class="fw-bold mt-5">전화번호</div>
                            <div class="text-gray-600">010-1111-3456</div>
                            <!--begin::Details item-->
                                    
                        </div>
                    </div>
                    <!--end::Details content-->
                    <div class="text-center pt-10">
                        <button type="reset" class="btn btn-light me-3" data-kt-users-modal-action="cancel">나가기</button>
                        <button type="submit" class="btn btn-primary" data-kt-users-modal-action="submit">
                            <span class="indicator-label">수정완료</span>
                            <span class="indicator-progress">등록중... 
                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                        </button>
                    </div>
                    
                </div>
                </div>
                </div>
</div>


</body>


<!-- Code injected by live-server -->
<script>
	// <![CDATA[  <-- For SVG support
	if ('WebSocket' in window) {
		(function () {
			function refreshCSS() {
				var sheets = [].slice.call(document.getElementsByTagName("link"));
				var head = document.getElementsByTagName("head")[0];
				for (var i = 0; i < sheets.length; ++i) {
					var elem = sheets[i];
					var parent = elem.parentElement || head;
					parent.removeChild(elem);
					var rel = elem.rel;
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
					}
					parent.appendChild(elem);
				}
			}
			var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
			var address = protocol + window.location.host + window.location.pathname + '/ws';
			var socket = new WebSocket(address);
			socket.onmessage = function (msg) {
				if (msg.data == 'reload') window.location.reload();
				else if (msg.data == 'refreshcss') refreshCSS();
			};
			if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
				console.log('Live reload enabled.');
				sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
			}
		})();
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}
	// ]]>
</script>


<%@include file="./footer.jsp"%>
</html>