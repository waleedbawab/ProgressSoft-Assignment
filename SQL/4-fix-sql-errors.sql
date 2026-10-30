 Identify and Correct SQL Errors


-- Original query provided in the assignment:
--
-- SELECT empno, ename,
-- salary x 12 ANNUAL SALARY; FROM emp;

-- Corrected query:
SELECT
    empno,
    ename,
    salary * 12 AS ANNUAL_SALARY
FROM emp;

-------------------------------------------------------------------------------------------------------------------------
-- Explanation of the corrections:
--
-- 1. Replace x with * to perform multiplication.
-- 2. Use AS to define the column alias clearly.
-- 3. Remove the space from ANNUAL SALARY by using
--    ANNUAL_SALARY as a valid unquoted alias.
-- 4. Move the semicolon to the end of the statement,
--    after the FROM clause.
--
-- Note: This query requires an EMP table containing
-- EMPNO, ENAME, and SALARY columns.
-------------------------------------------------------------------       --------- --------- ----------  ------------  -----------