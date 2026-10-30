HR Employee Query Function

CREATE OR REPLACE FUNCTION F_HR_QUERY
RETURN SYS_REFCURSOR
AS
    employee_cursor SYS_REFCURSOR;
BEGIN
    OPEN employee_cursor FOR
        SELECT
            FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
            HIRE_DATE
        FROM MyEmployee
        WHERE HIRE_DATE > (
            SELECT HIRE_DATE
            FROM MyEmployee
            WHERE UPPER(FIRST_NAME) = 'SCOTT'
              AND UPPER(LAST_NAME) = 'SCOTT'
        )
        ORDER BY HIRE_DATE;

    RETURN employee_cursor;
END;
/

