ALTER TABLE EMPLOYEE DROP COLUMN STARS;
ALTER TABLE EMPLOYEE ADD STARS VARCHAR2(5);

SET SERVEROUTPUT ON
SET VERIFY OFF


DECLARE

V_EMPLOYEE_ID EMPLOYEE.EMPLOYEE_ID%TYPE := &SV_EMPLOYEE_ID;
V_SALARY EMPLOYEE.SALARY%TYPE;
V_STARS VARCHAR2(5) := '';
V_COUNT NUMBER;

BEGIN
    SELECT SALARY
        INTO V_SALARY
        FROM EMPLOYEE
        WHERE  EMPLOYEE_ID = V_EMPLOYEE_ID;

        DBMS_OUTPUT.PUT_LINE('SALARY : ' || V_SALARY);

        V_COUNT := FLOOR(V_SALARY/1000); 
 

    FOR I IN 1..V_COUNT LOOP
        V_STARS := V_STARS || '*';
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('STARS : ' || V_STARS);

    UPDATE EMPLOYEE
        SET STARS = V_STARS
        WHERE EMPLOYEE_ID = V_EMPLOYEE_ID; 

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID : ' || V_EMPLOYEE_ID || ' IS NOT FOUND');

END;
/