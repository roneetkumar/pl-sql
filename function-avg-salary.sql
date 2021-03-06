SET SERVEROUTPUT ON
SET VERIFY OFF

CREATE OR REPLACE FUNCTION AVG_SALARY(I_DEP_ID IN NUMBER) RETURN NUMBER
AS 

V_AVG_SALARY EMPLOYEE.SALARY%TYPE;

BEGIN
    SELECT AVG(SALARY)
        INTO V_AVG_SALARY
        FROM EMPLOYEE
        WHERE DEPARTMENT_ID = I_DEP_ID;

    RETURN V_AVG_SALARY;    
  
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;  
END AVG_SALARY;
/