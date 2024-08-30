 INSERT INTO EMP (
        emp_no, 
        emp_name, 
        emp_email, 
        emp_idnum, 
        emp_joindate, 
        dep_no, 
        tier_name, 
        auth_name
    ) VALUES (
        '240830', 
        '김구디', 
        'goodie@naver.com', 
        '850909-1', 
        '240803-08-30', 
        (SELECT dep_no FROM DEP WHERE dep_name = '인사과'), 
        (SELECT tier_name FROM TIER WHERE tier_name = '사원'), 
        (SELECT auth_name FROM AUTH WHERE auth_name = '비권한')
    );