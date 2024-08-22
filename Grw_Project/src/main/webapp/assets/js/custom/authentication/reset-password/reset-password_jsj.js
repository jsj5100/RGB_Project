"use strict";

var KTAuthRequestCode = (function() {
    var form, submitButton, formValidator;

    return {
        init: function() {
            form = document.querySelector("#kt_password_reset_form");
            submitButton = document.querySelector("#kt_password_reset_submit");

            formValidator = FormValidation.formValidation(
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

            submitButton.addEventListener("click", function(e) {
                e.preventDefault();
                formValidator.validate().then(function(status) {
                    if (status === "Valid") {
                        submitButton.setAttribute("data-kt-indicator", "on");
                        submitButton.disabled = true;

                        // 인증번호 요청 API 호출
                        axios.post('/api/request-verification-code', {
                            email: form.querySelector('[name="email"]').value
                        })
                        .then(function(response) {
                            if (response.data.success) {
                                Swal.fire({
                                    text: "인증번호가 이메일로 전송되었습니다.",
                                    icon: "success",
                                    buttonsStyling: false,
                                    confirmButtonText: "확인",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                }).then(function() {
                                    // 성공 후 폼 리셋
                                    form.reset();
                                });
                            } else {
                                showErrorMessage("인증번호 요청에 실패했습니다. 다시 시도해주세요.");
                            }
                        })
                        .catch(function(error) {
                            showErrorMessage("인증번호 요청 중 문제가 발생했습니다. 다시 시도해주세요.");
                        })
                        .finally(function() {
                            submitButton.removeAttribute("data-kt-indicator");
                            submitButton.disabled = false;
                        });
                    } else {
                        showErrorMessage("정보를 올바르게 입력해 주세요.");
                    }
                });
            });
        }
    };

    // Function to show error message
    function showErrorMessage(message) {
        Swal.fire({
            text: message,
            icon: "error",
            buttonsStyling: false,
            confirmButtonText: "확인",
            customClass: {
                confirmButton: "btn btn-primary"
            }
        });
    }

})();

// Initialize the request code functionality on DOM content loaded
KTUtil.onDOMContentLoaded(function() {
    KTAuthRequestCode.init();
});
