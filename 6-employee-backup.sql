Employee Backup Procedure


CREATE OR REPLACE PROCEDURE P_EMPLOYEE_BACKUP
AS
BEGIN
    INSERT INTO MyEmployee_Backup
    SELECT *
    FROM MyEmployee;

    COMMIT;
END;
/

