//이메일 전송 js
document.addEventListener('DOMContentLoaded', function() {
	var form = document.querySelector("#kt_password_reset_form");
	var formValidator = FormValidation.formValidation(
		form,
		{
			fields: {
				emp_name: {
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
				emp_email: {
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
});

$(document).ready(function() {
	let timerInterval;

	function startTimer(duration) {
		let timer = duration, minutes, seconds;
		timerInterval = setInterval(function() {
			minutes = parseInt(timer / 60, 10);
			seconds = parseInt(timer % 60, 10);

			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;

			$('#timer').text(minutes + ":" + seconds);

			if (--timer < 0) {
				clearInterval(timerInterval);
				$('#timer').text('00:00');
				$('input[name="auth_code"]').prop('disabled', true).addClass('disabled-field');
				$('#kt_auth_code_submit').prop('disabled', true);
			}
		}, 1000);
	}

	$('#kt_password_reset_submit').on('click', function(e) {
		e.preventDefault(); // 기본 폼 제출 방지

		// 폼 데이터 가져오기
		var formData = {
			emp_name: $('input[name="emp_name"]').val(),
			emp_no: $('input[name="emp_no"]').val(),
			emp_email: $('input[name="emp_email"]').val()
		};

		$.ajax({
			url: './mailSender.do',
			type: 'POST',
			data: formData,
			dataType: 'json',
			success: function(response) {
				if (response.success) {
					Swal.fire({
						icon: 'success',
						title: '성공',
						text: response.message
					});
					// 인증 코드 입력 필드 활성화
					$('input[name="auth_code"]').prop('disabled', false).removeClass('disabled-field');
					$('#kt_auth_code_submit').prop('disabled', false);

					// 타이머 시작 (5분 = 300초)
					startTimer(300);
				} else {
					Swal.fire({
						icon: 'error',
						title: '오류',
						text: response.message
					});
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

	$('#kt_auth_code_submit').on('click', function() {
		const email = $('input[name="emp_email"]').val();
		const authCode = $('input[name="auth_code"]').val();
		const emp_no = $('input[name="emp_no"]').val();

		$.post('./verifyAuthCode.do', {
			email: email,
			authCode: authCode,
			emp_no: emp_no
		}).done(function(response) {
			if (response.success) {
				Swal.fire({
					icon: 'success',
					title: '성공',
					text: '인증 코드가 확인되었습니다.',
					confirmButtonText: '확인'
				}).then((result) => {
					if (result.isConfirmed && response.redirect) {
						window.location.href = response.redirect; // 인증 성공 후 리다이렉트
					}
				});
			} else {
				Swal.fire({
					icon: 'error',
					title: '오류',
					text: response.message
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
