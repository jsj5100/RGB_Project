

--삭제
    UPDATE DEP
    SET DEP_STATE = 'N'
    WHERE DEP_STATE = 'Y' AND DEP_NO = #{depNo}