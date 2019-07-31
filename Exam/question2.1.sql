SET SERVEROUTPUT ON
SET VERIFY OFF

CREATE OR REPLACE FUNCTION GET_MIN_SALARY(I_DEP_ID IN NUMBER) RETURN NUMBER
AS 

V_MIN_SALARY EMPLOYEE.SALARY%TYPE;

BEGIN
    SELECT MIN(SALARY)
        INTO V_MIN_SALARY
        FROM EMPLOYEE
        WHERE DEPARTMENT_ID = I_DEP_ID;

    RETURN V_MIN_SALARY;    
  
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;  
END GET_MIN_SALARY;
/