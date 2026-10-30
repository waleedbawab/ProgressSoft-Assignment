Total Monthly Salary by Job Title
Requirement: Total salary must exceed $2500
Exclude Sales employees

------------------------------------------------------------------------------------------------------------------
SELECT
    e.JOB_TITLE,
    SUM(e.SALARY) AS TOTAL_MONTHLY_SALARY
FROM MyEmployee e
JOIN MyDepartment d
    ON e.DEPT_ID = d.DEPT_ID
WHERE UPPER(d.NAME) <> 'SALES'
GROUP BY e.JOB_TITLE
HAVING SUM(e.SALARY) > 2500
ORDER BY TOTAL_MONTHLY_SALARY DESC;

