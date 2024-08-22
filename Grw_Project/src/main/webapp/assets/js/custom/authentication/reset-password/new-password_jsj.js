"use strict";

var KTAuthNewPassword = function () {
    var t, e, r, o, n = function () {
        return o.getScore() > 50;
    };

    return {
        init: function () {
            t = document.querySelector("#kt_new_password_form");
            e = document.querySelector("#kt_new_password_submit");
            o = KTPasswordMeter.getInstance(t.querySelector('[data-kt-password-meter="true"]'));
            r = FormValidation.formValidation(t, {
                fields: {
                    password: {
                        validators: {
                            notEmpty: {
                                message: "비밀번호는 필수입니다"
                            },
                            callback: {
                                message: "올바른 암호를 입력해주세요",
                                callback: function (t) {
                                    if (t.value.length > 0) return n();
                                }
                            }
                        }
                    },
                    "confirm-password": {
                        validators: {
                            notEmpty: {
                                message: "비밀번호 확인이 필요합니다"
                            },
                            identical: {
                                compare: function () {
                                    return t.querySelector('[name="password"]').value;
                                },
                                message: "비밀번호가 동일하지 않습니다"
                            }
                        }
                    },
                    toc: {
                        validators: {
                            notEmpty: {
                                message: "약관에 동의해야 합니다"
                            }
                        }
                    }
                },
                plugins: {
                    trigger: new FormValidation.plugins.Trigger({
                        event: {
                            password: !1
                        }
                    }),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: ".fv-row",
                        eleInvalidClass: "",
                        eleValidClass: ""
                    })
                }
            });

            t.querySelector('input[name="password"]').addEventListener("input", function () {
                if (this.value.length > 0) r.updateFieldStatus("password", "NotValidated");
            });

            !function (t) {
                try {
                    return new URL(t), !0;
                } catch (t) {
                    return !1;
                }
            }(t.getAttribute("action")) ? e.addEventListener("click", function (n) {
                n.preventDefault();
                r.revalidateField("password");
                r.validate().then(function (r) {
                    if ("Valid" == r) {
                        e.setAttribute("data-kt-indicator", "on");
                        e.disabled = !0;
                        setTimeout(function () {
                            e.removeAttribute("data-kt-indicator");
                            e.disabled = !1;
                            Swal.fire({
                                text: "암호를 재설정했습니다!",
                                icon: "success",
                                buttonsStyling: !1,
                                confirmButtonText: "확인",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            }).then(function (e) {
                                if (e.isConfirmed) {
                                    t.querySelector('[name="password"]').value = "";
                                    t.querySelector('[name="confirm-password"]').value = "";
                                    o.reset();
                                    var r = t.getAttribute("data-kt-redirect-url");
                                    r && (location.href = r);
                                }
                            });
                        }, 1500);
                    } else {
                        Swal.fire({
                            text: "죄송합니다, 오류가 발견되었습니다. 다시 시도하십시오.",
                            icon: "error",
                            buttonsStyling: !1,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                    }
                });
            }) : e.addEventListener("click", function (o) {
                o.preventDefault();
                r.revalidateField("password");
                r.validate().then(function (r) {
                    if ("Valid" == r) {
                        e.setAttribute("data-kt-indicator", "on");
                        e.disabled = !0;
                        axios.post(e.closest("form").getAttribute("action"), new FormData(t)).then(function (e) {
                            if (e) {
                                t.reset();
                                const e = t.getAttribute("data-kt-redirect-url");
                                e && (location.href = e);
                            } else {
                                Swal.fire({
                                    text: "양식이 올바르지 않습니다. 다시 시도하십시오.",
                                    icon: "error",
                                    buttonsStyling: !1,
                                    confirmButtonText: "확인",
                                    customClass: {
                                        confirmButton: "btn btn-primary"
                                    }
                                });
                            }
                        }).catch(function (t) {
                            Swal.fire({
                                text: "양식이 올바르지 않습니다. 다시 시도하십시오.",
                                icon: "error",
                                buttonsStyling: !1,
                                confirmButtonText: "확인",
                                customClass: {
                                    confirmButton: "btn btn-primary"
                                }
                            });
                        }).then(() => {
                            e.removeAttribute("data-kt-indicator");
                            e.disabled = !1;
                        });
                    } else {
                        Swal.fire({
                            text: "양식이 올바르지 않습니다. 다시 시도하십시오.",
                            icon: "error",
                            buttonsStyling: !1,
                            confirmButtonText: "확인",
                            customClass: {
                                confirmButton: "btn btn-primary"
                            }
                        });
                    }
                });
            });
        }
    }
}();

KTUtil.onDOMContentLoaded(function () {
    KTAuthNewPassword.init();
});
