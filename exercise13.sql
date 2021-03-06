SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
	CURSOR C_SALES IS 
	SELECT EMPLOYEE_ID,LAST_NAME, SALARY FROM EMPLOYEE WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);	
	V_ROW C_SALES%ROWTYPE;
	V_SALARY EMPLOYEE.SALARY%TYPE;

BEGIN
	OPEN C_SALES;
	LOOP
		FETCH C_SALES INTO V_ROW;
		EXIT WHEN C_SALES%NOTFOUND;
		
		UPDATE EMPLOYEE SET SALARY = SALARY * 1.10 WHERE EMPLOYEE_ID = V_ROW.EMPLOYEE_ID;
		DBMS_OUTPUT.PUT_LINE('SALARY:' || V_ROW.SALARY);
		DBMS_OUTPUT.PUT_LINE('LAST NAME:' || V_ROW.LAST_NAME);
		DBMS_OUTPUT.PUT_LINE('ID:' || V_ROW.EMPLOYEE_ID);
		DBMS_OUTPUT.PUT_LINE(CHR(13));
		
	END LOOP;
	CLOSE C_SALES;
END;
/