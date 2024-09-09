//마이프로필 수정 js
document.addEventListener("DOMContentLoaded", function() {
	const form = document.getElementById('updateForm');
	const passwordField = document.getElementById('emp_password');
	const passwordConfirmField = document.getElementById('emp_password_confirm');

	form.addEventListener('submit', function(event) {
		if (!passwordField.value.trim() || !passwordConfirmField.value.trim()) {
			alert('비밀번호와 비밀번호 확인을 입력해 주세요.');
			event.preventDefault(); // 폼 제출 방지
		}
	});
});