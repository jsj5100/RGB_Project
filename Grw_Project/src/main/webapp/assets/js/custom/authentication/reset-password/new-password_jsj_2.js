"use strict";

// KTAuthNewPassword 객체 정의
var KTAuthNewPassword = function () {
    var form, submitButton, passwordMeter, validator;

    // 비밀번호 확인 유효성 검사 함수
    var isPasswordValid = function () {
        return passwordMeter.getScore() > 50;
    };

    return {
        init: function () {
            // 요소 선택
            form = document.querySelector("#kt_new_password_form");
            submitButton = form.querySelector('button[type="submit"]');
            passwordMeter = KTPasswordMeter.getInstance(form.querySelector('[data-kt-password-meter="true"]'));

            // FormValidation 초기화
            validator = FormValidation.formValidation(form, {
                fields: {
                    emp_password: {
                        validators: {
                            notEmpty: {
                                message: "비밀번호는 필수입니다"
                            },
                            callback: {
                                message: "올바른 암호를 입력해주세요",
                                callback: function (input) {
                                    return input.value.length > 0 && isPasswordValid();
                                }
                            }
                        }
                    },
                    emp_password_confirm: {
                        validators: {
                            notEmpty: {
                                message: "비밀번호 확인이 필요합니다"
                            },
                            identical: {
                                compare: function () {
                                    return form.querySelector('[name="emp_password"]').value;
                                },
                                message: "비밀번호가 동일하지 않습니다"
                            }
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "is-invalid",
                        eleValidClass: "is-valid"
                    })
                }
            });

            // 비밀번호 필드 입력 이벤트 핸들러
            form.querySelector('input[name="emp_password"]').addEventListener("input", function () {
                if (this.value.length > 0) {
                    validator.updateFieldStatus("emp_password", "NotValidated");
                }
            });
        }
    }
}();

// DOMContentLoaded 이벤트에서 KTAuthNewPassword 객체 초기화
KTUtil.onDOMContentLoaded(function () {
    KTAuthNewPassword.init();
});
