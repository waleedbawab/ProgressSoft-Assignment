 Retrieve Employee Details
------------------------------------------------------------------------------------------------------------------------

SELECT
    e.FIRST_NAME || ' ' || e.LAST_NAME AS EMPLOYEE_NAME,
    e.SALARY,
    d.NAME AS DEPARTMENT_NAME,
    m.FIRST_NAME || ' ' || m.LAST_NAME AS MANAGER_NAME,
    g.NAME AS GENDER_NAME,
    u.NAME AS UNIVERSITY_NAME
FROM MyEmployee e
LEFT JOIN MyDepartment d
    ON e.DEPT_ID = d.DEPT_ID
LEFT JOIN MyEmployee m
    ON e.USERID = m.ID
LEFT JOIN Gender g
    ON e.Gender_ID = g.Gender_ID
LEFT JOIN University u
    ON e.University_ID = u.ID
ORDER BY e.ID;

