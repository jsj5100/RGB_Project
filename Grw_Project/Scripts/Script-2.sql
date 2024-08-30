INSERT INTO EMP (
    EMP_NAME, 
    EMP_NO, 
    EMP_PASSWORD, 
    EMP_EMAIL, 
    DEP_NO, 
    EMP_IDNUM, 
    EMP_GENDER, 
    EMP_JOINDATE, 
    TIER_NO, 
    AUTH_NO, 
    EMP_STATE
) 
VALUES (
    #{userName}, 
    #{userNo}, 
    #{userPw}, 
    #{userEmail}, 
    (SELECT DEP_NO FROM DEP WHERE DEP_NAME = #{deptSelect}),
    #{userIdnum}, 
    #{userGender}, 
    #{userJoin}, 
    (SELECT TIER_NO FROM TIER WHERE TIER_NAME = #{userTier}),
    (SELECT AUTH_NO FROM AUTH WHERE AUTH_NAME = #{userAuth}), 
    #{userState}
);