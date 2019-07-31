set serveroutput on
set verify off
DECLARE

CURSOR c_emp IS 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, EMPLOYEE_ID FROM EMPLOYEE FOR UPDATE OF PASSWORD;

v_temp_pwd CHAR(8);

BEGIN 

    FOR v_record in c_emp loop
      v_temp_pwd := UPPER(SUBSTR(v_record.LAST_NAME,0,2)) || TO_CHAR(v_record.HIRE_DATE,'DD') || LOWER(SUBSTR(v_record.FIRST_NAME,0,2)) || TO_CHAR(v_record.HIRE_DATE,'MM');
      UPDATE EMPLOYEE SET PASSWORD = v_temp_pwd WHERE EMPLOYEE_ID = v_record.EMPLOYEE_ID;
    end loop;
    COMMIT;
exception
  when no_data_found then
    dbms_output.put_line('update unsuccessful');
END;
/