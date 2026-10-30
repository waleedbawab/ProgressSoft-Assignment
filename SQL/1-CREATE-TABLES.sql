Create Tables and Constraints

-----------------------------------------------------------------------------------------

-- 1. Department Table
CREATE TABLE MyDepartment (
    Dept_ID NUMBER,
    Name VARCHAR2(100) NOT NULL,
    CONSTRAINT PK_MYDEPARTMENT PRIMARY KEY (Dept_ID)
);

-- 2. Gender Table
CREATE TABLE Gender (
    Gender_ID NUMBER,
    Name VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_GENDER PRIMARY KEY (Gender_ID)
);

-- 3. University Table
CREATE TABLE University (
    ID NUMBER,
    Name VARCHAR2(150) NOT NULL,
    CONSTRAINT PK_UNIVERSITY PRIMARY KEY (ID)
);

-- 4. Employee Table
CREATE TABLE MyEmployee (
    ID NUMBER,
    LAST_NAME VARCHAR2(100) NOT NULL,
    FIRST_NAME VARCHAR2(100) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    USERID NUMBER,
    SALARY NUMBER(10,2),
    DEPT_ID NUMBER,
    Gender_ID NUMBER,
    University_ID NUMBER,
    EMP_IMAGE BLOB,
    JOB_TITLE VARCHAR2(100),

    CONSTRAINT PK_MYEMPLOYEE PRIMARY KEY (ID),

    CONSTRAINT CK_EMP_SALARY
        CHECK (SALARY >= 0),

    CONSTRAINT FK_EMP_DEPARTMENT
        FOREIGN KEY (DEPT_ID)
        REFERENCES MyDepartment (Dept_ID),

    CONSTRAINT FK_EMP_GENDER
        FOREIGN KEY (Gender_ID)
        REFERENCES Gender (Gender_ID),

    CONSTRAINT FK_EMP_UNIVERSITY
        FOREIGN KEY (University_ID)
        REFERENCES University (ID),

    CONSTRAINT FK_EMP_MANAGER
        FOREIGN KEY (USERID)
        REFERENCES MyEmployee (ID)
);

