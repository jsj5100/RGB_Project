document.addEventListener("DOMContentLoaded", function() {
	const form = document.getElementById('updateForm');
	const passwordField = document.getElementById('emp_password');
	const passwordConfirmField = document.getElementById('emp_password_confirm');
	const phoneField = document.querySelector('input[name="emp_phone"]');
	const emailField = document.querySelector('input[name="emp_email"]');
	const stateField = document.querySelector('select[name="emp_state"]');

	const passwordError = document.getElementById('passwordError');
	const passwordConfirmError = document.getElementById('passwordConfirmError');
	const phoneError = document.getElementById('phoneError');
	const emailError = document.getElementById('emailError');
	const stateError = document.getElementById('stateError');

	form.addEventListener('submit', function(event) {
		let isValid = true;

		// 비밀번호 유효성 검사 (영문, 숫자, 특수문자 조합, 8자리 이상)
		const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
		if (!passwordField.value.trim()) {
			passwordError.innerHTML = '비밀번호를 입력해 주세요.';
			passwordError.classList.remove('d-none'); // 에러 메시지 표시
			isValid = false;
		} else if (!passwordRegex.test(passwordField.value.trim())) {
			passwordError.innerHTML = '비밀번호는 영문, 숫자, 특수문자를 포함하여 8자리 이상이어야 합니다.';
			passwordError.classList.remove('d-none'); // 에러 메시지 표시
			isValid = false;
		} else {
			passwordError.innerHTML = ''; // 오류 메시지 제거
			passwordError.classList.add('d-none'); // 숨기기
		}

		// 비밀번호 확인
		if (!passwordConfirmField.value.trim()) {
			passwordConfirmError.innerHTML = '비밀번호 확인을 입력해 주세요.';
			passwordConfirmError.classList.remove('d-none'); // 에러 메시지 표시
			isValid = false;
		} else if (passwordField.value !== passwordConfirmField.value) {
			passwordConfirmError.innerHTML = '비밀번호와 비밀번호 확인이 일치하지 않습니다.';
			passwordConfirmError.classList.remove('d-none'); // 에러 메시지 표시
			isValid = false;
		} else {
			passwordConfirmError.innerHTML = ''; // 오류 메시지 제거
			passwordConfirmError.classList.add('d-none'); // 숨기기
		}

		// 전화번호 유효성 검사 (000-0000-0000 형식)
		const phoneRegex = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if (!phoneRegex.test(phoneField.value.trim())) {
			phoneError.innerHTML = '전화번호는 000-0000-0000 형식으로 입력해 주세요.';
			phoneError.classList.remove('d-none'); // 에러 메시지 표시
			isValid = false;
		} else {
			phoneError.innerHTML = ''; // 오류 메시지 제거
			phoneError.classList.add('d-none'); // 숨기기
		}

		// 이메일 유효성 검사 (일반적인 이메일 형식)
		const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		if (!emailRegex.test(emailField.value.trim())) {
			emailError.innerHTML = '이메일은 올바른 형식으로 입력해 주세요.';
			emailError.classList.remove('d-none'); // 에러 메시지 표시
			isValid = false;
		} else {
			emailError.innerHTML = ''; // 오류 메시지 제거
			emailError.classList.add('d-none'); // 숨기기
		}

		// 재직 여부 유효성 검사 (Y or N)
		if (stateField.value.trim() !== 'Y' && stateField.value.trim() !== 'N') {
			stateError.innerHTML = '재직여부는 Y 또는 N으로 입력해 주세요.';
			stateError.classList.remove('d-none'); // 에러 메시지 표시
			isValid = false;
		} else {
			stateError.innerHTML = ''; // 오류 메시지 제거
			stateError.classList.add('d-none'); // 숨기기
		}

		// 폼 제출 방지 및 오류 메시지 표시
		if (!isValid) {
			event.preventDefault(); // 폼 제출 방지
		} else {
			// 폼 제출 후 성공 메시지 표시
			alert('프로필 수정이 완료되었습니다.');
		}
	});
});
