SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
V_LAST_NAME VARCHAR2(15);
V_HIRE_DATE DATE;
V_SALARY NUMBER;
V_EMP_ID NUMBER := &SV_EMPLOYEE_ID;

BEGIN
SELECT LAST_NAME,HIRE_DATE,SALARY
    INTO V_LAST_NAME,V_HIRE_DATE,V_SALARY
    FROM EMPLOYEE
    WHERE EMPLOYEE_ID = V_EMP_ID;
    -- 7788
    DBMS_OUTPUT.PUT_LINE('NAME: ' || V_LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('HIRE DATE: ' || TO_CHAR(V_HIRE_DATE,'YYYY/MM/DD'));
    DBMS_OUTPUT.PUT_LINE('SALARY: ' || V_SALARY);

EXCEPTION
WHEN NO_DATA_FOUND 
THEN DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID ' || V_EMP_ID || ' NOT FOUND');

END;
/
