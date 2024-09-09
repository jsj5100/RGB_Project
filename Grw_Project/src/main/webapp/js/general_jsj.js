//로그인 JS
"use strict";

var KTSigninGeneral = function() {
	var t, e, r;

	return {
		init: function() {
			// 요소 선택
			t = document.querySelector("#kt_sign_in_form");
			e = document.querySelector("#kt_sign_in_submit");

			// 폼 검증 설정
			r = FormValidation.formValidation(t, {
				fields: {
					username: {
						validators: {
							regexp: {
								regexp: /^[0-9]{6}$/,
								message: "숫자로 된 사원번호를 정확히 6자리 입력해주세요"
							},
							notEmpty: {
								message: "사원번호를 입력해주세요"
							}
						}
					},
					password: {
						validators: {
							notEmpty: {
								message: "비밀번호를 입력해주세요"
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
			});
		}
	};
}();

KTUtil.onDOMContentLoaded(function() {
	KTSigninGeneral.init();
});
