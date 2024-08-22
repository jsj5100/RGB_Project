"use strict";

var KTAuthComplete = (function() {
    var form, submitButton, formValidator;

    return {
        init: function() {
            form = document.querySelector("#kt_password_reset_form");
            submitButton = document.querySelector("#kt_password_reset_complete");

            formValidator = FormValidation.formValidation(
                form,
                {
                    fields: {
                        verification_code: {
                            validators: {
                                notEmpty: {
                                    message: "인증번호를 입력해주세요"
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

                        axios.post('/api/verify', {
                            verification_code: form.querySelector('[name="verification_code"]').value
                        })
                        .then(function(response) {
                            if (response.data.success) {
                                form.reset();
                                Swal.fire({
                                    text: "인증이 완료되었습니다.",
                                    icon: "success",
                                    buttonsStyling: false,
                                    confirmButtonText: "확인",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                }).then(function(result) {
                                    if (result.isConfirmed) {
                                        var redirectUrl = form.getAttribute("data-kt-redirect-url");
                                        if (redirectUrl && isValidRedirectUrl(redirectUrl)) {
                                            location.href = redirectUrl;
                                        } else {
                                            Swal.fire({
                                                text: "리디렉션할 URL이 유효하지 않습니다.",
                                                icon: "warning",
                                                buttonsStyling: false,
                                                confirmButtonText: "확인",
                                                customClass: {
                                                    confirmButton: "btn btn-primary"
                                                }
                                            });
                                        }
                                    }
                                });
                            } else {
                                showErrorMessage("인증번호가 올바르지 않습니다. 다시 시도해주세요.");
                            }
                        })
                        .catch(function(error) {
                            showErrorMessage("인증 요청에 문제가 발생했습니다. 다시 시도해주세요.");
                        })
                        .finally(function() {
                            submitButton.removeAttribute("data-kt-indicator");
                            submitButton.disabled = false;
                        });
                    } else {
                        showErrorMessage("인증번호를 입력해 주세요.");
                    }
                });
            });
        }
    };

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

    function isValidRedirectUrl(url) {
        try {
            new URL(url);  // If URL constructor does not throw an error, URL is valid
            return true;
        } catch (e) {
            return false;
        }
    }

})();

// Initialize the complete functionality on DOM content loaded
KTUtil.onDOMContentLoaded(function() {
    KTAuthComplete.init();
});
