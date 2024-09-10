$(document).ready(function() {
	let formValidator;

	// 폼 유효성 검사 초기화
	const form = $('#kt_new_password_form');
	if (form.length) {
		formValidator = FormValidation.formValidation(
			form[0], // jQuery 객체를 DOM 객체로 변환
			{
				fields: {
					emp_password: {
						validators: {
							notEmpty: {
								message: '비밀번호는 필수입니다.'
							},
							regexp: {
								regexp: /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
								message: '비밀번호는 영문, 숫자, 특수문자를 포함하여 8자리 이상이어야 합니다.'
							}
						}
					},
					confirm_password: {
						validators: {
							notEmpty: {
								message: '비밀번호 확인이 필요합니다.'
							},
							identical: {
								compare: function() {
									return $('input[name="emp_password"]').val();
								},
								message: '비밀번호가 동일하지 않습니다.'
							}
						}
					}
				},
				plugins: {
					trigger: new FormValidation.plugins.Trigger(),
					bootstrap: new FormValidation.plugins.Bootstrap5({
						rowSelector: '.fv-row'
					})
				}
			}
		);
	}

	$('#kt_new_password_submit').on('click', function(e) {
		e.preventDefault(); // 기본 폼 제출 방지

		// 현재 페이지의 경로를 가져와서 기본 컨텍스트 경로를 설정
		var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf('/', 1));
		var ajaxUrl = contextPath + '/changePassword.do';

		if (formValidator) {
			formValidator.validate().then(function(status) {
				if (status === 'Valid') {
					// 폼 데이터 가져오기
					var formData = {
						emp_password: $('input[name="emp_password"]').val(),
						emp_no: $('input[name="emp_no"]').val()
					};

					$.ajax({
						url: ajaxUrl,
						method: 'POST',
						contentType: 'application/json',
						data: JSON.stringify(formData),
						dataType: 'json',
						success: function(response) {
							if (response.success) {
								// 성공 처리
								Swal.fire({
									icon: 'success',
									title: response.message,
									text: '페이지가 새로고침 됩니다.',
									timer: 1500,
									showConfirmButton: false
								}).then(() => {
									// 서버에서 반환된 리디렉션 경로 사용
									window.location.href = response.redirect; // 상대 경로를 사용
								});
							} else {
								// 실패 처리
								Swal.fire({
									icon: 'error',
									title: '비밀번호 변경 실패',
									text: response.message
								});
							}
						},
						error: function(jqXHR, textStatus, errorThrown) {
							Swal.fire({
								icon: 'error',
								title: '서버 오류',
								text: '서버와의 통신에 실패했습니다.'
							});
						}
					});
				} else {
					Swal.fire({
						icon: 'error',
						title: '유효성 검사 실패',
						text: '폼의 필수 입력 값을 확인해주세요.'
					});
				}
			});
		}
	});
});
