<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RGB Groupware Project</title>
<style type="text/css">

#innerSignBox{
	display: flex;
	flex-direction: row;
	margin-left: 281px;
}

.sign-box {
    width: 80px;
    height: 80px; /* 내부 박스들의 총 높이 */
    border: 1px solid black;
    display: flex;
    flex-direction: column; 
    box-sizing: border-box;
}

.inner-name-box {
    border-bottom: 1px solid black; /* 아래쪽 경계선 추가 */
    width: 100%; /* 부모 컨테이너와 같은 너비 */
    height: 24px; /* 80px의 3/10 높이 */
    padding: 0px;
    margin: 0px;
    justify-content: center;
}

.inner-sign-box {
    width: 100%; /* 부모 컨테이너와 같은 너비 */
    height: 56px; /* 80px의 7/10 높이 */
    padding: 0px;
    margin: 0px;
}
	
	#innerSignBox .inner-sign-box img{
		 max-width: 100%;
         max-height: 100%;
         width: auto;
         height: auto;
	}
	
	.table-responsive{
		display: flex;
		justify-content: center;
		flex-direction: column;
	}
	
	table{
		position: relative;
		z-index: 1;
	}
	
</style>
</head>
<%@include file="./header.jsp"%>
<body>
	<div style="padding-left: 80px; margin-top: 10px;" id="kt_app_content"
		class="app-content flex-column-fluid">
		<div style="padding-left: 80px;" id="kt_app_content_container"
			class="app-container container-xxl">
			<div style="width: 100%; height: auto; margin-top: 10px;"
				class="card">
				<div class="card-header border-0 pt-5">
					<h3 class="card-title align-items-start flex-column">
						
					</h3>
					<div class="card-title">
						<!--begin::Search-->
						<div class="d-flex align-items-center position-relative my-1">
						</div>
						<!--end::Search-->
					</div>
				</div>
				<div class="card-body pt-3 pb-1">
					<div id="kt_table_users_wrapper"
						class="dataTables_wrapper dt-bootstrap4 no-footer">
						<div class="table-responsive">
							<div id="kt_table_users_wrapper"
								class="dataTables_wrapper dt-bootstrap4 no-footer">
								<div>
									<div id="innerSignBox"></div>
									<div class="table-responsive">
										${appDocOne.doc_content}
									</div>
								</div>
							</div>
						</div>
					</div>
					<button class="btn btn-primary" onclick="goBack()">뒤로가기</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="./footer.jsp"%>
</body>
<script type="text/javascript">
	function goBack(){
		window.history.back();
	}
</script>
<script type="text/javascript" src="./js/insertSignBox.js"></script>
</html>