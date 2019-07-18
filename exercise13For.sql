SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
	CURSOR C_SALES IS 
    SELECT EMPLOYEE_ID,LAST_NAME, SALARY 
    FROM EMPLOYEE 
    WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE) FOR UPDATE OF SALARY;	

BEGIN
    FOR V_ROW IN C_SALES LOOP
		UPDATE EMPLOYEE SET SALARY = SALARY * 1.10 WHERE CURRENT OF C_SALES;
		
		DBMS_OUTPUT.PUT_LINE('SALARY:' || V_ROW.SALARY);
		DBMS_OUTPUT.PUT_LINE('LAST NAME:' || V_ROW.LAST_NAME);
		DBMS_OUTPUT.PUT_LINE('ID:' || V_ROW.EMPLOYEE_ID);
		DBMS_OUTPUT.PUT_LINE(CHR(13));	
	END LOOP;
END;
/