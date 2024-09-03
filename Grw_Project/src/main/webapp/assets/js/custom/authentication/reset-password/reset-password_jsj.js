document.addEventListener('DOMContentLoaded', function() {
	var form = document.querySelector("#kt_password_reset_form");
	var formValidator = FormValidation.formValidation(
		form,
		{
			fields: {
				name: {
					validators: {
						notEmpty: {
							message: "이름을 입력해 주세요"
						},
						stringLength: {
							min: 2,
							max: 10,
							message: "이름은 2자리에서 10자리 사이여야 합니다"
						}
					}
				},
				emp_no: {
					validators: {
						notEmpty: {
							message: "사원번호를 입력해 주세요"
						},
						regexp: {
							regexp: /^[0-9]{6}$/,
							message: "숫자로 된 사원번호를 정확히 6자리 입력해주세요"
						}
					}
				},
				email: {
					validators: {
						notEmpty: {
							message: "이메일을 입력해 주세요"
						},
						regexp: {
							regexp: /^[^\s@]+@[^\s@]+\.[^\s@]+$/,
							message: "올바른 이메일 주소가 아닙니다"
						}
					}
				}
			},
			plugins: {
				trigger: new FormValidation.plugins.Trigger(),
				bootstrap: new FormValidation.plugins.Bootstrap5({
					rowSelector: ".fv-row",
					eleInvalidClass: "",
					eleValidClass: ""
				})
			}
		}
	);
	//	버튼으로 전환
	//	document.querySelector("#kt_auth_code_submit").addEventListener("click", function(e) {
	//		e.preventDefault();
	//		formValidator.validate().then(function(status) {
	//			if (status === "Valid") {
	//				Swal.fire({
	//					icon: 'success',
	//					title: '성공',
	//					text: '정보가 올바르게 입력되었습니다.'
	//				});
	//			} else {
	//				Swal.fire({
	//					icon: 'error',
	//					title: '오류',
	//					text: '정보를 올바르게 입력해 주세요.'
	//				});
	//			}
	//		});
	//	});
});

$(document).ready(function() {
	// 이메일 전송 버튼 클릭 시
	$('#kt_password_reset_submit').on('click', function(e) {
		console.log('Button clicked'); // 버튼 클릭 시 로그 확인
		e.preventDefault(); // 기본 폼 제출 방지

		// 폼 데이터를 가져오기
		var formData = {
			name: $('input[name="name"]').val(),
			emp_no: $('input[name="emp_no"]').val(),
			email: $('input[name="email"]').val()
		};
		console.log('Sending AJAX request with data:', formData);

		// 서버에 AJAX 요청
		$.ajax({
			url: './mailSender.do',
			type: 'POST',
			data: formData,
			dataType: 'json', // JSON 응답 처리
			success: function(response) {
				if (response.success) {
					Swal.fire({
						icon: 'success',
						title: '성공',
						text: response.message
					});
					console.log('Response:', response); // 응답 확인
				} else {
					Swal.fire({
						icon: 'error',
						title: '오류',
						text: response.message
					});
					console.error('AJAX Error:', response); // 오류 로그 확인
				}
			},
			error: function() {
				Swal.fire({
					icon: 'error',
					title: '오류',
					text: '요청 처리 중 오류가 발생했습니다.'
				});
			}
		});
	});

	// 타이머 및 인증 코드 확인 버튼 클릭 시
	$('#kt_auth_code_submit').on('click', function() {
		const email = $('input[name="email"]').val();
		const authCode = $('input[name="auth_code"]').val();

		$.post('./verifyAuthCode.do', {
			email: email,
			authCode: authCode
		}).done(function(response) {
			if (response.redirect) {
				window.location.href = response.redirect;
			} else {
				Swal.fire({
					icon: 'error',
					title: '오류',
					text: '인증 코드가 올바르지 않습니다.'
				});
			}
		}).fail(function() {
			Swal.fire({
				icon: 'error',
				title: '오류',
				text: '인증 코드 확인 중 오류가 발생했습니다.'
			});
		});
	});
});